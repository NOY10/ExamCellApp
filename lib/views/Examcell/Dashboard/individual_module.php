<?php
require('config.php');

// Check if the required parameters exist in the POST data
if (isset($_POST['semester'], $_POST['moduleCode'])) {
    $semester = $_POST['semester'];
    $moduleCode = $_POST['moduleCode'];

    // $sql = "SELECT sid, name, practical, ca, exam FROM Mark, Student WHERE sid = :userID AND code = :moduleCode AND SemNo = :semester";
    $sql = "SELECT Mark.*,name FROM Mark,Student WHERE code = :moduleCode and id=sid";

    $result = $connection->prepare($sql);
    // $result->bindParam(':userID', $userID, PDO::PARAM_INT);
    // $result->bindParam(':semester', $semester, PDO::PARAM_INT);
    $result->bindParam(':moduleCode', $moduleCode, PDO::PARAM_STR);
   
    
    $result->execute();

    $db_data = array();

    if ($result->rowCount() > 0) {
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            $db_data[] = $row;
        }
        echo json_encode($db_data);
    } else {
        echo json_encode(array("error" => "No data found"));
    }
} else {
    echo json_encode(array("error" => "Missing parameters"));
}

$connection = null;
