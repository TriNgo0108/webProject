<?php 
     if (isset($_REQUEST['uid'])&&isset($_REQUEST['pid'])){
         require_once './DBconfig.php';
         $uid = $_REQUEST['uid'];
         $pid = $_REQUEST['pid'];
         $sql = "call deleteLike(?,?)";
         $stmt = $conn->prepare($sql);
         $stmt ->bind_param('ii',$uid,$pid);
         $stmt->execute();
         $stmt->close();
         $conn->next_result();
     }
?>