<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Online handeln</title>
    <!-- MDB icon -->
    <link rel="icon" href="img/logo3.png" type="image/x-icon" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
    />
    <!-- MDB -->
    <link rel="stylesheet" href="css/mdb.min.css" />
    
    <style>
    	p {
    		color:red;
    	}
    	
    	#submitbutton {
    		width:auto;
    	 	margin:auto;
    	}
    	
    	.forms{
    		width:70%;
    		margin-top:30px;
    		margin:auto;
    		background-color:white;
    		padding:12px;
    		padding-left:25px;
    		padding-right:25px;
    		border: 1px white solid;
    		border-radius:4px;
    		
    	}
    	
    	@media screen and (max-width: 992px){
    		.forms {
    			width:90%;
    			padding-left:15px;
    			padding-right:15px;
    		}
    		#Name,#el,#Vorname,#el3,#Geburtsdatum,#el4,#Geburtsort,#el5,#Adresse,#el6,#Email,#el7,#Passwort,#el8,#Telephon,#el9{
    			font-size:0.9em;
    		}
    	}
    	
    	@media screen and (max-width: 600px){
    		.forms{
    			width:98%;
    			padding-left:1px;
    		    padding-right:1px;
    		}
    		#Name,#el,#Vorname,#el3,#Geburtsdatum,#el4,#Geburtsort,#el5,#Adresse,#el6,#Email,#el7,#Passwort,#el8,#Telephon,#el9,#el10,#radio1,#radio2{
    			font-size:0.9em;
    		}
    	}
    	
    
    
    
    </style>
  </head>
  <body style="background-image: url('<%= request.getContextPath()%>/background1.jpg');background-size:cover;background-repeat:no-repeat;background-attachment:fixed;">
    <!-- Start your project here-->
    
    <!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#48D1CC;">
	  <!-- Container wrapper -->
	  <div class="container-fluid">
	    <!-- Toggle button -->
	    <button
	      class="navbar-toggler"
	      type="button"
	      data-mdb-toggle="collapse"
	      data-mdb-target="#navbarSupportedContent"
	      aria-controls="navbarSupportedContent"
	      aria-expanded="false"
	      aria-label="Toggle navigation"
	    >
	      <i class="fas fa-bars"></i>
	    </button>
	
	    <!-- Collapsible wrapper -->
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <!-- Navbar brand -->
	      <a class="navbar-brand mt-2 mt-lg-0" href="<%= request.getContextPath()%>/index.jsp">
	        <img
	         src="img/logo3.png"
		          height="80"
	          alt=""
	          loading="lazy"
	        />
	      </a>
	     
	    </div>
	    <!-- Collapsible wrapper -->
	
	   
	  </div>
	  <!-- Container wrapper -->
	</nav>
<!-- Navbar -->

	<div class="text-center lead  mt-3"  style="color:white; font-weight:bold; font-size:2.3em;" id="el1">Registrierung</div>	
	
<!-- formular start-->
     <div class="forms">
     	<form style="padding:25px;margin-top:2%; " class="mx-1" action="registrierung">
			   <div class="row">
			   	<div class="col-md-6">
			   		<div class="row">
			   			<div class="col-sm">
			   				<span class="text-danger">*</span>
			   				<div class="form-outline mb-4">
				   				<input type="text" name="Name" id="Name" class="form-control" value="${Name}">
				   				<label for="Name" class="form-label" id="el2">Name</label>
				   			</div>
				   			<p id="Namefehler">${fehlermeldung.checkname}</p>
				   		</div>
			   			
				   			
			   			<div class="col-sm">
			   				<span class="text-danger">*</span>
			   				<div class="form-outline mb-4">
				   				<input type="text" name="Vorname" id="Vorname" class="form-control" value="${Vorname}">
				   				<label for="Vorname" class="form-label" id="el3">Vorname</label>
			   				</div>
			   				<p id="Vornamefehler">${fehlermeldung.checkVorname}</p>
			   			</div>
			   		</div>
			   		<div class="row">
			   			<div class="col-sm">
			   			<span style="visibility:hidden;">*</span>
			   				<div class="form-outline mb-4">
				   				<input type="date" name="Geburtsdatum" id="Geburtsdatum" class="form-control" value="${Geburtsdatum}">
				   				<label for="Geburtsdatum" class="form-label" id="el4">Geburtsdatum</label>
			   				</div>
			   				
			   			</div>
			   			<div class="col-sm">
			   			<span style="visibility:hidden;">*</span>
			   				<div class="form-outline mb-4">
				   				<input type="text" name="Geburtsort" id="Geburtsort" class="form-control" value="${Geburtsort}">
				   				<label for="Geburtsort" class="form-label" id="el5">Geburtsort</label>
			   				</div>
			   				
			   			</div>
			   		</div>
			   	</div >
			   	<div class="col-md-4">
			   		<div class="row">
			   			<div class="col-sm">
			   			<span class="text-danger">*</span>
			   				<div class="form-outline mb-4">
				   				<input type="text" name="Adresse" id="Adresse" class="form-control" value="${Adresse}">
				   				<label for="Adresse" class="form-label" id="el6">Adresse</label>
			   				</div>
			   				<p id="Adressefehler">${fehlermeldung.checkAdresse}</p>
			   			</div>
			   			<div class="col-sm">
			   				<span class="text-danger">*</span>
			   				<div class="form-outline mb-4">
				   				<input type="email" name="Email" id="Email" class="form-control" value="${Email}">
				   				<label for="Email" class="form-label" id="el7">Email</label>
			   				</div>
			   				<p id="Emailfehler">${fehlermeldung.checkEmail}</p>
			   			</div>
			   		</div>
			   		<div class="row">
			   			<div class="col-sm">
			   			<span class="text-danger">*</span>
			   				<div class="form-outline mb-4">
				   				<input type="password" name="Passwort" id="Passwort" class="form-control" value="${Passwort}">
				   				<label for="Passwort" class="form-label" id="el8">Passwort</label>
			   				</div>
			   				<p id="Passwortfehler">${fehlermeldung.checkPasswort}</p>
			   			</div>
			   			<div class="col-sm">
			   			<span style="visibility:hidden;">*</span>
			   				<div class="form-outline mb-4">
			   					<input type="text" name="Telephon" id="Telephon" class="form-control" value="${Telephon}">
			   					<label for="Telephon" class="form-label" id="el9">Telephon</label>
			   				</div>
			   				
			   			</div>
			   		</div>
			   	</div>
			   	<div class="col-md-2">
			   	
			   			<span class="text-danger">* </span><p class="leaf" style="margin-top:10px;display:inline-block; color:black;" id="el10">was sind Sie?<p>
			   					
			   					<div class="form-check">
			      				<label class="form-check-label" for="radio1">
			       					 <input type="radio" class="form-check-input" id="radio1" name="radiob" onclick="rolleChecked(this)" value="kaufer" >buyer
			      				</label>
			    				</div>
			    				<div class="form-check">
			     					 <label class="form-check-label" for="radio2">
			        					<input type="radio" class="form-check-input" id="radio2" name="radiob" onclick="rolleChecked(this)" value="Verkaufer" >seller
			      					</label>
			   					 </div>
			   					 <p id="Rollefehler">${fehlermeldung.checkRolle}</p>
			   					 
			   					 <div style="visibility:hidden;"  id="Pseudoblock">
			   					 	<span class="text-danger">*</span>
			   					 	<div class="form-outline mb-4" >
				   						<input type="text" name="Pseudo" id="Pseudo" class="form-control" value="${Pseudo}">
				   						<label for="Pseudo" class="form-label" id="el13">Pseudo</label>
				   					</div>
			   					 </div>
			   					 
			   					 <p id="Pseudofehler">${fehlermeldung.checkpseudo}</p>
			   					 <p>${pseudovorhanden}</p>
			   					    				  
			   	 	</div>
			   </div>
			   <div class="row">
			   		 <input type="submit" style="width:200px; border:1px solid #48D1CC;border-radius:200px; padding:5px; font-size:0.9em;background-color:#48D1CC;color: white; margin:auto;" id="submitbutton" value="registrieren" />
			   </div>
			   
			</form>
				
     </div>


<!-- formular end -->
    
    <!-- End your project here-->

    <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript">
    	var pseudofehler = document.getElementById("Pseudofehler").value;
    	if(pseudofehler=="Wählen Sie Kaufer und dann geben Sie ein Pseudo ein Oder Wählen Sie Verkaufer"){
    		document.getElementById("Pseudoblock").style.visibility='visible';
    	}
    
    
      function rolleChecked(e){
    	
      	if(e.value=="kaufer"){
      		document.getElementById("Pseudoblock").style.visibility='visible';
      	}else{
      		document.getElementById("Pseudoblock").style.visibility='hidden';
      	} 
      	
      }  
    	
      var erfolg = "<%=(request.getSession().getAttribute("erfolg"))%>";
      if(erfolg=="ok"){
    	  let lg = <%= request.getSession().getAttribute("language")%>
    	  if(parseInt(lg)==0){
    		 alert("register successed! Go to Homepage to connect yourself");
    	  }else if(parseInt(lg)==1){
    		  alert("enregistrement réussi. Allez à la page d acceuil pour vous connecter");
    	  }else{
    		  alert("Registrierung erfolgreich. welseln Sie bitte auf die Hauptseite, um sich anzumelden");
    	  }
	    		  
      }
      
      
      //language
      
        setInterval(function(){
	    	var lg = <%= request.getSession().getAttribute("language")%>
	    	
	    	if(parseInt(lg)==0){
	    		
	    		document.getElementById("el1").innerText = "Registration";
	    		document.getElementById("el2").innerText = "name";
	    		document.getElementById("el3").innerText = "first name";
	    		document.getElementById("el4").innerText = "birthsday";
	    		document.getElementById("el5").innerText = "birthsplace";
	    		document.getElementById("el6").innerText = "adresse";
	    		document.getElementById("el7").innerText = "email";
	    		document.getElementById("el8").innerText = "password";
	    		document.getElementById("el9").innerText = "phone";
	    		document.getElementById("el10").innerText = "are you a seller or a buyer?";
	    		
	    		document.getElementById("el13").innerText = "pseudo";
	    		document.getElementById("submitbutton").value = "register";
	    		
	 	    	
	 	    	
	 	    	
	 	    	
	 	    	
	    	}else if(parseInt(lg)==1){
	    		document.getElementById("el1").innerText = "enregistrement";
	    		document.getElementById("el2").innerText = "nom";
	    		document.getElementById("el3").innerText = "prénom";
	    		document.getElementById("el4").innerText = "date de naissance";
	    		document.getElementById("el5").innerText = "lieu de naissance";
	    		document.getElementById("el6").innerText = "adresse";
	    		document.getElementById("el7").innerText = "email";
	    		document.getElementById("el8").innerText = "mot de passe";
	    		document.getElementById("el9").innerText = "nummero de telephone";
	    		document.getElementById("el10").innerText = "etes-vous client ou vendeur?";
	    		
	    		document.getElementById("el13").innerText = "pseudo";
	    		document.getElementById("submitbutton").value = "s'enrégistrer";
	    		
	    	}else if(parseInt(lg)==2){
	    		document.getElementById("el1").innerText = "Registrierung";
	    		document.getElementById("el2").innerText = "Name";
	    		document.getElementById("el3").innerText = "Vorname";
	    		document.getElementById("el4").innerText = "Geburtsdatum";
	    		document.getElementById("el5").innerText = "Geburtsort";
	    		document.getElementById("el6").innerText = "Adresse";
	    		document.getElementById("el7").innerText = "Email";
	    		document.getElementById("el8").innerText = "Passwort";
	    		document.getElementById("el9").innerText = "Telefonnummer";
	    		document.getElementById("el10").innerText = "Sind Sie Käufer oder Verkäufer?";
	    		
	    		document.getElementById("el13").innerText = "Pseudo";
	    		document.getElementById("submitbutton").value = "registrieren";
	    		
	    	}
	    	
	    	
	    },500);
	    
      
      
      //end
    	
    
    </script>
  </body>
</html>
