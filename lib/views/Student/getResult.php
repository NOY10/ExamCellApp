<?php
require('config.php');

$sql = "SELECT Mark.*, Module.maxCA, Module.maxExam, Module.MaxPractical
FROM Mark 
JOIN Module ON Module.code = Mark.code
WHERE Mark.sid = '02210233' and Mark.semester = 'AS2021'";

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

return;
?>
