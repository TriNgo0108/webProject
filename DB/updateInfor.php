<?php 
session_start();
    if (isset($_REQUEST['submit'])){
        echo var_dump($_REQUEST);
        $uid = $_SESSION['uid'];
        $newName = $_REQUEST['name'];
        $newPhone = $_REQUEST['phone'];
        $newEmail = $_REQUEST['email'];
        $_SESSION['username']=$newName;
        $_SESSION['phone']=$newPhone;
        $_SESSION['email']=$newEmail;
        echo var_dump($_SESSION);
        require_once './DBconfig.php';
        $sql = "call updateAccInfor(?,?,?,?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('isss',$uid,$newName,$newEmail,$newPhone);
        $stmt->execute();
        echo var_dump($stmt);
        $stmt->close();
        $conn->next_result();
        $conn->close();
       header('Location: ../user.php');
    }
?>