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
                echo "bienvenue";
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="Accueilcss.css"></head>

        <title>Connexion</title>
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
      <a class="navbar-brand" href="#"><img src="https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/69245688_401188947269284_5766408162303279104_n.png?_nc_cat=101&_nc_oc=AQl7DOHb15dlmvNAvaLyACCPvENgm14C_53LsxrgtsimMLCpPi5rFh7jWLLj_CBZnGI&_nc_ht=scontent-cdg2-1.xx&oh=67393af4accd26d24f43f5d33399b3a7&oe=5E15AB3B" width="40px" height="30px" margin-bottom="15px"</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Accueil</a></li>
        <li><a href="#">Blog</a></li>
        <li><a href="#">Project</a></li>
        <li><a href="#">L'équipe</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	 <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">Chercher</button>
    </form>
      	<li><a href="inscription.php"><span class="glyphicon glyphicon-user"></span> S'incrire</a></li>
      <li><a href="connexion.php"><span class="glyphicon glyphicon-log-in"></span>Se connecter</a></li>
      </ul>
    </div>
  </div>
</nav>

        <h1>Se connecter</h1>
        <form method="post">
            <?php
                if (isset($er_mail)){
            ?>
                <div><?= $er_mail ?></div>
            <?php   
                }
            ?>

            <table>
            
            <tr>
            <td align="center">
            <input type="email" placeholder="Adresse mail ou login" name="email_real" value="<?php if(isset($email_real)){ echo $email_real; }?>" required>
            </td>
            </tr>

            <?php
                if (isset($er_mdp)){
            ?>
                <div><?= $er_mdp ?></div>
            <?php   
                }
            ?>
            <tr>
            <td>
            <input type="password" placeholder="Mot de passe" name="mdp_real" value="<?php if(isset($mdp_real)){ echo $mdp_real; }?>" required></td></tr>

            <tr>
            <td align="center"><button type="submit" name="connexion">Se connecter</button></td>
            </tr>
            
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