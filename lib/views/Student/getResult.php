<?php
require('config.php');

$sql = "SELECT Mark.*, Module.Credit, Module.ModuleName, Module.MaxCA, Module.MaxExam, Module.MaxPractical
              FROM Mark
              JOIN Module ON Module.ModuleCode = Mark.ModuleCode
              WHERE Mark.StdID = '02210215' AND YEAR(Mark.DateofExam) = 2023 AND Mark.SemNo = 4";

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