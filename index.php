<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wefi</title>
    <link type="text/css" rel="stylesheet" href="./css/style.css">
    <link type="text/css" rel="stylesheet" href="./css/sildesImage.css">
    <link type="text/css" rel="stylesheet" href="./css/theItems.css">
    <link type="text/css" rel="stylesheet" href="./css/offer.css">
    <link type="text/css" rel="stylesheet" href="./css/footer.css">
</head>
<header>
    <?php
        include 'navBar.php';
    ?>
</header>
<body>
    <?php include 'slideImage.php';?>
    <section>
        <?php include 'bestSeller.php';?>
        <?php include 'limitedProduct.php';?>
        <?php include 'newProduct.php';?>
    </section>
    <?php include 'newOffers.php';?>
</body>
<footer>
    <?php include 'footer.php'?>
</footer>
<script src="./js/slider.js"></script>
<script src="./js/stickyNavBar.js"></script>
</html>