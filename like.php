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
    <link type="text/css" rel="stylesheet" href="./css/like.css">
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
                <p><?php echo $_SESSION['username'] ?></p>
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
                        <div class="user-list">
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
                        <div class="user-list active">
                            <img src="./img/like.png" alt="like">
                            <a href="like.php">Sản phâm đã thích</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="user-order">
            <h3>Sản phảm yêu thích</h3>
            <div class="like-list">
                <?php 
                     echo "<input id=\"uid\" type=\"hidden\" value=\"$_SESSION[uid]\">";
                    require_once './DB/DBconfig.php'; // load config for database
                    $sql = "call getLikeProduct(?)"; // call procedure
                    $uid = $_SESSION['uid'];
                    $stmt = $conn ->prepare($sql);
                    $stmt->bind_param('i',$uid);
                    $stmt->execute();
                    $result = $stmt->get_result();
                    $index =0;
                    //fetch data and render product element
                    if ($result->num_rows>0){
                        while ($row=$result->fetch_assoc()){
                            // add listener for all product button
                            // index identifi button
                            echo "<div class=\"product\" id=\"$index\">";
                            $index+=1;
                            echo "<img src=\"$row[imageURL]\" alt=\"product\">";
                            echo "<div class=\"infor-product\">";
                            echo "<p><a href=\"product.php?pid=$row[pid]\">$row[product_name]</a></p>";
                            echo "<button type=\"button\" id=\"$index\">Xóa</button>";
                            echo "</div>";
                            echo "<p>".number_format($row['price'])." đ</p>";
                            $index +=1; 
                            echo "<input id=\"$index\" type=\"hidden\" value=\"$row[pid]\">";
                            echo "</div>";
                            $index=$index+1;
                        }

                    }
                    $stmt->close();
                    $conn->next_result();
                    $conn->close();

                ?>
            </div>
        </div>
    </div>
</body>
<footer>
    <?php include 'footer.php' ?>
</footer>
<script src="./js/like.js"></script>

</html>