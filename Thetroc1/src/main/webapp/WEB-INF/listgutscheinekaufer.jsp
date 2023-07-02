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
    	button:hover{
    		opacity:0.7;
    		transition-duration: 0.4s;
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
		    <div class="d-flex align-items-right">
		    
		      
		         
		
		      <!-- Anmeldung -->
		      <a   class="text-reset me-3" href="<%=request.getContextPath()%>/index.jsp" >
		      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em; border-bottom:2px solid white;" id="el2">Zurück</span>
		      </a>
		
		    
		
		    
		    </div>
		  
		   
		  </div>
		  <!-- Container wrapper -->
		</nav>
		<!-- Navbar -->
		<div class="container">
			<h2 class="text-center text-white mt-3 mb-2" style="font-weight:bold;" id="el3"> All your thetroc payment bills for this year !</h2>
			<div  id="inhalt"></div>
					
			
		</div>
		
    <!-- End your project here-->

    <!-- MDB <h1 class="text-center" style="font-size:4.0em; color: green; margin:auto;" id="gesamtpreis"></h1>
		-->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript">
    //Sessionhandling
    var idkaufer = <%=request.getSession().getAttribute("idkaufer") %>;
    if(idkaufer==null){
    	
    	  var XmL = initRequest();
		  XmL.onreadystatechange = function(){
			  if(this.readyState==4 && this.status==200){
				  window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
			  }
				 
		  };
		  
		  XmL.open("GET","logout",true);
		  XmL.send();
			
		}
    setInterval(function(){
    	if(idkaufer==null){	
    		 var XmL = initRequest();
   		  XmL.onreadystatechange = function(){
   			  if(this.readyState==4 && this.status==200){
   				  window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
   			  }
   				 
   		  };
   		  
   		  XmL.open("GET","logout",true);
   		  XmL.send();
   			
		}
    },600);
    //session end
    	 
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
    	  
  // Load Bills
  		 var XmL = initRequest();
    		  XmL.onreadystatechange = function(){
    			  if(this.readyState==4 && this.status==200){
    				 document.getElementById("inhalt").innerHTML= this.responseText;
    			  }
    				 
    		  };
    		  
    		  XmL.open("GET","Bestellung_verwaltung_kunde?type=quittungladen",false);
    		  XmL.send();
    	
   //end bills 	  
    	//language
          
          setInterval(function(){
  	    	var lg = <%= request.getSession().getAttribute("language")%>
  	    	
  	    	if(parseInt(lg)==0){
  	    		
  	    		
  	    		document.getElementById("el2").innerText = "Back";
  	    		document.getElementById("el3").innerText = "All your thetroc payment bills for this year !";
  	    		console.log("bin rein1");
  	    		
  	    		if(document.getElementById("res1")!=null){
  	    			console.log("bin rein2");
  	    			document.getElementById("res1").innerText= "ID-Payment";
  	  	    		document.getElementById("res2").innerText= "ID-Order";
  	  	    		document.getElementById("res3").innerText= "Pseudo";
  	  	    		document.getElementById("res4").innerText="Email";
  	  	    		document.getElementById("res5").innerText="Name Product";
  	  	    		document.getElementById("res6").innerText="Price"
  	  	    		document.getElementById("res7").innerText="Date";
  	  	    		
  	    		}
  	    		
  	    		
  	    	}else if(parseInt(lg)==1){
  	    		
  	    		document.getElementById("el2").innerText = "retour";
  	    		document.getElementById("el3").innerText = "Tout vos réçus de paiement 'Thetroc money Pay' de cette année !";
  	    		
  	    		
  	    		if(document.getElementById("res1")!=null){
  	    			document.getElementById("res1").innerText= "ID-Paiement";
  	  	    		document.getElementById("res2").innerText= "ID-Commande";
  	  	    		document.getElementById("res3").innerText= "Pseudo";
  	  	    		document.getElementById("res4").innerText="Email";
  	  	    		document.getElementById("res5").innerText="Nom du produit";
  	  	    		document.getElementById("res6").innerText="Prix"
  	  	    		document.getElementById("res7").innerText="Date";
  	  	    		
  	    		}
  	    			
  	    		
  	    	}else if(parseInt(lg)==2){
  	    		document.getElementById("el2").innerText = "zurück";
  	    		document.getElementById("el3").innerText = "Alle Quittung 'Thetroc money Pay' für dieses Jahr ! ";
  	    		
  	    		
  	    		if(document.getElementById("res1")!=null){
  	    			document.getElementById("res1").innerText= "ID-Zahlung";
  	  	    		document.getElementById("res2").innerText= "ID-Bestellung";
  	  	    		document.getElementById("res3").innerText= "Pseudo";
  	  	    		document.getElementById("res4").innerText="Email";
  	  	    		document.getElementById("res5").innerText="Name Produkt";
  	  	    		document.getElementById("res6").innerText="Preis"
  	  	    		document.getElementById("res7").innerText="Datum";
  	  	    		
  	    		}
  	    			
  	    	}
  	    	
  	    	
  	    },500);
  	    
      
        
        //end
       
    	
    </script>
  </body>
</html>
