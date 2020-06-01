<?php
    if(isset($_REQUEST['cid'])){
        require_once 'DBconfig.php';
        $cid = $_REQUEST['cid'];
        $sql = "CALL getDistrict(?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i",$cid);
        $stmt->execute();
        $result = $stmt->get_result();
        while($row=$result->fetch_assoc()){
            echo "$row[did]&&$row[district_name];;";
     
        }
        $stmt->close();
        $conn->close();
    }
?>