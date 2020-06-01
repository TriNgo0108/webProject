<?php 
     if(isset($_REQUEST['register'])){
          $Newuser = $_REQUEST['username'];
          $Newpassword = $_REQUEST['password'];
          $email = $_REQUEST['email'];
          $phone = $_REQUEST['phone'];
          $cid = $_REQUEST['city'];
          $did = $_REQUEST['district'];
          $street = $_REQUEST['street'];
          require_once 'DBconfig.php';
          $sql ="call addUser(?,?,?,?,?,?,?)";
          $stmt = $conn->prepare($sql);
          $stmt->bind_param("ssssiis",$Newuser,$Newpassword,$email,$phone,$cid,$did,$street);
          $stmt->execute();
          $stmt->close();
          $conn->close();
          header("Location: ../login.php");
     }
?>