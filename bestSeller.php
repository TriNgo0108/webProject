<div class="product-area">
    <div class="theItemTitle">
        <h2>Best seller</h2>
        <a href="#">Xem thêm</a>
    </div>
    <hr>
    <div class="product-list">
        <?php
        require_once './DB/DBconfig.php';
        $sql = "call BLNproduct(?)";
        $stmt = $conn->prepare($sql);
        $type ='B';
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
                echo "<p>".number_format($row['price'],3)." đ</p>";
                echo "</div>";
            }

        } else {
        }
        $stmt->close();
        $conn->next_result();
        ?>
    </div>
</div>