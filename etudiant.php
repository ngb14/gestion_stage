<?php
require_once('cobdd.php');
// recupération des usager
$sql="SELECT * FROM etudiant";
try{
    $req=$pdo->prepare($sql);
    $req->execute();
    $result=$req->fetchALL();


}catch(Exception $e){
    echo"Erreur ! ".$e->getMessage();
    echo" Les datas : ";
    print_r($sql);
}
?> 
 
<!DOCTYPE html>
<html>
    <head>
        <title>GESTION DE STAGE</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
    <div class="center">
<a href="creeretud.php" class="btn btn-primary" role="button">Création Étudiant</a>
</div>

    <table>
  <thead>
 <tr>
 <th>Nom</th>
<th>Prenom</th>
<th>Sexe</th>
<th>Date Naissance</th>
<th>Spécialité</th>
<th>Mail</th>
 
 </tr>
  </thead>
  <tbody>

 <?php
 foreach($result as $ap){
  ?>
<tr class="Nom">
<td class="num"><a href="dossier.php?NUMETUD=<?= $ap['NUMETUD'] ?>"><?= $ap['NOMETUD'] ?></a></td>
<td class="date1"><?= $ap['PREETUD'] ?></td>
<td class="nom1"><?= $ap['SEXEETUD'] ?></td>
<td class="prenom1"><?= $ap['DATENAISSETUD'] ?></td>
<td class="tel"><?= $ap['SPEETUD'] ?></td>
<td class="date"><?= $ap['MAILETUD'] ?></td>
<?php }?>
    </tr>
  </tbody>
 </table>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    </body>
</html>



