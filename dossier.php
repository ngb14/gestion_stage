<?php
require_once('cobdd.php');
session_start();
$user= $_GET['NUMETUD'];
$sql="SELECT * FROM etudiant WHERE NUMETUD = ?";
$data=array($user);
try{
  $req=$pdo->prepare($sql);
  $req->execute($data);
  $result=$req->fetchALL();
 
}catch(Exception $e){
  echo"Erreur ! ".$e->getMessage();
  echo" Les datas : ";
  print_r($data);
}
$nbresult= !empty($result) ? count($result) : 0;
if ($nbresult == 1) {
    $userinfo = $result[0];
    $_SESSION['envoi'] = $userinfo['Mail'];

}

?>
<!DOCTYPE html>
<html lang="fr">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">

    <title>Etat Civil</title>

    <link rel="stylesheet" href="assets/css/dossier.css">

  </head>
  <a href="modifetud.php?NUMETUD=<?=$userinfo['NUMETUD']?>" class="btn btn-primary" role="button">Création Étudiant</a>
  <a href="stage.php?NUMETUD=<?=$userinfo['NUMETUD']?>" class="btn btn-primary" role="button">Ajout stage</a>
  <a href="convention.php?NUMETUD=<?=$userinfo['NUMETUD']?>" class="btn btn-primary" role="button">Generer Convention</a>
  

<body>
  <div id="header">
    <main class="main-content">
    <center><div class="ges"><?= $userinfo['NOMETUD'] ."  ". $userinfo['PREETUD']?> </div></center>
</main>
  </div>

