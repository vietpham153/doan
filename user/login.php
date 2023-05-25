<?php
include '../connection.php';



$userAccount = ($_POST['Useraccount']);
$userPass = md5($_POST['Userpassword']);




$sqlQuery = "SELECT * FROM users_table WHERE 
Useraccount ='$userAccount'AND 
Userpassword ='$userPass' ";
$resultOfQuery = $connection->query($sqlQuery);

if($resultOfQuery -> num_rows > 0)
{
    $userRecord = array();
    while($rowFound = $resultOfQuery-> fetch_assoc()){
        $userRecord[] = $rowFound;
    }
    echo json_encode(
        array(
            "success"=>true,
            "userData"=>$userRecord[0],
        )
    );
}
else
{
    echo json_encode(array("success"=>false));
}