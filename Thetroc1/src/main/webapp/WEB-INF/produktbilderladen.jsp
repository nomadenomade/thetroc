
 <%@page import="java.util.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

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
    
    <style>
     .produkt{
    		max-width:100%;
    		height:auto;
    			
    	}
    	input:hover{
    		opacity:0.7;
    		transition-duration: 0.4s;
    	}
    	button:hover{
    		opacity:0.7;
    		transition-duration: 0.4s;
    	}
    </style>
</head>
<body style="background-image: url('<%= request.getContextPath()%>/background1.jpg');background-size:cover;background-repeat:no-repeat;background-attachment:fixed;">
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
<%
	if(request.getParameter("idprodukt")!=null){
		request.getSession(true).setAttribute("idprodukt", request.getParameter("idprodukt"));
	}
 %>
 
<%
	if( request.getParameter("produktname")!=null){
		request.getSession().setAttribute("produktname", request.getParameter("produktname"));
	}
 %>
<h2 class="text-center mt-5 text-white"><span id="el2">hochladen von Bilder für</span> <span class="text-success"><%=  request.getSession().getAttribute("produktname") %></span></h2>
<h6 class="text-center text-warning" id="el3">Sie dürfen maximal 4 Bilder hochladen</h6>
<div class="card" style="max-width:50%; margin:auto; background-color:#5F9EA0;">
	<div class="card-body">
	
		<form action="Bildprodukthochladen" method="post" enctype="multipart/form-data">
			<input type="file" class="form-control mt-2" name="bildprodukt1" id="bildprodukt1">
			<input type="file" class="form-control mt-2" name="bildprodukt2" id="bildprodukt2">
			<input type="file" class="form-control mt-2" name="bildprodukt3" id="bildprodukt3">
			<input type="file" class="form-control mt-2" name="bildprodukt4" id="bildprodukt4">
			<input 
				type="submit" 
				name="sendbildprodukt" 
				id="sendbildprodukt"
				class=" mt-5"
				style="width:150px; border:1px solid #1E90FF;border-radius:200px; padding:5px; font-size:0.7em;background-color:#1E90FF;color: white; margin:auto;"
				value="hochladen"
			>
	
		</form>
		<span class="text-center text-danger mt-1" style="font-size:0.8em;">${fehlermeldung2}</span>
	</div>
</div>
<!-- end content -->

<hr>
<h5 class="text-white text-center lead mb-3"  style="margin-top:25px;font-weight:bold;" id="el4">Liste der hochgeladenen Bilder</h5>


<!-- test debut -->
<!-- Button trigger modal -->

<!-- test fin -->

<div id="content" Style="max-height:600px;overflow-y:auto;background-color:#F5F5F5;">
<div class="row" id="rowcontent">
	<% int counter=0;
	 List <String> bildnamen = (List<String>)(session.getAttribute("bildname"));
	 List <String> bildsizes = (List<String>)(session.getAttribute("bildsize"));
	%>
	 
    <d:forEach items="${listbilder}" var="bildlink">
       <div class="col-sm">
       		<p><d:out value="${bildlink}"/><p>
		    <img alt="bild" class="produkt " src="Dateien/${userEmail}/${bildlink}"  />
		    <button type="button" class="btn btn-sm btn-danger delete" onclick="deleteBild('<%=bildnamen.get(counter)  %>','<%=bildsizes.get(counter)%>')">delete</button>	
		    <% counter++; %>		    	
       </div>
    </d:forEach>
	<div>
	
	</div>
</div>

</div>
<h3 class="text-center mt-5 mb-2 lead text-white" style="font-weight:bold;" id="el5">Produktverwaltung </h3>

<div class="row">
	<div class="col">
		<div class="card mb-3" style="margin:auto; font-size:0.8em; padding:15px; width:300px; background-color:black; color: white;">
			<div class="card-body" id="el6">Klicken Sie auf Online ,Um Ihr Produkt für Ihre Kunden online sichtbar zu machen</div>
		</div>
		<div style="width:50%;margin:auto;"><div class="btn btn-success btn-sm" style="border-radius:200px;" id="online" onclick="Online(this)" style="margin:auto;">Online</div></div>
	</div>
	<div class="col">
		<div class="card mb-3" style="margin:auto; font-size:0.8em;  padding:15px;width:300px; background-color:black; color: white;">
			<div class="card-body" id="el7">Klicken Sie auf Offline ,Um Ihr Produkt für Ihre Kunden online zu verbergen</div>
		</div>
		<div style="width:50%;margin:auto;"><div class="btn btn-danger btn-sm" style="border-radius:200px;" id="offline" onclick="Offline(this)" style="margin:auto;">Offline</div></div>
	</div>
	<div class="col">
		<div class="card mb-3" style="margin:auto; font-size:0.8em; padding:15px; width:300px; background-color:black; color: white;">
			<div class="card-body" id="el8">Klicken Sie auf löschen ,Um Ihr Produkt zu löschen</div>
		</div>
		<div style="width:50%;margin:auto;"><div class="btn btn-warning btn-sm" style="border-radius:200px;" id="loeschen" onclick="produktloeschen()" >delete</div></div>
	
	</div>
</div>


<%@ include file="/footer.jsp" %>

   <script type="text/javascript" src="js/mdb.min.js"></script>
   <script>
   
   
   
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
   			var idprodukt = <%=request.getParameter("idprodukt")%>; 
   			if(idprodukt==null){
   				idprodukt= ${idprodukt};
   			}
   			XML.open("GET","Bilderautomladen?idprodukt="+idprodukt,true);
   			XML.send();
   
   			
   			
   			//when the seller omit to answer some questions 
   			var check1 = <%= request.getSession().getAttribute("checkifverkauferconfirm")%>;
   			
   			if(parseInt(check1)==1){
   				document.getElementById("online").style.visibility="hidden";
   			}else if(parseInt(check1)==0){
   				document.getElementById("online").style.visibility="visible";
   			}
   			
   			setInterval(function(){
   				let check1 = <%= request.getSession().getAttribute("checkifverkauferconfirm")%>;
   	   			
   	   			if(parseInt(check1)==1){
   	   				document.getElementById("online").style.visibility="hidden";
   	   			}else if(parseInt(check1)==0){
   	   				document.getElementById("online").style.visibility="visible";
   	   			}
   				
   			},5000);
   			//
	   
		  function deleteBild(bildname,bildsize){
			 
			  var XML = new XMLHttpRequest();
			  XML.onreadystatechange = function(){
				  if(this.readyState==4 && this.status==200){
					  document.getElementById("rowcontent").innerHTML=this.responseText;
				  }
				  
			  };
			  
			  XML.open("GET","Bildloeschen?bildname="+bildname+"&bildsize="+bildsize,true);
			  XML.send();
		  }
		  
		  
		  function Online(e){
			 
			  var XML = new XMLHttpRequest();
			  var idprodukt = <%=request.getSession().getAttribute("idprodukt")%>; 
			  XML.onreadystatechange = function(){
				  if(this.readyState==4 && this.status==200){
					  alert(this.responseText);
				  }
			  };
			  XML.open("GET","Produktverwaltung?idprodukt="+idprodukt+"&funktion=online",true);
			  XML.send();
			  e.disabled=true;
			  document.getElementById("offline").disabled=false;
		  }
		  
		  function Offline(e){
			  e.disabled=true;
			  document.getElementById("online").disabled=false;
			  var XML = new XMLHttpRequest();
			  var idprodukt = <%=request.getSession().getAttribute("idprodukt")%>; 
			  XML.onreadystatechange = function(){
				  if(this.readyState==4 && this.status==200){
					  alert(this.responseText);
				  }
			  };
			  XML.open("GET","Produktverwaltung?idprodukt="+idprodukt+"&funktion=offline",true);
			  XML.send();
		  }
		  
		  function produktloeschen(){
			  var XML = new XMLHttpRequest();
			  var idprodukt = <%=request.getSession().getAttribute("idprodukt")%>; 
			  XML.onreadystatechange = function(){
				  if(this.readyState==4 && this.status==200){
					  if(this.responseText=="ok"){
						  window.location.replace("<%=request.getContextPath()%>/verkaufer_home.jsp");
					  }else{
						  alert(this.responseText);
					  }
				  }
			  };
			  XML.open("GET","Produktverwaltung?idprodukt="+idprodukt+"&funktion=loeschen",true);
			  XML.send();
		  }
	   		
		  
		  
		//language
		  var check =  <%= request.getSession().getAttribute("languagechoosen")%>
			
			if(check==null){
				let XmL = initRequest();
				XmL.onreadystatechange = function (){
					
				};
				XmL.open("GET","Language?type=default",false);
				XmL.send();
			}
		   
		   setInterval(function(){
		   	var lg = <%= request.getSession().getAttribute("language")%>
		   	
		   	if(parseInt(lg)==0){
		   		
		   		document.getElementById("el1").innerText = "dashboard";
		   		document.getElementById("el2").innerText = "upload pictures for ";
		   		document.getElementById("el3").innerText = "You may upload a maximum of 4 images ";
		   		document.getElementById("el4").innerText = "List of uploaded images ";
		   		document.getElementById("el5").innerText = "Product management ";
		   		document.getElementById("el6").innerText = "Click 'Online' to make your product visible to your customers ";
		   		document.getElementById("el7").innerText = "click 'Offline' to hide your product from your customers ";
		   		document.getElementById("el8").innerText = "Click 'delete' to delete your product";
		   		document.getElementById("online").innerText="online";
		   		document.getElementById("offline").innerText="offline";
		   		document.getElementById("loeschen").innerText="delete";
		   		document.getElementById("sendbildprodukt").value="upload";
		   		
		   		
		   	
		   		
		   	
			    	var res1 =document.getElementsByClassName("delet");	
			    	for(let i=0;i< res1.length; i++){
			    		
			    		if(res1[i]!=null){
			    			res1[i].value= "delete" ;
			 	    		
			    		}
			    	}		    	
				
			    	
		   	}else if(parseInt(lg)==1){
	
		   		document.getElementById("el1").innerText = "bureau";
		   		document.getElementById("el2").innerText = "Téléchargez des images pour ";
		   		document.getElementById("el3").innerText = "Vous ne pouvez télécharger au plus que 4 images ";
		   		document.getElementById("el4").innerText = "Liste des images téléchargées ";
		   		document.getElementById("el5").innerText = "Gestion du produit ";
		   		document.getElementById("el6").innerText = "cliquez sur 'mise en ligne' pour rendre votre produit visible pour vos clients ";
		   		document.getElementById("el7").innerText = "cliquez sur 'mise hors ligne' pour rendre votre produit invisible en ligne ";
		   		document.getElementById("el8").innerText = "cliquez sur 'supprimer' pour supprimer le produits";
		   		document.getElementById("online").innerText="mise en ligne";
		   		document.getElementById("offline").innerText="mise hors ligne";
		   		document.getElementById("loeschen").innerText="supprimer";
		   		document.getElementById("sendbildprodukt").value="télécharger";
		   		
		   		
		   	
		   		
		   	
			    	var res1 =document.getElementsByClassName("delet");	
			    	for(let i=0;i< res1.length; i++){
			    		
			    		if(res1[i]!=null){
			    			res1[i].value= "supprimer" ;
			 	    		
			    		}
			    	}		    	
		   	}else if(parseInt(lg)==2){
	
		   		document.getElementById("el1").innerText = "Dashboard";
		   		document.getElementById("el2").innerText = "hochladen von Bilder für ";
		   		document.getElementById("el3").innerText = "Sie dürfen maximal 4 Bilder hochladen ";
		   		document.getElementById("el4").innerText = "Liste der hochgeladenen Bilder ";
		   		document.getElementById("el5").innerText = "Produktverwaltung ";
		   		document.getElementById("el6").innerText = "klicken Sie auf 'Online', um dieses Produkt online zu stellen";
		   		document.getElementById("el7").innerText = "klicken Sie auf 'Offline', um dieses Produkt offline zu stellen ";
		   		document.getElementById("el8").innerText = "klicken Sie auf löschen, um dieses Produkt zu löschen";
		   		document.getElementById("online").innerText="Online";
		   		document.getElementById("offline").innerText="Offline";
		   		document.getElementById("loeschen").innerText="löschen";
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
