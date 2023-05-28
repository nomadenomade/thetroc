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
    		width:calc(80% - 10px);background-color:#F5F5F5;margin:auto;
    	}
    	.bewertungbody{
    		width:calc(80% - 10px);
    	}
    	.buttoncomment1{
    		margin: auto;
    	}
    	.buttoncomment2{
    		margin-left:20px;
    	}
    	
    	button:hover{
    		opacity:0.7;
    		transition-duration: 0.4s;
    	}
    
    	@media screen and (max-width: 992px){
    		.inhalt {
    			width:80% ;
    		}
    		
    		 .buttoncomment1{
    			margin: auto;
    		}
    		.buttoncomment2{
    			margin-left:0px;
    		}
    	}
    	
    	@media screen and (max-width: 600px){
    		.inhalt {
    			width:100%;
    		}
    		.bewertungbody {
    			width:100%;
    	    }
    	    
    	    .buttoncomment1{
    			margin: auto;
    			
    		}
    		.buttoncomment2{
    			margin-left:0px;
    			
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
	      			<span class="lead text-white" style="font-weight:bold; font-size:0.8em; border-bottom:2px solid white;" id="el1">Meine Bestellungen<i class="fas fa-shopping-cart"></i></span>
	     		</a> 
	    	</span> 
	    	
	     
	    </div>
	    
	     
	    
	     <!-- Right elements -->
	    <div class="d-flex align-items-center">
	    
	    
	    	
	    
	      
	      <!-- Regsitrierung -->
	       <a  class="text-reset nav-link me-1 " href="<%=request.getContextPath()%>/registrierung.jsp">
	      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em;" id="el2">Registrierung</span>
	      </a>
	         
	
	      <!-- Anmeldung -->
	      <a   class="nav-link text-reset me-1" href="<%=request.getContextPath()%>/anmeldung.jsp" >
	      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em;" id="el3">Anmeldung<i class="fas fa-circle-user"></i></span>
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
		      > <span class="lead text-white" id="username" style="font-weight:bold; font-size:0.8em;"><span id="el4">Benachrichtigung</span> <i class="fas fa-bell"></i><span class="badge rounded-pill badge-notification bg-danger" id="notif-zahl"></span></span>        
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
		          <a class="dropdown-item" href="<%=request.getContextPath() %>/RequestReSend?name=myinfo_client" id="el5">Mein infos</a>
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
	<div class="card mt-3" id="blockname" style="visibility:hidden; width:30%; margin:auto;">
		<div class="card-body">
			<div class="lead" style="font-size:0.8em; font-weight:bold;padding:5px; text-align:center;"><span id="el6">Hallo </span><span class="text-success " id="Pseudo">${pseudo}</span></div>
		</div>
	</div>
	<h1 class="text-center mt-5 mb-1 lead"  style="font-weight:bold;color:white; font-size:1.2em;"id="el7">Sobald der Status ihrer Bestellung auf 'bestätigt' gesetzt ist können Sie diese abholen gehen</h1>
	<div class="text-warning text-center lead" style="font-size:1.1em; max-width:60%;margin:auto;" id="warn">Sollten Ihre ausstehenden Bestellungen nicht mehr  zu sehen sein, bedeutet das, dass der Kaufer Ihre bestellung abgelehnt hat !</div>
	<div class="card inhalt" style="">
		<div class="card-body" id="inhalt"></div>
	</div>
	
	<div class="text-center lead  mb-2 " Style="font-size:2.3em;color:white; font-weight:bold;margin-top:100px;"id="el8">Bewertungen</div>
	<div id="bewertungen"></div>
	
	
	
	<!-- inhalt ende-->
	
	<%@ include file="/footer.jsp" %>
<!-- End your project here-->
	
<!-- Parameter empfangen -->
	<% request.getSession().setAttribute("idprodukt", request.getParameter("idprodukt"));
	 request.getSession().setAttribute("produktname", request.getParameter("produktname"));
	 %>
	  <!--Parameter empfangen end  -->
<script type="text/javascript" src="js/mdb.min.js"></script>
<script type="text/javascript" src="js/qrcode.min.js"></script>
	    <!-- Custom scripts -->
<script type="text/javascript">
		var lg = <%= request.getSession().getAttribute("language")%>
		
	    setInterval(function(){	 
    		window.location.reload();	  
    	 },93000);
	    
	    //Sessionhandling
	    if(<%=request.getSession().getAttribute("idkaufer") %>==null){		
				window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
			}
	    setInterval(function(){
	    	if(<%=request.getSession().getAttribute("idkaufer") %>==null){		
				window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
			}
	    },600);
	    //session end
	    	
	    var userid='<%=request.getSession().getAttribute("isuser")%>';
	   	 if(userid.trim()=='kaufer'){
	   		 document.getElementById("bestellungbutton").style.visibility="visible";
	   		 document.getElementById("profil").style.visibility="visible";
	   		 document.getElementById("blockname").style.visibility="visible";
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
	    	 
	    	 var idprodukt = "<%= request.getParameter("idprodukt")%>";
	 	 
	    	 if(idprodukt!=null){
	    		 var xml = initRequest();
		    	 xml.onreadystatechange= function(){
		    		 if(this.readyState==4 && this.status==200){
		    			 document.getElementById("inhalt").innerHTML= this.responseText;
		    		 }
		    	 };
		    	 xml.open("GET","Produkt_fuer_Bestellung?type=bestellungstafel&idprodukt="+idprodukt,false);
		    	 xml.send();
	    	 }
	    	
	    	 
	    	 // für die Warnunganzahl des Kaufer 
    		 setInterval(function(){ 
    			 let XML = initRequest();
    			 XML.onreadystatechange = function(){
    				 if(this.readyState==4 && this.status==200){
    					
    				 }
    			 };
    			 XML.open("GET","Bestellung_verwaltung_kunde?type=warning",false);
	    		 XML.send();
    			 
    		 },5000);
    		 
	    	
	    	
	    
	    	 
	    	 function differenz(date1, date2){
	    		 var tab1 =date1.split(",");
	    		 var tab2 = tab1[0].split("-");
	    		 
	    		 var tag =parseInt(tab2[0]);
	    		 var monate= parseInt(tab2[1]);
	    		 var year = parseInt(tab2[2]);
	    		 
	    		 var tab3 = tab1[1].split(":");
	    		 var stunde= parseInt(tab3[0]);
	    		 var minute= parseInt(tab3[1]);
	    		 var seconde= parseInt(tab3[2]);
	    		 
	    		 //
	    		 var tab =date2.split(",");
	    		 var tab4 = tab[0].split("-");
	    		 
	    		 var tag2 =parseInt(tab4[0]);
	    		 var monate2= parseInt(tab4[1]);
	    		 var year2 = parseInt(tab4[2]);
	    		 
	    		 var tab5 = tab[1].split(":");
	    		 var stunde2= parseInt(tab5[0]);
	    		 var minute2= parseInt(tab5[1]);
	    		 var seconde2= parseInt(tab5[2]);
	    		 
	    		 var neusecond=0;
	    		 var neuminute=0;
	    		 var neustunde=0;
	    		 
	    		 if(seconde2<seconde){   
	    			 
	    			 if(minute2==0){ 
	    				 if(stunde2==0){
	    					 
	    				 }else{
	    					 minute2=59;
	    					 stunde2--;	 
	    					 seconde2+=60;
		 	    			 neusecond=seconde2-seconde;
	    				 }
	    			 }else{
	    				 seconde2+=60;
	    				 minute2--;
	 	    			 neusecond=seconde2-seconde;
	    				
	    				
	    			 }
	    						 
	    		 }else{
	    			
	    			 neusecond =seconde2-seconde;
	    			
	    		 }
	    		 
	    	
	    		 
	    		 if(minute2<minute){
					
					 if(stunde2==0){
							 
    					 
    				 }else{
    					 minute2+=60;
    					 stunde2--;
    					 neuminute=minute2-minute;
    					
    					 
    				 }
					 
				 }else{
					 neuminute=minute2-minute; 
				 }
	    		
	    		if(stunde2<stunde){
	    			stunde2+=24;
	    			neustunde=stunde2-stunde;
	    			
	    		}else{
	    			neustunde = stunde2-stunde;
	    		}
	    		
	    		return neustunde+":"+neuminute+":"+neusecond;
	    		
	    	 }
	    	 
	    	 
	    	 function time_plus_dauerabholung(datum,dauerabholung){
	    		 var rueck = datum;
	    		 var date1 = datum.split(",");
	    		 var stunde = parseInt(date1[1].split(":")[0])+parseInt(dauerabholung);
	    		 var tag = parseInt(date1[0].split("-")[0]);
	    		 var mon = parseInt(date1[0].split("-")[1]);
	    		 var year= parseInt(date1[0].split("-")[2]);
	    		 while(stunde>24){
	    			 tag++;
	    			 stunde = stunde - 24;
	    			
	    		 }
	    		 
	    		 while(tag >30){
	    			 mon ++;
	    			 tag = tag -30;
	    		 }
	    		 
	    		 while (mon>12){
	    			 year ++;
	    			 mon = mon -12;
	    		 }
	    		 
	    		 if(stunde>24){
	    			 tag++;
	    			 
	    		 }
	    		 
	    		 rueck = ""+tag+"-"+mon+"-"+year+","+stunde+":"+date1[1].split(":")[1]+":"+date1[1].split(":")[2];
	    		
	    		 //date1[0]+","+stunde+":"+date1[1].split(":")[1]+":"+date1[1].split(":")[2];
	    		 return rueck;
	    	 }
	    	 
	    	 function storno(e){
	    		 var XML = initRequest();
	    		 XML.onreadystatechange = function (){
	    			 if(this.readyState=4 && this.status==200){
	    				 alert(this.responseText);
	    			 }
	    		 };
	    		 XML.open("GET","Bestellung_verwaltung_kunde?type=stornieren&idwarenkob="+e,false);
	    		 XML.send();
	    	 }
	    	 
	    	 
	    	 function antwortja(idwarenkob){
	    		 var XML = initRequest();
	    		 XML.onreadystatechange = function (){
	    			 if(this.readyState=4 && this.status==200){
	    				 alert("ok");
	    			 }
	    		 };
	    		 XML.open("GET","Bestellung_verwaltung_kunde?type=antwortja&idwarenkob="+idwarenkob,false);
	    		 XML.send();
	    	 }
	    	
	    	 //modal sector
	    	 var idwarenkob2=0;
	    	 var checkifgeolocationisactivated = 0;
	    	 function checkCodeSeller(codeseller,longitude,latitude,idwarenkob,count,type){
	    		let codeinput = document.querySelector("#code"+count).value;
	    		
	    		if(codeseller==codeinput){
	    			 
	    			idwarenkob2 = parseInt(document.getElementsByClassName("idwarenkob")[count].value);
	    			 
	    			 let XML = initRequest();
		    		 XML.onreadystatechange = function (){
		    			 if(this.readyState=4 && this.status==200){
		    				
		    				 zeitabgelaufen2();
		    				 
		    				 if(parseInt(lg)==0){
		    	    			document.querySelector("#fehler"+count).innerHTML="<div style='text-align:center; color:#2E8B57;font-weight:bold; font-size:0.9em;margin-left:5px;'> confirmed <img src='success.gif' als='success' /><div>";
		        			 }else if(parseInt(lg)==1){
		        			    document.querySelector("#fehler"+count).innerHTML="<div style='text-align:center; color:#2E8B57;font-weight:bold; font-size:0.9em;margin-left:5px;'> confirmé <img src='success.gif' als='success' /><div>";	    			
		        			 }else{
		        			    document.querySelector("#fehler"+count).innerHTML="<div style='text-align:center; color:#2E8B57;font-weight:bold; font-size:0.9em;margin-left:5px;'> bestätigt <img src='success.gif' als='success' /><div>";  		    			
		        			 }
		    				
		    			 }
		    		 };
		    		 XML.open("GET","Bestellung_verwaltung_kunde?type=antwortja&idwarenkob="+idwarenkob2,false);
		    		 XML.send();
		    		
	    		 }else{
	    			 if(parseInt(lg)==0){
	    				 document.querySelector("#fehler"+count).innerHTML="<div style='color:red; text-align:center;'>wrong code !</div>";
    			    }else if(parseInt(lg)==1){
    			    	document.querySelector("#fehler"+count).innerHTML="<div style='color:red; text-align:center;'>code incorrect!</div>";
    			    }else{
    			    	document.querySelector("#fehler"+count).innerHTML="<div style='color:red; text-align:center;'>Code falsch!</div>";
    			    }
	    			 
	    		 }
	    	 }
	    	 function zeitabgelaufen2 (count){
	    		 if(navigator.geolocation){
			   		   navigator.geolocation.getCurrentPosition(navigatorCallbackmodal,erreurPosition,{enableHighAccuracy:true});
			   	   }
    			
    		 }
	    	 function navigatorCallbackmodal(position){
	    		
				   lat = position.coords.latitude;
				   lng = position.coords.longitude;
				  
	    			  
				   var XML = initRequest();
		    		 XML.onreadystatechange = function (){
		    			 if(this.readyState=4 && this.status==200){
		    				if(this.responseText == "true"){
		    					checkifgeolocationisactivated=1;
		    				}
		    				
		    			 }
		    		 };
		    		 XML.open("GET","Bestellung_verwaltung_kunde?type=zeitabgelaufen&idwarenkob="+idwarenkob2+"&lat="+lat+"&lng="+lng,false);
		    		 XML.send();
				   	  	   
				  
			   }
			   
	    	 
	    	 //modal sector end
	    	 
	    	 function antwortnein(idwarenkob){
	    		 var XML = initRequest();
	    		 XML.onreadystatechange = function (){
	    			 if(this.readyState=4 && this.status==200){
	    				 alert("ok");
	    			 }
	    		 };
	    		 XML.open("GET","Bestellung_verwaltung_kunde?type=antwortnein&idwarenkob="+idwarenkob,false);
	    		 XML.send();
	    	 }
	    	 
	    	 
	    	 
	    	 var idwarenkob=0;
	    	 
	    	 function zeitabgelaufen (){
	    		 if(navigator.geolocation){
			   		   navigator.geolocation.getCurrentPosition(navigatorCallback,erreurPosition,{enableHighAccuracy:true});
			   	   }
    			
    		 }
	    	 
	    	 
	    	 
	    	 //geolocalisation funktionen
	    		
	    	   
			   function navigatorCallback(position){
				
				   lat = position.coords.latitude;
				   lng = position.coords.longitude;
				 
				   
				   var XML = initRequest();
		    		 XML.onreadystatechange = function (){
		    			 if(this.readyState=4 && this.status==200){
		    					
		    			 }
		    		 };
		    		 XML.open("GET","Bestellung_verwaltung_kunde?type=zeitabgelaufen&idwarenkob="+idwarenkob+"&lat="+lat+"&lng="+lng,false);
		    		 XML.send();
				   	  	   
				  
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
	    
	  		//geoloc-end
	    	 
	    	// Timer fürs abholen des Produkt
	    	
	    	 var tabdatum = document.getElementsByName("datum");
	    	 var tabdauerabholung = document.getElementsByName("abholung");
	    	 var tabfehlermeldung = document.getElementsByClassName("fehlermeldung");
	    	 var tabbutton = document.getElementsByClassName("storno");
	    	 var tabblockantwort = document.getElementsByClassName("blockantwort");
	    	 var tabidwarenkob = document.getElementsByClassName("idwarenkob");
	    	 var tabfehlermeldung3 = document.getElementsByClassName("fehlermeldung3");
	    	 var confblock=document.getElementsByClassName("confirmbuttonblock");
	    	 
	    	
	    		 for(let i=0;i<tabdatum.length;i++){
	    			
	    			 let id= setInterval(function(){
	    				
	    	    		 var datum = new Date();
	    		    	 let index= i;	
	    	    		 var tag2 =  parseInt(datum.getDate());
	    	    		 var monate2= parseInt(datum.getMonth());
	    	    		 var year2 = parseInt(datum.getFullYear());
	    	    		 
	    	    		 var stunde2 = parseInt(datum.getHours());
	    	    		 var minute2 = parseInt(datum.getMinutes());
	    	    		 var seconde2= parseInt(datum.getSeconds());
	    	    		 
	    	    		 var d = tag2+"-"+monate2+"-"+year2+","+stunde2+":"+minute2+":"+seconde2;
	    	    		 var t  = time_plus_dauerabholung(tabdatum[index].value,tabdauerabholung[index].value);
	    				 let date1 = differenz(d,t);
	    				 document.getElementById(index).innerHTML= date1;
	    				 let tabdate = date1.split(":");
	    				 
	    				 let lg = <%= request.getSession().getAttribute("language")%>
	    			    	
	    			    	
	    				 
	    				
	    				 //check ob die Frist überschrieten ist
	    				 let uhr = parseInt(t.split(",")[1].split(":")[0]);
	    				 let min = parseInt(t.split(",")[1].split(":")[1]);
	    				 let uhrinit = parseInt(tabdatum[index].value.split(",")[1].split(":")[0]);
	    				 let mininit = parseInt(tabdatum[index].value.split(",")[1].split(":")[1]);
	    				
	    				 if(parseInt(tabdate[0])==parseInt(parseInt(tabdauerabholung[index].value)/2) && parseInt(tabdate[0]) !=0 && parseInt(tabdauerabholung[index].value)!=2){
	    					 tabbutton[index].disabled=true;
	    					 document.getElementById(index).style.color="#FFA500";
	    					 
	    					 if(parseInt(lg)==0){
	    						 tabfehlermeldung3[index].innerHTML="It is not possible anymore to cancel this order !";
		    			    }else if(parseInt(lg)==1){
		    			    	tabfehlermeldung3[index].innerHTML="Vous ne pouvez plus annuler cette commande !";
		    			    }else{
		    			    	tabfehlermeldung3[index].innerHTML="Sie können diese Bestellung nicht mehr annulieren";
		    			    }
	    					 
	    				 }else if(parseInt(tabdate[0])==0){
	    					 tabbutton[index].disabled=true;
	    					 document.getElementById(index).style.color="red";
	    					 if(parseInt(lg)==0){
	    						 tabfehlermeldung3[index].innerHTML="It is not possible anymore to cancel this order !";
		    			    }else if(parseInt(lg)==1){
		    			    	tabfehlermeldung3[index].innerHTML="Vous ne pouvez plus annuler cette commande !";
		    			    }else{
		    			    	tabfehlermeldung3[index].innerHTML="Sie können diese Bestellung nicht mehr annulieren";
		    			    }
	    					 
	    				 }
	
	    				 if(uhr==stunde2 && minute2>min){
	    					 document.getElementById(index).innerHTML="0:0:0"; 
	    					 document.getElementById(index).style.color="red";
	    					 tabblockantwort[index].style.visibility ="visible";
	    					 confblock[index].style.visibility ="hidden";
	    					 
	    					 if(parseInt(lg)==0){
	    						 tabfehlermeldung[index].innerHTML= "The deadline for collecting this product has long passed";
		    			    }else if(parseInt(lg)==1){
		    			    	tabfehlermeldung[index].innerHTML= "la durée de récupération de ce produit c est écoulée depuis longtemps";	
		    			    }else{
		    			    	tabfehlermeldung[index].innerHTML= "Die Frist fürs Abholen dieses Produkts ist längst abgeläufen";	
		    			    }
	    					 tabbutton[index].disabled=true;
	    					 idwarenkob=tabidwarenkob[index].value;
	    					 zeitabgelaufen();
	    					 clearInterval(id);
	    				 }
	    				 
	    				 if(stunde2>uhr || stunde2< uhrinit){
	    					 tabblockantwort[index].style.visibility ="visible";
	    					 document.getElementById(index).innerHTML="0:0:0"; 
	    					 document.getElementById(index).style.color="red";
	    					 confblock[index].style.visibility ="hidden";
	    					 
	    					 if(parseInt(lg)==0){
	    						 tabfehlermeldung[index].innerHTML= "The deadline for collecting this product has long passed";
		    			    }else if(parseInt(lg)==1){
		    			    	tabfehlermeldung[index].innerHTML= "la durée de récupération de ce produit c est écoulée depuis longtemps";	
		    			    }else{
		    			    	tabfehlermeldung[index].innerHTML= "Die Frist fürs Abholen dieses Produkts ist längst abgeläufen";	
				    			
		    			    }
	    					 tabbutton[index].disabled=true;
	    					 idwarenkob=tabidwarenkob[index].value;
	    					 zeitabgelaufen();
	    					 clearInterval(id);
	    				 }
	    				 let e = parseInt(tabdatum[index].value.split(",")[0].split("-")[0]);
	    				 //check ob wir in einem anderen Tag sind
	    				 if(e>tag2 || e<tag2){
	    					 tabblockantwort[index].style.visibility ="visible";
	    					 document.getElementById(index).innerHTML="0:0:0"; 
	    					 document.getElementById(index).style.color="red";
	    					 confblock[index].style.visibility ="hidden";
	    					 tabbutton[index].disabled=true;
	    					 if(parseInt(lg)==0){
	    						 tabfehlermeldung[index].innerHTML= "The deadline for collecting this product has long passed";
		    			    }else if(parseInt(lg)==1){
		    			    	tabfehlermeldung[index].innerHTML= "la durée de récupération de ce produit c est écoulée depuis longtemps";	
		    			    }else{
		    			    	tabfehlermeldung[index].innerHTML= "Die Frist fürs Abholen dieses Produkts ist längst abgeläufen";	
				    			
		    			    }
	    					 idwarenkob=tabidwarenkob[index].value;
	    					 zeitabgelaufen();
	    					 clearInterval(id); 
	    				 }
	    				 
	    				 if(parseInt(tabdate[0])==0 && parseInt(tabdate[1])==0 && parseInt(tabdate[0])==0){
	    					 tabblockantwort[index].style.visibility ="visible";
	    					 document.getElementById(index).innerHTML="0:0:0";
	    					 document.getElementById(index).style.color="red";
	    					 confblock[index].style.visibility ="hidden";
	    					 if(parseInt(lg)==0){
	    						 tabfehlermeldung[index].innerHTML= "The deadline to collect this product has just passed";
	    						 alert("Your time to collect one of your orders has expired. Answer the question asked in the appropriate place");
		    			    	}else if(parseInt(lg)==1){
		    			    		 tabfehlermeldung[index].innerHTML= "la durée de récupération de ce produit vient de s'écouler ";	
		    			    		 alert("la durée de récupération de ce produit vient de s'écouler . repondez à la questions posée au niveau du produit");
		    			    	}else{
		    			    		tabfehlermeldung[index].innerHTML= "Die Frist fürs Abholen dieses Produkts ist gerade abgeläufen";	
		    			    		alert("Ihre Zeit fürs abholen einer Ihrer Bestellungen ist abgelauft.Beantworten Sie die an der entsprechenden Stelle gestellte Frage");
		    			    	
		    			    	}
	    					 tabbutton[index].disabled=true;
	    					 idwarenkob=tabidwarenkob[index].value;
	    					 zeitabgelaufen();
	    					 clearInterval(id);
	    				 }
	    			 
	    			 },1000);
	    		 }
	    		 
	    		 
	    		
		    	
    		//Tmer end	 
    		
	    	 
	    	 	var Xml = initRequest();
		    	 Xml.onreadystatechange= function(){
		    		 if(this.readyState==4 && this.status==200){
		    			
		    			 document.getElementById("bewertungen").innerHTML= this.responseText;
		    		 }
		    	 };
		    	 Xml.open("GET","Bestellung_verwaltung_kunde?type=bewertung",false);
		    	 Xml.send();
		    	 
		    //autodeletebewertung
		    var XMl = initRequest();
		    	 XMl.onreadystatechange= function(){
		    		 if(this.readyState==4 && this.status==200){
		    			
		    		
		    		 }
		    	 };
		    	 XMl.open("GET","Bestellung_verwaltung_kunde?type=autodeletebewertung",true);
		    	 XMl.send();
		    	 
		    	 
		   //KommentarBereich
		   function getSterne(counter){
			   var Sterne=0;
			   var radiobutton = document.getElementsByName("auswahl"+counter);
			  
			   for(let i=0; i<radiobutton.length; i++){
				   if(radiobutton[i].checked){
					   Sterne=radiobutton[i].value;
					  break;
				   }
			   }
			   return Sterne;
		   }
		   
		   function kommentierenja(idprodukt,idwarenkob,counter){
			   var sterne=getSterne(counter);
			   	
			   	let kommentar = document.getElementsByName("kommentar")[counter].value;
			    let Xml = initRequest();
		    	Xml.onreadystatechange= function(){
		    		if(this.readyState==4 && this.status==200){
		    			
		    			document.getElementById("bewertungen").innerHTML= this.responseText;
		    			if(parseInt(this.responseText)==1){
		    				alert("Danke");
		    			}else{
		    				alert("Ein Fehler ist aufgetreten");
		    			}
		    		}
		    	};
		    	Xml.open("GET","Bestellung_verwaltung_kunde?type=kommentierenja&idprodukt="+idprodukt+"&idwarenk="+idwarenkob+"&sterne="+sterne+"&kommentar="+kommentar,false);
		    	Xml.send(); 
		    	
		    	
		   }
		   
		   function kommentierennein(idwarenkob){
			   let Xml = initRequest();
		    	Xml.onreadystatechange= function(){
		    		if(this.readyState==4 && this.status==200){
		    			
		    			if(parseInt(this.responseText)==1){
		    				alert("Danke");
		    			}else{
		    				alert("Ein Fehler ist aufgetreten");
		    			}
		    		}
		    	};
		    	Xml.open("GET","Bestellung_verwaltung_kunde?type=kommentierennein&idwarenk="+idwarenkob,false);
		    	Xml.send(); 
		   }
		   
		   //Kommentarbereichend
	   
		  function alsgelesenmarkieren(e){
	    		 let XML = initRequest();
    			 XML.onreadystatechange = function(){
    				 if(this.readyState==4 && this.status==200){
    					
    					 if(this.responseText=="true"){
 	    					 window.location.replace("<%=request.getContextPath()%>/liste_de_commande_client.jsp"); 
 	    				 }
    				 }
    			 };
    			 XML.open("GET","Bestellung_verwaltung_kunde?type=notif-gelesen&idwarenkob="+e,false);
	    		 XML.send();
	    	}
		   
		   //logout
		  document.getElementById("logout").addEventListener("click",function(event){
				event.preventDefault();
				let XmL = initRequest();
				XmL.onreadystatechange = function (){
					if(this.readyState==4 && this.status==200){
						window.location.replace("<%= request.getContextPath()%>/index.jsp");
					}
						
				};
				XmL.open("GET","logout",true);
				XmL.send();
			});
		   
		   //abholungoption wählen
		   
		   function confirmOptionFunction(element,barcode,lng,lat,idwarenkob,count,qrcode){
			  
			   let content1 ="";
				   content1+="<div class='mt-5 mb-3 textconfirm' style='text-align: center; font-weight: bold; font-size=0.8em;' id='textconfirm'>Please put the Code, that you recieve from the seller in following field !</div>";
					content1+="<div class='mb-1' style='text-align:center; font-weight: bold; font-size: 1.4em; color:#2E8B57;'>Code</div>";
				    content1+="<div>";
						content1+="<div class='form-outline mb-2' >";
								content1+="<input type='password' style='font-size:0.8em;' class='form-control code' name='code' placeholder='e.g: TE123-345-SE12' id='code"+count+"'/>";
								content1+="<label for='code"+count+"' style='font-size:0.8em;' class='form-label labelconfirm'>Code here</label>";
						content1+="</div>";
						content1+="<div class='mt-2' style='width:50%; margin:auto;'>";
								content1+="<button class='buttonconfirm' onclick='checkCodeSeller(\""+barcode+"\","+lng+","+lat+","+idwarenkob+","+count+")' style='width:100%; border:1px solid #48D1CC;border-radius:200px; padding:5px; font-size:0.8em;background-color:#48D1CC;color: white; margin:auto;'>send</button>";
								content1+="<span id='fehler"+count+"' style='width:50%;margin:auto;'></span>";		
						content1+="</div>";
					content1+="</div>";
					
					
			  if(element.value=="option1"){
				  document.getElementById("confcontentoption"+count).innerHTML=content1;  
				}else if(element.value=="option2"){
					document.getElementById("confcontentoption"+count).innerHTML="<div id='reader"+count+"'></div><div id='fehler"+count+"'></div>";  
					const scanner = new Html5QrcodeScanner("reader"+count,{fps:10, qrbox:{width:250,height:250}},false);
					scanner.render((decodedtext)=>{
						if(decodedtext==qrcode){
							idwarenkob2 = parseInt(document.getElementsByClassName("idwarenkob")[count].value);
			    			 
			    			 let XML = initRequest();
				    		 XML.onreadystatechange = function (){
				    			 if(this.readyState=4 && this.status==200){
				    				
				    				 zeitabgelaufen2();
				    				 
				    				 if(parseInt(lg)==0){
				    	    			document.querySelector("#fehler"+count).innerHTML="<div style='text-align:center; color:#2E8B57;font-weight:bold; font-size:0.9em;margin-left:5px;'> confirmed <img src='success.gif' als='success' /><div>";
				        			 }else if(parseInt(lg)==1){
				        			    document.querySelector("#fehler"+count).innerHTML="<div style='text-align:center; color:#2E8B57;font-weight:bold; font-size:0.9em;margin-left:5px;'> confirmé <img src='success.gif' als='success' /><div>";	    			
				        			 }else{
				        			    document.querySelector("#fehler"+count).innerHTML="<div style='text-align:center; color:#2E8B57;font-weight:bold; font-size:0.9em;margin-left:5px;'> bestätigt <img src='success.gif' als='success' /><div>";  		    			
				        			 }
				    				
				    			 }
				    		 };
				    		 XML.open("GET","Bestellung_verwaltung_kunde?type=antwortja&idwarenkob="+idwarenkob2,false);
				    		 XML.send();
						}else{
							
							if(parseInt(lg)==0){
			    				 document.querySelector("#fehler"+count).innerHTML="<div style='color:red; text-align:center;'>Wrong QRcode !</div>";
		    			    }else if(parseInt(lg)==1){
		    			    	document.querySelector("#fehler"+count).innerHTML="<div style='color:red; text-align:center;'>QRcode incorrect!</div>";
		    			    }else{
		    			    	document.querySelector("#fehler"+count).innerHTML="<div style='color:red; text-align:center;'>QRcode falsch!</div>";
		    			    }
						}
						
					},(error)=>{
						document.querySelector("#fehler"+count).innerHTML=error;
					});
					
				}
			  
		   }
		   
		   //
	    	
		   
		   //language
		   
		     setInterval(function(){
		    	 var lg = <%= request.getSession().getAttribute("language")%>
	    	
			    	if(parseInt(lg)==0){
			    		
			    		document.getElementById("warn").innerText =" if you don't see your waiting oders anymore, it mean that the seller canceled them";
			    		document.getElementById("el1").innerText = "My Commands";
			    		document.getElementById("el2").innerText = "Registration";
			    		document.getElementById("el3").innerText = "Sign up";
			    		document.getElementById("el4").innerText = "Notification";
			    		document.getElementById("el5").innerText = "My Infos";
			    		document.getElementById("el6").innerText = "hello ";
			    		document.getElementById("el7").innerText = "As soon as the status of your order is set to confirmed, you can go to the seller at time and collect it";
			    		document.getElementById("el8").innerText = "evaluation ";
			    		if(document.getElementById("t1")!=null){
			    			document.getElementById("t1").innerText = "orders waiting to be confirmed ...";	
			    		}
			    		
			    		if(document.getElementById("t2")!=null){
			    			document.getElementById("t2").innerText = "confirmed oders";	
			    		}
			    		
			 	    	
			 	    	var res1 =document.getElementsByClassName("res1");
			 	    	var res2 =document.getElementsByClassName("res2");
			 	    	var res3=document.getElementsByClassName("res3");
			 	    	var res4 =document.getElementsByClassName("res4");
			 	    	var res5 =document.getElementsByClassName("res5");
			 	    	var res6 =document.getElementsByClassName("res6");
			 	    	var res7 =document.getElementsByClassName("res7");
			 	    	var res8 =document.getElementsByClassName("res8");
			 	    	var res9 =document.getElementsByClassName("res9");
			 	    	var res10 =document.getElementsByClassName("res10");
			 	    	var res11 =document.getElementsByClassName("res11");
			 	    	var res12=document.getElementsByClassName("res12");
			 	    	var res13=document.getElementsByClassName("res13");
			 	    	var conft =document.getElementsByClassName("textconfirm");
			 	    	var confb =document.getElementsByClassName("buttonconfirm");
			 	    	var confl =document.getElementsByClassName("labelconfir");
			 	    	var conft2=document.getElementsByClassName("textconfirm2");
			 	    	var conf=document.getElementsByClassName("confirm");
			 	    	var confop1=document.getElementsByClassName("confoption1");
			 	    	var confop2=document.getElementsByClassName("confoption2");
			 	    	
			 	    	
			 	    	for(let i=0;i< res1.length; i++){
			 	    		
			 	    		if(res1[i]!=null){
			 	    			res1[i].innerText= "published on :	";
				 	    		
			 	    		}
							if(res2[i]!=null){
								res2[i].innerText="name:	";
				 	    		
			 	    		}
							if(res3[i]!=null){
								res3[i].innerText= "price:	";
				 	    			    			
							}
							if(res4[i]!=null){
								res4[i].innerText= "town:	";
				 	    			
							}
							if(res5[i]!=null){
								res5[i].innerText= "exact location:	";
				 	    			
							}
							if(res6[i]!=null){
								res6[i].innerText= "description:	";
				 	    			
							}
							if(res7[i]!=null){
								res7[i].innerText= "brand:	";	
							}
							if(res8[i]!=null){
								res8[i].innerText= "quantity on stock:	";	
							}
							if(res9[i]!=null){
								res9[i].innerText= "Did you pick up your product from the seller?	";	
							}
							if(res10[i]!=null){
								res10[i].innerText= "yes	";	
							}
							if(res11[i]!=null){
								res11[i].innerText= "no";	
							}
							
							if(res12[i]!=null){
								res12[i].innerText= "pick up your order before the timer runs out";	
							}
							if(res13[i]!=null){
								res13[i].innerText= "cancel";	
							}
							if(conft[i]!=null){
								conft[i].innerText= "Please choose on the following list the way to confirm... be sure to be at the right seller's location to do it. if is'nt the case your position won't be correctly identify and you will lose one konto's live";	
							}
							if(confb[i]!=null){
								confb[i].innerText= "envoyer";	
							}
							if(confl[i]!=null){
								confl[i].innerText= "code here";	
							}
							if(conft2[i]!=null){
								conft2[i].innerText= "You can also confirm having taken your order before the Time run out !";	
							}
							if(conf[i]!=null){
								conf[i].innerText= "confirm";	
							}
							if(confop1[i]!=null){
								confop1[i].innerText= "Confirm with the textcode that you recieved from the seller !";	
							}
							if(confop2[i]!=null){
								confop2[i].innerText= "Confirm by scanning the QRcode that you recieved from the Seller !";	
							}
			 	    		
			 	    	}
			 	    	
			 	    	
			 	    	var tes1 =document.getElementsByClassName("tes1");
			 	    	var tes2 =document.getElementsByClassName("tes2");
			 	    	var tes3=document.getElementsByClassName("tes3");
			 	    	var tes4 =document.getElementsByClassName("tes4");
			 	    	var tes5 =document.getElementsByClassName("tes5");
			 	    	var tes6 =document.getElementsByClassName("tes6");
			 	    	var tes7 =document.getElementsByClassName("tes7");
			 	    	var tes8 =document.getElementsByClassName("tes8");
			 	    	var tes9 =document.getElementsByClassName("tes9");
			 	    	
			 	    	
		
			 	    	for(let i=0;i< tes1.length; i++){
			 	    		
			 	    		if(tes1[i]!=null){
			 	    			tes1[i].innerText= "published on :	";
				 	    		
			 	    		}
							if(tes2[i]!=null){
								tes2[i].innerText="name:	";
				 	    		
			 	    		}
							if(tes3[i]!=null){
								tes3[i].innerText= "price:	";
				 	    			    			
							}
							if(tes4[i]!=null){
								tes4[i].innerText= "town:	";
				 	    			
							}
							if(tes5[i]!=null){
								tes5[i].innerText= "exact location:	";
				 	    			
							}
							if(tes6[i]!=null){
								tes6[i].innerText= "Please your review of this product";
				 	    			
							}
							if(tes7[i]!=null){
								tes7[i].innerText= "your comment !";	
							}
							if(tes8[i]!=null){
								tes8[i].innerText= "send";	
							}
							if(tes9[i]!=null){
								tes9[i].innerText= "no thanks";	
							}
							
			 	    		
			 	    	}
			 	    	
			    	}else if(parseInt(lg)==1){
			    		document.getElementById("warn").innerText ="Si vous ne voyer plus aparaitre vos commandes en attente dans la liste d'attente, cela signifie que sois vous, soit le vendeur les a supprimer";
				    	
			    		document.getElementById("el1").innerText = "Mes commandes";
			    		document.getElementById("el2").innerText = "enregistrement";
			    		document.getElementById("el3").innerText = "se connecter";
			    		document.getElementById("el4").innerText = "Notification";
			    		document.getElementById("el5").innerText = "Mes Infos";
			    		document.getElementById("el6").innerText = "Salut ";
			    		document.getElementById("el7").innerText = "Aussitot que votre commande est confirmé par le vendeur vous pouvez aller le récupérer";
			    		document.getElementById("el8").innerText = "évaluation ";
			    		if(document.getElementById("t1")!=null){
			    			document.getElementById("t1").innerText = "commande en attente de confirmation ...";	
			    		}
			    		
			    		if(document.getElementById("t2")!=null){
			    			document.getElementById("t2").innerText = "commandes confirmées";	
			    		}
			    		
			 	    	
			 	    	var res1 =document.getElementsByClassName("res1");
			 	    	var res2 =document.getElementsByClassName("res2");
			 	    	var res3=document.getElementsByClassName("res3");
			 	    	var res4 =document.getElementsByClassName("res4");
			 	    	var res5 =document.getElementsByClassName("res5");
			 	    	var res6 =document.getElementsByClassName("res6");
			 	    	var res7 =document.getElementsByClassName("res7");
			 	    	var res8 =document.getElementsByClassName("res8");
			 	    	var res9 =document.getElementsByClassName("res9");
			 	    	var res10 =document.getElementsByClassName("res10");
			 	    	var res11 =document.getElementsByClassName("res11");
			 	    	var res12=document.getElementsByClassName("res12");
			 	    	var res13=document.getElementsByClassName("res13");
			 	    	var conft =document.getElementsByClassName("textconfirm");
			 	    	var confb =document.getElementsByClassName("buttonconfirm");
			 	    	var confl =document.getElementsByClassName("labelconfir");
			 	    	var conft2=document.getElementsByClassName("textconfirm2");
			 	    	var conf=document.getElementsByClassName("confirm");
			 	    	var confop1=document.getElementsByClassName("confoption1");
			 	    	var confop2=document.getElementsByClassName("confoption2");
			 	    	
			 	    	
			 	    	
			 	    	for(let i=0;i< res1.length; i++){
			 	    		
			 	    		if(res1[i]!=null){
			 	    			res1[i].innerText= "mis en ligne le :	";
				 	    		
			 	    		}
							if(res2[i]!=null){
								res2[i].innerText="nom:	";
				 	    		
			 	    		}
							if(res3[i]!=null){
								res3[i].innerText= "prix:	";
				 	    			    			
							}
							if(res4[i]!=null){
								res4[i].innerText= "ville:	";
				 	    			
							}
							if(res5[i]!=null){
								res5[i].innerText= "lieu de vente:	";
				 	    			
							}
							if(res6[i]!=null){
								res6[i].innerText= "description:	";
				 	    			
							}
							if(res7[i]!=null){
								res7[i].innerText= "marque:	";	
							}
							if(res8[i]!=null){
								res8[i].innerText= "quantité en stock:	";	
							}
							if(res9[i]!=null){
								res9[i].innerText= "avez-vous récupérer votre commande chez le vendeur?	";	
							}
							if(res10[i]!=null){
								res10[i].innerText= "oui	";	
							}
							if(res11[i]!=null){
								res11[i].innerText= "non";	
							}
							
							if(res12[i]!=null){
								res12[i].innerText= "allez récupérer votre commande chez le vendeur...Penser à emporter l'appareil avec lequel vous etes connecté avec vous ";	
							}
							if(res13[i]!=null){
								res13[i].innerText= "annuler";	
							}
							if(conft[i]!=null){
								conft[i].innerText= "Svp ! choisissez le moyen de confirmation dans la liste suivante...assurez vous pour cela de vous trouver chez le vendeur, sinon votre position ne sera pas correctement identifiée et vous perdrez une vie sur votre compte.";	
							}
							if(confb[i]!=null){
								confb[i].innerText= "envoyer";	
							}
							if(confl[i]!=null){
								confl[i].innerText= "code ici";	
							}
							if(conft2[i]!=null){
								conft2[i].innerText= "Vous pouvez aussi confirmer la récuperation de votre commande avant que le Timer ne se soit ecoulé !";	
							}
							if(conf[i]!=null){
								conf[i].innerText= "confirmer";	
							}
							if(confop1[i]!=null){
								confop1[i].innerText= "Confirmer en utilisant le code sous forme de text reçu du vendeur !";	
							}
							if(confop2[i]!=null){
								confop2[i].innerText= "Confirmer en scannant le QRcode reçu du vendeur !";	
							}
			 	    	}
			 	    	
			 	    	
			 	    	var tes1 =document.getElementsByClassName("tes1");
			 	    	var tes2 =document.getElementsByClassName("tes2");
			 	    	var tes3=document.getElementsByClassName("tes3");
			 	    	var tes4 =document.getElementsByClassName("tes4");
			 	    	var tes5 =document.getElementsByClassName("tes5");
			 	    	var tes6 =document.getElementsByClassName("tes6");
			 	    	var tes7 =document.getElementsByClassName("tes7");
			 	    	var tes8 =document.getElementsByClassName("tes8");
			 	    	var tes9 =document.getElementsByClassName("tes9");
			 	    	
			 	    	
		
			 	    	for(let i=0;i< tes1.length; i++){
			 	    		
			 	    		if(tes1[i]!=null){
			 	    			tes1[i].innerText= "mise en ligne le :	";
				 	    		
			 	    		}
							if(tes2[i]!=null){
								tes2[i].innerText="nom:	";
				 	    		
			 	    		}
							if(tes3[i]!=null){
								tes3[i].innerText= "prix:	";
				 	    			    			
							}
							if(tes4[i]!=null){
								tes4[i].innerText= "ville:	";
				 	    			
							}
							if(tes5[i]!=null){
								tes5[i].innerText= "lieu de vente:	";
				 	    			
							}
							if(tes6[i]!=null){
								tes6[i].innerText= "S'il vous plait,évaluez ce produit ";
				 	    			
							}
							if(tes7[i]!=null){
								tes7[i].innerText= "ton commentaire !";	
							}
							if(tes8[i]!=null){
								tes8[i].innerText= "envoyer";	
							}
							if(tes9[i]!=null){
								tes9[i].innerText= "non merci";	
							}
							
			 	    		
			 	    	}
			    	}else if(parseInt(lg)==2){
			    		document.getElementById("warn").innerText ="Sollten Ihre ausstehenden Bestellungen nicht mehr  zu sehen sein, bedeutet das, dass der Kaufer Ihre bestellung abgelehnt hat !";
			    		document.getElementById("el1").innerText = "Meine Bestellungen";
			    		document.getElementById("el2").innerText = "Registrierung";
			    		document.getElementById("el3").innerText = "Anmeldung";
			    		document.getElementById("el4").innerText = "Benachrichtigung";
			    		document.getElementById("el5").innerText = "Meine Infos";
			    		document.getElementById("el6").innerText = "hallo ";
			    		document.getElementById("el7").innerText = "Sobald der Status ihrer Bestellung auf 'bestätigt' gesetzt ist können Sie diese abholen gehen";
			    		document.getElementById("el8").innerText = "Bewertung ";
			    		if(document.getElementById("t1")!=null){
			    			document.getElementById("t1").innerText = "ausstehende bestellungen ...";	
			    		}
			    		
			    		if(document.getElementById("t2")!=null){
			    			document.getElementById("t2").innerText = "bestätigte Bestellungen";	
			    		}
			    		
			 	    	
			 	    	var res1 =document.getElementsByClassName("res1");
			 	    	var res2 =document.getElementsByClassName("res2");
			 	    	var res3=document.getElementsByClassName("res3");
			 	    	var res4 =document.getElementsByClassName("res4");
			 	    	var res5 =document.getElementsByClassName("res5");
			 	    	var res6 =document.getElementsByClassName("res6");
			 	    	var res7 =document.getElementsByClassName("res7");
			 	    	var res8 =document.getElementsByClassName("res8");
			 	    	var res9 =document.getElementsByClassName("res9");
			 	    	var res10 =document.getElementsByClassName("res10");
			 	    	var res11 =document.getElementsByClassName("res11");
			 	    	var res12=document.getElementsByClassName("res12");
			 	    	var res13=document.getElementsByClassName("res13");
			 	    	
			 	    	var conft =document.getElementsByClassName("textconfirm");
			 	    	var confb =document.getElementsByClassName("buttonconfirm");
			 	    	var confl =document.getElementsByClassName("labelconfir");
			 	    	var conft2=document.getElementsByClassName("textconfirm2");
			 	    	var conf=document.getElementsByClassName("confirm");
			 	    	var confop1=document.getElementsByClassName("confoption1");
			 	    	var confop2=document.getElementsByClassName("confoption2");
			 	    	
			 	    	
			 	    	
			 	    	for(let i=0;i< res1.length; i++){
			 	    		
			 	    		if(res1[i]!=null){
			 	    			res1[i].innerText= "veröffentlicht am :	";
				 	    		
			 	    		}
							if(res2[i]!=null){
								res2[i].innerText="Name:	";
				 	    		
			 	    		}
							if(res3[i]!=null){
								res3[i].innerText= "Preis:	";
				 	    			    			
							}
							if(res4[i]!=null){
								res4[i].innerText= "Stadt:	";
				 	    			
							}
							if(res5[i]!=null){
								res5[i].innerText= "Adresse:	";
				 	    			
							}
							if(res6[i]!=null){
								res6[i].innerText= "Beschreibung:	";
				 	    			
							}
							if(res7[i]!=null){
								res7[i].innerText= "Marke:	";	
							}
							if(res8[i]!=null){
								res8[i].innerText= "Menge im Lager:	";	
							}
							if(res9[i]!=null){
								res9[i].innerText= "haben Sie Ihre Bestellung beim Verkäufer abgeholt?	";	
							}
							if(res10[i]!=null){
								res10[i].innerText= "ja	";	
							}
							if(res11[i]!=null){
								res11[i].innerText= "nein";	
							}
							
							if(res12[i]!=null){
								res12[i].innerText= "holen Sie sich Ihre Bestellung bevor die Zeit abläuft...denken Sie daran das Gerät mitzunehmen, mit dem Sie auf der Plattform verbunden sind";	
							}
							if(res13[i]!=null){
								res13[i].innerText= "stornieren";	
							}
							if(conft[i]!=null){
								conft[i].innerText= "Bitte wählen Sie auf folgender List die Art der Bestätigung...Dafür müssen Sie sich beim Verkäufer befinden sonst wird ihre Position falsch erfasst, was dazu führt, dass Sie ein Kontolive verlieren";	
							}
							if(confb[i]!=null){
								confb[i].innerText= "senden";	
							}
							if(confl[i]!=null){
								confl[i].innerText= "Code hier";	
							}
							if(conft2[i]!=null){
								conft2[i].innerText= "Sie können auch die Abholung Ihrer Bestellung bestätigen bevor der Timer abgelaufen ist !";	
							}
							if(conf[i]!=null){
								conf[i].innerText= "bestätigen";	
							}
							
							if(confop1[i]!=null){
								confop1[i].innerText= "Mit dem Textcode des Verkäufer bestätigen !";	
							}
							if(confop2[i]!=null){
								confop2[i].innerText= "QRcode des Verkäufer scannen !";	
							}
			 	    	}
			 	    	
			 	    	
			 	    	var tes1 =document.getElementsByClassName("tes1");
			 	    	var tes2 =document.getElementsByClassName("tes2");
			 	    	var tes3=document.getElementsByClassName("tes3");
			 	    	var tes4 =document.getElementsByClassName("tes4");
			 	    	var tes5 =document.getElementsByClassName("tes5");
			 	    	var tes6 =document.getElementsByClassName("tes6");
			 	    	var tes7 =document.getElementsByClassName("tes7");
			 	    	var tes8 =document.getElementsByClassName("tes8");
			 	    	var tes9 =document.getElementsByClassName("tes9");
			 	    	
			 	    	
		
			 	    	for(let i=0;i< tes1.length; i++){
			 	    		
			 	    		if(tes1[i]!=null){
			 	    			tes1[i].innerText= "veröffentlicht am :	";
				 	    		
			 	    		}
							if(tes2[i]!=null){
								tes2[i].innerText="Name:	";
				 	    		
			 	    		}
							if(tes3[i]!=null){
								tes3[i].innerText= "Preis:	";
				 	    			    			
							}
							if(tes4[i]!=null){
								tes4[i].innerText= "Stadt:	";
				 	    			
							}
							if(tes5[i]!=null){
								tes5[i].innerText= "Adresse:	";
				 	    			
							}
							if(tes6[i]!=null){
								tes6[i].innerText= "Bitte deine Bewertung zu diesem Produkt";
				 	    			
							}
							if(tes7[i]!=null){
								tes7[i].innerText= "Kommentar !";	
							}
							if(tes8[i]!=null){
								tes8[i].innerText= "senden";	
							}
							if(tes9[i]!=null){
								tes9[i].innerText= "nein danke";	
							}
							
			 	    		
			 	    	}
			    	}
			    	
	    	
	    },500);
		   
		   
		   
	
	    </script>
  </body>
</html>