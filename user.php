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
                        <div class="user-list active">
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
                        <div class="user-list">
                            <img src="./img/like.png" alt="like">
                            <a href="like.php">Sản phâm đã thích</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="user-info">
            <h3>Thông tin khách hàng</h3>
            <form action="./DB/updateInfor.php" method="POST">
                <div class="element">
                    <label class="element-label">Họ tên</label>
                    <div>
                        <input type="text" name="name" value=<?php echo $_SESSION['username'] ?>>
                    </div>
                </div>
                <div class="element">
                    <label class="element-label">Số điện thọai</label>
                    <div>
                        <input type="text" name="phone" value=<?php echo $_SESSION['phone']?>>
                    </div>
                </div>
                <div class="element">
                    <label class="element-label">Email</label>
                    <div>
                        <input type="email" name="email" value=<?php echo $_SESSION['email'] ?>>
                    </div>
                </div>
                <div class="element">
                    <div>
                        <input type="submit" name="submit"  value="Cập Nhật">
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
<footer>
    <?php include 'footer.php'?>
</footer>

</html>