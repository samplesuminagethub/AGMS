<?php
session_start();

// Database connection
$host = 'localhost';
$user = 'root';
$password = '';
$dbname = 'agmsdb';  // Adjust to your database name

$mysqli = new mysqli($host, $user, $password, $dbname);

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Ensure the request is POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: buy.php");
    exit();
}

// Verify that the expected POST data exists
if (
    !isset($_POST['amount']) ||
    !isset($_POST['order_time']) ||
    !isset($_POST['items']) ||
    !isset($_POST['quantity']) ||
    !isset($_POST['payment_method']) ||
    $_POST['payment_method'] !== 'khalti'
) {
    $_SESSION["validate_msg"] = '<script>
        Swal.fire({
            icon: "error",
            title: "Missing payment data",
            showConfirmButton: false,
            timer: 1500
        });
    </script>';
    header("Location: buy.php");
    exit();
}

// Retrieve POST data
$amount = $_POST['amount'];   // Amount in rupees
$order_time = $_POST['order_time'];
$items = $_POST['items'];
$quantity = $_POST['quantity'];
$payment_method = $_POST['payment_method'];

// Basic validation
if (empty($amount) || empty($order_time) || empty($items) || empty($quantity)) {
    $_SESSION["validate_msg"] = '<script>
        Swal.fire({
            icon: "error",
            title: "Required payment fields missing",
            showConfirmButton: false,
            timer: 1500
        });
    </script>';
    header("Location: checkout.php");
    exit();
}

if (!is_numeric($amount) || !is_numeric($quantity)) {
    $_SESSION["validate_msg"] = '<script>
        Swal.fire({
            icon: "error",
            title: "Amount and quantity must be numeric",
            showConfirmButton: false,
            timer: 1500
        });
    </script>';
    header("Location: checkout.php");
    exit();
}

// Convert amount from rupees to paisa (Khalti requires the amount in paisa)
$amount = $amount * 100; // Amount in paisa

// Generate a purchase order id (you can modify this logic as needed)
$purchase_order_id = "ORD" . time();

// Use the items string as the purchase order name (or modify as needed)
$purchase_order_name = $items;

// Retrieve customer info from session (these should be set on login/checkout)
if (!isset($_SESSION['name']) || !isset($_SESSION['email'])) {
    $_SESSION["validate_msg"] = '<script>
        Swal.fire({
            icon: "error",
            title: "User information missing",
            showConfirmButton: false,
            timer: 1500
        });
    </script>';
    header("Location: checkout.php");
    exit();
}

$name  = $_SESSION['name'];
$email = $_SESSION['email'];

// If you have phone stored in the session, use it; otherwise, set a default (adjust as needed)
$phone = isset($_SESSION['phone']) ? $_SESSION['phone'] : "9800000000";

// Prepare the payload for the Khalti API request
$postFields = array(
    "return_url"         => "http://localhost/agms/agms/payment_response.php", // Adjust your return URL
    "website_url"        => "http://localhost/agms/agms",
    "amount"             => $amount,
    "purchase_order_id"  => $purchase_order_id,
    "purchase_order_name"=> $purchase_order_name,
    "customer_info"      => array(
        "name"  => $name,
        "email" => $email,
        "phone" => $phone
    )
);

$jsonData = json_encode($postFields);

// Initialize cURL and set the options
$curl = curl_init();
curl_setopt_array($curl, array(
    CURLOPT_URL            => 'https://a.khalti.com/api/v2/epayment/initiate/',
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POST           => true,
    CURLOPT_POSTFIELDS     => $jsonData,
    CURLOPT_HTTPHEADER     => array(
        'Authorization: key live_secret_key_68791341fdd94846a146f0457ff7b455', // Replace with your secret key
        'Content-Type: application/json',
    ),
));

$response = curl_exec($curl);

if (curl_errno($curl)) {
    echo 'cURL Error: ' . curl_error($curl);
} else {
    $responseArray = json_decode($response, true);

    if (isset($responseArray['error'])) {
        echo 'Error: ' . $responseArray['error'];
    } elseif (isset($responseArray['payment_url'])) {
        // Redirect the user to the Khalti payment page
        header('Location: ' . $responseArray['payment_url']);
        exit();
    } else {
        echo 'Unexpected response: ' . $response;
    }
}

curl_close($curl);

// After user successfully pays, handle the insertion
// Assuming you get payment success data (after Khalti returns a response)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($responseArray['payment_url'])) {
    // Insert order into 'tbl_orders' table
    $orderQuery = "INSERT INTO tbl_orders (order_time, items, quantity, user_name, user_email, user_phone) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $mysqli->prepare($orderQuery);
    $stmt->bind_param("ssssss", $order_time, $items, $quantity, $name, $email, $phone);
    if ($stmt->execute()) {
        $order_id = $mysqli->insert_id;  // Get the inserted order ID

        // Insert payment into 'tbl_payments' table
        $paymentQuery = "INSERT INTO tbl_payments (order_id, amount, payment_method, status) VALUES (?, ?, ?, ?)";
        $payment_status = 'success'; // You can adjust the status based on the actual payment status from Khalti
        $stmt = $mysqli->prepare($paymentQuery);
        $stmt->bind_param("iiss", $order_id, $amount, $payment_method, $payment_status);
        $stmt->execute();

        // Empty the user's cart after successful payment
        $cartQuery = "DELETE FROM tbl_cart WHERE user_email = ?";
        $stmt = $mysqli->prepare($cartQuery);
        $stmt->bind_param("s", $email);
        $stmt->execute();

        // Redirect or provide success message
        $_SESSION["validate_msg"] = '<script>
            Swal.fire({
                icon: "success",
                title: "Payment successful! Order has been placed.",
                showConfirmButton: false,
                timer: 1500
            });
        </script>';
        header("Location: payment_response.php");
        exit();
    } else {
        echo "Error placing order or payment details. Please try again.";
    }
}
?>
<style>
body {
    height: 300vh;
    width: 300vw;
    background-color: #f6f4f9;
}

.container {
    width: 100vw;
    height: 100vh;
    display: flex;
    /* Default Axis is X*/
    justify-content: center;
    /* Main Axis */
    align-items: center;
    /* Cross Axis */
}

.indicator {
    width: 50vw;
}
</style>