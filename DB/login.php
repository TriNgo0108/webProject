<?php
session_start();
if (isset($_REQUEST['login'])) {
  require_once('./DBconfig.php');
  $sql = "call login(?,?,?)";
  $phoneOrEmail = $_REQUEST['phoneOrEmail'];
  $password = $_REQUEST['password'];

  $stmt = $conn->prepare($sql);
  if (strpos($phoneOrEmail, '@')) {
    $phone = null;
    $stmt->bind_param('sss', $phoneOrEmail, $phone, $password);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {

      $row = $result->fetch_assoc();
  
      $_SESSION['isLogin'] = true;
      $_SESSION['uid'] = $row['uid'];
      $_SESSION['username'] = $row["username"];
      $_SESSION['phone'] = $row['phone'];
      $_SESSION['email'] = $row['email'];
      $_SESSION['cid'] = $row['cid'];
      $_SESSION['did'] = $row['did'];
      $_SESSION['street'] = $row['street'];
      header('Location: ../../webProject');
    } else {
      header('Location: ../login.php');
      setcookie('loginError', true, time() + 10, '/');
    }
  } else {
    $email = null;
    $stmt->bind_param('sss', $email, $phoneOrEmail, $password);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
      $row = $result->fetch_assoc();
      $_SESSION['isLogin'] = true;
      $_SESSION['uid'] = $row['uid'];
      $_SESSION['username'] = $row["username"];
      $_SESSION['phone'] = $row['phone'];
      $_SESSION['email'] = $row['email'];
      $_SESSION['cid'] = $row['cid'];
      $_SESSION['did'] = $row['did'];
      $_SESSION['street'] = $row['street'];
      header('Location: ../../webProject');
    } else {
      header('Location: ../login.php');
      setcookie('loginError', true, time() + 10, '/');
    }
  }
}
