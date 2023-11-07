
<?php
require('connection.php');

$sql = "SELECT *, Time(Notification.date)
FROM Notification
ORDER BY Time(Notification.date) DESC;";

$result = $connection->prepare($sql);
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
