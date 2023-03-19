<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    	
    	.inhalt{
    		width:calc(80% - 10px);
    		margin:auto;
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
        <li class="nav-item">
           <a class="nav-link text-reset me-3" href="<%=request.getContextPath()%>RequestReSendSeller?name=kommentarverkaufer">
            <span class="lead text-white" style="font-weight:bold; font-size:0.8em;border-bottom:2px solid white;" id="el2">Kommentare</span> 
            <i class="fas fa-comments fa-lg"  style="color:white;font-size:0.8em;"></i>
            <span class="badge rounded-pill badge-notification bg-danger" id="comments"></span>
       </a>
        </li>
        
      </ul>
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
          <li >
            <a class="dropdown-item" href="#" id ="englishlg"
              ><i class="flag-united-kingdom flag"></i>English
              </a>
          </li>
          <li><hr class="dropdown-divider" /></li>
         
          <li >
            <a class="dropdown-item" href="#" id="germanlg"><i class="flag-germany flag"></i>German</a>
          </li>
          <li >
            <a class="dropdown-item" href="#" id="frenchlg"><i class="flag-france flag"></i>French</a>
          </li>
         
        </ul>
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
      	<span class="lead text-white"style="font-weight:bold; font-size:0.8em;" id="el3">Bestellungen</span>
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
          <a class="dropdown-item" href="#" id="el6">Nachricht von thetroc</a>
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
          <a class="dropdown-item"  id="logout">Logout</a>
        </li>
      </ul>
    </div>
    <!-- Right elements -->
  </div>
  <!-- Container wrapper -->
</nav>
<!-- Navbar -->
<!-- content -->

<div class="card mt-5 inhalt" >
	<div class="card-body" id="inhalt"></div>
</div>


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
   
   
   var XML = initRequest();
   XML.onreadystatechange= function(){
	 	if(this.readyState==4 && this.status==200){
	 		document.getElementById("inhalt").innerHTML= this.responseText;
	 	}  
   };
   XML.open("GET","Bestellung_verwaltung_verkaufer?type=kommentarverkaufer",true);
   XML.send();
   
   setInterval(function(){
	   var XML = initRequest();
	   XML.onreadystatechange= function(){
		 	if(this.readyState==4 && this.status==200){
		 		document.getElementById("inhalt").innerHTML= this.responseText;
		 	}  
	   };
	   XML.open("GET","Bestellung_verwaltung_verkaufer?type=kommentarverkaufer",true);
	   XML.send();  
   },240000);
   		
   let xL = initRequest();
	xL.onreadystatechange = function (){
		if(this.readyState==4 && this.status==200){
			
		}
		
	};
	xL.open("GET","Bestellung_verwaltung_verkaufer?type=commentsalreadyread",true);                 
	xL.send();
	
	setInterval(function(){
		let XmL = initRequest();
		XmL.onreadystatechange = function (){
			if(parseInt(this.responseText)==0){
					document.getElementById("comments").innerHTML="";
				}else{
					document.getElementById("comments").innerHTML= this.responseText;
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
   		
	
	//language
	
	var check =  <%= request.getSession().getAttribute("languagechoosen")%>
	var numm = <%= request.getSession().getAttribute("numm")%>
	if(check==null && numm==null){
			let XmL = initRequest();
			XmL.onreadystatechange = function (){
				if(this.readyState==4 && this.status==200){
					window.location.reload();
				}
			};
			XmL.open("GET","Language?type=default",false);
			XmL.send();
		}
		
   document.getElementById("englishlg").addEventListener("click",function(event){
   	alert("ok");
   	event.preventDefault();
   	let XmL = initRequest();
		XmL.onreadystatechange = function (){
			if(this.readyState==4 && this.status==200){
				window.location.reload();
			}
		};
		XmL.open("GET","Language?type=english",false);
		XmL.send();
   	
   });
   
   document.getElementById("frenchlg").addEventListener("click",function(event){
   	alert("ok");
   	event.preventDefault();
   	let XmL = initRequest();
		XmL.onreadystatechange = function (){
			if(this.readyState==4 && this.status==200){
				window.location.reload();
			}
		};
		XmL.open("GET","Language?type=french",false);
		XmL.send();
   });
   
   document.getElementById("germanlg").addEventListener("click",function(event){
   	alert("ok");
   	event.preventDefault();
   	let XmL = initRequest();
		XmL.onreadystatechange = function (){
			if(this.readyState==4 && this.status==200){
				window.location.reload();
			}
		};
		XmL.open("GET","Language?type=german",false);
		XmL.send();
   });
   
  
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
	    	
	    	
	    	for(let i=0;i< res1.length; i++){
	    		
	    		if(res1[i]!=null){
	    			res1[i].innerText= "name:";
	 	    		
	    		}
				if(res2[i]!=null){
					res2[i].innerText="price:	";
	 	    		
	    		}
				if(res3[i]!=null){
					res3[i].innerText= "description:	";
	 	    			    			
				}
				if(res4[i]!=null){
					res4[i].innerText= "brand:	";
	 	    			
				}
				if(res5[i]!=null){
					res5[i].innerText= "No picture existing	";
	 	    			
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
   		document.getElementById("logout").innerText = "se déconnecter";
   		
   		
   	
   		
   	
	    	var res1 =document.getElementsByClassName("res1");
	    	var res2 =document.getElementsByClassName("res2");
	    	var res3=document.getElementsByClassName("res3");
	    	var res4 =document.getElementsByClassName("res4");
	    	var res5 =document.getElementsByClassName("res5");
	    	
	    	
	    	for(let i=0;i< res1.length; i++){
	    		
	    		if(res1[i]!=null){
	    			res1[i].innerText= "nom:";
	 	    		
	    		}
				if(res2[i]!=null){
					res2[i].innerText="prix:	";
	 	    		
	    		}
				if(res3[i]!=null){
					res3[i].innerText= "description:	";
	 	    			    			
				}
				if(res4[i]!=null){
					res4[i].innerText= ",marque:	";
	 	    			
				}
				if(res5[i]!=null){
					res5[i].innerText= "aucune image trouvée";
	 	    			
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
	    	
	    	
	    	for(let i=0;i< res1.length; i++){
	    		
	    		if(res1[i]!=null){
	    			res1[i].innerText= "Name:";
	 	    		
	    		}
				if(res2[i]!=null){
					res2[i].innerText="Preis:	";
	 	    		
	    		}
				if(res3[i]!=null){
					res3[i].innerText= "Beschreibung:	";
	 	    			    			
				}
				if(res4[i]!=null){
					res4[i].innerText= ",Marke:	";
	 	    			
				}
				if(res5[i]!=null){
					res5[i].innerText= "Kein Bild gefunden";
	 	    			
				}
				
	    		
	    	}
	    	
   	}
   	
   	

	
	
	//language end
   </script>
</body>

</html>