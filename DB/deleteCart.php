<?php 
    if (isset($_REQUEST['uid'])&&isset($_REQUEST['pid'])){
        require_once './DBconfig.php';
        $uid = $_REQUEST['uid'];
        $pid = $_REQUEST['pid'];
        // delete some product
        $sql = "call deleteCart(?,?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('ii',$uid,$pid);
        $stmt->execute();
        $stmt->close();
        $conn->next_result();
        // re-count quality product
        $sql = "call getCountCart(?)";
        $stmt =$conn->prepare($sql);
        $stmt->bind_param('i',$uid);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows>0){
            echo $result->fetch_assoc()['count'].'&&';
        }
        $stmt->close();
        $conn->next_result();
        // re-sum price of product
        $sql = "call getTotal(?)";
        $stmt =$conn->prepare($sql);
        $stmt->bind_param('i',$uid);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows>0){
            echo $result->fetch_assoc()['total'];
        }
        $stmt->close();
        $conn->next_result();
    }
?>