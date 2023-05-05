<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style type="text/css">
    	.forms{
    		width:40%;
    		background-color:white;
    		padding:12px;
    		margin:auto;
    		margin-top:20px;
    		padding-left:25px;
    		padding-right:25px;
    		border: 1px white solid;
    		border-radius:4px;
    		height:auto;
    	}
    
    	button:hover{
    		opacity:0.7;
    		transition-duration: 0.4s;
    	}
    	
    	@media screen and (max-width: 992px){
    		.forms {
    			width: 400px;
    			margin-bottom:50%;
    		}
    	}
    	
    	@media screen and (max-width: 600px){
    		.forms {
    			width: 90%;
    			margin:auto;
    			margin-bottom:50%;
    		}
    		
    		#email,#passwort,#el4,#el5{
    			font-size:0.9em;
    		}
    		
    	}
    	
    	@media screen and (min-width: 993px){
    		.forms {
    			width: 450px;
    			margin:auto;
    		}
    	}
    
    </style>
  
  </head>
  <body  style="background-image: url('<%= request.getContextPath()%>/background1.jpg');background-size:cover;background-repeat:no-repeat;background-attachment:fixed;">
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
		    
		     <!-- Right elements -->
		    <div class="d-flex align-items-center">
		    
		      <!-- Bestellungen -->
		       <a  class="text-reset me-3 " href="<%=request.getContextPath()%>/registrierung.jsp">
		      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em;" id="el1">Registrierung</span>
		      </a>
		         
		
		      <!-- Anmeldung -->
		      <a   class="text-reset me-3" href="<%=request.getContextPath()%>/anmeldung.jsp" >
		      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em; border-bottom:2px solid white;" id="el2">Anmeldung</span>
		      </a>
		
		    
		
		    
		    </div>
		  
		   
		  </div>
		  <!-- Container wrapper -->
		</nav>
<!-- Navbar -->

		<div class="container " >
			<div class="text-center lead  mt-5 mb-3"  style="color:white; font-weight:bold; font-size:2.5em;" id="el3">Anmeldung</div>
			
			<div class="forms">
				<form>
			      				<div class="form-outline mb-4 mt-5 mr-1 ml-1">
			      					<input type="email" class="form-control" name="email" id="email" />
			      					<label for="email" class="form-label" id="el4">Email</label>
			      				</div>
			      				<div class="form-outline mb-4">
			      					<input type="password" class="form-control" name="passwort" id="passwort" />
			      					<label for="passwort" class="form-label" id="el5">Passwort</label>
			      				</div>
			      				<div style="width: 50%; margin:auto">
			      					<button class="mb-3" id="einloggen" style="margin:auto;width:100%; border:1px solid #48D1CC;border-radius:200px; padding:5px; font-size:0.9em;background-color:#48D1CC;color: white; "><span id="el6">einloggen</span></button><span id="spinner"></span>		
			      				</div>  
			      			
			      				 <div id="fehlermeldung"  style="color:red; font-size: 0.7em;"></div>
			      </form>	
			</div>
		</div>

    <!-- End your project here-->

    <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript">
    	 
    	  function initRequest() {
    		    if (window.XMLHttpRequest) {
    		        if (navigator.userAgent.indexOf('MSIE') != -1) {
    		            isIE = true;
    		        }
    		        return new XMLHttpRequest();
    		    } else if (window.ActiveXObject) {
    		        isIE = true;
    		        return new ActiveXObject("Microsoft.XMLHTTP");
    		    }
    		}
    	  
  
    	  
    	  document.getElementById("einloggen").addEventListener("click",function(event){
    		  event.preventDefault();
    		  var email = document.getElementById("email").value;
    		  var passwort = document.getElementById("passwort").value;
    		  var XML = initRequest();
    		  XML.onreadystatechange = function(){
    			  if(this.readyState==4 && this.status==200){
    				  document.getElementById("spinner").innerHTML="";
    				  if(this.responseText.trim()=='verkaufer'){  
    					  window.location.replace("<%=request.getContextPath()%>/RequestReSendSeller?name=verkaufer_home");
    				  }else if(this.responseText.trim()=='kaufer'){
    					
    					  if(<%=request.getParameter("idprodukt")%> != null){
    						  window.location.replace("<%=request.getContextPath()%>/RequestReSend?name=liste_de_commande_client_produkt&idprodukt=<%=request.getParameter("idprodukt")%>");
    					  }else{
    						  window.location.replace("<%=request.getContextPath()%>/index.jsp");
    					  }
    					
    					  
    				  }else if(this.responseText.trim()=='errorpage'){
    					  window.location.replace("<%=request.getContextPath()%>/RequestReSend?name=errorpage");
    				  }else{
    					  document.getElementById("fehlermeldung").innerHTML= this.responseText;
    				  }
    			  }else{
    				  document.getElementById("spinner").innerHTML="<span class='spinner-border text-primary me-2'></span>";
    			  }
    				 
    		  };
    		  
    		  XML.open("GET","Einloggen?email="+email+"&passwort="+passwort,false);
    		  XML.send();
    	  });
    	  
    	  
    	//language
          
          setInterval(function(){
  	    	var lg = <%= request.getSession().getAttribute("language")%>
  	    	
  	    	if(parseInt(lg)==0){
  	    		
  	    		document.getElementById("el1").innerText = "Registration";
  	    		document.getElementById("el2").innerText = "Sign in";
  	    		document.getElementById("el3").innerText = "Sign in";
  	    		document.getElementById("el4").innerText = "email";
  	    		document.getElementById("el5").innerText = "password";
  	    		document.getElementById("el6").innerText = "log in";
  	    			
  	 	    	
  	    	}else if(parseInt(lg)==1){
  	    		document.getElementById("el1").innerText = "enregistrement";
  	    		document.getElementById("el2").innerText = "se connecter";
  	    		document.getElementById("el3").innerText = "connexion";
  	    		document.getElementById("el4").innerText = "email";
  	    		document.getElementById("el5").innerText = "mot de passe";
  	    		document.getElementById("el6").innerText = "se connecter";
  	    			
  	    	}else if(parseInt(lg)==2){
  	    		document.getElementById("el1").innerText = "Registrierung";
  	    		document.getElementById("el2").innerText = "Anmeldung";
  	    		document.getElementById("el3").innerText = "Anmeldung";
  	    		document.getElementById("el4").innerText = "email";
  	    		document.getElementById("el5").innerText = "passwort";
  	    		document.getElementById("el6").innerText = "einloggen";
  	    			
  	    	}
  	    	
  	    	
  	    },500);
  	    
      
        
        //end
    	  
    </script>
  </body>
</html>
