<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <link type="text/css" rel="stylesheet" href="./css/style.css">
    <link type="text/css" rel="stylesheet" href="./css/footer.css">
    <link type="text/css" rel="stylesheet" href="./css/cart.css">
</head>
<header>
    <?php
    include 'navBar.php';
    if(!isset($_SESSION['isLogin'])) header('Location: /webProject');
    ?>
</header>

<body>
    <div class="cart-area">
        <div class="popup">
            <div class="content">
            <h1>Bạn có chắc chắn mua những sản phẩm này không </h1>
            <div class="popup__button">
            <a href="./DB/paidCart.php?uid=<?php echo $_SESSION['uid'] ?>">Thanh Toán</a>
            <a id="exit">Thoát</a>
            </div>
            </div>
        </div>
        <h2>GIỎ HÀNG
            <span id="amount">
                <?php
                require_once './DB/DBconfig.php';
                $uid = $_SESSION['uid'];
                $sql = "call getCountCart(?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param('i', $uid);
                $stmt->execute();
                $result = $stmt->get_result();
                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    echo " ( có $row[count] sản phẩm )";
                } else {
                    echo "( 0 sản phẩm )";
                }
                $stmt->close();
                $conn->next_result();
                ?>
            </span>
        </h2>
        <div class="main-cart">
            <div class="cart-List">

                <?php
                echo "<input id=\"uid\" type=\"hidden\" value=\"$_SESSION[uid]\">";
                $sql = "call getCart(?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param('i', $uid);
                $stmt->execute();
                $result = $stmt->get_result();
                $index = 0;
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<div class=\"product\" id=\"$index\">";
                        $index += 1;
                        echo "<img src=\"$row[imageURL]\" alt=\"product\">";
                        echo "<div class=\"infor-product\">";
                        echo "<p><a href=\"product.php?pid=$row[pid]\">$row[product_name]</a></p>";
                        echo "<p>Số lượng: $row[quality]</p>";
                        echo "<button id=\"$index\" type=\"button\">Xóa</Button>";
                        echo "</div>";
                        echo "<p>".number_format($row['price'])." đ</p>";
                        $index += 1;
                        echo "<input id=\"$index\" type=\"hidden\" value=\"$row[pid]\">";
                        echo "</div>";
                        $index = $index + 1;
                    }
                }
                $stmt->close();
                $conn->next_result();

                ?>
            </div>

            <div class="pay">
                <div class="price">
                    <p>Thành tiền: <span id="total">
                            <?php
                            require_once './DB/DBconfig.php';
                            $uid = $_SESSION['uid'];
                            $sql = "call getTotal(?)";
                            $stmt = $conn->prepare($sql);
                            $stmt->bind_param('i', $uid);
                            $stmt->execute();
                            $result = $stmt->get_result();
                            if ($result->num_rows > 0) {
                                $row = $result->fetch_assoc();
                                echo number_format($row['total'])." đ";
                            } else {
                                echo "0 đ";
                            }
                            $stmt->close();
                            $conn->next_result();
                            ?>
                        </span></p>
                    <p>(Đã bao gồm thuế VAT)</p>
                </div>
                <div class="pay-button">
                    <button id="pay">Thanh toán</button>
                </div>
            </div>
        </div>
    </div>
</body>
<footer>
    <?php include 'footer.php' ?>
</footer>
<script src="./js/cart.js"></script>

</html>