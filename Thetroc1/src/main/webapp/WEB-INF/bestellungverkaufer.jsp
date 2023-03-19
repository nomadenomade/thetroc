<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Online handeln</title>
    <!-- MDB icon -->
    <link rel="icon" href="img/logo3.png"   type="image/x-icon" />
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
    		margin-top:30px;
    	}
    
    	@media screen and (max-width: 992px){
    		.inhalt {
    			width:80% ;
    		}
    		
    		
    	}
    	
    	@media screen and (max-width: 600px){
    		.inhalt{
    			width:100%;
    		}
    	}
      
    
    </style>
  
  
  </head>

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
      <a class="navbar-brand mt-2 mt-lg-0" href="#">
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
        <li class="nav-item">
           <a class="nav-link text-reset me-3" href="<%= request.getContextPath()%>/RequestReSendSeller?name=kommentarverkaufer">
            <span class="lead text-white" style="font-weight:bold; font-size:0.8em;" id="el2">Kommentare</span> 
            <i class="fas fa-comments fa-lg"  style="color:white;font-size:0.8em;"></i>
            <span class="badge rounded-pill badge-notification bg-danger" id="comments"></span>
       </a>
        </li>
        
      </ul>
      <!-- Left links -->
    </div>
     

    <!-- Right elements -->
    <div class="d-flex align-items-center">
      <!-- Icon -->
         
     
      <!-- Bestellungen -->
       <a
        class="text-reset me-3 dropdown-toggle hidden-arrow"
        href="#"
        id="navbarDropdownMenuLink"
        role="button"
        data-mdb-toggle="dropdown"
        aria-expanded="false"
      >
      	<span class="lead text-white"style="font-weight:bold; font-size:0.8em;border-bottom:2px solid white;"id="el3">Bestellungen</span>
        <i class="fas fa-shopping-cart"  style="color:white;font-size:0.8em;"></i>
        <span class="badge rounded-pill badge-notification bg-danger" id="command"></span>
      </a>
      <ul
        class="dropdown-menu dropdown-menu-end"
        aria-labelledby="navbarDropdownMenuLink"
      >
        <li>
          <a class="dropdown-item" href="<%=request.getContextPath()%>/RequestReSendSeller?name=bestellungverkaufer" id="el4">aktuelle Bestellungen</a>
        </li>
        
       
      </ul>
      
      
      
      

      <!-- Notifications -->
      <a
        class="text-reset me-3 dropdown-toggle hidden-arrow"
        href="#"
        id="navbarDropdownMenuLink"
        role="button"
        data-mdb-toggle="dropdown"
        aria-expanded="false"
      >
      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em;" id="el5">Notifications</span>
        <i class="fas fa-bell"  style="color:white;font-size:0.8em;"></i>
        <span class="badge rounded-pill badge-notification bg-danger"></span>
      </a>
      <ul
        class="dropdown-menu dropdown-menu-end"
        aria-labelledby="navbarDropdownMenuLink"
      >
        <li>
          <a class="dropdown-item" href="#" id="el6">Nachricht von Thetroc</a>
        </li>
       
      </ul>

      <!-- Avatar -->
     
      <a
        class="dropdown-toggle d-flex align-items-center hidden-arrow"
        href="#"
        id="navbarDropdownMenuLink"
        role="button"
        data-mdb-toggle="dropdown"
        aria-expanded="false"
      > <span class="lead text-white"style="font-weight:bold; font-size:0.8em;" id="el7">Profil</span>
        <img
          src="https://mdbootstrap.com/img/new/avatars/2.jpg"
          class="rounded-circle"
          height="25"
          alt=""
          loading="lazy"
        />
      </a>
      <ul
        class="dropdown-menu dropdown-menu-end"
        aria-labelledby="navbarDropdownMenuLink"
      >
        <li>
          <a class="dropdown-item" href="#" id="el8">Mein infos</a>
        </li>
        <li>
          <a class="dropdown-item" href="<%=request.getContextPath() %>/RequestReSendSeller?name=Unternehmeninfo" id="el9">Unternehmen erstellen</a>
        </li>
        <li>
          <a class="dropdown-item" id="logout">Logout</a>
        </li>
      </ul>
    </div>
    <!-- Right elements -->
  </div>
  <!-- Container wrapper -->
</nav>
<!-- Navbar -->
<div class="card inhalt" >
		<div class="card-body" id="inhalt"></div>
</div>



</body>
<script type="text/javascript" src="js/mdb.min.js"></script>
<script type="text/javascript">
var lg = <%= request.getSession().getAttribute("language")%>;

if(<%=request.getSession().getAttribute("idverkaufer") %>==null){
	window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
}
setInterval(function(){
	if(<%=request.getSession().getAttribute("idverkaufer") %>==null){
	window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
}
},300000);
setInterval(function(){	 
	window.location.reload();	  
 },50000);

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
   
   
   var xml = initRequest();
   xml.onreadystatechange = function(){
		if(this.readyState==4 && this.status==200){
			document.getElementById("inhalt").innerHTML = this.responseText;
		}   
   };
   xml.open("GET","Bestellung_verwaltung_verkaufer?type=listeallebestellung",false);
   xml.send();
   
   //hilfefunktionen für Timer
    
    
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
	    	/* function zeitabgelaufen (idwarenkob){
    			 var XML = initRequest();
	    		 XML.onreadystatechange = function (){
	    			 if(this.readyState=4 && this.status==200){
	    			
	    			 }
	    		 };
	    		 XML.open("GET","Bestellung_verwaltung_kunde?type=zeitabgelaufen&idwarenkob="+idwarenkob,false);
	    		 XML.send();
    		 }
	    	*/
	    	 
	    //ende hilffunctionnen für timer	 
	    
	    // Timer fürs abholen des Produkt
	    
	     function zeitabgelaufen (idwarenkob){
    			 var XML = initRequest();
	    		 XML.onreadystatechange = function (){
	    			 if(this.readyState=4 && this.status==200){
	    			
	    			 }
	    		 };
	    		 XML.open("GET","Bestellung_verwaltung_kunde?type=zeitabgelaufen&idwarenkob="+idwarenkob,false);
	    		 XML.send();
    		 }
	    	
	    	 var tabdatum = document.getElementsByName("datum");
	    	 var tabdauerabholung = document.getElementsByName("abholung");
	    	 var tabfehlermeldung = document.getElementsByClassName("fehlermeldung");
	    	 var tabbutton = document.getElementsByClassName("storno");
	    	 var tabblockantwort = document.getElementsByClassName("blockantwort");
	    	 var tabidwarenkob = document.getElementsByClassName("idwarenkob");
	    	 
	    	
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
	    				 
	    				
	    				 //check ob die Frist überschrieten ist
	    				 let uhr = parseInt(t.split(",")[1].split(":")[0]);
	    				 let min = parseInt(t.split(",")[1].split(":")[1]);
	    				 let uhrinit = parseInt(tabdatum[index].value.split(",")[1].split(":")[0]);
	    				 let mininit = parseInt(tabdatum[index].value.split(",")[1].split(":")[1]);
	    				
	    				 if(parseInt(tabdate[0])==parseInt(parseInt(tabdauerabholung[index].value)/2) && parseInt(tabdate[0]) !=0 && parseInt(tabdauerabholung[index].value)!=2){
	    					 tabbutton[index].disabled=true;
	    					 document.getElementById(index).style.color="#FFA500";
	    				 }else if(parseInt(tabdate[0])==0){
	    					 
	    					 document.getElementById(index).style.color="red";
	    				 }
	
	    				 if(uhr==stunde2 && minute2>min){
	    					 document.getElementById(index).innerHTML="0:0:0"; 
	    					 document.getElementById(index).style.color="red";
	    					 tabblockantwort[index].style.visibility ="visible";
	    					if(parseInt(lg)==0){
	    						 tabfehlermeldung[index].innerHTML= "The deadline for collecting this product has long passed";
		    			    }else if(parseInt(lg)==1){
		    			    	tabfehlermeldung[index].innerHTML= "la durée de récupération de ce produit c est écoulée depuis longtemps";	
		    			    }else{
		    			    	tabfehlermeldung[index].innerHTML= "Die Frist fürs Abholen dieses Produkts ist längst abgeläufen";	
				    			
		    			    }
	    					 zeitabgelaufen(tabidwarenkob[index].value);
	    					 clearInterval(id);
	    				 }
	    				 
	    				 if(stunde2>uhr || stunde2< uhrinit){
	    					 tabblockantwort[index].style.visibility ="visible";
	    					 document.getElementById(index).innerHTML="0:0:0"; 
	    					 document.getElementById(index).style.color="red";    					
	    					if(parseInt(lg)==0){
	    						 tabfehlermeldung[index].innerHTML= "The deadline for collecting this product has long passed";
		    			    }else if(parseInt(lg)==1){
		    			    	tabfehlermeldung[index].innerHTML= "la durée de récupération de ce produit c est écoulée depuis longtemps";	
		    			    }else{
		    			    	tabfehlermeldung[index].innerHTML= "Die Frist fürs Abholen dieses Produkts ist längst abgeläufen";	
				    			
		    			    }
	    					 zeitabgelaufen(tabidwarenkob[index].value);
	    					 clearInterval(id);
	    				 }
	    				 let e = parseInt(tabdatum[index].value.split(",")[0].split("-")[0]);
	    				 //check ob wir in einem anderen Tag sind
	    				 if(e>tag2 || e<tag2){
	    					 tabblockantwort[index].style.visibility ="visible";
	    					 document.getElementById(index).innerHTML="0:0:0"; 
	    					 document.getElementById(index).style.color="red";
	    					
	    					if(parseInt(lg)==0){
	    						 tabfehlermeldung[index].innerHTML= "The deadline for collecting this product has long passed";
		    			    }else if(parseInt(lg)==1){
		    			    	tabfehlermeldung[index].innerHTML= "la durée de récupération de ce produit c est écoulée depuis longtemps";	
		    			    }else{
		    			    	tabfehlermeldung[index].innerHTML= "Die Frist fürs Abholen dieses Produkts ist längst abgeläufen";	
				    			
		    			    }
	    					 zeitabgelaufen(tabidwarenkob[index].value);	
	    					 clearInterval(id); 
	    				 }
	    				 
	    				 if(parseInt(tabdate[0])==0 && parseInt(tabdate[1])==0 && parseInt(tabdate[0])==0){
	    					 tabblockantwort[index].style.visibility ="visible";
	    					 document.getElementById(index).innerHTML="0:0:0";
	    					 document.getElementById(index).style.color="red";
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
	    					 zeitabgelaufen(tabidwarenkob[index].value);
	    					 clearInterval(id);
	    				 }
	    			 
	    			 },1000);
	    		 }
	    		 
	    		 
	    		
		    	
    		//Tmer end	 
    		//andere funktionen
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
    		
    		//bestellunganahme
    		function bestellungannahme(e){
   			var XML = initRequest();
   			XML.onreadystatechange = function (){
   				if(this.readyState==4 && this.status==200){
   					if(this.responseText == "true"){
	   					if(parseInt(lg)==0){
	   						alert("confirmed"); 
	    			    }else if(parseInt(lg)==1){
	    			    	alert("confirmé");
	    			    }else{
	    			    	alert("bestätigt");
			    			
	    			    }
	   						
   					}else{
   						alert("Error");
   					}
   					
   				}
   				
   			};
   			XML.open("GET","NeueBestellungLaden?type=bestellungconfirm&idwarenkob="+e,false);
   			XML.send();
   		}

    		
    		//confirm ob der Kunde sein Produkt abgeholt hat
    		
    		 function antwortja(idwarenkob){
	    		 var XML = initRequest();
	    		 XML.onreadystatechange = function (){
	    			 if(this.readyState=4 && this.status==200){
	    				 if(parseInt(lg)==0){
		   						alert("confirmed"); 
		    			    }else if(parseInt(lg)==1){
		    			    	alert("confirmé");
		    			    }else{
		    			    	alert("bestätigt");
				    			
		    			    }
	    			 }
	    		 };
	    		 XML.open("GET","Bestellung_verwaltung_verkaufer?type=antwortja&idwarenkob="+idwarenkob,false);
	    		 XML.send();
	    	 }
	    	 
	    	 function antwortnein(idwarenkob){
	    		 var XML = initRequest();
	    		 XML.onreadystatechange = function (){
	    			 if(this.readyState=4 && this.status==200){
	    				 if(parseInt(lg)==0){
		   						alert("confirmed"); 
		    			    }else if(parseInt(lg)==1){
		    			    	alert("confirmé");
		    			    }else{
		    			    	alert("bestätigt");
				    			
		    			    }
	    			 }
	    		 };
	    		 XML.open("GET","Bestellung_verwaltung_verkaufer?type=antwortnein&idwarenkob="+idwarenkob,false);
	    		 XML.send();
	    	 }
	    	 
	    	 let XL = initRequest();
	 			XL.onreadystatechange = function (){
	 				if(this.readyState==4 && this.status==200){
	 					
	 					document.getElementById("comments").innerHTML= this.responseText;
	 				}
	 				
	 			};
	 			XL.open("GET","Bestellung_verwaltung_verkaufer?type=commentsread",true);
	 			XL.send();
	    	 
	    	 setInterval(function(){
	 			let XmL = initRequest();
	 			XmL.onreadystatechange = function (){
	 				if(this.readyState==4 && this.status==200){
	 					
	 					if(parseInt(this.responseText)==0){
	 						document.getElementById("comments").innerHTML="";
	 					}else{
	 						document.getElementById("comments").innerHTML= this.responseText;
	 					}
	 					
	 				}
	 				
	 			};
	 			XmL.open("GET","Bestellung_verwaltung_verkaufer?type=commentsread",true);
	 			XmL.send();
	 		},5000);	
	    	 
	    	
	    		setInterval(function(){
	    			let XmL = initRequest();
	    			XmL.onreadystatechange = function (){
	    				if(parseInt(this.responseText)==0){
	    						document.getElementById("command").innerHTML="";
	    					}else{
	    						document.getElementById("command").innerHTML= this.responseText; 
	    					}
	    					
	    			};
	    			XmL.open("GET","Bestellung_verwaltung_verkaufer?type=isnewcommandread",true);
	    			XmL.send();
	    		},6000);	
	    		
	    		
	    		setInterval(function(){
	       			var XmL = initRequest();
	    			XmL.onreadystatechange = function (){
	    				if(this.readyState==4 && this.status==200){
	    					if(parseInt(this.responseText) == 1){
	    						alert("Sie haben nochnicht mindesten eine Frage über die Abholung ihrer verkauften Produkte im Bereich 'alle Bestellungen' beantworten,deshalb haben wir alle Ihre Waren offline gestellt.Beantworten Sie bitte diese immer spätesten 2 Stunden dem Verkauf.Nun können Sie ihre Waren wieder Online stellen sobald diese Aufgabe erledigt ist");
	    					}
	    					
	    				}
	    				
	    			};
	    			XmL.open("GET","Bestellung_verwaltung_verkaufer?type=checkaufconfirmabhohlung",false);
	    			XmL.send();
	       		
	       		},300000);
	       		
	    		
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
	    		
	    		//end
	    		
	    		
	    		//language
		
		
	   
	    
	    setInterval(function(){
	    	var lg = <%= request.getSession().getAttribute("language")%>
	    	
	    	if(parseInt(lg)==0){
	    		
	    		document.getElementById("el1").innerText = "dashboard";
	    		document.getElementById("el2").innerText = "comments";
	    		document.getElementById("el3").innerText = "orders";
	    		document.getElementById("el4").innerText = "current oders";
	    		document.getElementById("el5").innerText = "notifications";
	    		document.getElementById("el6").innerText = "messages from Thetroc";
	    		document.getElementById("el7").innerText = "profile";
	    		document.getElementById("el8").innerText = "my infos";
	    		document.getElementById("el9").innerText = "create company";
	    		document.getElementById("logout").innerText = "logout";
	    		
	    		
	    		
	    	
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
	 	    	var res12 =document.getElementsByClassName("res12");
	 	    	var res13 =document.getElementsByClassName("res13");
	 	    	var res14 =document.getElementsByClassName("res14");
	 	    
	 	    	
	 	    	
	 	    	for(let i=0;i< res1.length; i++){
	 	    		
	 	    		if(res1[i]!=null){
	 	    			res1[i].innerText= "oders waiting to be confirmed...";
		 	    		
	 	    		}
					if(res2[i]!=null){
						res2[i].innerText="information on the customer";
		 	    		
	 	    		}
					if(res3[i]!=null){
						res3[i].innerText= "pseudo :	";
		 	    			    			
					}
					if(res4[i]!=null){
						res4[i].innerText= "published on ";
		 	    			
					}
					if(res5[i]!=null){
						res5[i].innerText= "name :	";
		 	    			
					}
					if(res6[i]!=null){
						res6[i].innerText= "price :	";
		 	    			
					}
					if(res7[i]!=null){
						res7[i].innerText= "town :	";	
					}
					if(res8[i]!=null){
						res8[i].innerText= "exact location : ";	
					}
					if(res9[i]!=null){
						res9[i].innerText= "description : ";	
					}
					if(res10[i]!=null){
						res10[i].innerText= "brand : ";	
					}
					if(res11[i]!=null){
						res11[i].innerText= "quantity on stock: ";	
					}
					if(res12[i]!=null){
						res12[i].innerText= "accept";	
					}
					if(res13[i]!=null){
						res13[i].innerText= "reject";	
					}
					if(res14[i]!=null){
						res14[i].innerText= "No images found! ";	
					}
					
	 	    		
	 	    	}
	 	    	
	 	    	//für bereich produkt laden
	 	    	
	 	  
	 	   	var t1 =document.getElementsByClassName("t1");
	 		var t2 =document.getElementsByClassName("t2");
	 		var t3 =document.getElementsByClassName("t3");
	 		var t4 =document.getElementsByClassName("t4");
	 		var t5 =document.getElementsByClassName("t5");
	 		var t6 =document.getElementsByClassName("t6");
	 		var t7 =document.getElementsByClassName("t7");
	 		var t8 =document.getElementsByClassName("t8");
	 		var t9 =document.getElementsByClassName("t9");
	 		var t10 =document.getElementsByClassName("t10");
	 		var t11 =document.getElementsByClassName("t11");
	 		var t12 =document.getElementsByClassName("t12");
	 		var t13 =document.getElementsByClassName("t13");
	 		var t14 =document.getElementsByClassName("t14");
	 		var t15 =document.getElementsByClassName("t15");
	 		
	 		
	 		for(let i=0;i< t1.length; i++){
 	    		
	 			if(t1[i]!=null){
 	    			t1[i].innerText= "waiting to be picked up ...";
	 	    		
 	    		}
				if(t2[i]!=null){
					t2[i].innerText="information on the customer";
	 	    		
 	    		}
				if(t3[i]!=null){
					t3[i].innerText= "pseudo :	";
	 	    			    			
				}
				if(t4[i]!=null){
					t4[i].innerText= "published on ";
	 	    			
				}
				if(t5[i]!=null){
					t5[i].innerText= "name :	";
	 	    			
				}
				if(t6[i]!=null){
					t6[i].innerText= "price :	";
	 	    			
				}
				if(t7[i]!=null){
					t7[i].innerText= "town :	";	
				}
				if(t8[i]!=null){
					t8[i].innerText= "exact location : ";	
				}
				if(t9[i]!=null){
					t9[i].innerText= "description : ";	
				}
				if(t10[i]!=null){
					t10[i].innerText= "brand : ";	
				}
				if(t11[i]!=null){
					t11[i].innerText= "quantity on stock: ";	
				}
				if(t12[i]!=null){
					t12[i].innerText= "Did this customer pick up its product? ";	
				}
				if(t13[i]!=null){
					t13[i].innerText= "yes";	
				}
				if(t14[i]!=null){
					t14[i].innerText= "no";	
				}
				if(t15[i]!=null){
					t15[i].innerText= "No images found";	
				}
				
 	    		
 	    	}
	 		
	 		
	 	    	
	    	}else if(parseInt(lg)==1){
	    		document.getElementById("el1").innerText = "bureau";
	    		document.getElementById("el2").innerText = "commentaires";
	    		document.getElementById("el3").innerText = "commandes";
	    		document.getElementById("el4").innerText = "commandes actuelles";
	    		document.getElementById("el5").innerText = "notifications";
	    		document.getElementById("el6").innerText = "messages de Thetroc";
	    		document.getElementById("el7").innerText = "profile";
	    		document.getElementById("el8").innerText = "mes infos";
	    		document.getElementById("el9").innerText = "créer votre entreprise,restaurant...etc";
	    		
	    		
	    		
	    	
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
	 	    	var res12 =document.getElementsByClassName("res12");
	 	    	var res13 =document.getElementsByClassName("res13");
	 	    	var res14 =document.getElementsByClassName("res14");
	 	    
	 	    	
	 	    	
	 	    	for(let i=0;i< res1.length; i++){
	 	    		
	 	    		if(res1[i]!=null){
	 	    			res1[i].innerText= "commande en attente de confirmation...";
		 	    		
	 	    		}
					if(res2[i]!=null){
						res2[i].innerText="informations sur le client";
		 	    		
	 	    		}
					if(res3[i]!=null){
						res3[i].innerText= "pseudo :	";
		 	    			    			
					}
					if(res4[i]!=null){
						res4[i].innerText= "mise en ligne le ";
		 	    			
					}
					if(res5[i]!=null){
						res5[i].innerText= "nom :	";
		 	    			
					}
					if(res6[i]!=null){
						res6[i].innerText= "prix :	";
		 	    			
					}
					if(res7[i]!=null){
						res7[i].innerText= "ville :	";	
					}
					if(res8[i]!=null){
						res8[i].innerText= "lieu de vente : ";	
					}
					if(res9[i]!=null){
						res9[i].innerText= "description : ";	
					}
					if(res10[i]!=null){
						res10[i].innerText= "marque : ";	
					}
					if(res11[i]!=null){
						res11[i].innerText= "quantité en stock: ";	
					}
					if(res12[i]!=null){
						res12[i].innerText= "accepter";	
					}
					if(res13[i]!=null){
						res13[i].innerText= "réfuser";	
					}
					if(res14[i]!=null){
						res14[i].innerText= "aucune image trouvée! ";	
					}
					
	 	    		
	 	    	}
	 	    	
	 	    	//für bereich produkt laden
	 	    	
	 	    
	 	   	var t1 =document.getElementsByClassName("t1");
	 		var t2 =document.getElementsByClassName("t2");
	 		var t3 =document.getElementsByClassName("t3");
	 		var t4 =document.getElementsByClassName("t4");
	 		var t5 =document.getElementsByClassName("t5");
	 		var t6 =document.getElementsByClassName("t6");
	 		var t7 =document.getElementsByClassName("t7");
	 		var t8 =document.getElementsByClassName("t8");
	 		var t9 =document.getElementsByClassName("t9");
	 		var t10 =document.getElementsByClassName("t10");
	 		var t11 =document.getElementsByClassName("t11");
	 		var t12 =document.getElementsByClassName("t12");
	 		var t13 =document.getElementsByClassName("t13");
	 		var t14 =document.getElementsByClassName("t14");
	 		var t15 =document.getElementsByClassName("t15");
	 		
	 		
	 		for(let i=0;i< t1.length; i++){
 	    		
	 			if(t1[i]!=null){
 	    			t1[i].innerText= "commandes en attente de récupération!";
	 	    		
 	    		}
				if(t2[i]!=null){
					t2[i].innerText="informations sur le client";
	 	    		
 	    		}
				if(t3[i]!=null){
					t3[i].innerText= "pseudo :	";
	 	    			    			
				}
				if(t4[i]!=null){
					t4[i].innerText= "mis en ligne le ";
	 	    			
				}
				if(t5[i]!=null){
					t5[i].innerText= "nom :	";
	 	    			
				}
				if(t6[i]!=null){
					t6[i].innerText= "prix :	";
	 	    			
				}
				if(t7[i]!=null){
					t7[i].innerText= "ville :	";	
				}
				if(t8[i]!=null){
					t8[i].innerText= "lieu de vente : ";	
				}
				if(t9[i]!=null){
					t9[i].innerText= "description : ";	
				}
				if(t10[i]!=null){
					t10[i].innerText= "marque : ";	
				}
				if(t11[i]!=null){
					t11[i].innerText= "quantité en Stock: ";	
				}
				if(t12[i]!=null){
					t12[i].innerText= "ce client a-t il récupéré son produit? ";	
				}
				if(t13[i]!=null){
					t13[i].innerText= "oui";	
				}
				if(t14[i]!=null){
					t14[i].innerText= "non";	
				}
				if(t15[i]!=null){
					t15[i].innerText= "aucune image trouvée";	
				}
				
 	    		
 	    	}
	 		
	 		
	    		
	    	}else if(parseInt(lg)==2){
	    		document.getElementById("el1").innerText = "Dashboard";
	    		document.getElementById("el2").innerText = "Kommentare";
	    		document.getElementById("el3").innerText = "Bestellungen";
	    		document.getElementById("el4").innerText = "aktuelle Bestellungen";
	    		document.getElementById("el5").innerText = "Benachrchtigung";
	    		document.getElementById("el6").innerText = "Nachrichten von Thetroc";
	    		document.getElementById("el7").innerText = "Profil";
	    		document.getElementById("el8").innerText = "meine Infos";
	    		document.getElementById("el9").innerText = "Unternehmen erstellen";
	    		document.getElementById("logout").innerText = "abmelden";
	    		
	    		
	    		
	    	
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
	 	    	var res12 =document.getElementsByClassName("res12");
	 	    	var res13 =document.getElementsByClassName("res13");
	 	    	var res14 =document.getElementsByClassName("res14");
	 	    
	 	    	
	 	    	
	 	    	for(let i=0;i< res1.length; i++){
	 	    		
	 	    		if(res1[i]!=null){
	 	    			res1[i].innerText= "ausstehende Bestellungen...";
		 	    		
	 	    		}
					if(res2[i]!=null){
						res2[i].innerText="informationen über den Kunden";
		 	    		
	 	    		}
					if(res3[i]!=null){
						res3[i].innerText= "pseudo :	";
		 	    			    			
					}
					if(res4[i]!=null){
						res4[i].innerText= "veröffentlicht am ";
		 	    			
					}
					if(res5[i]!=null){
						res5[i].innerText= "Name :	";
		 	    			
					}
					if(res6[i]!=null){
						res6[i].innerText= "Preis :	";
		 	    			
					}
					if(res7[i]!=null){
						res7[i].innerText= "Stadt :	";	
					}
					if(res8[i]!=null){
						res8[i].innerText= "Standort : ";	
					}
					if(res9[i]!=null){
						res9[i].innerText= "Beschreibung : ";	
					}
					if(res10[i]!=null){
						res10[i].innerText= "Marke : ";	
					}
					if(res11[i]!=null){
						res11[i].innerText= "Menge im Lager: ";	
					}
					if(res12[i]!=null){
						res12[i].innerText= "annehmen";	
					}
					if(res13[i]!=null){
						res13[i].innerText= "ablehnen";	
					}
					if(res14[i]!=null){
						res14[i].innerText= "kein Bild gefunden! ";	
					}
					
	 	    		
	 	    	}
	 	    	
	 	    	//für bereich produkt laden
	 	    	
	 	   
	 	   	var t1 =document.getElementsByClassName("t1");
	 		var t2 =document.getElementsByClassName("t2");
	 		var t3 =document.getElementsByClassName("t3");
	 		var t4 =document.getElementsByClassName("t4");
	 		var t5 =document.getElementsByClassName("t5");
	 		var t6 =document.getElementsByClassName("t6");
	 		var t7 =document.getElementsByClassName("t7");
	 		var t8 =document.getElementsByClassName("t8");
	 		var t9 =document.getElementsByClassName("t9");
	 		var t10 =document.getElementsByClassName("t10");
	 		var t11 =document.getElementsByClassName("t11");
	 		var t12 =document.getElementsByClassName("t12");
	 		var t13 =document.getElementsByClassName("t13");
	 		var t14 =document.getElementsByClassName("t14");
	 		var t15 =document.getElementsByClassName("t15");
	 		
	 		
	 		for(let i=0;i< t1.length; i++){
 	    		
	 			if(t1[i]!=null){
 	    			t1[i].innerText= "Bestellungen wartend zur Abholung ...";
	 	    		
 	    		}
				if(t2[i]!=null){
					t2[i].innerText="Informationen über den Kunden";
	 	    		
 	    		}
				if(t3[i]!=null){
					t3[i].innerText= "pseudo :	";
	 	    			    			
				}
				if(t4[i]!=null){
					t4[i].innerText= "veröffentlicht am ";
	 	    			
				}
				if(t5[i]!=null){
					t5[i].innerText= "Name :	";
	 	    			
				}
				if(t6[i]!=null){
					t6[i].innerText= "Preis :	";
	 	    			
				}
				if(t7[i]!=null){
					t7[i].innerText= "Stadt :	";	
				}
				if(t8[i]!=null){
					t8[i].innerText= "Standort : ";	
				}
				if(t9[i]!=null){
					t9[i].innerText= "Beschreibung : ";	
				}
				if(t10[i]!=null){
					t10[i].innerText= "Marke : ";	
				}
				if(t11[i]!=null){
					t11[i].innerText= "Menge im Lager: ";	
				}
				if(t12[i]!=null){
					t12[i].innerText= "hat dieser kunde sein Produkt abgeholt? ";	
				}
				if(t13[i]!=null){
					t13[i].innerText= "ja";	
				}
				if(t14[i]!=null){
					t14[i].innerText= "nein";	
				}
				if(t15[i]!=null){
					t15[i].innerText= "Keine Bilder gefunden";	
				}
				
 	    		
 	    	}
	 		
	 		
	    	}
	    	
	    	
	    },500);
		
		
		//language end
			
	    	 
</script>
</html>