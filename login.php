<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="./css/style.css">
    <link type="text/css" rel="stylesheet" href="./css/footer.css">
    <link type="text/css" rel="stylesheet" href="./css/login.css">
    <link rel="icon" type="image/png" href="./img/icon.png">
    <title>Đăng nhập</title>
</head>
<header>
    <?php
    include 'navBar.php';
    ?>
</header>

<body>
    <div class="main">
        <div class="login-area">
            <h3>Chào mừng trở lại ! </h3>
            <h3>Đăng nhập để sử dụng dịch vụ của chúng tôi</h3>
            <div class="login-form">
                <form action="./DB/login.php" method="POST">
                    <div class="input-field">
                        <p>Số điện thoại hoặc email<span>*</span></p>
                        <input type="text" name="phoneOrEmail" placeholder="Nhập số điện thoại hoặc email của bạn" required>
                    </div>
                    <div class="input-field">
                        <p>Mật khẩu<span>*</span></p>
                        <div class="password">
                            <input type="password" id="password" name="password" placeholder="Mật khẩu của bạn" required>
                            <input id="hide" type="checkbox">Hiện
                        </div>
                    </div>

                    <?php
                    if (isset($_COOKIE['loginError'])) {
                        echo "<p>Tài khoản hoặc mật khẩu không đúng</p>";
                    }
                    ?>

                    <button id="login" name="login">Đăng nhập</button>
                </form>
            </div>
        </div>
        <div class="orLoginWith">
            <p>Hoặc đăng nhập với</p>
            <div class="login-method" id="fb">
                <img src="./img/fb.png">
                <p>Facebook</p>
            </div>
            <div class="login-method" id="gg">
                <img src="./img/google.png">
                <p>Google</p>
            </div>
            <p>Chưa có tài khoản</p>
            <div class="register">
                <a href="register.php">Đăng ký</a>
            </div>
        </div>
    </div>
</body>
<footer>
    <?php include 'footer.php' ?>
</footer>
<script src="./js/stickyNavBar.js"></script>
<script src="./js/hidePassword.js"></script>

</html>