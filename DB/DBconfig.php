<?php 
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $databse ="wefi";
    
    // Create connection
    $conn = new mysqli($servername, $username, $password,$databse);
    
    // Check connection
    if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
    }
?>