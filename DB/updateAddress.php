<?php   
session_start();
    if (isset($_REQUEST['submit'])){
        $uid = $_SESSION['uid'];
        $cid = $_REQUEST['city'];
        $did = $_REQUEST['district'];
        $street = $_REQUEST['street'];
        $_SESSION['cid']= $cid;
        $_SESSION['did']=$did;
        $_SESSION['street']=$street;
        require_once './DBconfig.php';
        $sql = "call updateAccAddress(?,?,?,?)";
        $stmt = $conn ->prepare($sql);
        $stmt ->bind_param('iiis',$uid,$cid,$did,$street);
        $stmt ->execute();
        $stmt->close();
        $conn->next_result();
        header('Location: ../address.php');
    }
?>