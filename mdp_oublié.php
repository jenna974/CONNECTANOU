<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: mdp_oublié.php");
    exit;
}
 
// Include config file
require_once "dbconfig.php";
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'connectanou');
 
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

// Define variables and initialize with empty values
$new_password = $confirm_password = "";
$new_password_err = $confirm_password_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Validate new password
    if(empty(trim($_POST["new_password"]))){
        $new_password_err = "Veuillez renseigner un mot de passe.";     
    } elseif(strlen(trim($_POST["new_password"])) < 6){
        $new_password_err = "Mot de passe doit contenir au moins 6 carartère minimun.";
    } else{
        $new_password = trim($_POST["new_password"]);
    }
    
    // Validate confirm password
    if(empty(trim($_POST["confirm_password"]))){
        $confirm_password_err = "Veuillez confirmer votre mot de passe s'il vous plaît.";
    } else{
        $confirm_password = trim($_POST["confirm_password"]);
        if(empty($new_password_err) && ($new_password != $confirm_password)){
            $confirm_password_err = "Les mots de passes ne se correspondent pas !!.";
        }
    }
        
    // Check input errors before updating the database
    if(empty($new_password_err) && empty($confirm_password_err)){
        // Prepare an update statement
        $sql = "UPDATE realisateur SET mdp_real= ? WHERE id_real = ?";
        
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "si", $param_password, $param_id);
            
            // Set parameters
            $param_password = password_hash($new_password, PASSWORD_DEFAULT);
            $param_id = $_SESSION["id_real"];
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Password updated successfully. Destroy the session, and redirect to login page
                session_destroy();
                header("location: connexion.php");
                exit();
            } else{
                echo "Oops!.";
            }
        }
        
        // Close statement
        mysqli_stmt_close($stmt);
    }
    
    // Close connection
    mysqli_close($link);
}
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mot de passe oublié</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="Accueilcss.css"></head>
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

        <h1>Reinitialiser votre mot de passe</h1>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post"> 
            <div class="form-group <?php echo (!empty($new_password_err)) ? 'has-error' : ''; ?>">
                <input type="password" placeholder="Nouveau mot de passe*" name="new_password" value="<?php echo $new_password; ?>">
                <span class="help-block"><?php echo $new_password_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($confirm_password_err)) ? 'has-error' : ''; ?>">
                <input type="password" name="confirm_password" placeholder="Confirmer le mot de passe*" >
                <span class="help-block"><?php echo $confirm_password_err; ?></span>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Envoyer">
                <a class="btn btn-link" href="mdp_oublié.php">Quitter</a>
            </div>
        </form>
        </form>
            </div>
            <footer class="footer navbar-fixed-bottom" >
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
