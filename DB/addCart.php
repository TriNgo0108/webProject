<?php 
    if(isset($_REQUEST['uid'])&&isset($_REQUEST['pid'])&&isset($_REQUEST['quality'])){
        require_once './DBconfig.php';
        $uid =$_REQUEST['uid'];
        $pid= $_REQUEST['pid'];
        $quality = $_REQUEST['quality'];
        $sql = "call addCart(?,?,?)";
        $stmt = $conn ->prepare($sql);
        $stmt->bind_param("iii",$uid,$pid,$quality);
        $stmt->execute();
        $stmt->close();
        $conn->next_result();
    }
?>