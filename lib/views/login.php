<?php
include 'config.php';

// Add debugging statements
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (isset($_POST['Email']) && isset($_POST['Password'])) {
    $email = $_POST['Email'];
    $password = $_POST['Password'];

    $table = "Users";
    $sql = "SELECT * FROM $table WHERE email = :Email AND password = :Password";

    // Prepare the SQL statement
    $stmt = $connection->prepare($sql);

    // Bind parameters
    $stmt->bindParam(':Email', $email, PDO::PARAM_STR);
    $stmt->bindParam(':Password', $password, PDO::PARAM_STR);

    // Execute the statement
    $stmt->execute();

    // Check for results
    if ($stmt->rowCount() > 0) {
        $response = $stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode($response);
    } else {
        $response = array("role" => "Error");
        echo json_encode($response);
    }
} else {
    $response = array("role" => "Error");
    echo json_encode($response);
}
?>
