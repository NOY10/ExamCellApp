<!-- <?php
try {
    $connection = new PDO('mysql:host=localhost;dbname=id21425530_examcelldb', 'id21425530_root', 'Examcell@2023');
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $exc) {
    echo $exc->getMessage();
    die;
}
?> -->
<?php

try{
    $connection = new PDO('mysql:host=localhost;dbname=id21433673_resultdb','id21433673_norphel','1qaz@WSX' );
    $connection -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Yes Connected";
}catch(PDOException $exc){
    echo $exc -> getMessage();
    die("Could not connected");
}

?>