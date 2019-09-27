
function afficherAutreStatut() {
    var a = document.getElementById("autre_statut");
    var m = document.getElementById("mots_statut");
    
    if (document.form1.liste1.value == 6)
    {
        if (a.style.display == "none")
          a.style.display = "block";
   
        if (m.style.display == "none")
          m.style.display = "block";
    }
    else
    {
        a.style.display = "none";
      m.style.display = "none";	
    }
  }

  function afficherAutre_ecole() {
    var a = document.getElementById("autre_ecole");
    var m = document.getElementById("mots_ecole");
    
    if (document.form3.liste3.value == 7)
    {
        if (a.style.display == "none")
          a.style.display = "block";
   
        if (m.style.display == "none")
          m.style.display = "block";
    }
    else
    {
        a.style.display = "none";
      m.style.display = "none";	
    }
  }

  function afficherAutre_domaine() {
    var a = document.getElementById("autre_domaine");
    var m = document.getElementById("mots_domaine");
    
    if (document.form4.liste4.value == 17)
    {
        if (a.style.display == "none")
          a.style.display = "block";
   
        if (m.style.display == "none")
          m.style.display = "block";
    }
    else
    {
        a.style.display = "none";
      m.style.display = "none";	
    }
  }

  function afficherAutre_nivdip() {
    var a = document.getElementById("autre_nivdip");
    var m = document.getElementById("mots_nivdip");
    
    if (document.form2.liste2.value == 10)
    {
        if (a.style.display == "none")
          a.style.display = "block";
   
        if (m.style.display == "none")
          m.style.display = "block";
    }
    else
    {
        a.style.display = "none";
      m.style.display = "none";	
    }
  }


