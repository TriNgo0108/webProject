<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm</title>
    <link type="text/css" rel="stylesheet" href="./css/style.css">
    <link type="text/css" rel="stylesheet" href="./css/footer.css">
    <link type="text/css" rel="stylesheet" href="./css/product.css">
    <link rel="icon" type="image/png" href="./img/icon.png">
</head>
<header>
    <?php
    include 'navBar.php';
    ?>
</header>

<body>
    <div class="main">
        <div class="popup">
            <h1>Đã thêm sản phảm vào giỏ hàng</h1>
        </div>
        <div class="product">
            <?php
            require_once './DB/DBconfig.php';
            $sql = "call getProductDetail(?)";
            $pid = $_REQUEST['pid'];
            $stmt = $conn->prepare($sql);
            $stmt->bind_param('i', $pid);
            $stmt->execute();
            $result = $stmt->get_result();
            
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                echo "<div class='img-zoom-container'>";
                echo "<div id='result' class='img-zoom-result'></div>";
                echo "<div id='lens' class='img-zoom-lens'></div>";
                echo "<img src=\"$row[imageURL]\" id='image' alt=\"product\">";
                echo "</div>";
                echo "<div class=\"detail\">";
                echo "<div class=\"name\">";
                echo "<h3>Tên sản phẩm: $row[product_name]</h3>";
                echo "</div>";
                echo "<div class=\"price\">";
                echo "<h4> Giá: ".number_format($row['price'])." đ</h4>";
                echo "</div>";
                $about = explode(",", $row['about']);
                echo "<div class=\"about\"";
                echo "<h5>Tác giả: $about[0]</h5>";
                echo "<h5>Hãng sản xuất: $about[1]</h5>";
                echo "</div>";
                $description = '';
                for ($i = 2; $i < count($about); $i++) {
                    $description .= $about[$i];
                }
                $para = explode('.', $description);
                echo "<div class=\"Synopsis\">";
                foreach ($para as $pa) {
                    echo "<p>$pa    </p>";
                }
                echo "</div>";
            } else {
                die();
            }
            $stmt->close();
            $conn->next_result();

            ?>
            
            <div class="form">
                <div class="amount">
                    <button type="button" id="increase">+</button>
                    <input type="number" id="quality" value="1" min=1 name="about">
                    <button type="button" id="decrease">-</button>
                </div>
                <?php
                if (isset($_SESSION['isLogin']))
                    echo "<input type=\"button\" id=\"buy\" value=\"Mua\" name=\"buy\">";
                else {
                    echo "<a href=\"./login.php\" >Mua";
                    echo "</a>";
                }
                ?>
                <?php
                if (isset($_SESSION['isLogin'])) {

                    echo "<button type=\"button\" id=\"like\">";
                    echo "<span class=\"icon icon-like\"></span>";
                    echo "</button>";
                } else {

                    echo "<button type=\"button\" class=\"like\">";
                    echo "<a href=\"./login.php\">";
                    echo "<span class=\"icon icon-like\"></span>";
                    echo "</a>";
                    echo "</button>";
                }
                ?>
                <input id="pid" type="hidden" value=<?php echo $_REQUEST['pid'] ?>>
                <input id="uid" type="hidden" value=<?php if (isset($_SESSION['uid'])) echo $_SESSION['uid'] ?>>
            </div>
        </div>
    </div>
</body>
<footer>
    <?php include 'footer.php' ?>
</footer>
<script src="./js/stickyNavBar.js"></script>
<script src="./js/qualityButton.js"></script>
<script src="./js/product.js"></script>
</html>