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
            
            $mdp_real = trim($mdp_real); // On récupère le mot de passe 
            $confmdp_real = trim($confmdp_real); //  On récupère la confirmation du mot de passe
            $datenais_real = trim($datenais_real);
            $id_statut_real = trim($id_statut_real);

            
            
 
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
           
           if(empty($id_statut_real)){
            $valid = false;
            $er_statut_real = ("Veuillez renseignez votre statut");
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
                $DB->insert("INSERT INTO realisateur (nom_real, prenom_real, email_real, mdp_real, tel_real, datenais_real, id_statut_real, date_creation_compte) VALUES 
                    (?, ?, ?, ?, ?, ?, ?, ?)", 
                    array($nom_real, $prenom_real, $email_real, $mdp_real, $tel_real, $datenais_real, $id_statut_real, $date_creation_compte));

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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="Accueilcss.css">
  <link rel="stylesheet" href="inscription.css">
</head>
    
    <body> 
    <div align="center">     
        <h1>Inscription du réalisateur</h1>
        <form method="post">

        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"> <img src="logo_connectanou.png" width="150" height="70"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="Accueil.html">Accueil</a></li>
        <li><a href="#">Blog</a></li>
        <li><a href="lequipe.html">L'équipe</a></li>
        <li><a href="landingrea.html">Réalisateur</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	 <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Recherches">
      </div>
      <button type="submit" class="btn btn-default"><img src="iconeloupe.svg" witdh="30" height="20"></button>
    </form>
      	<li><a href="inscription.php"><span class="glyphicon glyphicon-user"></span> S'incrire</a></li>
      <li><a href="connexion.php"><span class="glyphicon glyphicon-log-in"></span>Se connecter</a></li>
      </ul>
    </div>
  </div>
</nav>

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

            <?php
                if (isset($er_statut_real)){
                ?>
                    <div><?= $er_statut_real ?></div>
            <?php   
                }
            ?>
            <tr>
            <td>
            <div align= center >
            <style type="text/css">
            select {
            
            font-size : 17px ;
           width : 270px ;
               }
           </style>
         <form size ="37" name="id_statut_real" method="post" >
            <select  id="statut" name="id_statut_real" value="<?php if(isset($id_statut_real)){ echo $id_statut_real; }?>" required>
            <option value=""> Choississez votre statut </option>
             <option value="1">Etudiant</option>
            <option value="2">Formateur</option>
             <option value="3">Demandeur d'emploi</option>
            <option value="4">Salarié</option>
            <option value="5">Entrepreneur</option>
           <option value="6">Autre</option>
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
            <input size ="37" type="text" placeholder="Formation en cours" name=""  required>   
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
            <input size ="37" type="text" placeholder="Dernier diplome obtenue" required>   
            </td>
            </tr>
             

            
            <?php
                if (isset($er_niv_dip)){
                ?>
                    <div><?= $er_niv_dip ?></div>
            <?php   
                }
            ?> 
            <tr>
            <td>
            <form size ="37" name="niveau_diplome" method="post" >
            <select  id="niv_diplome" name="niveau_diplome" >
            <option value=""> Votre niveau diplome actuel </option>
             <option value="1">BAC</option>
            <option value="2">BAC+1</option>
             <option value="3">BAC+2</option>
            <option value="4">BAC+3</option>
            <option value="5">BAC+4</option>
           <option value="6">BAC+5</option>
           <option value="7">BAC+6</option>
            <option value="8">BAC+7</option>
            <option value="9">BAC+8</option>
           <option value="10">Autre</option>
        </select>
        </form>  
            </td>
            </tr>
            <tr><td align="center"><button type="submit" name="inscription">S'inscrire</button></td></tr>
        
            </table>
        </form>
    </div>

    <footer class="container-fluid text-center" >
  <img src="029-instagram.png" width="35px" height="35px">
  <a href="https://www.linkedin.com/company/connectanou/"><img src="027-linkedin.png" width="35px" height="35px"></a>
  <a href="https://www.facebook.com/connectanou/""><img src="036-facebook.png" width="35px" height="35px"></a>
  <img src="008-twitter.png" width="35px" height="35px">
  <a href="PageContact.html">Contact</a>
  <a href="mentionlegale.html">Mentions légales</a>
</footer>
    </body>
</html>