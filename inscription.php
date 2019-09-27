<?php

include "dbconfig.php";
 
// Definir les variables
$nom_real = $prenom_real = $tel_real = $datenais_real =  $email_real = $mdp_real = $confmdp_real  = "";
$nom_err = $prenom_err = $tel_real_err = $datenais_err = $email_err = $mdp_err = $confmdp_err  = "";
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'connectanou');
 
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

if($_SERVER["REQUEST_METHOD"] == "POST"){
    

    // Valider les champs

     if(empty(trim($_POST["nom_real"]))){
        $nom_err = "Veuillez renseigner un nom";
        } else{
        $nom_real = trim($_POST["nom_real"]);
        }

       if(empty(trim($_POST["prenom_real"]))){
        $prenom_err = "Veuillez renseigner un prénom.";
        } else{
        $prenom_real = trim($_POST["prenom_real"]);
        } 
 
       if(empty(trim($_POST["tel_real"]))){
        $tel_real_err = "Veuillez renseigner un numéro de téléphone";
        } else{
        $tel_real = trim($_POST["tel_real"]);
        } 

      if(empty(trim($_POST["datenais_real"]))){
        $datenais_err = "Veuillez renseigner une date de naissance";
        } else{
        $datenais_real = trim($_POST["datenais_real"]);
        }
       
    if(empty(trim($_POST["email_real"]))){
    $email_err = "Veuillez renseigner une email";
    }else{
            $sql = "SELECT id_real FROM realisateur WHERE email_real = ?";
            
            if($stmt = mysqli_prepare($link, $sql)){
              
                mysqli_stmt_bind_param($stmt, "s", $param_email);
                
                $param_email = trim($_POST["email_real"]);
                
                if(mysqli_stmt_execute($stmt)){
                   
                    mysqli_stmt_store_result($stmt);
                    
                    if(mysqli_stmt_num_rows($stmt) == 1){
                        $email_err = "Ce email existe déjà.";
                    } else{
                        $email_real = trim($_POST["email_real"]);
                    }
                } else{
                    echo "Oops!.";
                }
            }

            mysqli_stmt_close($stmt);
        }

    
    if(empty(trim($_POST["mdp_real"]))){
        $mdp_err = "Veuillez renseigner un mot de passe.";     
    } elseif(strlen(trim($_POST["mdp_real"])) < 6){
        $mdp_err = "Mot de passe doit contenir au moins 6 carartère minimun.";
    } else{
        $mdp_real = trim($_POST["mdp_real"]);
    }
    
    
    if(empty(trim($_POST["confmdp_real"]))){
        $confmdp_err = "Veuillez confirmer votre mot de passe s'il vous plaît.";     
    } else{
        $confmdp_real = trim($_POST["confmdp_real"]);
        if(empty($mdp_err) && ($mdp_real != $confmdp_real)){
            $confmdp_err = "Les mots de passes ne se correspondent pas !!.";
        }
    }
    
    // Inserer les données dans le bdd
    if(empty($mdp_err) && empty($confmdp_err) && empty($nom_err) && empty($prenom_err) && empty($tel_real_err) && empty($datenais_err) && empty($email_err)){
    
        $sql = "INSERT INTO realisateur (mdp_real, nom_real, prenom_real, tel_real, datenais_real, email_real) VALUES (?,?,?,?,?,?)";
         
        if($stmt = mysqli_prepare($link, $sql)){
            mysqli_stmt_bind_param($stmt,'ssssss', $param_password, $nom_real, $prenom_real, $tel_real, $datenais_real, $param_email);
           
            $param_email = $email_real;
            $param_password = password_hash($mdp_real, PASSWORD_DEFAULT); 
            
            if(mysqli_stmt_execute($stmt)){
      
                header("location: Accueil.php");
            } else{
                echo "Désolés de la gêne occasionner. Veuillez réessayer plus tard";
            }
        }
    
        mysqli_stmt_close($stmt);
    }

    mysqli_close($link);
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
  <script type="text/javascript" src="js_site.js"></script>
</head>
    
    <body> 
    <div align="center">     

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
        <li><a href="Accueil.php">Accueil</a></li>
        <li><a href="#">Blog</a></li>
        <li><a href="lequipe.html">L'équipe</a></li>
    <li><a href="landingrea.html">Réalisateur</a></li>
        <li><a href="landingporter.html">Porteur de projet</a></li>
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

<h1>Inscription du réalisateur</h1>
        <form method="post">
        <table><tr><td>
            <?php
                if (isset($nom_err)){
                ?>
                    <div><?= $nom_err ?></div>
            <?php   
                }
            ?>
            
            <p> Mon profil </p>
            <input size ="37" type="text" placeholder="Votre nom*" name="nom_real" value="<?php if(isset($nom_real)){ echo $nom_real; }?>" required>       
            <br/><br/>
            <?php
                if (isset($prenom_err)){
                ?>
                    <div><?= $prenom_err?></div>
            <?php   
                }
            ?>
           
            <input size ="37" type="text" placeholder="Votre prénom*" name="prenom_real" value="<?php if(isset($prenom_real)){ echo $prenom_real; }?>" required> <br/><br/>
            </td></tr>

            <tr><td>
            <style type="text/css">
            select {
           font-size : 17px ;
           width :301px ;
               }
            </style>
           
              <?php
                if (isset($statut_err)){
                ?>
                    <div><?= $statut_err?></div>
            <?php   
                }
            ?>

<form></form>
           <form name="form1" method="post" action="" size ="37" >
            <select  name="liste1" onChange="afficherAutreStatut()" onChange="afficherAutre()" >
            <option value=""> Votre statut* </option>
             <option value="1" >Etudiant</option>
            <option value="2">Formateur</option>
             <option value="3">Demandeur d'emploi</option>
            <option value="4">Salarié</option>
            <option value="5">Entrepreneur</option>
           <option  value="6">Autre</option>
    </select>
    <span id=autre_statut style="display: none"> </span> <br/>
    <input type="text" id="mots_statut" name="mots_statut" style="display: none" placeholder="Autre statut*"><br/>
</form>
<input size ="37" type="text" placeholder="Login" name="login_real" value="<?php if(isset($login_real)){ echo $login_real; }?>">  
<br/> 
        <br/>
        </td>
        </tr>
            <?php
                if (isset($tel_real_err)){
                ?>
                    <div><?=$tel_real_err ?></div>
            <?php   
                }
            ?>  
            <tr>
            <td>
            <input size ="37" type="tel" placeholder=" Votre numéro de Téléphone*"  name="tel_real" pattern="[0-9]{10}" value="<?php if(isset($tel_real)){ echo $tel_real; }?>" required><br/> 
        <br/>

            <?php
                if (isset($datenais_err)){
                ?>
                    <div><?= $datenais_err?></div>
            <?php   
                }
            ?>  

            <label for="">Date de naissance:</label>
            <input size ="37" type="date" placeholder=" Votre date de naissance*"  name="datenais_real"  value="<?php if(isset($datenais_real)){ echo $datenais_real; }?>" required><br/><br/>
            </td>
            </tr>
 
            <?php
                if (isset($email_err)){
                ?>
                    <div><?= $email_err?></div>
            </td>
            </tr>
           <?php
                }
            ?>
            <tr>
            <td>
            <input size ="37" type="email" placeholder="Adresse mail*" name="email_real" value="<?php if(isset($email_real)){ echo $email_real; }?>" required><br/><br/>
            
            <?php
                if (isset($mdp_err)){
                ?>
                    <div><?= $mdp_err?></div>
                
            </td>
            </tr> 
            <?php   
                }
            ?>
            <tr>
            <td> 
            <input size ="37" type="password" placeholder="Mot de passe*" name="mdp_real" value="<?php if(isset($mdp_real)){ echo $mdp_real; }?>" required>

            <input size ="37" type="password" placeholder="Confirmer le mot de passe*" name="confmdp_real" required><br/>           </td>
            </tr>  
            
            <tr>
            <td>
            <br/>
            <p>Votre diplome</p>
             
            <?php
                if (isset($er_niv_dip)){
                ?>
                    <div><?= $er_niv_dip ?></div>
            <?php   
                }
            ?> 
            
           <form name="form2" method="post" action="" size ="37" >
          <select name="liste2" onChange="afficherAutre_nivdip()"  id="niv_diplome" name="niveau_diplome" >
            <option value=""> Votre niveau diplome actuel* </option>
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
        <input size ="37" type="text" placeholder="Dernier diplome obtenue*" name="dip_obt" required> 
        <span id=autre_nivdip style="display: none"> </span> <br/>
    <input type="text" id="mots_nivdip" name="mots_nivdip" style="display: none" placeholder="Autre niveau diplome*">
        </form>
        <br/>  
            </td>
            </tr>
            </div>
            
            <tr>
            <td>
          <p>Ecole (Pour les étudiant(e)s) </p>
            <form name="form3" size ="37"  method="post" >
            <select name="liste3"  onChange="afficherAutre_ecole()" onChange="afficherAutre()" name="ecole" value="<?php if(isset($ecole)){ echo $ecole; }?>" required>
            <option  value=""> Votre établissement* </option>
             <option value="1">Supinfo</option>
            <option value="2">HESIP</option>
             <option value="3">ESRN</option>
            <option value="4">ILOI</option>
            <option value="5">AFPAR</option>
           <option value="6">Université de la Réunion</option>
           <option value="7">Autre</option>
        </select>
        <span id=autre_ecole style="display: none"> </span> <br/>
       <input type="text" id="mots_ecole" name="mots_ecole" style="display: none" placeholder="Autre ecole*"><br/>
        </form> 
        </td>
            </tr>

            <tr>
            <td>
            <input   id="mots_ecole" name="id_formation"  size ="37" type="text" placeholder="Formation en cours*"   required>  <br/><br/>
            </td>
            </tr>

            <tr>
            <td>
            <form  name="form4" size ="37"  method="post" >
            <select  name="liste4" onChange="afficherAutre_domaine()"  id="statut" name="id_domaine" value="<?php if(isset($id_domaine)){ echo $id_domaine; }?>" required>
            <option value=""> Votre domaine* </option>
             <option value="1">Informatique - Réseau - Télécom</option>
            <option value="2">Economie - Droit juridique - Politique</option>
             <option value="3">Electricité - Electronique - Robotique - Mécanique</option>
            <option value="4">Agriculture - Agrolimentaie - Environnement</option>
            <option value="5">Mode - Esthétique - Beauté</option>
           <option value="6">Banque - Assurance - Immobilier</option>
           <option value="7"> Construction - Architecture - Travaux publics</option>
             <option value="8">Comptabilité - Finance - Gestion</option>
            <option value="9">Tourisme - Hôtellerie - Restauration</option>
             <option value="10">Transport - Logistique</option>
            <option value="11">Arts - Lettres - Langues - Culture - Sciences humaine</option>
            <option value="12">Edition - Presse - Médias - Journalisme</option>
           <option value="13">Commerce - Vente - Marketing</option>
           <option value="14"> Sport - Loisir </option>
             <option value="15">Santé - Social</option>
            <option value="16">Audiovisuel - Graphisme</option>
             <option value="17">Autre</option>
             </select>
             <span id=autre_domaine style="display: none"> </span> <br/>
       <input type="text" id="mots_domaine" name="mots_domaine" style="display: none" placeholder="Autre domaine*">
        </form>
        
        <br/><br/>

            <tr><td align="center"> Tous les champs avec un * sont obligatoires !!<br/><br/></td></tr> <br/><br/>
            <tr><td align="center"><label><input type="checkbox" name="condition" id="condition" required> J'accepte <a href="mentionlegale.html">les thermes &amp; et les conditions</a> pour l'inscription.</label ></td></tr>
            <tr><td align="center"><button type="submit" name="inscription">S'inscrire</button><br/><br/></td></tr>
            <tr><td align="center"><p>Vous avez un compte ? <a href="connexion.php">Connectez-vous ici !!</a></p><br/><br/></td></tr>
            </table>
        </form>
    </div>

    <footer class="footer navbar-bottom" >
    <div class="container text-center">
  <img src="029-instagram.png" width="35px" height="35px">
  <a href="https://www.linkedin.com/company/connectanou/"><img src="027-linkedin.png" width="35px" height="35px"></a>
  <a href="https://www.facebook.com/connectanou/"><img src="036-facebook.png" width="35px" height="35px"></a>
  <img src="008-twitter.png" width="35px" height="35px">
  <a href="PageContact.html">Contact</a>
  <a href="mentionlegale.html">Mentions légales</a>
            </div>
</footer>
    </body>
</html>