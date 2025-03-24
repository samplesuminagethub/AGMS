<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../vendor/autoload.php'; // Load PHPMailer

session_start();
error_reporting(0);
include('includes/dbconnection.php');

if (strlen($_SESSION['agmsaid']) == 0) {
    header('location:logout.php');
} else {
    if (isset($_POST['submit'])) {
        $cid = $_GET['viewid'];
        $remark = $_POST['remark'];
        $status = 'Answer';

        // Update database
        $query = mysqli_query($con, "UPDATE tblenquiry SET AdminRemark='$remark', Status='$status' WHERE ID='$cid'");

        if ($query) {
            // Fetch user email for sending mail
            $result = mysqli_query($con, "SELECT Email, FullName FROM tblenquiry WHERE ID='$cid'");
            $row = mysqli_fetch_array($result);
            $userEmail = $row['Email'];
            $userName = $row['FullName'];

            // Send Email Notification
            
            require '../vendor/autoload.php'; // Ensure correct path
            
            $mail = new PHPMailer(true);
            
            try {
                // SMTP Configuration
                $mail->isSMTP();
                $mail->Host = 'smtp.office365.com'; // Outlook SMTP server
                $mail->SMTPAuth = true;
                $mail->Username = 'project.agsm@outlook.com'; // Your Outlook email
                $mail->Password = 'Summerproject'; // App password or email password
                $mail->SMTPSecure = 'tls';
                $mail->Port = 587;
            
                // Email Content
                $mail->setFrom('project.agsm@outlook.com', 'Art Gallery Admin');
                $mail->addAddress($row['Email']); // Recipient's email
                $mail->Subject = "Enquiry Response - " . $row['EnquiryNumber'];
                $mail->Body = "Dear " . $row['FullName'] . ",\n\n"
                            . "We have reviewed your enquiry regarding '" . $row['Title'] . "'.\n"
                            . "Admin's Remark: " . $remark . "\n\n"
                            . "Best regards,\nArt Gallery Team";
            
                // Send Email
                $mail->send();
                echo "<script>alert('Email sent successfully');</script>";
            } catch (Exception $e) {
                echo "<script>alert('Mailer Error: {$mail->ErrorInfo}');</script>";
            }
          }
          
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>

  <link rel="shortcut icon" href="img/favicon.png">

  <title>View Enquiry | Art Gallery Management System</title>

  <!-- Bootstrap CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="css/elegant-icons-style.css" rel="stylesheet" />
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet" />

</head>

<body>
  <!-- container section start -->
  <section id="container" class="">
    <!--header start-->
    <?php include_once('includes/header.php');?>
    <!--header end-->

    <!--sidebar start-->
    <?php include_once('includes/sidebar.php');?>

    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-table"></i>View Enquiry</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="dashboard.php">Home</a></li>
              <li><i class="fa fa-table"></i>Enquiry</li>
              <li><i class="fa fa-th-list"></i>View Enquiry</li>
            </ol>
          </div>
        </div>
        <!-- page start-->
        <div class="row">
          <div class="col-sm-12">
            <section class="panel">
              <header class="panel-heading">
                View Enquiry Details
              </header>

  <?php
 $cid=$_GET['viewid'];
$ret=mysqli_query($con,"select tblartproduct.*,tblenquiry.* from tblenquiry
  join tblartproduct on tblartproduct.ID=tblenquiry.Artpdid
  where tblenquiry.ID='$cid'");
$cnt=1;
while ($row=mysqli_fetch_array($ret)) {

?>
               <table border="1" class="table table-bordered mg-b-0">
      <tr>
                                <th>Enquiry Number</th>
                                   <td colspan="3"><?php  echo $row['EnquiryNumber'];?></td>
                                   </tr>
   <tr>
                                <th>Full Name</th>
                                   <td><?php  echo $row['FullName'];?></td>

                                <th>Art Name</th>
                                   <td><?php  echo $row['Title'];?><br />
                                     <a href="edit-art-product-detail.php?editid=<?php echo $row['Artpdid'];?>"  target="_blank">View Details</a>
                                   </td>
                                   </tr>
                                   <tr>
                                <th>Art Reference Number</th>
                                   <td><?php  echo $row['RefNum'];?></td>

                                <th>Email</th>
                                   <td><?php  echo $row['Email'];?></td>
                                 </tr>
                          <tr>
                                <th>MobileNumber</th>
                                   <td><?php  echo $row['MobileNumber'];?></td>

                                       <th>Enquiry Date</th>
                                        <td><?php  echo $row['EnquiryDate'];?></td>
                                   </tr>
                                   <tr>
                                    <th>Message</th>
                                      <td><?php  echo $row['Message'];?></td>

    <th>Status</th>
    <td> <?php
if($row['Status']=="")
{
  echo "Unanswer Enquiry";
}
if($row['Status']=="Answer")
{
  echo "Answer Enquiry";
}

     ;?></td>
  </tr>


<?php if($row['Status']==""){ ?>


<form name="submit" method="post">

<tr>
    <th>Remark :</th>
    <td>
    <textarea name="remark" placeholder="" rows="5" cols="14" class="form-control wd-450" required="true"></textarea></td>
  </tr>





  <tr align="center">
    <td colspan="2"><button type="submit" name="submit" class="btn btn-primary btn-sm"><i class="fa fa-dot-circle-o"></i> Update</button></td>
  </tr>
  </form>
<?php } else { ?>

  <tr>
    <th>Remark</th>
    <td colspan="3"><?php echo $row['AdminRemark']; ?></td>
  </tr>


<tr>
<th>Remark date</th>
<td colspan="3"> <?php echo $row['AdminRemarkdate']; ?>  </td></tr>
<?php } ?>







<?php } ?>

          </table>
        </section>
          </div>

        </div>

        <!-- page end-->
      </section>
    </section>
    <!--main content end-->
    <?php include_once('includes/footer.php');?>
  </section>
  <!-- container section end -->
  <!-- javascripts -->
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <!-- nicescroll -->
  <script src="js/jquery.scrollTo.min.js"></script>
  <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
  <!--custome script for all page-->
  <script src="js/scripts.js"></script>


</body>

</html>
<?php }  ?>