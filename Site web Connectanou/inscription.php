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

        // On se place sur le bon formulaire grâce au "name" de la balise "input"
        if (isset($_POST['inscription'])){
            $Nom_real  = htmlentities(trim($Nom_real)); // On récupère le nom
            $Prenom_real = htmlentities(trim($Prenom_real)); // on récupère le prénom
            $Email_real = htmlentities(strtolower(trim($Email_real))); // On récupère le mail
            $Tel_real = trim($Tel_real);
            // $id_statut_real = trim($id_statut_real);
            $Mdp_real = trim($Mdp_real); // On récupère le mot de passe 
            $ConfMdp_real = trim($ConfMdp_real); //  On récupère la confirmation du mot de passe
            
 
            //  Vérification du nom
            if(empty($Nom_real)){
                $valid = false;
                $er_nom = ("Le nom d' utilisateur ne peut pas être vide");
            }       

            //  Vérification du prénom
            if(empty($Prenom_real)){
                $valid = false;
                $er_prenom = ("Le prenom d' utilisateur ne peut pas être vide");
            }            
 
            // Vérification du mail
            if(empty($Email_real)){
                $valid = false;
                $er_mail = "Le mail ne peut pas être vide";

                // On vérifit que le mail est dans le bon format
            }elseif(!preg_match("/^[a-z0-9\-_.]+@[a-z]+\.[a-z]{2,3}$/i", $Email_real)){
                $valid = false;
                $er_mail = "Le mail n'est pas valide";

            }else{
                // On vérifit que le mail est disponible
                $req_mail = $DB->query("SELECT Email_real FROM realisateur WHERE Email_real= ?",
                    array($Email_real));

                $req_mail = $req_mail->fetch();

                if ($req_mail['Email_real'] <> ""){
                    $valid = false;
                    $er_mail = "Ce mail existe déjà";
                }
            }

            if(empty($Tel_real)){
                $valid = false;
                $er_tel = ("Le numéro de téléphone ne peut pas être vide");
            }  

            // Vérification du mot de passe
            if(empty($Mdp_real)) {
                $valid = false;
                $er_mdp = "Le mot de passe ne peut pas être vide";

            }elseif($Mdp_real != $ConfMdp_real){
                $valid = false;
                $er_mdp = "La confirmation du mot de passe ne correspond pas";
            }

            // Si toutes les conditions sont remplies alors on fait le traitement
            if($valid) {
                
                $mdp_admin = password_hash("rasmuslerdorf", PASSWORD_DEFAULT);
                $date_creation_compte = date('Y-m-d H:i:s');
            

                // On insert nos données dans la table utilisateur
                $DB->insert("INSERT INTO realisateur (Nom_real, Prenom_real, Email_real, Mdp_real, Tel_real, date_creation_compte) VALUES 
                    (?, ?, ?, ?, ?, ?)", 
                    array($Nom_real, $Prenom_real, $Email_real, $Mdp_real, $Tel_real, $date_creation_compte));

                header('Location: index.php');
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
        <title>Inscription</title>
    </head>
    <body> 
    <div align="center">     
        <h1>Inscription</h1>
        <form method="post">
            <?php
                // S'il y a une erreur sur le nom alors on affiche
                if (isset($er_nom)){
                ?>
                    <div><?= $er_nom ?></div>
            <?php   
                }
            ?>
            <table>
            <tr>
            <td>
            <input type="text" placeholder="Votre nom" name="Nom_real" value="<?php if(isset($Nom_real)){ echo $Nom_real; }?>" required> 
            </td>
            </tr>
            

            <?php
                if (isset($er_prenom)){
                ?>
                    <div><?= $er_prenom ?></div>
            <?php   
                }
            ?>
            <tr>
            <td>
            <input type="text" placeholder="Votre prénom" name="Prenom_real" value="<?php if(isset($Prenom_real)){ echo $Prenom_real; }?>" required>   
            </td>
            </tr>


<            <?php
                if (isset($er_tel)){
                ?>
                    <div><?= $er_tel ?></div>
            <?php   
                }
            ?>  -->
            <tr>
            <td>
            <input type="tel" placeholder=" Entrez votre numéro de Téléphone"  name="Tel_real" pattern="[0-9]{10}" value="<?php if(isset($Tel_real)){ echo $Tel_real; }?>" required>
            </td>
            </tr>


            <?php
                if (isset($er_mail)){
                ?>
                    <div><?= $er_mail ?></div>
            </td>
            </tr>
           <?php
                }
            ?>
            <tr>
            <td>
            <input type="email" placeholder="Adresse mail" name="Email_real" value="<?php if(isset($Email_real)){ echo $Email_real; }?>" required>
            
            
            <?php
                if (isset($er_mdp)){
                ?>
                    <div><?= $er_mdp ?></div>
                
            </td>
            </tr> 
            <?php   
                }
            ?>
            <tr><td> <input type="password" placeholder="Mot de passe" name="Mdp_real" value="<?php if(isset($Mdp_real)){ echo $Mdp_real; }?>" required></td></tr>
            <tr><td><input type="password" placeholder="Confirmer le mot de passe" name="ConfMdp_real" required></td></tr>
            <tr><td align="center"><button type="submit" name="inscription">Envoyer</button></td></tr>
            
            </table>
        </form>
    </div>
    </body>
</html>
