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

        // On se place sur le bon formulaire grâce au "name" de la balise "input"
        if (isset($_POST['inscription'])){
            $nom_real  = htmlentities(trim($nom_real)); // On récupère le nom
            $prenom_real = htmlentities(trim($prenom_real)); // on récupère le prénom
            $email_real = htmlentities(strtolower(trim($email_real))); // On récupère le mail
            $tel_real = trim($tel_real);
            $linkedin_URL = trim($linkedin_URL);
            $mdp_real = trim($mdp_real); // On récupère le mot de passe 
            $confmdp_real = trim($confmdp_real); //  On récupère la confirmation du mot de passe
            $datenais_real = trim($datenais_real);
            
 
            //  Vérification du nom
            if(empty($nom_real)){
                $valid = false;
                $er_nom = ("Le nom d' utilisateur ne peut pas être vide");
            }       

            //  Vérification du prénom
            if(empty($prenom_real)){
                $valid = false;
                $er_prenom = ("Le prenom d' utilisateur ne peut pas être vide");
            }            
 
            // Vérification du mail
            if(empty($email_real)){
                $valid = false;
                $er_mail = "Le mail ne peut pas être vide";

                // On vérifit que le mail est dans le bon format
            }elseif(!preg_match("/^[a-z0-9\-_.]+@[a-z]+\.[a-z]{2,3}$/i", $email_real)){
                $valid = false;
                $er_mail = "Le mail n'est pas valide";

            }else{
                // On vérifit que le mail est disponible
                $req_mail = $DB->query("SELECT email_real FROM realisateur WHERE email_real= ?",
                    array($email_real));

                $req_mail = $req_mail->fetch();

                if ($req_mail['email_real'] <> ""){
                    $valid = false;
                    $er_mail = "Ce mail existe déjà";
                }
            

            if(empty($tel_real)){
                $valid = false;
                $er_tel = ("Le numéro de téléphone ne peut pas être vide");
            }  

        
           if(empty($datenais_real)){
            $valid = false;
            $er_date = ("Veuillez renseignez votre date de naissance");
           }  



            // Vérification du mot de passe
            if(empty($mdp_real)) {
                $valid = false;
                $er_mdp = "Le mot de passe ne peut pas être vide";

            }elseif($mdp_real != $confmdp_real){
                $valid = false;
                $er_mdp = "La confirmation du mot de passe ne correspond pas";
            }

            // Si toutes les conditions sont remplies alors on fait le traitement
            if($valid) {
                
                $mdp_real = password_hash($mdp_real, PASSWORD_DEFAULT);
                $date_creation_compte = date('Y-m-d H:i:s');
            

                // On insert nos données dans la table utilisateur
                $DB->insert("INSERT INTO realisateur (nom_real, prenom_real, email_real, mdp_real, tel_real, datenais_real, linkedin_URL, date_creation_compte) VALUES 
                    (?, ?, ?, ?, ?, ?, ?, ?)", 
                    array($nom_real, $prenom_real, $email_real, $mdp_real, $tel_real, $datenais_real, $linkedin_URL, $date_creation_compte));

                header('Location: index.php');
                exit;
            }
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
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="inscription.css">
        <title>Inscription</title>
    </head>
    <body> 
    <div align="center">     
        <h1>Inscription du réalisateur</h1>
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
            <p> Mon profil </p>
            <input size ="37" type="text" placeholder="Votre nom" name="nom_real" value="<?php if(isset($nom_real)){ echo $nom_real; }?>" required> 
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
            <input size ="37" type="text" placeholder="Votre prénom" name="prenom_real" value="<?php if(isset($prenom_real)){ echo $prenom_real; }?>" required>   
            </td>
            </tr>

            <tr>
            <td>
            <div align= center >
            <style type="text/css">
            select {
            
            font-size : 17px ;
           width : 270px ;
               }
           </style>
         <form size ="37" name="statut" method="post" >
            <select  id="statut" name="statut_real" value="<?php if(isset($statut_real)){ echo $statut_real; }?>" required >
            <option value=""> Choississez votre statut </option>
             <option value="">Etudiant</option>
            <option value="">Formateur</option>
             <option value="">Demandeur d'emploi</option>
            <option value="">Entrepreneur</option>
            <option value="">Salarié</option>
           <option value="">Autre</option>
        </select>
        </form>
        </div>
        </td>
        </tr>


            <?php
                if (isset($er_tel)){
                ?>
                    <div><?= $er_tel ?></div>
            <?php   
                }
            ?>  
            <tr>
            <td>
            <input size ="37" type="tel" placeholder=" Votre numéro de Téléphone"  name="tel_real" pattern="[0-9]{10}" value="<?php if(isset($tel_real)){ echo $tel_real; }?>" required>
            </td>
            </tr>


            <?php
                if (isset($er_date)){
                ?>
                    <div><?= $er_date ?></div>
            <?php   
                }
            ?>  
            <tr>
            <td>
            <label for="">Date de naissance:</label>
            <input size ="37" type="date" placeholder=" Votre date de naissance"  name="datenais_real"  value="<?php if(isset($datenais_real)){ echo $datenais_real; }?>" required>
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
            <input size ="37" type="email" placeholder="Adresse mail" name="email_real" value="<?php if(isset($email_real)){ echo $email_real; }?>" required>
            
            
            <?php
                if (isset($er_mdp)){
                ?>
                    <div><?= $er_mdp ?></div>
                
            </td>
            </tr> 
            <?php   
                }
            ?>
            <tr>
            <td> 
            <input size ="37" type="password" placeholder="Mot de passe" name="mdp_real" value="<?php if(isset($mdp_real)){ echo $mdp_real; }?>" required></td></tr>
            <tr>
            <td> 
            <input size ="37" type="password" placeholder="Confirmer le mot de passe" name="confmdp_real" required>
            
            
        
            <tr>
            <td>
            <p> Ecole </p>
            <form size ="37" name="ecole" method="post" >
            <select  id="ecole" name="ecole" value="" required >
            <option value=""> Choississez votre établissement </option>
             <option value="">SUPINFO</option>
            <option value="">HESIP</option>
             <option value="">ESRN</option>
            <option value="">ILOI</option>
            <option value="">AFPAR</option>
           <option value="">Université de la Réunion</option>
        </select>
        </form>  
            </td>
            </tr>
             
            <tr>
            <td>
            <input size ="37" type="text" placeholder="Formation en cours" name="" value="" required>   
            </td>
            </tr>

            <tr>
            <td>
            <input size ="37" type="text" placeholder="Domaine" name="" value="" required>   
            </td>
            </tr>

           
            <tr>
            <td>
            <p>Votre diplome</p>
            <input size ="37" type="text" placeholder="Dernier diplome obtenue" name="" value="" required>   
            </td>
            </tr>
             
            <tr>
            <td>
            <form size ="37" name="niv_diplome" method="post" >
            <select  id="niv_diplome" name="niv_diplome" value="" required >
            <option value=""> Votre niveau diplome actuel </option>
             <option value="">BAC</option>
            <option value="">BAC+1</option>
             <option value="">BAC+2</option>
            <option value="">BAC+3</option>
            <option value="">BAC+4</option>
           <option value="">BAC+5</option>
           <option value="">BAC+6</option>
            <option value="">BAC+7</option>
            <option value="">BAC+8</option>
           <option value="">Autre</option>
        </select>
        </form>  
            </td>
            </tr>



            <tr><td align="center"><button type="submit" name="inscription">S'inscrire</button></td></tr>

            </table>
        </form>
    </div>
    </body>
</html>