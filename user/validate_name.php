<?php
include '../connection.php';
$userAccount = $_POST['Useraccount'];

$sqlQuery = "SELECT * from users_table where Useraccount = '$userAccount'";

$resultOfQuery = $connection->query($sqlQuery);

if($resultOfQuery -> num_rows > 0){
    echo json_encode(array("emailFound"=>true));
}else{
    echo json_encode(array("emailFound"=>false));
}