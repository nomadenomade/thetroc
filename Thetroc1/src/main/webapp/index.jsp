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
    	
    	.title{
    		font-weight:bold;
    		font-size:2em;
    	}
    	#searchsektor{
    			width: 60%;
    		
    	}
    
    	@media screen and (max-width: 992px){
    		.title {
    			font-size:1.0em;
    		}
    		#searchsektor{
    			width: 80%;
    		
    		}
    		#kategorie,#el200,#umkreis,#el19,#suche,#el17,#online,#el20,#stadt,#el21,#stadtviertel,#el22,#unternehmensname,#el22{
    			font-size:0.9em;
    		}
    	}
    	
    	@media screen and (max-width: 600px){
    		.title {
    			font-size:0.9em;
    		}
    		
    		#searchsektor{
    			width: 90%;
    		
    		}
    		#kategorie,#el200,#umkreis,#el19,#suche,#el17,#online,#el20,#stadt,#el21,#stadtviertel,#el22,#unternehmensname,#el22{
    			font-size:0.9em;
    		}
    	}
    	
    
    
    </style>
  
  
  </head>
  <body style="background-image: url('<%= request.getContextPath()%>/background1.jpg');background-size:cover;background-repeat:no-repeat;background-attachment:fixed;">
	    <!-- Start your project here-->
	
			<!-- Navbar2 -->
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
		        <li class="nav-item" id="bestellungbutton" style="visibility:hidden;">
		          <a class="nav-link text-reset me-3" href="<%=request.getContextPath()%>/RequestReSend?name=liste_de_commande_client">
		         <span class="lead text-white" style="font-weight:bold; font-size:0.8em;" id="el1">Meine Bestellungen<i class="fas fa-shopping-cart"></i></span>
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
		         
		     
			      
			      <!-- Regsitrierung -->
			      <span  class="navbar-item me-1 ">
				       <a  class="text-reset nav-link me-1 " href="<%=request.getContextPath()%>/registrierung.jsp">
				      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em;" id="el2">Registrierung</span>
				      </a>
			       </span>  
			
			      <!-- Anmeldung -->
			      <span  class="navbar-item me-1 ">
				      <a  class="nav-link text-reset me-1" href="<%=request.getContextPath()%>/anmeldung.jsp" >
				      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em;"id="el3">Anmeldung<i class="fas fa-circle-user"></i></span>
				      </a>
			      </span>
			      
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
				          <a class="dropdown-item" href="<%=request.getContextPath() %>/RequestReSend?name=myinfo_client" id="el100">Mein infos</a>
				        </li>
				       
				        <li>
				          <a class="dropdown-item" href="#" id="logout">Logout</a>
				        </li>
				      </ul>
			      
			      </span>
			       
			
		    </div>
		    <!-- Right elements -->
		  </div>
		  <!-- Container wrapper -->
		  </nav>
			<!-- Navbar2 end -->
			
			<!-- Inhalt -->
			<div class="card mt-3" id="blockname" style="visibility:hidden; width:35%; margin:auto;">
				<div class="card-body">
					<div class="lead" style="font-size:0.8em; font-weight:bold;padding:2px; text-align:center;"><span id="el5">Willkommen</span> <span class="text-success " id="Pseudo">${pseudo}</span></div>
				</div>
			</div>
			
			<!-- blockinfo -->
			<div id="blockinfo">
				
			</div>
			<!--  -->
			
			
			
			<div style="width:50%;margin:auto;">
			<h1 class="text-center text-white mt-4 mb-4 lead title" id="el6">Geben Sie ein, was sie Kaufen wollen oder wählen Sie eine Kategorie aus</h1>
			</div>
			
			<div class="card" style=" margin:auto;" id="searchsektor" >
				<div class="card-body">
					<div class="row mt-1">
						<div class="col-sm-4">
							<div class="form-group" style="margin:auto;">
											<label for="kategorie" id="el200">Kategorie</label>
											<select class="form-control" id="kategorie" onchange="fieldcontent(this)" name="kategorie" >
												<option>--</option>
												<option>Restaurant</option>
												<option id="el7">Supermarkt</option>
												<option id="el8">Imbiss</option>
												<option id="el9">Kiosk</option>
												<option id="el10">Shop mode</option>
												<option id="el11">allgemeine shop</option>
												<option id="el12">Drogerie markt</option>
												<option id="el13">Elekronik</option>
												<option id="el14">Getraenke</option>
												<option id="el15">Baeckerei</option>
												<option id="el206">Apotheken</option>
												<option id="el16">Sonstiges</option>
											</select>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="form-outline mt-4" >
								<input type="search" name="suche" onchange ="fieldcontent2(this)" class="form-control" id="suche"/>
								<label for="suche" class="form-label" id="el17">Suche</label>
								
							</div>
							
							
						</div>
				</div>
				</div>
			</div>
			
			<div id="filter" class="card mt-2" style="width:90%; margin:auto; visibility:hidden;">
				<div class="card-body">
					<h3 class="text-center lead" style="color:#48D1CC;"id="el18">Filter</h3>
					<div class="row">
						<div class="col-sm">
							<div class="form-group" style="margin:auto;">
											<label for="umkreis" id="el19">Umkreis</label>
											<select class="form-control" id="umkreis" onchange="fieldcontent(this)" name="kategorie" >
												<option>0-2 km</option>
												<option>2-5 km</option>
												<option>5-10 km</option>
												<option>10-30 km</option>
												<option>30-90 km</option>
												<option>90-120 km</option>
												<option>120-200 km</option>
												<option id="el201">unbegrenzt</option>
												
											</select>
							</div>
						</div>
						<div class="col-sm">
							<div class="form-group" style="margin:auto;">
											<label for="online" id="el20">Online seit</label>
											<select class="form-control" id="online" onchange="fieldcontent(this)" name="kategorie" >
												<option id="el202">unbegrenzt</option>
												<option id="el203">heute</option>
												<option id="el204">2 Tagen</option>
													
											</select>
							</div>
						</div>
						<div class="col-sm">
							<div class="form-outline mt-4" id="block1">
									<input type="text" name="stadt" id="stadt" class="form-control" >
									<label for="stadt" class="form-label" id="el21">Stadt</label>
							</div>	
						</div>
						<div class="col-sm">
							<div class="form-outline mt-4" id="block2">
									<input type="text" name="stadtviertel" id="stadtviertel" class="form-control" >
									<label for="stadtviertel" class="form-label" id="el22">Stadtviertel</label>
							</div>	
						</div>
						<div class="col-sm">
							<div class="form-outline mt-4" id="block1">
									<input type="text" name="Unternehmensname" id="unternehmensname" class="form-control" >
									<label for="unternehmensname" class="form-label" id="el23">Unternehmensname</label>
							</div>	
						</div>
					</div>
					
					<div class="row">
						 <button class="mt-2" id="submit" style="width:200px; border:1px solid #48D1CC;border-radius:200px; padding:5px; font-size:0.9em;background-color:#48D1CC;color: white; margin:auto;">suchen</button>
					</div>
							
				</div>
			</div>
			
			
			<!-- searchresult -->
			<div id="searchblock" class=" card mt-5" style="visibility:hidden;max-height:650px;overflow-y:scroll;width:95%;margin:auto;background-color:#F5F5F5;">
				<h1 class="text-center mt-4 lead" style="font-weight:bold;color:#48D1CC; font-size:1.2em;"id="el25"> Ergebnisse</h1>
				<div class="card-body" id="searchresult">
					
				</div>
			</div>	
			<!--searchresult end -->
			
	
	<!-- inhalt ende-->
	
	
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
	    var browserid ="";
	    var warnungzahl=0;
	    var check=0;
	    var idkaufer = <%=request.getSession().getAttribute("idkaufer")%>;
	    
	    //Sessionhandling
	   
	    setInterval(function(){
	    	if(idkaufer === null){		
	    		 document.getElementById("bestellungbutton").style.visibility="hidden";
	    		 document.getElementById("profil").style.visibility="hidden";
	    		 document.getElementById("blockname").style.visibility="hidden";
	    		// document.getElementById("blocklive").style.visibility="visible";
	    		 document.getElementById("notif").style.visibility="hidden";
	    		 document.getElementById("blockinfo").innerHTML="";
	    		 document.getElementById("blockname").style.visibility="hidden";
								 
	    	}
	    },4000);
	    //session end                  
	    	
	  
	    
	    	 var idInterval =0;
	    	 var userid='<%=request.getSession().getAttribute("isuser")%>';
	    	 var warnunganzahl = '<%=request.getSession().getAttribute("warnunganzahl")%>';
	    	 var wz = parseInt(warnunganzahl);
	    	 
	    	
	    	 
	    	 if(idkaufer !== null){
	    		 document.getElementById("bestellungbutton").style.visibility="visible";
	    		 document.getElementById("profil").style.visibility="visible";
	    		 document.getElementById("blockname").style.visibility="visible";
	    		// document.getElementById("blocklive").style.visibility="visible";
	    		 document.getElementById("notif").style.visibility="visible";
	    		 
	    		
	    		 
	    		 idInterval = setInterval(function(){ 
	    			 let XML = initRequest();
	    			 XML.onreadystatechange = function(){
	    				 if(this.readyState==4 && this.status==200){
	    					
	    					 document.getElementById("notification").innerHTML=this.responseText;
	    					 let zahl= <%= request.getSession().getAttribute("notif-zahl")%>;
	    	    			 if(parseInt(zahl)!=0){
	    	    				 document.getElementById('notif-zahl').innerHTML = zahl;
	    	    			 }else{
	    	    				 document.getElementById('notif-zahl').innerHTML = ""; 
	    	    			 }
	    	    			
	    				 }
	    			 };
	    			 XML.open("GET","Bestellung_verwaltung_kunde?type=notification",true);
		    		 XML.send();
	    			 
	    		 },20000);
	    		 
	    		 // für die Warnunganzahl des Kaufer 
	    		 setInterval(function(){ 
	    			 let XML = initRequest();
	    			 XML.onreadystatechange = function(){
	    				 if(this.readyState==4 && this.status==200){
	    					 warnungzahl = parseInt(this.responseText);
	    					//alert(warnungzahl);
	    					
	    	    			
	    				 }
	    			 };
	    			 XML.open("GET","Bestellung_verwaltung_kunde?type=warning",false);
		    		 XML.send();
	    			 
	    		 },5000);
	    		 
	    		 //für den Nachweis der Produktabholung
	    		 
	    		 var opaciti = 1;
	    			 setInterval(function(){
	 	 	    		
	 	 	    		if(opaciti>=0){
	 	 	    			if(document.getElementById("prove")!=null){
	 	 	    				document.getElementById("prove").style.opacity= opaciti;
	 	 	    			}
	 	 	    			
	 	 	    			opaciti = opaciti-0.1;
	 	 	    		}else{
	 	 	    			opaciti =1;
	 	 	    		}
	 	 	    		
	 	 	    		
	 	 	    	},200);
	    		 
	 	    	

	    	 
	 	    	//auto Prüfung ob der Kaufer über den selben Browser surft
	 	    	
	 	    	
	 	    	//inhalt von blockinfo
	 	    	var text="Klicken Sie auf PR, wenn Sie dauerhaft und automatisch nachweisen wollen, dass Sie Ihr Produkt abgeholt haben. Diese Funktion ist wichtig, wenn der Verkäufer vorgibt, dass Sie sein Produkt nicht abgeholt haben,obwohl es der Fall war. Mit diesem Beweis vermeiden Sie den Verlust  eines Kontolives";
	 	    	
	 	    	var text2="Kontolives";
	 	    	 	
	 	    	var inhaltblockinfo = "<div class='row mt-3'>";
		 	    	inhaltblockinfo+="<div class='col-sm-4' id ='proveblock'>";
		 	    	inhaltblockinfo+="	<div class='row'>";
		 	    	inhaltblockinfo+="	 <div class='col-4'>";
		 	    	inhaltblockinfo+="			<div  style='width:50%;height:50%;margin:auto;'><span id='prove' class='btn btn-success' style='border-radius:50% 50% 50% 50%;padding:30px;'>pr</span></div>";
		 	    	inhaltblockinfo+="			</div>";
		 	    	inhaltblockinfo+="	<div class='col-8'>";
		 	    	inhaltblockinfo+="				<div class='card  mt-1'>";
		 	    	inhaltblockinfo+="					<div class='card-body'>";
		 	    	inhaltblockinfo+="						 <div class='lead text-center' style='font-size:0.8em;padding:2px;' id='title2'>"+text+"</div>";			
		 	    	inhaltblockinfo+="						</div>";
		 	    	inhaltblockinfo+="					</div>";
		 	    	inhaltblockinfo+="			   </div>";
		 	    	inhaltblockinfo+="			</div>";
		 	    	inhaltblockinfo+="		</div>";
		 	    	inhaltblockinfo+="		<div class='col-sm-8'>";
		 	    	inhaltblockinfo+="			<div class='card mt-1 mr-1' id='blocklive' style=' width:100%; margin:auto; margin-right:7px;'>";
		 	    	inhaltblockinfo+="				<div class='card-body'>";
		 	    	inhaltblockinfo+="					<div class='lead text-center ' style='font-size:0.7em;'id='title1'></div>";
		 	    	inhaltblockinfo+="					<div class='mb-1' style='width:50%;margin:auto;'>";
		 	    	inhaltblockinfo+="						<div id='kontolive' style='width:50%;margin:auto;'>";
		 	    	
		 	    	inhaltblockinfo+="						</div>";
		 	    	inhaltblockinfo+="					</div>";
		 	    						
		 	    	inhaltblockinfo+="					<div id='warnungtext'></div>";
		 	    	inhaltblockinfo+="				</div>";
		 	    	inhaltblockinfo+="			</div>";
		 	    	inhaltblockinfo+="		</div>";	
		 	    	inhaltblockinfo+="	</div>";
			
		
		
				var inhaltblockinfo2 = "<div class='card mt-1' id='blocklive' style=' width:50%; margin:auto;'>";
					inhaltblockinfo2+="<div class='card-body'>";
					inhaltblockinfo2+="		<div class='lead text-center ' style='font-size:0.7em;' id='title1'></div>";
					inhaltblockinfo2+="		<div class='mb-1' style='width:50%;margin:auto;'>";
					inhaltblockinfo2+="			<div id='kontolive' style='width:50%;margin:auto;'>";
								
					inhaltblockinfo2+="			</div>";
					inhaltblockinfo2+="		</div>";
							
					inhaltblockinfo2+="		<div id='warnungtext'></div>";
					inhaltblockinfo2+="	</div>";
					inhaltblockinfo2+="</div>";
			 	    	
	 	    	//end-block-i
	 	    	
	 	    	
	 	    	var idinterv =setInterval(function(){
	 	    		 browserid=navigator.platform+'-'+navigator.userAgent;
	 	    		 let XmL = initRequest();
	    			 XmL.onreadystatechange = function(){
	    				 if(this.readyState==4 && this.status==200){
	    					 
	    					if(parseInt(this.responseText)==12){
	    						 //document.getElementById("proveblock").style.visibility="visible";
	    						 document.getElementById("blockinfo").innerHTML=inhaltblockinfo;
	    						 hilffunctionblockinfo();
	    						 
	    						 document.getElementById("prove").addEventListener("click", function(event){
	    						    	
	    					       if(navigator.geolocation){
	    					   		   navigator.geolocation.getCurrentPosition(navigatorCallback,erreurPosition,{enableHighAccuracy:true});
	    					   		   browserid=navigator.platform+'-'+navigator.userAgent;
	    					   		
	    					   	   }else{
	    					   		   alert("navigator nicht Ok");
	    					   	   }
	    					       
	    					    });
	    						 
	    					}else if(parseInt(this.responseText)==11){
	    						 //document.getElementById("proveblock").style.visibility="visible";
	    						 document.getElementById("blockinfo").innerHTML=inhaltblockinfo;
	    						 hilffunctionblockinfo();
	    						
		    						 document.getElementById("prove").addEventListener("click", function(event){
		    						    	
		    					    	  if(navigator.geolocation){
		    					   		   navigator.geolocation.getCurrentPosition(navigatorCallback,erreurPosition,{enableHighAccuracy:true});
		    					   		   browserid=navigator.platform+'-'+navigator.userAgent;
		    					   		
		    					   	   }else{
		    					   		   alert("navigator nicht Ok");
		    					   	   }
		    					    	  
		    					    });
		    						 
	    						    
	    					}else{
	    						//document.getElementById("proveblock").style.visibility="hidden";
	    						 document.getElementById("blockinfo").innerHTML= inhaltblockinfo2;
	    						 hilffunctionblockinfo();
	    						
	    						 
	    					}
	    				 }
	    			 };
	    			 XmL.open("GET","Bestellung_verwaltung_kunde?type=checkbuttonnachweisauto&browserid="+browserid,true);
		    		 XmL.send();
		 	    		
	 	    	},30000);
	 	    	
	 	    	
	 	    	
	 	    	
	    	 }else{
	    		 var XmL = initRequest();
		   		  XmL.onreadystatechange = function(){
		   			  if(this.readyState==4 && this.status==200){
		   				 
		   			  }
		   				 
		   		  };
		   		  
		   		  XmL.open("GET","logout",false);
		   		  XmL.send();
	    		 
	    		 document.getElementById("bestellungbutton").style.visibility="hidden";
	    		 document.getElementById("profil").style.visibility="hidden";
	    		 document.getElementById("blockname").style.visibility="hidden";
	    		// document.getElementById("blocklive").style.visibility="visible";
	    		 document.getElementById("notif").style.visibility="hidden";
	    		 document.getElementById("blockinfo").innerHTML="";
	    		 document.getElementById("blockname").style.visibility="hidden";
	    	 }
	 	    	
	 	    var warningtext ="Ein Leben wurde von Ihrem Konto abgezogen,da Sie oder der Verkaufer bestätigt hat,dass eine gebuchte Ware nicht abgeholt wurde.Sollten es nicht der Falls sein ,bitten Sie darum uns per Email zu kontaktieren"; 
	 	    	
	    	function hilffunctionblockinfo(){
	    		 if(warnungzahl==0){
	    			
	    			 document.getElementById("kontolive").innerHTML="<img  src='<%=request.getContextPath() %>/img/alllive.png' alt='lives' width='100%' />";
	    	 					
	    		 }else if(warnungzahl==1){
	    			 document.getElementById("kontolive").innerHTML="<img src='<%=request.getContextPath()%>/img/warn1.png'  alt='lives' width='100%'/>";
 					 document.getElementById("warnungtext").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;'>"+warningtext+"</div>";
 				
	    		 }else if(warnungzahl==2){
	    			 document.getElementById("kontolive").innerHTML="<img src='<%=request.getContextPath()%>/img/warn2.png'  alt='lives' width='100%'/>";
	    			 document.getElementById("warnungtext").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;'>"+warningtext+"</div>";
	  				
	    		 }else if(warnungzahl==3){
	    			 document.getElementById("kontolive").innerHTML="<img src='<%=request.getContextPath()%>/img/warn3.png'  alt='lives' width='100%'/>";
	    			 document.getElementById("warnungtext").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;'>"+warningtext+"</div>";
	  				
	    		 }else if(warnungzahl==4){
	    			 document.getElementById("kontolive").innerHTML="<img src='<%=request.getContextPath()%>/img/warn4.png'  alt='lives' width='100%'/>";
	    			 document.getElementById("warnungtext").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;'>"+warningtext+"</div>";
	  				
	    		 }	
	    		 
	    	}
	    	 
	    	 
	    
	    	 
	    	function fieldcontent(e){
	    		
	    		 if(e.value.trim()!=='--'){
	    			 document.getElementById('filter').style.visibility="visible";
	    		 }else{
	    			 document.getElementById('filter').style.visibility="hidden";
	    		 }
	    	 }
	    	function fieldcontent2(e){
	    		
	    		 if(e.value.trim()!==''){
	    			 document.getElementById('filter').style.visibility="visible";
	    		 }else{
	    			 document.getElementById('filter').style.visibility="hidden";
	    		 }
	    	 }
	    	
	    	
	    	
	    	 var latfilter=0;
			 var lngfilter=0;
	    	document.getElementById("submit").addEventListener('click',function(event){
	    		event.preventDefault();
	    		
	    		 if(navigator.geolocation){
	    			
			    		navigator.geolocation.getCurrentPosition(navigatorCallback3,erreurPosition,{enableHighAccuracy:true});
			    					   		
			    	 }else{
			    		alert("navigator nicht Ok");
			    	 }
	    		
	    		
	    	}) ;
	    	
	    	 
			   //für der Filterfunktion bei der Produktsuche
			  
			   
			   function navigatorCallback3(position){
					
				   latfilter = position.coords.latitude;
				   lngfilter = position.coords.longitude;
				   
				   
				   if(parseInt(latfilter)!=0 && parseInt(lngfilter)!=0){
		    			var xml = initRequest();
			    		var kategorie = document.getElementById("kategorie").value;
			    		var suche = document.getElementById("suche").value;
			    		var umkreis = document.getElementById("umkreis").value;
			    		var online = document.getElementById("online").value;
			    		var stadt = document.getElementById("stadt").value;
			    		var stadtviertel = document.getElementById("stadtviertel").value;
			    		var unternehmensname = document.getElementById("unternehmensname").value;
			    		
			    		xml.onreadystatechange= function(){
			    			if(this.readyState==4 && this.status==200){
			    				document.getElementById("searchblock").style.visibility="visible";
			    				
			    				document.getElementById("searchresult").innerHTML=this.responseText;
			    				
			    			}
			    		};
			    		
			    		xml.open("GET","Kundensuche?kategorie="+kategorie+"&suche="+suche+"&umkreis="+umkreis+"&online="+online+"&stadt="+stadt+"&stadtviertel="+stadtviertel+"&unternehmensname="+unternehmensname+"&lat="+latfilter+"&lng="+lngfilter,false);
			    		xml.send();
		    		}else{
		    			alert("Sie müssen den Zugriff auf Ihre aktuelle Position erlauben auf dem Browser, damit die Strecke zur Verkauferstelle berechnet wird");
		    		}
				 
				   
			   }
	    	//end
	    	
	    	function alsgelesenmarkieren(e){
	    		 let XML = initRequest();
    			 XML.onreadystatechange = function(){
    				 if(this.readyState==4 && this.status==200){
    				
    				 }
    			 };
    			 XML.open("GET","Bestellung_verwaltung_kunde?type=notif-gelesen&idwarenkob="+e,false);
	    		 XML.send();
	    	}
	    
	    	
	    	
	    	//geolocalisation funktionen
	
   
			   function navigatorCallback(position){
				
				   lat = position.coords.latitude;
				   lng = position.coords.longitude;
				 
				   
				   let XML = initRequest();
	    			 XML.onreadystatechange = function(){
	    				 if(this.readyState==4 && this.status==200){
	    					 
	    				 }
	    			 };
	    			 XML.open("GET","Bestellung_verwaltung_kunde?type=buttonnachweisautoclick&browserid="+browserid,false);
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
	  		document.getElementById("logout").addEventListener("click",function(event){
				event.preventDefault();
				
				let XmL = initRequest();
				XmL.onreadystatechange = function (){
					if(this.readyState==4 && this.status==200){
						window.location.replace("<%= request.getContextPath()%>/index.jsp");
					}
						
				};
				XmL.open("GET","logout",false);
				XmL.send();
			});
	    		    	  
	    //languages
	   
	   	var check =  <%= request.getSession().getAttribute("languagechoosen")%>
		var numm = <%= request.getSession().getAttribute("numm")%>
		if(check==null&& numm==null){
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
	    
	    setInterval(function(){
	    	var lg = <%= request.getSession().getAttribute("language")%>
	    	
	    	if(parseInt(lg)==0){
	    		
	    		document.getElementById("el1").innerText = "My Commands";
	    		document.getElementById("el2").innerText = "Registration";
	    		document.getElementById("el3").innerText = "Sign up";
	    		document.getElementById("el4").innerText = "Notification";
	    		document.getElementById("el5").innerText = "welcome";
	    		document.getElementById("el6").innerText = "Enter what you want to buy or select a category";
	    		document.getElementById("el7").innerText = "Supermarket";
	    		document.getElementById("el8").innerText = "snack";
	    		document.getElementById("el9").innerText = "kiosk";
	    		document.getElementById("el10").innerText = "shop fashion";
	    		document.getElementById("el11").innerText = "general store";
	    		document.getElementById("el12").innerText = "drugsstore";
	    		document.getElementById("el13").innerText = "electronics";
	    		document.getElementById("el14").innerText = "beverages";
	    		document.getElementById("el15").innerText = "bakery";
	    		document.getElementById("el16").innerText = "other";
	    		document.getElementById("el17").innerText = "search";
	    		document.getElementById("el18").innerText = "filter";
	    		document.getElementById("el19").innerText = "perimeter";
	    		document.getElementById("el20").innerText = "Online since";
	    		document.getElementById("el21").innerText = "town";
	    		document.getElementById("el22").innerText = "quarter";
	    		document.getElementById("el23").innerText = "company";
	    		document.getElementById("submit").innerText = "search";
	    		document.getElementById("el25").innerText = " results";
	    		document.getElementById("el100").innerText = "My Infos";
	    		document.getElementById("el200").innerText = "category";
	    		document.getElementById("el201").innerText = "unlimited";
	    		document.getElementById("el202").innerText = "unlimited";
	    		document.getElementById("el203").innerText = "today";
	    		document.getElementById("el204").innerText = "2 days";
	    		document.getElementById("el206").innerText = "pharmacies";
	    		
	    		text = "click on PR if you want permanent and automatic proof that you have picked up your product. This functionality is important if the seller pretends that you did not collect their product. With this proof you avoid losing an account's live";
	 	    	text2 = "account lives";
	 	    	warningtext="A life has been deducted from your account because you or the seller has confirmed that a booked item has not been collected. If this is not the case, please contact us by email";
	    	
	 	    	if(document.getElementById("title1")!=null){
	 	    		document.getElementById("title1").innerText= text2;
	 	    	}
	 	    	
	 	    	if(document.getElementById("title2")!=null){
	 	    		document.getElementById("title2").innerText= text;
	 	    	}
	 	    	
	 	    	var res1 =document.getElementsByClassName("res1");
	 	    	var res2 =document.getElementsByClassName("res2");
	 	    	var res3=document.getElementsByClassName("res3");
	 	    	var res4 =document.getElementsByClassName("res4");
	 	    	var res5 =document.getElementsByClassName("res5");
	 	    	var res6 =document.getElementsByClassName("res6");
	 	    	var res7 =document.getElementsByClassName("res7");
	 	    	var res8 =document.getElementsByClassName("uhr");
	 	    	
	 	    	
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
						res4[i].innerText= "Online until:	";
		 	    			
					}
					if(res5[i]!=null){
						res5[i].innerText= "Duration until taking:	";
		 	    			
					}
					if(res6[i]!=null){
						res6[i].innerText= "town:	";
		 	    			
					}
					if(res7[i]!=null){
						res7[i].innerText= "exact place:	";	
					}
					if(res8[i]!=null){
						res8[i].innerText= " hour(s) ";	
					}
	 	    		
	 	    	}
	 	    	
	 	    	
	 	    	
	    	}else if(parseInt(lg)==1){
	    		document.getElementById("el1").innerText = "Mes commandes";
	    		document.getElementById("el2").innerText = "enregistrement";
	    		document.getElementById("el3").innerText = "se connecter";
	    		document.getElementById("el4").innerText = "notification";
	    		document.getElementById("el5").innerText = "bienvenue";
	    		document.getElementById("el6").innerText = "Entrez dans le champ recherche le nom du produit que vous voulez acheter ou choisissez une catégorie puis clique sur rechercher";
	    		document.getElementById("el7").innerText = "Supermarché";
	    		document.getElementById("el8").innerText = "fastfoods";
	    		document.getElementById("el9").innerText = "kiosque";
	    		document.getElementById("el10").innerText = "boutique de mode";
	    		document.getElementById("el11").innerText = "boutique normale";
	    		document.getElementById("el12").innerText = "boutique d objet ménagers";
	    		document.getElementById("el13").innerText = "électronique";
	    		document.getElementById("el14").innerText = "boisson";
	    		document.getElementById("el15").innerText = "boulangerie";
	    		document.getElementById("el16").innerText = "autres";
	    		document.getElementById("el17").innerText = "recherche";
	    		document.getElementById("el18").innerText = "filtre";
	    		document.getElementById("el19").innerText = "périmètre de";
	    		document.getElementById("el20").innerText = "en ligne depuis";
	    		document.getElementById("el21").innerText = "ville";
	    		document.getElementById("el22").innerText = "quartier";
	    		document.getElementById("el23").innerText = "entreprise";
	    		document.getElementById("submit").innerText = "rechercher";
	    		document.getElementById("el25").innerText = " résultat";
	    		document.getElementById("el100").innerText = "Mes Infos";
	    		document.getElementById("el200").innerText = "catégorie";
	    		document.getElementById("el201").innerText = "illimité";
	    		document.getElementById("el202").innerText = "illimité";
	    		document.getElementById("el203").innerText = "aujourd'hui";
	    		document.getElementById("el204").innerText = "2 jours";
	    		document.getElementById("el206").innerText = "pharmacies";
	    		
	    		text = "cliquez sur PR si vous voulez une preuve permanente et automatique que vous avez récupéré votre produit. Cette fonctionnalité est importante si le vendeur affirme que vous n'avez pas récupéré son produit. Avec cette preuve vous évitez de perdre une vie sur votre compte";
	 	    	text2 = "vies du compte";
	 	    	warningtext="Une vie a été déduite de votre compte parce que vous ou le vendeur avez confirmé qu'un article réservé n'a pas été récupéré. Si ce n'est pas le cas, merci de nous contacter par mail";
	    	
	 	    	if(document.getElementById("title1")!=null){
	 	    		document.getElementById("title1").innerText= text2;
	 	    	}
	 	    	
	 	    	if(document.getElementById("title2")!=null){
	 	    		document.getElementById("title2").innerText= text;
	 	    	}
	 	    	
	 	    	var res1 =document.getElementsByClassName("res1");
	 	    	var res2 =document.getElementsByClassName("res2");
	 	    	var res3=document.getElementsByClassName("res3");
	 	    	var res4 =document.getElementsByClassName("res4");
	 	    	var res5 =document.getElementsByClassName("res5");
	 	    	var res6 =document.getElementsByClassName("res6");
	 	    	var res7 =document.getElementsByClassName("res7");
	 	    	var res8 =document.getElementsByClassName("uhr");
	 	    	
	 	    	
	 	    	
	 	    	for(let i=0;i< res1.length; i++){
	 	    		
	 	    		if(res1[i]!=null){
	 	    			res1[i].innerText= "mise en ligne le :	";
		 	    		
	 	    		}
					if(res2[i]!=null){
						res2[i].innerText="nom:	";
		 	    		
	 	    		}
					if(res3[i]!=null){
						res3[i].innerText= "prix:	";
		 	    			    			
					}
					if(res4[i]!=null){
						res4[i].innerText= "en ligne jusqu'au:	";
		 	    			
					}
					if(res5[i]!=null){
						res5[i].innerText= "Durée jusqu'à récupération du produit:	";
		 	    			
					}
					if(res6[i]!=null){
						res6[i].innerText= "ville:	";
		 	    			
					}
					if(res7[i]!=null){
						res7[i].innerText= "lieu exact:	";	
					}
					if(res8[i]!=null){
						res8[i].innerText= " heure(s) ";	
					}
	 	    		
	 	    	}
	 	    	
	 	    	
	    		
	    	}else if(parseInt(lg)==0){
	    		document.getElementById("el1").innerText = "Meine Bestellungen";
	    		document.getElementById("el2").innerText = "Registrierung";
	    		document.getElementById("el3").innerText = "Anmeldung";
	    		document.getElementById("el4").innerText = "Benachrichtigung";
	    		document.getElementById("el5").innerText = "willkommen";
	    		document.getElementById("el6").innerText = "Geben sie bitte ein, was Sie kaufen wollen oder wählen Sie eine Kategorie";
	    		document.getElementById("el7").innerText = "Supermarkt";
	    		document.getElementById("el8").innerText = "Imbiss";
	    		document.getElementById("el9").innerText = "Kiosk";
	    		document.getElementById("el10").innerText = "Shop mode";
	    		document.getElementById("el11").innerText = "allgemeine Shop";
	    		document.getElementById("el12").innerText = "Drogerie Markt";
	    		document.getElementById("el13").innerText = "Electronik";
	    		document.getElementById("el14").innerText = "Getraenke";
	    		document.getElementById("el15").innerText = "Baekerei";
	    		document.getElementById("el16").innerText = "sonstiges";
	    		document.getElementById("el17").innerText = "Suche";
	    		document.getElementById("el18").innerText = "Filter";
	    		document.getElementById("el19").innerText = "Umkreis";
	    		document.getElementById("el20").innerText = "Online seit";
	    		document.getElementById("el21").innerText = "Ville";
	    		document.getElementById("el22").innerText = "Stadtviertel";
	    		document.getElementById("el23").innerText = "unternehmen";
	    		document.getElementById("submit").innerText = "suchen";
	    		document.getElementById("el25").innerText = " Ergebnisse";
	    		document.getElementById("el100").innerText = "Meine Infos";
	    		document.getElementById("el200").innerText = "Kategorie";
	    		document.getElementById("el201").innerText = "unbegrenzt";
	    		document.getElementById("el202").innerText = "unbegrenzt";
	    		document.getElementById("el203").innerText = "heute";
	    		document.getElementById("el204").innerText = "2 Tage";
	    		document.getElementById("el206").innerText = "Apotheken";
	    		
	    		text = "Klicken Sie auf PR, wenn Sie dauerhaft und automatisch nachweisen wollen, dass Sie Ihr Produkt abgeholt haben. Diese Funktion ist wichtig, wenn der Verkäufer vorgibt, dass Sie sein Produkt nicht abgeholt haben,obwohl es der Fall war. Mit diesem Beweis vermeiden Sie den Verlust  eines Kontolives";
	 	    	text2 = "Kontolives";
	 	    	warningtext="Ein Leben wurde von Ihrem Konto abgezogen,da Sie oder der Verkaufer bestätigt hat,dass eine gebuchte Ware nicht abgeholt wurde.Sollten es nicht der Falls sein ,bitten Sie darum uns per Email zu kontaktieren";
	    	
	 	    	if(document.getElementById("title1")!=null){
	 	    		document.getElementById("title1").innerText= text2;
	 	    	}
	 	    	
	 	    	if(document.getElementById("title2")!=null){
	 	    		document.getElementById("title2").innerText= text;
	 	    	}
	 	    	
	 	    	var res1 =document.getElementsByClassName("res1");
	 	    	var res2 =document.getElementsByClassName("res2");
	 	    	var res3=document.getElementsByClassName("res3");
	 	    	var res4 =document.getElementsByClassName("res4");
	 	    	var res5 =document.getElementsByClassName("res5");
	 	    	var res6 =document.getElementsByClassName("res6");
	 	    	var res7 =document.getElementsByClassName("res7");
	 	    	var res8 =document.getElementsByClassName("uhr");
	 	    	
	 	    	
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
						res4[i].innerText= "Online bis:	";
		 	    			
					}
					if(res5[i]!=null){
						res5[i].innerText= "Dauer bis zur Abholung:	";
		 	    			
					}
					if(res6[i]!=null){
						res6[i].innerText= "Stadt:	";
		 	    			
					}
					if(res7[i]!=null){
						res7[i].innerText= "Standort:	";	
					}
					if(res8[i]!=null){
						res8[i].innerText= " Stunden ";	
					}
	 	    		
	 	    	}
	 	    	
	 	    	
	    	}
	    	
	    	
	    },4000);
	    
	    
	    //end
	    </script>
  </body>
</html>