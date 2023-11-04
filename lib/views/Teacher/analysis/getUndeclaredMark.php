<?php
require('connection.php');

$tid = $_GET['tid'];
$semester = $_GET['semester'];

$sql = "SELECT * FROM undeclaredMark WHERE tid = "";;

$result = $connection->prepare($sql);
$result->bindParam(':tid', $tid, PDO::PARAM_STR);
$result->execute();

$db_data = array();

if ($result->rowCount() > 0) {
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $db_data[] = $row;
    }
    echo json_encode($db_data);
} else {
    echo "error";
}

$connection = null;
?>
