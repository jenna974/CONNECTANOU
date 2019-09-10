<?php
    session_start();
    include('dbconfig.php'); // Fichier PHP contenant la connexion à votre BDD

  // S'il y a une session alors on ne retourne plus sur cette page  
    if (isset($_SESSION['IdReal'])){
        header('Location: index.php');
        exit;
    }

    // Si la variable "$_Post" contient des informations alors on les traitres
    if(!empty($_POST)){
        extract($_POST);
        $valid = true;

        if (isset($_POST['connexion'])){
            $Email_real = htmlentities(strtolower(trim($Email_real)));
            $Mdp_real = trim($Mdp_real);

            if(empty($Email_real)){ // Vérification qu'il y est bien un mail de renseigné
                $valid = false;
                $er_mail = "Il faut mettre un mail";
            }

            if(empty($Mdp_real)){ // Vérification qu'il y est bien un mot de passe de renseigné
                $valid = false;
                $er_mdp = "Il faut mettre un mot de passe";
            }

            // On fait une requête pour savoir si le couple mail / mot de passe existe bien car le mail est unique !
            $req = $DB->query("SELECT * 
                FROM realisateur
                WHERE Email_real = ? AND Mdp_real = ?",
                array($Email_real, password_hash($Mdp_real ("rasmuslerdorf", PASSWORD_DEFAULT))));
                
                
            $req = $req->fetch();

            // Si on a pas de résultat alors c'est qu'il n'y a pas d'utilisateur correspondant au couple mail / mot de passe
            if ($req['IdReal'] == ""){
                $valid = false;
                $er_mail = "Le mail ou le mot de passe est incorrecte";
            }

            // S'il y a un résultat alors on va charger la SESSION de l'utilisateur en utilisateur les variables $_SESSION
            if ($valid){
                $_SESSION['IdReal'] = $req['IdReal']; // id de l'utilisateur unique pour les requêtes futures
                $_SESSION['Nom_real'] = $req['Nom_real'];
                $_SESSION['Prenom_real'] = $req['Prenom_real'];
                $_SESSION['Email_real'] = $req['Email_real'];

                header('Location:  index.php');
                exit;
            }   
        }
    }
?>


<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Connexion</title>
    </head>
    <body>      
        <div>Se connecter</div>
        <form method="post">
            <?php
                if (isset($er_mail)){
            ?>
                <div><?= $er_mail ?></div>
            <?php   
                }
            ?>
            <input type="email" placeholder="Adresse mail" name="Email_real" value="<?php if(isset($Email_real)){ echo $Email_real; }?>" required>
            <?php
                if (isset($er_mdp)){
            ?>
                <div><?= $er_mdp ?></div>
            <?php   
                }
            ?>
            <input type="password" placeholder="Mot de passe" name="Mdp_real" value="<?php if(isset($Mdp_real)){ echo $Mdp_real; }?>" required>
            <button type="submit" name="connexion">Se connecter</button>
        </form>
    </body>
</html>
