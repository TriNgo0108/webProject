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
    <title>Đăng Ký</title>
</head>
<header>
    <?php
    include 'navBar.php';
    ?>
</header>

<body>
    <div class="main-register">
        <div class="image">
            <img src="./img/register.png" alt="register">
        </div>
        <div class="login-area">
            <h3>Đăng ký tài khoản mới ! </h3>
            <div class="login-form">
                <form action="./DB/register.php" method="POST">
                    <div class="input-field">
                        <p>Tên người dùng<span>*</span></p>
                        <input type="text" name="username" placeholder="username" required>
                    </div>
                    <div class="input-field" id="passwordField">
                        <p>Mật khẩu<span>*</span></p>
                        <input type="password" id="password" name="password" placeholder="Mật khẩu của bạn" required>
                        <p id="error-password"></p>
                    </div>
                    <div class="input-field" id="repasswordField">
                        <p>Nhập lại mật khẩu của bạn<span>*</span></p>
                        <input type="password" id="repassword" placeholder="Nhập lại mật khẩu của bạn" required>
                        <p id="error-repassword"></p>
                    </div>
                    <div class="input-field">
                        <p>Email của bạn<span>*</span></p>
                        <input type="text" name="email" id="email" placeholder="Nhập email của bạn" required>
                        <p id="error-email"></p>
                    </div>

                    <div class="input-field">
                        <p>Số điện thoại của bạn<span>*</span></p>
                        <input type="text" name="phone" id="phone" placeholder="Nhập số điện thoại của bạn" required>
                        <p id="error-phone"></p>
                    </div>
                    <div class="input-field">
                        <p>Địa chỉ<span>*</span></p>
                        <div class="address">
                            <div class="city-address">
                                <label for="city">Tỉnh/Thành phố</label>
                                <select id="city" name="city" required>

                                    <?php
                                    require_once './DB/DBconfig.php';
                                    $sql = "call getCity()";
                                    $result = $conn->query($sql);
                                    if ($result->num_rows > 0) {
                                        while ($row = $result->fetch_assoc()) {
                                            echo "<option value=" . $row['cid'] . ">";
                                            echo $row['city_name'];
                                            echo "</option>";
                                        }
                                    }
                                    $result->close();
                                    $conn->next_result();
                                    ?>
                                </select>
                            </div>
                            <div class="district-address">
                                <label for="district">Quận/Huyện</label>
                                <select id="district" name="district" required>
                                    <?php
                                    $sql = "SELECT * FROM district WHERE CID=1";
                                    $result = $conn->query($sql);
                                    if ($result->num_rows > 0) {
                                        while ($row = $result->fetch_assoc()) {
                                            echo "<option value=" . $row['did'] . ">";
                                            echo $row['district_name'];
                                            echo "</option>";
                                        }
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="street-address">
                                <label for="street">Tên đường</label>
                                <input type="text" name="street" placeholder="Tên đường" required>
                                </label>
                            </div>
                        </div>
                    </div>
                    <button id="register" name="register">Đăng ký</button>
                </form>
            </div>
        </div>
        <div class="orLoginWith">
            <p>Đã có tài khoản</p>

            <div class="register">
                <a href="login.php">Đăng nhập tại đây</a>
            </div>
            <div class="login-method" id="fb">
                <img src="./img/fb.png">
                <p>Facebook</p>
            </div>
            <div class="login-method" id="gg">
                <img src="./img/google.png">
                <p>Google</p>
            </div>
        </div>
    </div>
</body>
<footer>
    <?php include 'footer.php' ?>
</footer>
<script src="./js/stickyNavBar.js"></script>
<script src="./js/dropDown.js"></script>
<script src="./js/checkRegister.js"></script>


<script>
   

</script>
</html>