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
    	
    	.inhalt{
    		width:calc(80% - 10px);
    		background-color:#F5F5F5;
    		margin:auto;
    	}
    	
    	button:hover{
    		opacity:0.7;
    		transition-duration: 0.4s;
    	}
    	.bewertung{
    		width:calc(80% - 10px);
    		margin:auto;
    	}
    
    	@media screen and (max-width: 992px){
    		.inhalt {
    			width:80% ;
    		}
    		
    		.bewertung{
    		width:80% ;
    		
    		}
    	}
    	
    	@media screen and (max-width: 600px){
    		.inhalt {
    			width:100%;
    		}
    		.bewertung{
    			width:100%;
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
	       <!-- Bestellungen -->
	    	<span id="bestellungbutton" style="visibility:hidden;">
	    		<a  class="text-reset me-3 " href="<%=request.getContextPath()%>/RequestReSend?name=liste_de_commande_client">
	      			<span class="lead text-white" style="font-weight:bold; font-size:0.8em;" id="el1">Meine Bestellungen<i class="fas fa-shopping-cart"></i></span>
	     		</a> 
	    	</span> 
	    	
	     
	    </div>
	   <!-- language --> 
	  <ul class="navbar-nav">
      <!-- Icon dropdown -->
      <li class="nav-item dropdown">
        <a
          class="nav-link dropdown-toggle"
          href="#"
          id="navbarDropdown"
          role="button"
          data-mdb-toggle="dropdown"
          aria-expanded="false"
        >
          <i class="flag-united-kingdom flag m-0"></i>
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          <li>
            <a class="dropdown-item" href="#" id ="englishlg"
              ><i class="flag-united-kingdom flag"></i>English
              <i class="fa fa-check text-success ms-2"></i
            ></a>
          </li>
          <li><hr class="dropdown-divider" /></li>
         
          <li>
            <a class="dropdown-item" href="#" id="germanlg"><i class="flag-germany flag"></i>German</a>
          </li>
          <li>
            <a class="dropdown-item" href="#" id="frenchlg"><i class="flag-france flag"></i>French</a>
          </li>
         
        </ul>
      </li>
    </ul>
	    
	     <!-- Right elements -->
	    <div class="d-flex align-items-center">
	    
	    
	    	
	    
	      
	      <!-- Regsitrierung -->
	       <a  class="text-reset nav-link me-1 " href="<%=request.getContextPath()%>/registrierung.jsp">
	      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em;" id="el2">Registrierung</span>
	      </a>
	         
	
	      <!-- Anmeldung -->
	      <a  class="nav-link text-reset me-1" href="<%=request.getContextPath()%>/anmeldung.jsp" >
	      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em;"id="el3">Anmeldung<i class="fas fa-circle-user"></i></span>
	      </a>
	      
	      
	      	 <!-- Notification -->
	      
	        <span class="navbar-item me-1 " id="notif" style="visibility:hidden;">
		      	<a
		        class="dropdown-toggle d-flex align-items-center hidden-arrow"
		        href="#"
		        id="navbarDropdownMenuLink"
		        role="button"
		        data-mdb-toggle="dropdown"
		        aria-expanded="false"
		      > <span class="lead text-white" id="username" style="font-weight:bold; font-size:0.8em;" ><span id="el4">Benachrichtigung</span> <i class="fas fa-bell"></i><span class="badge rounded-pill badge-notification bg-danger" id="notif-zahl"></span></span>        
		      </a>
		       
		      <ul id="notification"
		        class="dropdown-menu dropdown-menu-end"
		        aria-labelledby="navbarDropdownMenuLink"
		      >
		       
		      </ul>
	      
	      </span>
	    
	      
	      <span id="profil" class="nav-item" style="visibility:hidden;margin-left:10px;">
		      	<a
		        class="dropdown-toggle d-flex align-items-center hidden-arrow"
		        href="#"
		        id="navbarDropdownMenuLink"
		        role="button"
		        data-mdb-toggle="dropdown"
		        aria-expanded="false"
		      > <span class="lead text-white" id="username" style="font-weight:bold; font-size:0.8em;">Profil</span>
		    
		      </a>
		      <ul
		        class="dropdown-menu dropdown-menu-end"
		        aria-labelledby="navbarDropdownMenuLink"
		      >
		        <li>
		          <a class="dropdown-item" href="#" id="el100">Mein infos</a>
		        </li>
		       
		        <li>
		          <a class="dropdown-item" href="#" id="logout">Logout</a>
		        </li>
		      </ul>
	      
	      </span>
	       
	
	    
	    </div>
	  
	   
	  </div>
	  <!-- Container wrapper -->
	</nav>
	<!-- Navbar -->
	
	<!-- Inhalt -->
	<h1 class="text-center mt-5 mb-3  lead"  style="font-weight:bold;color:white;" id="el5">Sie können jeder Zeit auf bestellen klicken,um das Produkt zu bestellen</h1>
	
	<div class="card inhalt">
		<div class="card-body" id="inhalt"></div>
	</div>
	
	

	<div id="bewertung"  class="mt-5 mb-2 "></div>
	<!-- inhalt ende-->
	
	<%@ include file="/footer.jsp" %>
	
	    <!-- End your project here-->
	
	  <!-- Parameter empfangen -->
	  	<% request.getSession().setAttribute("idprodukt", request.getParameter("idprodukt"));
	  	   request.getSession().setAttribute("produktname", request.getParameter("produktname"));
	    %>
	  <!--Parameter empfangen end  -->
	    <script type="text/javascript" src="js/mdb.min.js"></script>
	    <!-- Custom scripts -->
	    <script type="text/javascript">
	    	
	   
	    var userid='<%=request.getSession().getAttribute("isuser")%>';
   		 if(userid.trim()=='kaufer'){
   			 document.getElementById("bestellungbutton").style.visibility="visible";
   		     document.getElementById("profil").style.visibility="visible";
   			
   		 }
   	 
	    
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
	    	 
	    	 var idprodukt = "<%= request.getSession().getAttribute("idprodukt")%>";
	    	
	    	 var xml = initRequest();
	    	 xml.onreadystatechange= function(){
	    		 if(this.readyState==4 && this.status==200){
	    			 document.getElementById("inhalt").innerHTML= this.responseText;
	    			
	    		 }
	    	 };
	    	 xml.open("GET","Produkt_fuer_Bestellung?type=bestellungsansicht",false);
	    	 xml.send();
	    
	    	 
	    	 document.getElementById("bestellenbtn").addEventListener("click",function (event){
	 	    	event.preventDefault();
	 	    	 var userid='<%=request.getSession().getAttribute("isuser")%>';
	
	 	    	 if(userid.trim()=='kaufer'){
	 	    		
	 	    		 if(parseInt(checkaufantwort())==0){
	 	    			 var xml = initRequest();
		 	    		 xml.onreadystatechange = function(){
		 	    			 if(this.readyState==4 && this.status==200){
		 	    				 
		 	    				 if(this.responseText=="true"){
		 	    					window.location.replace("<%=request.getContextPath()%>/RequestReSend?name=liste_de_commande_client_produkt&idprodukt="+idprodukt);
		 	    					
		 	    					}	
		 	    				
		 	    			 }
		 	    		 };
		 	    		 xml.open("GET","le_client_commande?idprodukt="+idprodukt,false);
		 	    		 xml.send();
		 	    			 
							 
 					 }else{
 						 let sp = <%= request.getSession().getAttribute("language")%>;
 						 if(parseInt(sp)==0){
 							 alert("You may not order a new product until you have answered all questions from your previous orders. Please switch to <My orders> and answer the open questions");
 						 }else if(parseInt(sp)==2){
 							 alert("Sie dürfen kein neues Produkt bestellen so lange Sie nicht alle Fragen von ihren bisherigen Bestellungen beantwortet haben. Bitte wechsel Sie auf 'Meine Bestellungen' und beantworten Sie die offenen Fragen");
 		 					
 						 }else if(parseInt(sp)==1){
 							alert("vous n'avez pas le droit de commander de nouveaux produits aussi longtemps que vous n'aurez pas répondu au question qui vous ont été posé dans votre section 'mes commandes',concernant les produits déjà commandés");
 						 }
 					}
	 	    		
	 	    	 }else{
	 	    		 let param = "<%=request.getContextPath()%>/anmeldung.jsp?idprodukt=<%=request.getSession().getAttribute("idprodukt")%>";
	 	    		 window.location.replace(param);
	 	    	 }
	 	    	 
	 	    });
	    	 
	    	 function checkaufantwort (){
	    		 var xml = initRequest();
	    		 var rueck =0;
 	    		 xml.onreadystatechange = function(){
 	    			 if(this.readyState==4 && this.status==200){
 	    				
 	    				 rueck= parseInt(this.responseText);
 	    				
 	    			 }
 	    		 };
 	    		 xml.open("GET","Bestellung_verwaltung_kunde?type=checkaufantwort",false);
 	    		 xml.send();
 	    		
	    		return rueck; 
	    	 }
	 	    
	    	
	    	 //Bewertung für das  Produkt anzeigen
			 let Xml = initRequest();
    		 Xml.onreadystatechange = function(){
    			 if(this.readyState==4 && this.status==200){
    				
    				document.getElementById('bewertung').innerHTML=this.responseText;
    				
    			 }
    		 };
    		 Xml.open("GET","Bestellung_verwaltung_kunde?type=bewertunganzeige",false);
    		 Xml.send();
    		 
    		 //language
    		 setInterval(function(){
    		    	var lg = <%= request.getSession().getAttribute("language")%>
    		    	
    		    	if(parseInt(lg)==0){
    		    		
    		    		document.getElementById("el1").innerText = "My Commands";
    		    		document.getElementById("el2").innerText = "Registration";
    		    		document.getElementById("el3").innerText = "Sign up";
    		    		document.getElementById("el4").innerText = "Notification";
    		    		document.getElementById("el100").innerText = "My Info";
    		    		document.getElementById("el5").innerText = "you can click on 'command now ' to command";
    		    		
    		    		
    		 	    	if(document.getElementById("bestellenbtn")!=null){
    		 	    		document.getElementById("bestellenbtn").innerText="command now";
    		 	    	}
    		 	    	
    		 	    	if(document.getElementById("res1")!=null){
    		 	    		document.getElementById("res1").innerText = "Information and images about the product:	";
    		 	    	}
    		 	    	if(document.getElementById("res2")!=null){
    		 	    		document.getElementById("res2").innerText = "published on:	";
    		 	    	}
    		 	    	if(document.getElementById("res3")!=null){
    		 	    		document.getElementById("res3").innerText = "name:	";
    		 	    	}
    		 	    	if(document.getElementById("res4")!=null){
    		 	    		document.getElementById("res4").innerText = "price:	";
    		 	    	}
    		 	    	if(document.getElementById("res5")!=null){
    		 	    		document.getElementById("res5").innerText = "Online until:	";
    		 	    	}
    		 	    	if(document.getElementById("res6")!=null){
    		 	    		document.getElementById("res6").innerText = "Duration until taking:	";
    		 	    	}
    		 	    	if(document.getElementById("res7")!=null){
    		 	    		document.getElementById("res7").innerText = "town:	";
    		 	    	}
    		 	    	if(document.getElementById("res8")!=null){
   		 	    			document.getElementById("res8").innerText = "exact place:	";
    		 	    	}
    		 	    	if(document.getElementById("res9")!=null){
    		 	    		document.getElementById("res9").innerText = "description:	";
    		 	    	}
    		 	    	if(document.getElementById("res10")!=null){
    		 	    		document.getElementById("res10").innerText = "brand:	";
    		 	    	}
    		 	    	if(document.getElementById("res11")!=null){
    		 	    		document.getElementById("res11").innerText = "quantity in stock:	";
    		 	    	}
    		 	    	if(document.getElementById("res12")!=null){
    		 	    		document.getElementById("res12").innerText = "Information and pictures about the company:	";
    		 	    	}
    		 	    	if(document.getElementById("res13")!=null){
    		 	    		document.getElementById("res13").innerText = "name:	";
    		 	    	}
    		 	    	if(document.getElementById("res14")!=null){
    		 	    		document.getElementById("res14").innerText = "town:	";
    		 	    	}
    		 	    	if(document.getElementById("res15")!=null){
    		 	    		document.getElementById("res15").innerText = "exact location:	";
    		 	    	}
    		 	    	if(document.getElementById("res16")!=null){
    		 	    		document.getElementById("res16").innerText = "Click on the image for geolocalization to show the company on the map";
    		 	    	}
    		 	    	
    		 	    	
    		 	    	
    		 	    	if(document.getElementById("b1")!=null){
    		 	    		document.getElementById("b1").innerText = "evaluation";
    		 	    	}
    		 	    	if(document.getElementById("b2")!=null){
    		 	    		document.getElementById("b2").innerText = "statistics";
    		 	    	}
    		 	    	if(document.getElementById("b3")!=null){
    		 	    		document.getElementById("b3").innerText = "No comments";
    		 	    	}
    		 	    	
    		 	    	
    		 	    	
    		    	}else if(parseInt(lg)==1){

    		    		document.getElementById("el1").innerText = "mes commandes";
    		    		document.getElementById("el2").innerText = "enregistrement";
    		    		document.getElementById("el3").innerText = "se connecter";
    		    		document.getElementById("el4").innerText = "notification";
    		    		document.getElementById("el100").innerText = "mes infos";
    		    		document.getElementById("el5").innerText = "vous pouvez cliquer sur commandez pour passer votre commande";
    		    		
    		    		
    		 	    	if(document.getElementById("bestellenbtn")!=null){
    		 	    		document.getElementById("bestellenbtn").innerText="commandez";
    		 	    	}
    		 	    	
    		 	    	if(document.getElementById("res1")!=null){
    		 	    		document.getElementById("res1").innerText = "Information et images sur le produit	";
    		 	    	}
    		 	    	if(document.getElementById("res2")!=null){
    		 	    		document.getElementById("res2").innerText = "mise en ligne le:	";
    		 	    	}
    		 	    	if(document.getElementById("res3")!=null){
    		 	    		document.getElementById("res3").innerText = "nom:	";
    		 	    	}
    		 	    	if(document.getElementById("res4")!=null){
    		 	    		document.getElementById("res4").innerText = "prix:	";
    		 	    	}
    		 	    	if(document.getElementById("res5")!=null){
    		 	    		document.getElementById("res5").innerText = "en ligne jusqu'au:	";
    		 	    	}
    		 	    	if(document.getElementById("res6")!=null){
    		 	    		document.getElementById("res6").innerText = "durée en heure jusqu'a récupération:	";
    		 	    	}
    		 	    	if(document.getElementById("res7")!=null){
    		 	    		document.getElementById("res7").innerText = "ville:	";
    		 	    	}
    		 	    	if(document.getElementById("res8")!=null){
   		 	    			document.getElementById("res8").innerText = "lieu de recupération:	";
    		 	    	}
    		 	    	if(document.getElementById("res9")!=null){
    		 	    		document.getElementById("res9").innerText = "description:	";
    		 	    	}
    		 	    	if(document.getElementById("res10")!=null){
    		 	    		document.getElementById("res10").innerText = "marque:	";
    		 	    	}
    		 	    	if(document.getElementById("res11")!=null){
    		 	    		document.getElementById("res11").innerText = "quantité en stock:	";
    		 	    	}
    		 	    	if(document.getElementById("res12")!=null){
    		 	    		document.getElementById("res12").innerText = "Informations et images sur le vendeur:	";
    		 	    	}
    		 	    	if(document.getElementById("res13")!=null){
    		 	    		document.getElementById("res13").innerText = "nom:	";
    		 	    	}
    		 	    	if(document.getElementById("res14")!=null){
    		 	    		document.getElementById("res14").innerText = "ville:	";
    		 	    	}
    		 	    	if(document.getElementById("res15")!=null){
    		 	    		document.getElementById("res15").innerText = "lieu:	";
    		 	    	}
    		 	    	if(document.getElementById("res16")!=null){
    		 	    		document.getElementById("res16").innerText = "cliquez sur l'image de géolocalisation ci dessous pour afficher le lieu de vente sur google Map";
    		 	    	}
    		 	    	
    		 	    	
    		 	    	
    		 	    	if(document.getElementById("b1")!=null){
    		 	    		document.getElementById("b1").innerText = "évaluation";
    		 	    	}
    		 	    	if(document.getElementById("b2")!=null){
    		 	    		document.getElementById("b2").innerText = "statistiques";
    		 	    	}
    		 	    	if(document.getElementById("b3")!=null){
    		 	    		document.getElementById("b3").innerText = "pas de commentaire";
    		 	    	}
    		 	    	
    		    	}else if(parseInt(lg)==2){
    		    		document.getElementById("el1").innerText = "Meine Bestellungen";
    		    		document.getElementById("el2").innerText = "Registrierung";
    		    		document.getElementById("el3").innerText = "Anmeldung";
    		    		document.getElementById("el4").innerText = "Benachrichtigung";
    		    		document.getElementById("el100").innerText = "Meine Infos";
    		    		document.getElementById("el5").innerText = "Klicken Sie auf 'bestellen,um Ihre Bestellung durchzuführen";
    		    		
    		    		
    		 	    	if(document.getElementById("bestellenbtn")!=null){
    		 	    		document.getElementById("bestellenbtn").innerText="bestellen";
    		 	    	}
    		 	    	
    		 	    	if(document.getElementById("res1")!=null){
    		 	    		document.getElementById("res1").innerText = "Informationen und Bilder über das Produkt:	";
    		 	    	}
    		 	    	if(document.getElementById("res2")!=null){
    		 	    		document.getElementById("res2").innerText = "veröffentlicht am:	";
    		 	    	}
    		 	    	if(document.getElementById("res3")!=null){
    		 	    		document.getElementById("res3").innerText = "Name:	";
    		 	    	}
    		 	    	if(document.getElementById("res4")!=null){
    		 	    		document.getElementById("res4").innerText = "Preis:	";
    		 	    	}
    		 	    	if(document.getElementById("res5")!=null){
    		 	    		document.getElementById("res5").innerText = "Online bis:	";
    		 	    	}
    		 	    	if(document.getElementById("res6")!=null){
    		 	    		document.getElementById("res6").innerText = "Dauer bis zur Abholung:	";
    		 	    	}
    		 	    	if(document.getElementById("res7")!=null){
    		 	    		document.getElementById("res7").innerText = "Stadt:	";
    		 	    	}
    		 	    	if(document.getElementById("res8")!=null){
   		 	    			document.getElementById("res8").innerText = "genauer Standort:	";
    		 	    	}
    		 	    	if(document.getElementById("res9")!=null){
    		 	    		document.getElementById("res9").innerText = "Beschreibung:	";
    		 	    	}
    		 	    	if(document.getElementById("res10")!=null){
    		 	    		document.getElementById("res10").innerText = "Marke:	";
    		 	    	}
    		 	    	if(document.getElementById("res11")!=null){
    		 	    		document.getElementById("res11").innerText = "Menge im Lager:	";
    		 	    	}
    		 	    	if(document.getElementById("res12")!=null){
    		 	    		document.getElementById("res12").innerText = "Informationen und Bilder über den Verkäufer";
    		 	    	}
    		 	    	if(document.getElementById("res13")!=null){
    		 	    		document.getElementById("res13").innerText = "Name:	";
    		 	    	}
    		 	    	if(document.getElementById("res14")!=null){
    		 	    		document.getElementById("res14").innerText = "Stadt:	";
    		 	    	}
    		 	    	if(document.getElementById("res15")!=null){
    		 	    		document.getElementById("res15").innerText = "genauer Standort:	";
    		 	    	}
    		 	    	if(document.getElementById("res16")!=null){
    		 	    		document.getElementById("res16").innerText = "Klicken Sie auf das untenstehendes Bild für geolocation,um den Standort des Verkäufer auf google Map anzeigen zu können";
    		 	    	}
    		 	    	
    		 	    	
    		 	    	
    		 	    	if(document.getElementById("b1")!=null){
    		 	    		document.getElementById("b1").innerText = "evaluation";
    		 	    	}
    		 	    	if(document.getElementById("b2")!=null){
    		 	    		document.getElementById("b2").innerText = "Statistiken";
    		 	    	}
    		 	    	if(document.getElementById("b3")!=null){
    		 	    		document.getElementById("b3").innerText = "Kein Kommentar";
    		 	    	}
    		 	    	
    		 	    	
    		    	}
    		    	
    		    	
    		    },500);
    		    
	    		
	    	
	    </script>
  </body>
</html>