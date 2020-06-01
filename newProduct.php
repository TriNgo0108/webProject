<div class="product-area">
    <div class="theItemTitle">
        <h2>Sản phẩm mới</h2>
        <a href="#">Xem thêm</a>
    </div>
    <hr>
    <div class="product-list">
    <?php
        require_once './DB/DBconfig.php';
        $sql = "call BLNproduct(?)";
        $stmt = $conn->prepare($sql);
        $type ='N';
        $stmt->bind_param('s',$type);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<div class=\"product-infor\">";
                echo "<div class=\"product-image\">";
                echo "<img src=\"$row[imageURL]\" alt=\"product\">";
                echo "</div>";
                echo "<p class=\"product-name\">";
                echo "<a href=\"./product.php?pid=$row[pid]\">$row[product_name]</a>";
                echo "</p>";
                echo "<p>".number_format($row['price'])." đ</p>";
                echo "</div>";
            }

        } else {
        }
        $stmt->close();
        $conn->next_result();
        ?>
        <!-- <div class="product-infor">
            <div class="product-image">
                <img src="./img/dvdAnime/yourName.jpg" alt="product">
            </div>
            <p class="product-name"><a href="#">Your Name</a></p>
            <p>200000 đ</p>
        </div>
        <div class="product-infor">
            <div class="product-image">
                <img src="./img/manga/Kaguya1.jpg" alt="product">
            </div>
            <p class="product-name"><a href="#">Kaguya Sama: Love is war</a></p>
            <p>200000 đ</p>
        </div>
        <div class="product-infor">
            <div class="product-image">
                <img src="./img/dvdAnime/FoodWar.jpg" alt="product">
            </div>
            <p class="product-name"><a href="#">Food War</a></p>
            <p>200000 đ</p>
        </div>
        <div class="product-infor">
            <div class="product-image">
                <img src="./img/lightNovels/NoGameNoLife.jpg" alt="product">
            </div>
            <p class="product-name"><a href="#">No Game No Life</a></p>
            <p>200000 đ</p>
        </div> -->

    </div>
</div>