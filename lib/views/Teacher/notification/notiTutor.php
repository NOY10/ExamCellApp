<?php

require("connection.php");

$tid = $_POST['tid'];
$mid = $_POST['mid'];
$semester = $_POST['semester'];

$sql = "INSERT INTO Notification (tid, mid, semester) VALUES (:tid, :mid, :semester)";
$stmt = $connection->prepare($sql);
$stmt->bind_param(':tid', $tid);
$stmt->bind_param(':mid', $mid);
$stmt->bind_param(':semester', $semester);

if ($stmt->execute()) {
    echo "Data inserted successfully.";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();

?>
