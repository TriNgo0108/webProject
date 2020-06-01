<?php 
 if(isset($_REQUEST['uid'])){
     require_once './DBconfig.php';
     $uid = $_REQUEST['uid'];
     $sql = "call paidCart(?)";
     $stmt = $conn ->prepare($sql);
     $stmt ->bind_param('i',$uid);
     $stmt ->execute();
     $stmt->close();
     $conn ->next_result();
     header('Location: ../orders.php');
 }
?>