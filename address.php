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
    <link type="text/css" rel="stylesheet" href="./css/address.css">
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
                <p><?php echo $_SESSION['username']?></p>
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
                        <div class="user-list active">
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
            <h3>Thông tin địa chỉ </h3>
            <form action="./DB/updateAddress.php" method="POST">
                <div class="input-field">
                    <p>Địa chỉ<span>*</span></p>
                    <div class="address">
                        <div class="city-address">
                            <label for="city">Tỉnh/Thành phố</label>
                            <select id="city" name="city">
                                <option value="1" <?php if($_SESSION['cid']==1)  echo "selected"?>>Cần Thơ</option>
                                <option value="2" <?php if($_SESSION['cid']==2)  echo "selected"?>>Hồ Chí Minh</option>
                                <option value="3" <?php if($_SESSION['cid']==3)  echo "selected"?>>An giang</option>
                                <option value="4" <?php if($_SESSION['cid']==4)  echo "selected"?>>Hậu giang</option>
                            </select>
                        </div>
                        <div class="district-address">
                            <label for="district">Quận/Huyện</label>
                            <select id="district" name="district">
                               <?php 
                                 require_once './DB/DBconfig.php';
                                 $sql = "CALL getDistrict(?)";
                                 $stmt = $conn->prepare($sql);
                                 $stmt->bind_param("i",$_SESSION['cid']);
                                 $stmt->execute();
                                 $result = $stmt->get_result();
                                 while($row=$result->fetch_assoc()){
                                     echo "<option value=".$row['did'];
                                     if($_SESSION['did']==$row['did']){
                                         echo " selected";
                                         echo ">";
                                     }
                                     else{
                                         echo">";
                                     }
                                     echo $row['district_name']."</option>";
                              
                                 }
                                 $stmt->close();
                                 $conn->close();
                               ?>
                            </select>
                        </div>
                        <div class="street-address">
                            <label for="street">Tên đường</label>
                            <input type="text" name="street" placeholder="Tên đường" value=<?php echo $_SESSION['street']?> >
                            </label>
                        </div>
                    </div>
                </div>
                <input type="submit" id="update" name="submit" value="Cập nhật">
            </form>
        </div>
    </div>
    <script src="./js/dropDown.js"></script>
</body>
<footer>
    <?php include 'footer.php' ?>
</footer>

</html>