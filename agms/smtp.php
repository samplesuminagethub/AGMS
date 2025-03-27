<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php'; // Load PHPMailer

if (isset($_POST['send'])) {
    $receiverEmail = $_POST['email'];
    $message = $_POST['message'];

    $mail = new PHPMailer(true);
    
    try {
        // SMTP Configuration
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Change for Outlook or other providers
        $mail->SMTPAuth = true;
        $mail->Username = 'sajanshr10224@gmail.com'; // Your SMTP email
        $mail->Password = 'fsxh vjkp shis hvxs';   // App Password (Not your normal password)
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Email Content
        $mail->setFrom('sajanshr10224@gmail.com', 'Sajan Shrestha');
        $mail->addAddress($receiverEmail);
        $mail->Subject = 'SMTP Test Email';
        $mail->Body = $message;

        // Send Email
        if ($mail->send()) {
            echo "<script>alert('Email Sent Successfully!');</script>";
        }
    } catch (Exception $e) {
        echo "<script>alert('Error: {$mail->ErrorInfo}');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>SMTP Mail Sender</title>
</head>

<body>
    <h2>Send Email via SMTP</h2>
    <form method="post">
        <label>Receiver Email:</label><br>
        <input type="email" name="email" required><br><br>

        <label>Message:</label><br>
        <textarea name="message" required></textarea><br><br>

        <button type="submit" name="send">Send Email</button>
    </form>
</body>

</html>