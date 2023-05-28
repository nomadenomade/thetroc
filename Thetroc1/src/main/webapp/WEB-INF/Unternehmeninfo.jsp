<%@page import="java.util.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
     .produkt{
    		max-width:100%;
    		height:auto;
    			
    	}
    	.textinfo{
    		width:400px; 
    		margin:auto;
    		background-color:#FFFFE0;
    	}
    	
    	.form1{
    		width:60%; 
    		margin:auto;
    	}
    	
    	button:hover{
    		opacity:0.7;
    		transition-duration: 0.4s;
    	}
    	
    	input:hover{
    		opacity:0.7;
    		transition-duration: 0.4s;
    	}
    	
    	.form2{
    		width:50%; margin:auto;
    	}
    	
    	@media screen and (max-width: 992px){
    		.textinfo{
    			width:70%; 
    		
    		}
    		
    		.form1{
    			width:85%;
    		}
    		
    		.form2{
    			width:85%;
    		}
    	
    	}
    	
    	@media screen and (max-width: 600px){
    		.textinfo{
    			width:80%; 
    		
    		}
    		
    		.form1{
    			width:95%;
    		}
    		
    		.form1{
    			width:95%;
    		}
    	}
    </style>
    
     <script type="javascript">
		if(<%=request.getSession().getId()%>==null){
			window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
		}
	</script>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light " style="background-color:#48D1CC;">
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
      <a class="navbar-brand mt-2 mt-lg-0" href="<%=request.getContextPath() %>/index.jsp">
        <img
         src="img/logo3.png"
	          height="80"
          alt=""
          loading="lazy"
        />
      </a>
      <!-- Left links -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link text-reset me-3" href="<%= request.getContextPath()%>/RequestReSendSeller?name=verkaufer_home">
	          <span class="lead text-white"style="font-weight:bold; font-size:0.8em;" id="el1">Dashboard</span>
	          <i class="fas fa-home fa-lg" style="color:white;font-size:0.8em;"></i>
          </a>
        </li>
       
        
      </ul>
      <!-- Left links -->
    </div>
     
  </div>
  <!-- Container wrapper -->
</nav>
<!-- Navbar -->
<!-- content -->

	<h2 class="text-center mt-5" id="el2">Geben Sie Informationen über Ihr Unternehmen.</h2>
	<div class="card mt-3 mb-5 textinfo" >
		<div class="card-body lead" style="font-size:0.8em;">
			<span class="text-warning" id="el3">Achtung! </span><span id="el4"> Sie müssen sich in Ihrem Unternehmen befinden,um Ihr Unternehmensprofil herstellen zu können. Die Idee darunter ist es dafür zu sorgen, dass Ihre Kunden ihr Unternehmen über Google Maps finden.</span>
		</div>
	</div>
	
	
	<h6 class="text-center mb-1" id="el5">befinden Sie sich gerade in Ihrem Unternehmen?</h6>
	
	<div style="width:50%; margin:auto;">
		<div class="row">
			<div class="col">
				<div class="form-check" id="block1">
					<input type="radio" name="check" onclick="check1()" class="form-check-input" id="check1">
					<label for="check1" class="form-check-label" id="el6">ja </label>								
				</div>
			</div>
			<div class="col">
				<div class="form-check" id="block2">
					<input type="radio" name="check" onclick="check2()" class="form-check-input" id="check2">
					<label for="check2" class="form-check-label" id="el7">Nein </label>								
				</div>
			</div>
		</div>
	</div>
	<!-- Begin Inhalt -->
	<div id="Inhalt" class="mt-4" style="visibility:hidden;">
	
		<div class="card form1" >
			<div class="card-body">
				<form action="Unternehmeninfo">	
					<div class="row mb-3">
						<div class="col-sm mb-2">
							<div class="form-outline mb-4">
								<input type="text" name="name" class="form-control" id="name" value="${name}">
								<label for="name" class="form-label" id="el8">Unternehmensname</label>
							</div>	
							<div id="namefehler"  style="color:red; font-size: 0.7em;">${fehler1}</div>
						
						</div>
							
						<div class="col-sm mb-2">
							<div class="form-outline mb-4">
								<textarea rows="5" cols="6" name="adresse" id="adresse" class="form-control" value="${adresse}"></textarea>
								<label for="adresse" class="form-label" id="el9">Wo befindet sich Ihr Unternehmen?</label>
							</div>
							<div id="ablauffehler"  style="color:red; font-size: 0.7em;">${fehler2}</div>
						
						</div>
						<div class="col-sm mb-2">
							<div class="form-outline mb-4">
								<input type="text" name="stadt" id="stadt" class="form-control" value="${stadt}"/>
								<label for="stadt" class="form-label" id="el10">Stadt</label>
							</div>
										
						</div>
						<input type="hidden" name="latitude" id="latitude"/>
						<input type="hidden" name="longitude" id="longitude"/>
					</div>
				<input type="submit" name="submit" id="submit1" value="speichern" style="width:200px; border:1px solid #48D1CC;border-radius:200px; padding:5px; font-size:0.9em;background-color:#48D1CC;color: white; margin:auto;">
									
				</form>
				<h6 class="text-center text-success" style=" font-size: 0.8em;">${erfolg}</h6>
			</div>
		</div>
	
	
		
	
	
	
		<h3 class="text-center mt-5" id="el11">Laden Sie die Bilder für Ihr Unternehmen hoch.</h3>
		<h6 class="text-center text-warning" id="el12">Sie dürfen maximal 4 Bilder hochladen</h6>
		<div class="card form2" style="max-width:50%; margin:auto; background-color:#5F9EA0;">
			<div class="card-body">
		
				<form action="Unternehmeninfo" method="post" enctype="multipart/form-data">
					<input type="file" class="form-control mt-2" name="bildprodukt1" id="bildprodukt1">
					<input type="file" class="form-control mt-2" name="bildprodukt2" id="bildprodukt2">
					<input type="file" class="form-control mt-2" name="bildprodukt3" id="bildprodukt3">
					<input type="file" class="form-control mt-2" name="bildprodukt4" id="bildprodukt4">
					
					<span class="text-center text-danger mt-1" style="font-size:0.8em;">${fehlermeldung2}</span><br>
					<input
						 type="submit" 
						 name="sendbildprodukt" 
						 id="sendbildprodukt" class=" mt-5"
						 style="width:150px; border:1px solid #1E90FF;border-radius:200px; padding:5px; font-size:0.7em;background-color:#1E90FF;color: white; margin:auto;"
						 value="hochladen"
					>
			
				</form>
			</div>
		</div>
	
	
	<hr>
	<h5 class="text-info text-center lead mb-3"  style="margin-top:25px;font-weight:bold;" id="el13">Liste der hochgeladenen Bilder</h5>
	
	
	
	
	
	
	<div id="content" Style="height:600px;overflow-y:scroll;background-color:#F5F5F5;">
	<div class="row" id="rowcontent">
	
		<% int counter=0;
		 List <String> bildnamen = (List<String>)(session.getAttribute("bildnameunternehmen"));
		 List <String> bildsizes = (List<String>)(session.getAttribute("bildsizeunternehmen"));
		%>
		 
	    <d:forEach items="${listbilderunternehmen}" var="bildlink">
	       <div class="col-sm">
			    <p><d:out value="${bildlink}"/><p>
			    <img alt="bild" class="produkt " src="Dateien/${userEmail}/${bildlink}"  />
			    <button type="button" class="btn btn-sm btn-danger delet" onclick="deleteBild('<%=bildnamen.get(counter)  %>','<%=bildsizes.get(counter)%>')">löschen</button>	
			    <% counter++; %>
			    	
	       </div>
	    </d:forEach>
		<div>
		
		</div>
		
	</div>
	
	</div>
		
	
	</div>




<!-- end Inhalt -->



   <script type="text/javascript" src="js/mdb.min.js"></script>
   <script>
   
   if(<%=request.getSession().getAttribute("idverkaufer") %>==null){
		window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
	}
	setInterval(function(){
		if(<%=request.getSession().getAttribute("idverkaufer") %>==null){
		window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
	}
	},100000);
   
        var XML = new XMLHttpRequest();
		XML.onreadystatechange = function (){
			if(this.readyState==4 && this.status==200){
			  document.getElementById("rowcontent").innerHTML=this.responseText;		
			}
		};
		
		XML.open("GET","Bilderunternehmenautomladen",true);
		XML.send();
   
   function check1(){
	   if(navigator.geolocation){
		   navigator.geolocation.getCurrentPosition(navigatorCallback,erreurPosition,{enableHighAccuracy:true});
	   }else{
		   alert("navigator nicht Ok");
	   }
	  
		
		
	}  
   
   function navigatorCallback(position){
	
	   lat = position.coords.latitude;
	   lng = position.coords.longitude;
	 
	   document.getElementById("latitude").value=lat;
	   document.getElementById("longitude").value=lng;
	   
	   if(lat!=null){
		   document.getElementById("Inhalt").style.visibility ="visible";
	   }else{
			var lg = <%= request.getSession().getAttribute("language")%>
		  	
		  	if(parseInt(lg)==0){
		  		 alert("please go to your browsersettings and allow this application access to your location ");
		  	}else if(parseInt(lg)==1){
		  		alert("s il vous plait activez d abord la fonction 'geolocalisation' pour site web dans les paramètres avancés de votre navigateur ");
		  	}else if(parseInt(lg)==2){
		  		alert("aktivieren Sie bitte zuerst die Lokalisierungsoption für Webseiten in den Parametern ihres Browsers ");
		  	}
		  
	   }
	   	  	   
	   
   }
   
  
   
   function erreurPosition(error) {
	    var info = "Erreur lors de la géolocalisation : ";
	    switch(error.code) {
	    case error.TIMEOUT:
	    	alert("Timeout !");
	    break;
	    case error.PERMISSION_DENIED:
		alert("Vous n’avez pas donné la permission");
	    break;
	    case error.POSITION_UNAVAILABLE:
	   		alert("La position n’a pu être déterminée");
	    break;
	    case error.UNKNOWN_ERROR:
	    	alert("Erreur inconnue");
	    break;
	    }
	}
	 
   function check2(){
	   document.getElementById("Inhalt").style.visibility ="hidden";
		
		
	}  
	 
   			
   
   
	function deleteBild(bildname,bildsize){
		 
		  var XML = new XMLHttpRequest();
		  XML.onreadystatechange = function(){
			  if(this.readyState==4 && this.status==200){
				  document.getElementById("rowcontent").innerHTML=this.responseText;
			  }
			  
		  };
		  
		  XML.open("GET","Bildunternehmenloeschen?bildname="+bildname+"&bildsize="+bildsize,true);
		  XML.send();
	  }
	  
	 
	//language
	
	
  
  
  setInterval(function(){
  	var lg = <%= request.getSession().getAttribute("language")%>
  	
  	if(parseInt(lg)==0){
  		
  		document.getElementById("el1").innerText = "dashboard";
  		document.getElementById("el2").innerText = "Provide information about your company!";
  		document.getElementById("el3").innerText = "warning! ";
  		document.getElementById("el4").innerText = "You must be in your company to create your company profile. The idea below is to make your customers find your business place through Google Maps.  ";
  		document.getElementById("el5").innerText = "are you currently in your company?";
  		document.getElementById("el6").innerText = "yes ";
  		document.getElementById("el7").innerText = "no ";
  		document.getElementById("el8").innerText = "company name";
  		document.getElementById("el9").innerText="Where is your business located?";
  		document.getElementById("el10").innerText="town";
  		document.getElementById("el11").innerText="Upload the images for your company.";
  		document.getElementById("el12").innerText="You may upload a maximum of 4 images";
  		document.getElementById("el13").innerText="list of uploaded images"
  		document.getElementById("submit1").value="save";
  		document.getElementById("sendbildprodukt").value="upload";
  		
  		
  	
  		
  	
	    	var res1 =document.getElementsByClassName("delet");	
	    	for(let i=0;i< res1.length; i++){
	    		
	    		if(res1[i]!=null){
	    			res1[i].value= "delete" ;
	 	    		
	    		}
	    	}		    	
		
	    	
  	}else if(parseInt(lg)==1){
  		document.getElementById("el1").innerText = "bureau";
  		document.getElementById("el2").innerText = "Donnez les informations sur votre entreprise, restaurant...etc!";
  		document.getElementById("el3").innerText = "attention! ";
  		document.getElementById("el4").innerText = "Vous devez être dans votre entreprise pour que votre profil soit crée. Ceci est uniquement dans le but de permettre à vos futures clients de vous retrouver sur Google Map.  ";
  		document.getElementById("el5").innerText = "etes vous actuellement dans votre entreprise,boutique...etc?";
  		document.getElementById("el6").innerText = "oui ";
  		document.getElementById("el7").innerText = "non ";
  		document.getElementById("el8").innerText = "nom de votre entreprise";
  		document.getElementById("el9").innerText="lieu exact";
  		document.getElementById("el10").innerText="ville";
  		document.getElementById("el11").innerText="Télécharger des images de votre entreprise...exemple: images de la fassade extérieure";
  		document.getElementById("el12").innerText="vous ne pouvez télécharger au plus que 4 images";
  		document.getElementById("el13").innerText="liste des images téléchargées"
  		document.getElementById("submit1").value="sauvegardez";
  		document.getElementById("sendbildprodukt").value="télécharger";
  		
  		
  	
  		
  	
	    	var res1 =document.getElementsByClassName("delet");	
	    	for(let i=0;i< res1.length; i++){
	    		
	    		if(res1[i]!=null){
	    			res1[i].value= "supprimer" ;
	 	    		
	    		}
	    	}		    	
		
  	}else if(parseInt(lg)==2){
  		document.getElementById("el1").innerText = "dashboard";
  		document.getElementById("el2").innerText = "Geben Se Information über Ihr Unternehmen, Shop, Restaurant...etc!";
  		document.getElementById("el3").innerText = "Achtung! ";
  		document.getElementById("el4").innerText = "Sie müssen sich innerhalb Ihres Unternehmen befinden,um ein Profil erstellen zu können. Dadurch wird nur dafür gesorgt, dass Ihre zukünftige Kunden Ihren Standort auf Google Map finden! ";
  		document.getElementById("el5").innerText = "Sind Sie im Augenblick innerhalb Ihres Unternehmen?";
  		document.getElementById("el6").innerText = "ja ";
  		document.getElementById("el7").innerText = "nein ";
  		document.getElementById("el8").innerText = "Unternehmensname";
  		document.getElementById("el9").innerText="genauer Standort";
  		document.getElementById("el10").innerText="Stadt";
  		document.getElementById("el11").innerText="Laden Sie die Bilder für Ihr unternehmen hoch.";
  		document.getElementById("el12").innerText="Sie können maximal 4 Bilder hochladen";
  		document.getElementById("el13").innerText="Liste der hochgeladenen Bilder"
  		document.getElementById("submit1").value="speichern";
  		document.getElementById("sendbildprodukt").value="hochladen";
  		
  		
  	
  		
  	
	    	var res1 =document.getElementsByClassName("delet");	
	    	for(let i=0;i< res1.length; i++){
	    		
	    		if(res1[i]!=null){
	    			res1[i].value= "löschen" ;
	 	    		
	    		}
	    	}		    	
		
  	}
  	
  	
  },500);
	
	
	//language end
	
   		
   </script>
   
</body>

</html>
