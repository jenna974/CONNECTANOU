<?php
// Initialize the session
session_start();
 
// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: connexion.php");
    exit;
}
 
// Include config file
require_once "dbconfig.php";

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'connectanou');
 
/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
// Define variables and initialize with empty values
$email = $mdp = "";
$email_err = $mdp_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Check if username is empty
    if(empty(trim($_POST["email"]))){
        $email_err = "Veuillez renseigner votre email.";
    } else{
        $email = trim($_POST["email"]);
    }
    
    // Check if password is empty
    if(empty(trim($_POST["mdp"]))){
        $mdp_err = "Veuillez renseigner votre mot de passe.";
    } else{
        $mdp = trim($_POST["mdp"]);
    }
    
    // Validate credentials
    if(empty($email_err) && empty($mdp_err)){
        // Prepare a select statement
        $sql = "SELECT id_real, email_real, mdp_real FROM realisateur WHERE email_real = ?";
        
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $param_email);
            
            // Set parameters
            $param_email = $email;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Store result
                mysqli_stmt_store_result($stmt);
                
                // Check if username exists, if yes then verify password
                if(mysqli_stmt_num_rows($stmt) == 1){                    
                    // Bind result variables
                    mysqli_stmt_bind_result($stmt, $id, $email, $hashed_password);
                    if(mysqli_stmt_fetch($stmt)){
                        if(password_verify($mdp, $hashed_password)){
                            // Password is correct, so start a new session
                            session_start();
                            
                            // Store data in session variables
                            $_SESSION["loggedin"] = true;
                            $_SESSION["id_real"] = $id;
                            $_SESSION["prenom_real"] = $email;                            
                            
                            // Redirect user to welcome page
                            header("location: Accueil.php");
                        } else{
                            // Display an error message if password is not valid
                            $mdp_err = "Le mot de passe que vous avez entré n'est pas valide.";
                        }
                    }
                } else{
                    // Display an error message if username doesn't exist
                    $email_err = "Aucun compte trouvé avec cet adresse mail.";
                }
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
        <h1>Se connecter</h1>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group <?php echo (!empty($email_err)) ? 'has-error' : ''; ?>">
                <input type="email" name="email" placeholder="Votre adresse email*" value="<?php echo $email; ?>">
                <span class="help-block"><?php echo $email_err; ?></span>
            </div>    
            <div class="form-group <?php echo (!empty($mdp_err)) ? 'has-error' : ''; ?>">
                <input type="password" placeholder="Votre mot de passe*" name="mdp">
                <span class="help-block"><?php echo $mdp_err; ?></span>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Se connecter"> <br/>  <br/> 
                <p>Vous avez pas de compte ? <a href="inscription.php">Inscrivez-vous maintenant</a>.</p>
                <a href="mdp_oublié.php">Mot de passe oublié ?</a>.</p>
            </div>
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