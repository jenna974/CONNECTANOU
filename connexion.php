<?php
    session_start();
    include('dbconfig.php'); // Fichier PHP contenant la connexion à votre BDD

  // S'il y a une session alors on ne retourne plus sur cette page  
    if (isset($_SESSION['id_real'])){
        header('Location: index.php');
        exit;
    }

    // Si la variable "$_Post" contient des informations alors on les traitres
    if(!empty($_POST)){
        extract($_POST);
        $valid = true;

        if (isset($_POST['connexion'])){
            $email_real = $_POST['email_real'];
            $mdp_real = $_POST['mdp_real'];

            if(empty($email_real)){ // Vérification qu'il y est bien un mail de renseigné
                $valid = false;
                $er_mail = "Il faut mettre un mail";
            }

            if(empty($mdp_real)){ // Vérification qu'il y est bien un mot de passe de renseigné
                $valid = false;
                $er_mdp = "Il faut mettre un mot de passe";
            }
            
            // On fait une requête pour savoir si le couple mail / mot de passe existe bien car le mail est unique !
            
            $req = $DB->query("SELECT * FROM realisateur WHERE email_real = ? AND mdp_real = ?",
                array($email_real, $mdp_real));
                
             $req = $req->fetch();  

                if (password_verify($_POST['mdp_real'], $req['mdp_real'])) {
                echo "success";
                }
            

            // Si on a pas de résultat alors c'est qu'il n'y a pas d'utilisateur correspondant au couple mail / mot de passe
            if ($req['id_real'] == ""){
                $valid = false;
                $er_mail = "Le mail ou le mot de passe est incorrecte";
                
            }elseif($req['n_mdp'] == 1){ // On remet à zéro la demande de nouveau mot de passe s'il y a bien un couple mail / mot de passe
                $DB->insert("UPDATE utilisateur SET n_mdp = 0 WHERE id = ?", 
                    array($req['id']));
            }

            // S'il y a un résultat alors on va charger la SESSION de l'utilisateur en utilisateur les variables $_SESSION
            if ($valid){
                $_SESSION['id_real'] = $req['id_real']; // id de l'utilisateur unique pour les requêtes futures
                $_SESSION['nom_real'] = $req['nom_real'];
                $_SESSION['prenom_real'] = $req['prenom_real'];
                $_SESSION['email_real'] = $req['email_real'];

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
            <input type="email" placeholder="Adresse mail" name="email_real" value="<?php if(isset($email_real)){ echo $email_real; }?>" required>
            <?php
                if (isset($er_mdp)){
            ?>
                <div><?= $er_mdp ?></div>
            <?php   
                }
            ?>
            <input type="password" placeholder="Mot de passe" name="mdp_real" value="<?php if(isset($mdp_real)){ echo $mdp_real; }?>" required>
            <button type="submit" name="connexion">Se connecter</button>
        </form>
    </body>
</html>