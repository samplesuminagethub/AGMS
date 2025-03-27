<?php
header('Content-Type: application/json');

// Check if the required parameters exist in the callback URL
if (!isset($_GET['pidx']) || !isset($_GET['status'])) {
    die(json_encode(["error" => "Invalid payment response!"]));
}

// Fetch the data from the callback
$pidx = $_GET['pidx'];
$status = $_GET['status'];
$transaction_id = $_GET['transaction_id'] ?? null;
$amount = $_GET['amount'] ?? null;
$purchase_order_id = $_GET['purchase_order_id'] ?? null;
$purchase_order_name = $_GET['purchase_order_name'] ?? null;
$mobile = $_GET['mobile'] ?? null;

// Khalti Lookup API to confirm the transaction status
$lookupPayload = json_encode(["pidx" => $pidx]);

$ch = curl_init();
curl_setopt_array($ch, [
    CURLOPT_URL => 'https://dev.khalti.com/api/v2/epayment/lookup/',
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_CUSTOMREQUEST => 'POST',
    CURLOPT_POSTFIELDS => $lookupPayload,
    CURLOPT_HTTPHEADER => [
        'Authorization: Key live_secret_key_68791341fdd94846a146f0457ff7b455', // Replace with your actual secret key
        'Content-Type: application/json'
    ]
]);

$response = curl_exec($ch);
curl_close($ch);

// Decode response from Khalti Lookup API
$responseData = json_decode($response, true);

// Check for valid response from Khalti API
if ($responseData && isset($responseData['status'])) {
    $finalStatus = $responseData['status'];

    if ($finalStatus === 'Completed') {
        // ✅ Payment was successful; provide service or update database
        // Extract the username from purchase_order_name (assuming "By: sinja commerce pvt. ltd")
        preg_match('/By:\s*(.*)/', $purchase_order_name, $matches);
        $username = isset($matches[1]) ? $matches[1] : 'Customer';  // Default to 'Customer' if no match

        // Redirect URL with status and username for the alert box
        $redirectUrl = "http://localhost/agms/agms?status=success&username=" . urlencode($username);
        
        // Redirect to the homepage
        header("Location: " . $redirectUrl);
        exit();
    } elseif ($finalStatus === 'Pending') {
        // ⚠️ Payment is still pending, do not provide service yet
        $redirectUrl = "http://localhost/agms/agms?status=pending&username=" . urlencode($purchase_order_name);
        header("Location: " . $redirectUrl);
        exit();
    } elseif ($finalStatus === 'User canceled') {
        // ❌ Payment was canceled by user
        $redirectUrl = "http://localhost/agms/agms?status=canceled&username=" . urlencode($purchase_order_name);
        header("Location: " . $redirectUrl);
        exit();
    } elseif ($finalStatus === 'Expired') {
        // ❌ Payment link expired
        $redirectUrl = "http://localhost/agms/agms?status=expired&username=" . urlencode($purchase_order_name);
        header("Location: " . $redirectUrl);
        exit();
    } elseif ($finalStatus === 'Refunded') {
        // ❌ Payment was refunded, do not provide service
        $redirectUrl = "http://localhost/agms/agms?status=refunded&username=" . urlencode($purchase_order_name);
        header("Location: " . $redirectUrl);
        exit();
    } else {
        // ❌ Unknown status
        $redirectUrl = "http://localhost/agms/agms?status=unknown&username=" . urlencode($purchase_order_name);
        header("Location: " . $redirectUrl);
        exit();
    }
} else {
    // ❌ Failed to verify payment with Khalti
    echo json_encode(["error" => "Failed to verify payment with Khalti!"]);
}
?>
