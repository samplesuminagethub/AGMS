<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');

if (isset($_POST['submit_order'])) {
    $product_id = $_POST['product_id'];
    $fullname = $_POST['fullname'];
    $email = $_POST['email'];
    $contact_number = $_POST['contact_number'];
    $address = $_POST['address'];
    $city = $_POST['city'];
    $zip = $_POST['zip'];
    $quantity = $_POST['quantity'];
    $total_price = $_POST['total_price'];
    $order_status = 'Pending';
    $payment_status = 'Unpaid';
    $order_date = date("Y-m-d H:i:s");

    $query = "INSERT INTO tbl_orders (product_id, fullname, email, contact_number, address, city, zip, order_status, order_date, total_price, quantity, payment_status) VALUES ('$product_id', '$fullname', '$email', '$contact_number', '$address', '$city', '$zip', '$order_status', '$order_date', '$total_price', '$quantity', '$payment_status')";
    mysqli_query($con, $query);
    $order_id = mysqli_insert_id($con);
}
?>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>Buy Product</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <?php include_once('includes/header.php'); ?>
    <div class="inner_page-banner one-img"></div>
    <section class="banner-bottom py-lg-5 py-3">
        <div class="container">
            <div class="inner-sec-shop pt-lg-4 pt-3">
                <?php
                $pid = $_GET['pid'];
                $ret = mysqli_query($con, "SELECT * FROM tblartproduct WHERE ID='$pid'");
                $row = mysqli_fetch_array($ret);
                ?>
                <div class="row">
                    <div class="col-lg-4">
                        <img src="admin/images/<?php echo $row['Image']; ?>" class="img-fluid" alt="Product Image">
                    </div>
                    <div class="col-lg-8">
                        <h3><?php echo $row['Title']; ?></h3>
                        <h4 style="color:#28a745;">NPR <?php echo number_format($row['SellingPricing'], 2); ?></h4>
                        <form method="POST" action="">
                            <input type="hidden" name="product_id" value="<?php echo $row['ID']; ?>">
                            <div class="form-group">
                                <label>Full Name</label>
                                <input type="text" name="fullname" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" name="email" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Contact Number</label>
                                <input type="text" name="contact_number" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" name="address" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label>City</label>
                                <input type="text" name="city" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Zip Code</label>
                                <input type="text" name="zip" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="number" name="quantity" value="1" readonly>
                            </div>
                            <input type="hidden" name="total_price" value="<?php echo $row['SellingPricing']; ?>">
                            <input type="hidden" name="product_name" value="<?php echo $row['Title']; ?>">
                            <button type="submit" name="submit_order" class="btn btn-primary">Place Order</button>
                            <button type="button" class="btn btn-success" onclick="payWithKhalti()">Pay with Khalti</button>
                        </form>
                        <script>
    function payWithKhalti() {
        var orderData = {
            product_id: document.getElementsByName('product_id')[0].value,
            product_name: "<?php echo addslashes($row['Title']); ?>", // Add product name
            fullname: document.getElementsByName('fullname')[0].value,
            email: document.getElementsByName('email')[0].value,
            contact_number: document.getElementsByName('contact_number')[0].value,
            address: document.getElementsByName('address')[0].value,
            city: document.getElementsByName('city')[0].value,
            zip: document.getElementsByName('zip')[0].value,
            quantity: document.getElementsByName('quantity')[0].value,
            total_price: document.getElementsByName('total_price')[0].value,
            return_url: 'http://localhost/agms/payment_success.php'[0].value,
            website_url: 'http://localhost/agms/'[0].value
        };
        var orderJson = encodeURIComponent(JSON.stringify(orderData));
        window.location.href = 'payment_request.php?order=' + orderJson;
    }
</script>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php include_once('includes/footer.php'); ?>
</body>

</html>