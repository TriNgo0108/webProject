<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm kiếm</title>
    <link type="text/css" rel="stylesheet" href="./css/style.css">
    <link type="text/css" rel="stylesheet" href="./css/footer.css">
    <link type="text/css" rel="stylesheet" href="./css/game.css">
    <link type="text/css" rel="stylesheet" href="./css/sildesImage.css">
</head>
<header>
    <?php
    include 'navBar.php';
    ?>
</header>

<body>
    <?php include 'slideImage.php'; ?>
    <div class="result">
        <h2>Tìm kiếm</h2>
        <?php
        require_once './DB/DBconfig.php';
        if (isset($_REQUEST['search'])){
            setcookie('keyword',$_REQUEST['search'],time()+1800);
            
        }
        $keyword = $_REQUEST['search']?? $_COOKIE['search'];// if $keyword is empty then set $keyword = '';
        $sql = "call getCountSearch(?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('s', $keyword);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $quality = $result->fetch_assoc()['quality'];
        } else {
            $quality = 0;
        }
        $stmt->close();
        $conn->next_result();
        ?>
        <h3>Tìm được <?php echo $quality ?> sản phẩm dựa trên <?php echo $keyword ?></h3>
    </div>
    <div class="game-area">
        <div class="type">
            <p>Loại</p>
            <a href="#">Hành động</a>
            <a href="#">Viễn tưởng</a>
            <a href="#">Giả lập</a>
            <a href="#">Học đường</a>
            <a href="#">Âm nhạc</a>
            <hr>
        </div>
        <div class="game">
            <div class="game__wrapper">
            <?php
            require_once './DB/pagination.php';
            $Ppage = 8;
            $page = computePagination($quality, $Ppage);

            $sql = "call getSearchProduct(?,?,?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param('sii', $keyword, $page['pageStart'], $Ppage);
            $stmt->execute();
            $result = $stmt->get_result();
            if ($result->num_rows > 0) {
            
                while ($row = $result->fetch_assoc()) {
                    
                    echo "<div class=\"product-infor\">";
                    echo "<div class=\"product-image\">";
                    echo "<img src=\"$row[imageURL]\" alt=\"product\">";
                    echo "</div>";
                    echo "<div class=\"wapper\">";
                    echo "<p class=\"product-name\">";
                    echo "<a href=\"./product.php?pid=$row[pid]\">$row[product_name]</a>";
                    echo "</p>";
                    echo "<p>".number_format($row['price'])." đ</p>";
                    echo "</div>";
                    echo "</div>";
                }
            } else {
            }
            $stmt->close();
            $conn->next_result();
           // $conn->close();
            ?>
            </div>
           
            <div class="page">
            <?php
            if ($page['pagePre'] == 0 && $page['pageNext'] == 0) {
                echo "<a href=\"search.php\" id=\"pre\">Trang trước</a>";
                echo "<a href=\"search.php\" id=\"next\">Trang sau</a>";
            } elseif ($page['pageNext'] == 0) {
                echo "<a href=\"search.php?p=$page[pagePre]\" id=\"pre\">Trang trước</a>";
                echo "<a href=\"search.php\" id=\"next\">Trang sau</a>";
            } elseif ($page['pagePre'] == 0) {
                echo "<a href=\"search.php\" id=\"pre\">Trang trước</a>";
                echo "<a href=\"search.php?p=$page[pageNext]\" id=\"next\">Trang sau</a>";
            } else {
                echo "<a href=\"search.php?p=$page[pagePre]\" id=\"pre\">Trang trước</a>";
                echo "<a href=\"search.php?p=$page[pageNext]\" id=\"next\">Trang sau</a>";
            }

            ?>
        </div>
            </div>
        
    </div>
    
</body>
<footer>
    <?php include 'footer.php' ?>
</footer>
<script src="./js/stickyNavBar.js"></script>
<script src="./js/slider.js"></script>

</html>