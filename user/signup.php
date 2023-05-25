<?php
include '../connection.php';



$userAccount = ($_POST['Useraccount']);
$userPass = md5($_POST['Userpassword']);
$userEmail = ($_POST['Email']);
$userPhoneNum = ($_POST['PhoneNum']);
$userName = ($_POST['userName']);



$sqlQuery = "INSERT INTO users_table SET 
Useraccount ='$userAccount', 
Userpassword ='$userPass', 
Email ='$userEmail', 
PhoneNum ='$userPhoneNum', 
userName ='$userName'";
$resultOfQuery = $connection->query($sqlQuery);

if($resultOfQuery){
    echo json_encode(array("success"=>true));
}else{
    echo json_encode(array("success"=>false));
}