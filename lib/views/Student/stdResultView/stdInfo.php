<?php
include 'config.php';

if (isset($_POST['userID'])) {

    $userID = $_POST['userID'];

    $sql = "SELECT name,SemNo,program,id FROM Student WHERE id = :userID";

    // Prepare the SQL statement
    $stmt = $connection->prepare($sql);


    $stmt->bindParam(':userID', $userID, PDO::PARAM_STR);

    $stmt->execute();

    // Check for results
    if ($stmt->rowCount() > 0) {
        $response = $stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode($response);
    } else {
        echo json_encode(array("error" => "No data found"));
        echo json_encode($response);
    }
}
?>
