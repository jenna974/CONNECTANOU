<?php
  // Permet de savoir s'il y a une session. 
  // C'est à dire si un utilisateur c'est connecté à votre site 
  session_start(); 
  
  // Fichier PHP contenant la connexion à votre BDD
  include('dbconfig.php');
  
?>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Accueil</title>
  </head>
  <body>
    <h1>Connectanou</h1>
    <?php
      if(!isset($_SESSION['id'])){ // Si on ne détecte pas de session alors on verra les liens ci-dessous
      ?>
        <a href="inscription.php">Inscription</a> <!-- Liens de nos futures pages -->
        <a href="connexion.php">Connexion</a>
        <a href="motdepasse.php">Mot de passe oublié</a>
        <a href="mention legale.php">Mention légales</a>
      <?php
      }else{ // Sinon s'il y a une session alors on verra les liens ci-dessous
      ?>
        <a href="profil.php">Mon profil</a>
        <a href="deconnexion.php">Déconnexion</a>
      <?php
      } 
    ?>
  </body>
</html>