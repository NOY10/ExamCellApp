<?php
include 'config.php';

if (isset($_POST['Email'])) {
    $email = $_POST['Email'];
    $password = $_POST['Password'];

    $table = "Users";
    $sql = "SELECT * FROM $table WHERE Email = :Email AND Password = :Password";

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
        $response = array("Role" => "Error");
        echo json_encode($response);
    }
}
