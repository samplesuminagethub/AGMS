<?php
header('Content-Type: application/json');

if (isset($_GET['order'])) {
    $orderData = json_decode(urldecode($_GET['order']), true);

    // Prepare the payload for Khalti API
    $payload = [
        "return_url" => "http://localhost/agms/agms/payment_response.php",
        "website_url" => "http://localhost/agms/agms",
        "amount" => (int)($orderData['total_price'] * 100),
        "purchase_order_id" => uniqid("order_"),
        "purchase_order_name" => "Product id: " . $orderData['product_id'] . " Purchase. By: " . $orderData['fullname'],
        "customer_info" => [
            "name" => $orderData['fullname'],
            "email" => $orderData['email'],
            "phone" => $orderData['contact_number']
        ],
        "amount_breakdown" => [
            [
                "label" => "Total Price",
                "amount" => (int)($orderData['total_price'] * 100)
            ]
        ],
        "product_details" => [
            [
                "identity" => $orderData['product_id'],
                "name" => $orderData['product_name'],
                "total_price" => (int)($orderData['total_price'] * 100),
                "quantity" => 1,
                "unit_price" => (int)($orderData['total_price'] * 100)
            ]
        ]
    ];

    // Initiate cURL request to Khalti API
    $ch = curl_init();
    curl_setopt_array($ch, [
        CURLOPT_URL => 'https://dev.khalti.com/api/v2/epayment/initiate/',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => json_encode($payload),
        CURLOPT_HTTPHEADER => [
            'Authorization: Key live_secret_key_68791341fdd94846a146f0457ff7b455', // Replace with your actual secret key
            'Content-Type: application/json'
        ]
    ]);

    $response = curl_exec($ch);
    curl_close($ch);

    // Decode the response from Khalti
    $responseData = json_decode($response, true);

    // Redirect to Khalti payment URL if available
    if (isset($responseData['payment_url'])) {
        header("Location: " . $responseData['payment_url']);
        exit();
    } else {
        echo "Error: Payment URL not found!";
    }
} else {
    echo json_encode(["error" => "No order data received"], JSON_PRETTY_PRINT);
}
?>
