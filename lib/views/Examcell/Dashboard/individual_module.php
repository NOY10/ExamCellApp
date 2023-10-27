<?php
require('config.php');

$userID = $_POST['userID'];

$sql = "SELECT Mark.*, Module.maxCA, Module.maxExam, Module.MaxPractical
FROM Mark 
JOIN Module ON Module.code = Mark.code
WHERE Mark.sid = '02210233' and Mark.semester = 'AS2021'";

"SELECT sid,name,practical,ca,exam FROM Mark,Student WHERE sid ='id' and code = 'CPL101' and SemNo='5'";

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
