<?php
try{

$pdo = new PDO('mysql:dbname=bddgestionstages;host=localhost',"root","root");
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(Exception $e)
{
  die("Une érreur a été trouvé : " . $e->getMessage());
}

?>

