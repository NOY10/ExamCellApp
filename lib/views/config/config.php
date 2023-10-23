<?php
try {
    $connection = new PDO('mysql:host=localhost;dbname=id21425530_examcelldb', 'id21425530_root', 'Examcell@2023');
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $exc) {
    echo $exc->getMessage();
    die;
}
?>