<?php
include '../connection.php';



$userAccount = ($_POST['userAcount']);
$userPass = ($_POST['userPassword']);




$sqlQuery = "SELECT * FROM doctor_table WHERE 
userAcount ='$userAccount'AND 
userPassword ='$userPass' ";
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