<div class="nav-bar">
    <div class="nav-bar-top">
        <div class="column">
            <?php
            if (isset($_SESSION['username'])) {
                echo "<p>Xin chào " . $_SESSION['username'] . " </p>";
            } else {
                echo "<p>Xin chào quý khách </p>";
            }
            ?>
            <!-- sau khi đổi đuôi thành php nhớ thay đổi thành  -->
        </div>
        <div class="right column">
            <ul>
                <li>
                    <?php
                    if (isset($_SESSION['isLogin'])) {
                        echo "<div class=\"dropdown\">";
                        echo "<a href=\"user.php\" class=\"dropbtn\">Tài khoản của tôi</a>";
                        echo "<div class=\"dropdown-content\">";
                        echo "<a href=\"address.php\">Địa chỉ</a>";
                        echo "<a href=\"like.php\">Sản phẩm đã thích</a>";
                        echo "<a href=\"orders.php\">Hóa đơn</a>";
                        echo "</div>";
                        echo "</div>";
                    } else {
                        echo "<a href=\"login.php\">Tài khoản của tôi</a>";
                    }
                    ?>
                </li>
                <!-- Khi đăng nhập thành công thì đăng nhập và đăng ký đổi thành đăng xuất-->
                <?php
                if (isset($_SESSION['isLogin'])) {
                    echo "<li>";
                    echo "<a href=\"./DB/logout.php\">Đăng Xuất</a>";
                } else {
                    echo "<li>";
                    echo "<a href=\"login.php\">Đăng nhập</a>";
                    echo "</li>";

                    echo "<li>";
                    echo "<a href=\"register.php\">Đăng Ký</a>";
                    echo "</li>";
                }
                ?>
            </ul>
        </div>
    </div>
    <div class="nav-bar-bottom" id="bottomNavBar">
        <div class="column">
            <a href="/webProject"><img src="./img/wefi_logo.png" alt="logo"></a>
        </div>
        <div class="column">
            <ul>
                <li>
                    <a href="/webProject">Trang chủ</a>
                </li>
                <li>
                    <a href="game.php">Game</a>
                </li>
                <li>
                    <a class="dropbtn" href="figure.php">Figure</a>
                </li>
                <li>
                    <a class="dropbtn" href="manga.php">Manga và sách</a>
                </li>
                <li>

                    <a class="dropbtn" href="dvd.php">DVD - Bluray </a>

                </li>
            </ul>
        </div>
        <div class="input-container column">
            <form action="./search.php" id="search" method="post">
                <input class="input-field" type="text" placeholder="Tìm kiếm sản phẩm" name="search">
                <div class="">
                    <input type="submit" value="">
                </div>

            </form>
        </div>
        <div class="icon-button column">
            <?php
            if (isset($_SESSION['isLogin'])) {
                echo "<a href=\"like.php\"><span class=\"icon icon-like\"></span></a>";
                echo "<a href=\"cart.php\"><span class=\"icon icon-cart\"></span></a>";
            } else {
                echo "<a href=\"login.php\"><span class=\"icon icon-like\"></span></a>";
                echo "<a href=\"login.php\"><span class=\"icon icon-cart\"></span></a>";
            }
            ?>
        </div>
    </div>
</div>