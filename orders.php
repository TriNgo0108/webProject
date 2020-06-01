<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài khoản của tôi</title>
    <link type="text/css" rel="stylesheet" href="./css/style.css">
    <link type="text/css" rel="stylesheet" href="./css/footer.css">
    <link type="text/css" rel="stylesheet" href="./css/user.css">
    <link type="text/css" rel="stylesheet" href="./css/orders.css">
</head>
<header>
    <?php
    include 'navBar.php';
    ?>
</header>

<body>
    <div class="main-user">
        <div class="user-action">
            <div class="user-name">
                <p>Tài khoản của</p>
                <p><?php echo $_SESSION['username']  ?></p>
            </div>
            <div class="link">
                <ul>
                    <li>
                        <div class="user-list">
                            <img src="./img/user.png" alt="user">
                            <a href="user.php">Thông tin tài khoản</a>
                        </div>
                    </li>
                    <li>
                        <div class="user-list active">
                            <img src="./img/order.png" alt="order">
                            <a href="orders.php">Quản lý đơn hàng</a>
                        </div>
                    </li>
                    <li>
                        <div class="user-list">
                            <img src="./img/address.png" alt="address">
                            <a href="address.php">Thông tin địa chỉ</a>
                        </div>
                    </li>
                    <li>
                        <div class="user-list">
                            <img src="./img/like.png" alt="like">
                            <a href="like.php">Sản phâm đã thích</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="user-order">
            <h3>Đơn hàng của tôi</h3>
            <div class="order-list">
                <table>
                    <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Ngày mua</th>
                            <th>Sản phẩm</th>
                            <th>Tổng tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            require_once './DB/DBconfig.php';
                            $uid = $_SESSION['uid'];
                            $sql = "call getOrders(?)";
                            $stmt = $conn ->prepare($sql);
                            $stmt->bind_param('i',$uid);
                            $stmt->execute();
                            $result = $stmt ->get_result();
                            if ($result->num_rows>0){
                                while ($row = $result->fetch_assoc()){
                                    echo "<tr>";
                                   echo "<td>".rand(100000,999999)."</td>";
                                    echo "<td>$row[orderDate]</td>";
                                    echo "<td>$row[product_name]</td>";
                                    echo "<td>$row[total]</td>";
                                    echo "<tr>";
                                }
                            }
                        ?>
                        <!-- <tr>
                            <td>551831607</td>
                            <td>05/09/2019</td>
                            <td>Thẻ Nhớ Micro SD Samsung Evo Plus U1 32GB Class 10 - 95MB/s (Kèm Adapter) - Hàng Chính Hãng</td>
                            <td>117.000 ₫</td>
                        </tr>
                        <tr>
                            <td>855723549</td>
                            <td>05/03/2019</td>
                            <td>Code Dạo Kí Sự - Lập Trình Viên Đâu Phải Chỉ Biết Code</td>
                            <td>157.000 ₫</td>
                        </tr> -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
<footer>
    <?php include 'footer.php' ?>
</footer>

</html>