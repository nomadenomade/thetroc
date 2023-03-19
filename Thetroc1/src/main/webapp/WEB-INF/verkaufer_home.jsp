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
    	
    	#info1{
    		 margin:auto;
    		 background-color:#FFFFE0;
    		 width:60%;
    		 padding:15px;
    	
    	}
    
    	@media screen and (max-width: 992px){
    		#info1 {
    			
    			 width:80%;
    		 	 padding:10px;
    		}
    	}
    	
    	@media screen and (max-width: 600px){
    		#info1 {
    
    			 width:95%;
    		 	 padding:2px;
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
          <span class="lead text-white"style="font-weight:bold; font-size:0.8em;border-bottom:2px solid white;" id="el1">Dashboard</span>
          <i class="fas fa-home fa-lg" style="color:white;font-size:0.8em;"></i>
        </a>
        </li>
        <li class="nav-item">
           <a class="nav-link text-reset me-3" href="<%=request.getContextPath()%>/RequestReSendSeller?name=kommentarverkaufer">
            <span class="lead text-white" style="font-weight:bold; font-size:0.8em;" id="el2">Kommentare</span> 
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
      	<span class="lead text-white"style="font-weight:bold; font-size:0.8em;"  id="el3">Bestellungen</span>
        <i class="fas fa-shopping-cart"  style="color:white;font-size:0.8em;"></i>
        <span class="badge rounded-pill badge-notification bg-danger" id="command"></span>
      </a>
      <ul
        class="dropdown-menu dropdown-menu-end"
        aria-labelledby="navbarDropdownMenuLink"
      >
        <li>
          <a class="dropdown-item" href="<%=request.getContextPath()%>/RequestReSendSeller?name=bestellungverkaufer"  id="el4">aktuelle Bestellungen</a>
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
      	<span class="lead text-white" style="font-weight:bold; font-size:0.8em;"  id="el5">Notifications</span>
        <i class="fas fa-bell"  style="color:white;font-size:0.8em;"></i>
        <span class="badge rounded-pill badge-notification bg-danger"></span>
      </a>
      <ul
        class="dropdown-menu dropdown-menu-end"
        aria-labelledby="navbarDropdownMenuLink"
      >
        <li>
          <a class="dropdown-item" href="#"  id="el6">Nachricht von thetroc</a>
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
      > <span class="lead text-white"style="font-weight:bold; font-size:0.8em;"  id="el7">Profil</span>
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
          <a class="dropdown-item" href="#"  id="el8">Mein infos</a>
        </li>
        <li>
          <a class="dropdown-item" href="<%=request.getContextPath() %>/RequestReSendSeller?name=Unternehmeninfo"  id="el9">Unternehmen erstellen</a>
        </li>
        <li>
          <a class="dropdown-item" id="logout" href="<%=request.getContextPath() %>/index.jsp">Logout</a>
        </li>
      </ul>
    </div>
    <!-- Right elements -->
  </div>
  <!-- Container wrapper -->
</nav>
<!-- Navbar -->
<!-- content -->
<h4 class="text-white">Profil-Status : <span class="text-success"  id="el11">Aktiviert</span></h4>
<div class="text-warning lead" style="font-size:0.6em;"  id="el12">Achtung! Ihr profil ist nur für ein jahr aktiviert</div>
<hr style="box-shadow:2px 3px;">
<h5 class="text-white text-center lead " style="font-weight:bold;" id="el13">Info Unternehmen</h5>

<div style="max-width: 800px;margin:auto;">
	<div class='row' id='z'>
		<div class='col-sm-6'>
			<div class="card mt-4"  id="info1" >
				<div class="card-body">
					 <p class="lead" style="font-size:0.9em;"  id="el14">Sie haben bisher kein Unternehmen erstellt. Wechseln Sie bitte auf Profil-> "Unternehmen erstellen" und geben Sie alle Informationen über Ihr Unternehmen! </p>
				</div>
			</div>
	</div>
		<div class='col-sm-6' >
			<div class="text-white text-center lead " style="font-weight:bold; font-size:1em;">Lives</div>
			<div  class="card" id= "kk" style="width:50%;margin:auto;">
				 <div class="card-body" id="live">
				 
				 </div>
				 <div id="livemeldung"></div>
			</div>
		</div>
	</div>
</div>



<!--  
<div class="container-fluid" id="container1">	
	<hr>
	<h5 class="text-info text-center lead" style="font-weight:bold;"  id="el15">Produkterstellung und Veröffentlichung</h5>
	<div  style="width:55%; font-size:0.9em; padding:12px; margin:auto;background-color:#ADD8E6;border-radius:12px;box-shadow: 2px 6px :#ADD8E6"  id="el16">Hier können Sie ein Produkt erstellen,Bilder für dieses Produkt einfügen,welche von Ihren Kunden werden gesehen werden können,und dieses Produkt dann veröffentlichen</div>
	
	<form class="mt-5" action="Produkterstellung">
	<div class="row">
		<div class="col-md-8 pt-3">
		
			<div class="card" style="background-color:#F5F5F5;">
				<div class="card-body">
					<div class="row">
						<div class="col-sm-4">
							<span class="text-danger">*</span>
							<div class="form-outline mb-4">
								<input type="text" name="nameprodukt" id="nameprodukt" class="form-control" value="${name}">
								<label for="nameprodukt" class="form-label"  id="el17">Name</label>
							</div>
							<div id="namefehler" style="color:red; font-size: 0.7em;">${fehlermeldung.checknameprodukt}</div>
							<div class="form-outline mb-4">
								<textarea rows="5" cols="8" name="beschreibung" id="beschreibung" class="form-control" value="${beschreibung}"></textarea>
								<label for="beschreibung" class="form-label"  id="el18">Beschreibung</label>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="row">
								<div class="col-sm-6">
								 
								 	<div class="row">
								 		<div class="col">
								 			<span class="text-danger">*</span>
											<div class="form-outline mb-4">
												<input type="text" name="preis" id="preis" class="form-control" value="${preis}">
												<label for="preis" class="form-label"  id="el19">Preis</label>
								   			</div>
								   			 <div id="preisfehler"  style="color:red; font-size: 0.7em;">${fehlermeldung.checkpreisprodukt}</div>
								 		</div>
								 		<div class="col">
								 			<span class="text-danger">*</span>
								 			<select class="form-control" name="waehrung" id="waehrung" value="${währung}">
								 				<option>Euro</option>
								 				<option>Fcfa</option>
								 				<option>dinar</option>
								 				<option>dolar</option>
								 			</select>
								 		</div>
								 	</div>
								 	<div class="row">
								 		<div class="col">
								 			<div class="form-outline mb-4">
												<input type="text" name="marke" id="marke" class="form-control" value="${marke}">
												<label for="marke" class="form-label"  id="el20">Marke</label>
											</div>
								 		</div>
								 	</div>
									
									
									
								</div>
								<div class="col-sm-6">
								<span class="text-danger">*</span>
								<div class="form-group" style="margin:auto;">
									<label for="kategorie"  id="el21">Kategorie</label>
									<select class="form-control" id="kategorie" name="kategorie" value="${kategorie}">
										<option  id="el22">Restaurant</option>
										<option  id="el23">Supermarkt</option>
										<option  id="el24">imbiss</option>
										<option  id="el25">kiosk</option>
										<option  id="el26">shop mode</option>
										<option  id="el27">allgemeine shop</option>
										<option  id="el28">Drogerie markt</option>
										<option  id="el29">Elekronik</option>
										<option  id="el30">Getraenke</option>
										<option  id="el31">Baeckerei</option>
										<option  id="el300">Apotheke</option>
										<option  id="el32">Sonstiges</option>
									</select>
								</div>
								
								<div class="row ">
								<p style="font-size:0.9em" class="lead mt-3 text-center"  id="el33">Geben Sie die Menge und wählen Sie die Einheit aus oder klicken Sie auf unbegrenzt.</p>
								
									<div class="col">
										<span class="text-danger">*</span>
										<div class="form-outline mb-2" id="block1">
											<input type="text" name="menge" id="menge" class="form-control" value="${menge}">
											<label for="menge" class="form-label"  id="el34">Menge</label>
										</div>	
										<div id="block2">
											<select id="einheit" name="einheit" class="form-control" value="${einheit}">
												<option  id="el35">Stueck</option>
												<option>Kg</option>
												<option  id="el36">Liter</option>
											</select>
										</div>
										
										<div id="ablauffehler"  style="color:red; font-size: 0.7em;">${fehlermeldung.checkmenge}</div>
									
									</div>
									<div class="col">
										<span style="visibility:hidden">*</span>
										<div class="form-check" id="block3">
											<input type="checkbox" name="mengecheckbox"  onclick="isChecked3(this)" class="form-check-input" id="mengecheckbox">
											<label for="mengecheckbox" class="form-check-label"  id="el37">unbegrenzt </label>
											
										</div>
									</div>
								</div>
								</div>
							</div>
							<div class="row">
								<p style="font-size:0.9em" class="lead text-center mt-4"  id="el38">Wählen Sie das Ablaufdatum des Produkts oder klicken Sie auf "Kein Datum"</p>
								<div class="col">
									<div id="blockablauf">
										<span class="text-danger">*</span>
										<div class="form-outline">
											<input type="date" name="ablauf" id ="ablauf" class="form-control" value="${ablaufdatum}">
											<label for="ablauf" class="form-label"  id="el39">ablaufdatum</label>
										</div>
										<div id="ablauffehler"  style="color:red; font-size: 0.7em;">${fehlermeldung.checkablaufdatum}</div>
									</div>
									
													
								</div>
								<div class="col">
									<span style="visibility:hidden">*</span>
									<div class="form-check">
											<input type="checkbox" name="ablaufcheckbox" onclick="isChecked2(this)" class="form-check-input" id="ab">
											<label for="ab" class="form-check-label"  id="el40">Kein Datum </label>
											
									</div>
									<input type="hidden" id="ablaufcheckboxhidden" value="${ablaufcheckbox }">
								</div>
								
							</div>
						</div>		
					</div>
					
					<div class="row">
						<div class="row">
							<div class="col-sm" style=" margin-top:10px;">
								<div class="card">
									<div class="card-body">
										<p class="text-center lead" style="font-size:0.9em"  id="el41">geben Sie das Datum, bis wann dieses Angebot Online bleiben soll</p>
										<span class="text-danger">*</span>
											<div id="blockdate">
												<div class="form-outline mb-4">
													<input type="date" name="dateonline"   id ="dateonline" class="form-control" value="${onlinebis}">
													<label for="dateonline" class="form-label"  id="el42">Online bis</label>
												</div>
												<div id="onlinedatefehler"></div>	
												
															
												<div class="form-outline mb-4"> 
													<input type="time" name="timeonline"   id="timeonline" class="form-control" class="form-control" value="${onlinetime }">
													<label for="timeonline" class="form-label"  id="el43">Uhrzeit</label>
												</div>
											</div>
											
											<div class="form-check" id="kein1">
														<input type="checkbox" name="dateonlinecheckbox" onclick="isChecked(this)" class="form-check-input" id="doc">
														<label for="doc" class="form-check-label"  id="el44">unbegrenzt </label>							
											</div>
											<div id="onlinetimefehler"  style="color:red; font-size: 0.7em;">${fehlermeldung.checkonlinedate }</div>	
											<input type="hidden" id="dateonlinecheckboxhidden" value="${dateonlinecheckbox}">
									</div>
								</div>				
						</div>
						<div class="col-sm" style=" margin-top:10px;">
							<div class="card">
								<div class="card-body">
									<p class="text-center lead" style="font-size:0.9em"  id="el45">wie lange soll es maximal dauer bis der kunde sein Produkt abgeholt hat.Diese Dauer muss in Stunden sein zb: 2</p>
									<span class="text-danger">*</span>
									<div class="form-outline mb-4">					
										<input type="text" name="dauer" id="dauer" class="form-control">
										<label for="dauer" class="form-label"  id="el46">Dauer</label>
									</div>
									<div id="dauerfehler"  style="color:red; font-size: 0.7em;" >${fehlermeldung.checkdauerabholprodukt}</div>
								</div>
							</div>
						
						</div>
						</div>
						<div class="row mt-5">
							<div style="width:50%; margin:auto;" class="mb-4 ">
								<input type="submit" name="erstellen"  id="erstellen"  class="btn btn-sm btn-info btn-block" value="erstellen">
							</div>		
						</div>
						
					</div>
					
				</div>
			</div>		
		</div>
		<div class="col-md-4">
			<h5 class="text-info text-center lead mb-3"  style="margin-top:25px;font-weight:bold;"  id="el47">neue Bestellungen</h5>
	
			<div class="card" style="max-height:800px; overflow-y:scroll;">
			
			<div class="card-body">
				
				<div id="neuebestellung"></div>
			</div>
			
			</div>		
		</div>
	</div>
	</form>
	
	
	
	<hr>
	<h5 class="text-info text-center lead"  style="margin-top:25px;font-weight:bold;"  id="el48">Liste der erstellten Produkte</h5>
	<div class="card">
		<div class="card-body" id="content" Style="max-height:600px;overflow-y:scroll;background-color:#F5F5F5;"></div>
	</div>
	
	
	
</div>
<div class="mt-4" id="bb">
	<span class="btn btn-sm btn-success" style='margin-right:20px;margin-left:20px;' onclick="allonline()" id="online">all Online</span>
	<span class="btn btn-sm btn-danger" id="offline" onclick="alloffline()">all Offline</span>
	<span class="btn btn-sm " id="aktualisieren" style='margin-left:50px;  background-color:#D3D3D3;' onclick="aktualisieren()" >aktualisieren</span>
</div>

-->
<!-- end container -->
   <div id="contain"></div>
   <script type="text/javascript" src="js/mdb.min.js"></script>
   <script>
   
   
   //iNHALT SEITE
   
   
  //INHALT END
   
   
   var lang = <%= request.getSession().getAttribute("language")%>
   lang = parseInt(lang);
   var abzug1="Ein Leben wurde von Ihrem Konto abgezogen,da Sie vorgegeben haben,dass einer Ihrer Kunden Sein Produkt nicht abgeholt hat obwohl unser System das Gegenteil bewiesen hat.";
   var abzug2="A life has been deducted from your account for pretending that one of your customers has not picked up its product despite our system proving otherwise.";
   var abzug3="Une vie a été déduite de votre compte pour avoir prétendu qu'un de vos clients n'avait pas récupéré son produit alors que notre système prouve le contraire.";
   
   if(<%=request.getSession().getAttribute("idverkaufer") %>==null){
		window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
	}
	setInterval(function(){
		if(<%=request.getSession().getAttribute("idverkaufer") %>==null){
		window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
	}
	},100000);
   
   		var unternehmenid =<%=request.getSession().getAttribute("unternehmenid")%>;
   		if(unternehmenid=="0"){
   			document.getElementById("contain").innerHTML='';
			//document.getElementById("container1").style.visibility="hidden";
			document.getElementById("kk").style.visibility="hidden";
			if(document.getElementById("bb")!=null){
				document.getElementById("bb").style.visibility="hidden";
			}
			let tl= "<div class='card '  id='info1' ><div class='card-body'>";
			tl+="<p class='lead' style='font-size:0.9em;'  id='el14'>Sie haben bisher kein Unternehmen erstellt. Wechseln Sie bitte auf Profil-> 'Unternehmen erstellen' und geben Sie alle Informationen über Ihr Unternehmen! </p>";
			tl+="</div></div>"	;
			document.getElementById("z").innerHTML=tl;
			
			document.getElementById("info1").style.visibility="visible";
		}else{
			let xml = initRequest();
			xml.onreadystatechange = function (){
				if(this.readyState==4 && this.status==200){
					 document.getElementById("contain").innerHTML= this.responseText;
				}
			};
			xml.open("GET","Myinfos?type=body_desk_seller",false);
			xml.send(); 
			
			//document.getElementById("contain").innerHTML=cont;
			//document.getElementById("container1").style.visibility="visible";
			document.getElementById("kk").style.visibility="visible";
			if(document.getElementById("bb")!=null){
				document.getElementById("bb").style.visibility="hidden";
			}
			document.getElementById("info1").innerHTML="<div class='lead ' style='font-size:0.9em;'><span id='s1' style='font-weight:bold;font-size:1.0em;'>Name</span> : <%= request.getSession().getAttribute("unternehmenname")%></div><div class='lead mt-5 ' style='font-size:0.9em;'><span id='s2' style='font-weight:bold;font-size:1.0em;'>Standort</span> : <%= request.getSession().getAttribute("unternehmenstandort")%></div>";
			
			//live Sector
			var warnungzahl = parseInt(<%= request.getSession().getAttribute("warnungzahl") %>);
	   		
			 if(warnungzahl==0){
	    			
   			 document.getElementById("live").innerHTML="  <div class='text-center lead' style='font-size:1.1em;'>Lives</div></br><img  src='<%=request.getContextPath() %>/img/v1.png' alt='lives' width='100%' />";
   	 					
   		 }else if(warnungzahl==1){
   			 document.getElementById("live").innerHTML="<img src='<%=request.getContextPath()%>/img/v2.png'  alt='lives' width='100%'/>";
   			 document.getElementById("livemeldung").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;' class='f'>"+abzug1+"</div>";	 
   			
					 
   		 }else if(warnungzahl==2){
   			 document.getElementById("live").innerHTML="<img src='<%=request.getContextPath()%>/img/v3.png'  alt='lives' width='100%'/>";
   			 document.getElementById("livemeldung").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;' class='f'>"+abzug1+"</div>";	 
    	
   		 }else if(warnungzahl==3){
   			 document.getElementById("live").innerHTML="<img src='<%=request.getContextPath()%>/img/v4.png'  alt='lives' width='100%'/>";
    		 document.getElementById("livemeldung").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;' class='f'>"+abzug1+"</div>";	 
    		
   		 }else if(warnungzahl==4){
   			 document.getElementById("live").innerHTML="<img src='<%=request.getContextPath()%>/img/v5.png'  alt='lives' width='100%'/>";
    		 document.getElementById("livemeldung").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;' class='f'>"+abzug1+"</div>";	 
    			 
 				
   		 }else if(warnungzahl==5){
   			 document.getElementById("live").innerHTML="<img src='<%=request.getContextPath()%>/img/v6.png'  alt='lives' width='100%'/>";
    		 document.getElementById("livemeldung").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;' class='f'>"+abzug1+"</div>";	 
    			 
   		 }else if(warnungzahl==6){
   			 document.getElementById("live").innerHTML="<img src='<%=request.getContextPath()%>/img/v7.png'  alt='lives' width='100%'/>";
    		 document.getElementById("livemeldung").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;' class='f'>"+abzug1+"</div>";	 
    			 
   		 }else if(warnungzahl==7){
   			 document.getElementById("live").innerHTML="<img src='<%=request.getContextPath()%>/img/v8.png'  alt='lives' width='100%'/>";
    		 document.getElementById("livemeldung").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;' class='f'>"+abzug1+"</div>";	 
    			
   		 }else if(warnungzahl==8){
   			 document.getElementById("live").innerHTML="<img src='<%=request.getContextPath()%>/img/v9.png'  alt='lives' width='100%'/>";
    		 document.getElementById("livemeldung").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;' class='f'>"+abzug1+"</div>";	 
    			 
   		 }else if(warnungzahl==9){
   			 document.getElementById("live").innerHTML="<img src='<%=request.getContextPath()%>/img/v10.png'  alt='lives' width='100%'/>";
    		 document.getElementById("livemeldung").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;' class='f'>"+abzug1+"</div>";	 
    			 
   		 }else if(warnungzahl==10){
   			 document.getElementById("live").innerHTML="<img src='<%=request.getContextPath()%>/img/v11.png'  alt='lives' width='100%'/>";
    		 document.getElementById("livemeldung").innerHTML="<div style='font-size:0.6em;text-align:center;color:red;' class='f'>"+abzug1+"</div>";	 
    			 
   		 }
			
			
			 
			 
			 //Laden der Produkte auf der entsprechenden Verkaufer_home bereich
				var XML = initRequest();
			XML.onreadystatechange = function (){
				if(this.readyState==4 && this.status==200){
					 document.getElementById("content").innerHTML= this.responseText;
				}else{
					document.getElementById("content").innerHTML= "<div class='spinner-grow text-info' style='width:150px; height:150px; margin-left:40%;'role='status'><span class='visually-hidden'>Loading...</span></div>";
				}
			};
			XML.open("GET","Produktladen",false);
			XML.send(); 
			 
			
			var L = initRequest();
			L.onreadystatechange = function (){
			if(this.readyState==4 && this.status==200){
				if(parseInt(this.responseText) == 1){
					if(lang==0){
						alert("You have not yet answered at least one question about the collection of your sold products in the 'all orders' section, so we have put all your goods offline. Please answer these always no later than 2 hours after the sale. Now you can put your goods back online as soon as this task is done");
					}else if(lang==1){
						alert("jusqu à présent vous n avez pas répondu à au moins une question sur la récupation de vos produits récement vendus. Pour cette raison tous vos produits ont été provisoirement mis hors ligne. Répondez à tous les questions posées et activez manuellement vos produits");
					}else{
						alert("Sie haben nochnicht mindesten eine Frage über die Abholung ihrer verkauften Produkte im Bereich 'alle Bestellungen' beantworten,deshalb haben wir alle Ihre Waren offline gestellt.Beantworten Sie bitte diese immer spätesten 2 Stunden nach dem Verkauf.Nun können Sie ihre Waren wieder Online stellen sobald diese Aufgabe erledigt ist");
						
					}
				}
				
			}
			
		};
		L.open("GET","Bestellung_verwaltung_verkaufer?type=checkaufconfirmabhohlung",false);
		L.send();
   		
   		setInterval(function(){
   			var XmL = initRequest();
			XmL.onreadystatechange = function (){
				if(this.readyState==4 && this.status==200){
					if(parseInt(this.responseText) == 1){
						if(lang==0){
							alert("You have not yet answered at least one question about the collection of your sold products in the 'all orders' section, so we have put all your goods offline. Please answer these always no later than 2 hours after the sale. Now you can put your goods back online as soon as this task is done");
						}else if(lang==1){
							alert("jusqu à présent vous n avez pas répondu à au moins une question sur la récupation de vos produits récement vendus. Pour cette raison tous vos produits ont été provisoirement mis hors ligne. Répondez à tous les questions posées et activez manuellement vos produits");
						}else{
							alert("Sie haben nochnicht mindesten eine Frage über die Abholung ihrer verkauften Produkte im Bereich 'alle Bestellungen' beantworten,deshalb haben wir alle Ihre Waren offline gestellt.Beantworten Sie bitte diese immer spätesten 2 Stunden nach dem Verkauf.Nun können Sie ihre Waren wieder Online stellen sobald diese Aufgabe erledigt ist");
							
						}
					}
					
				}
				
			};
			XmL.open("GET","Bestellung_verwaltung_verkaufer?type=checkaufconfirmabhohlung",false);
			XmL.send();
   		
   		},300000);
   		
   		setInterval(neueBestellungLaden, 10000);
   		
   		
   		
   		var check1 = <%= request.getSession().getAttribute("checkifverkauferconfirm")%>;
		
		if(parseInt(check1)==1 && unternehmenid !="0"){
			document.getElementById("online").style.visibility="hidden";
		}else if(parseInt(check1)==0 && unternehmenid=="0"){
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
			if(this.readyState==4 && this.status==200){
				if(parseInt(this.responseText)==0){
					document.getElementById("command").innerHTML="";
				}else{
					document.getElementById("command").innerHTML= this.responseText; 
				}
			}
			
				
		};
		XmL.open("GET","Bestellung_verwaltung_verkaufer?type=isnewcommandread",true);
		XmL.send();
	},6000);	
			
}
		
		//unternehm end
   
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
   		
   

			
   
   		function isChecked(e){
   			if(e.checked==true){
   				document.getElementById("blockdate").style.visibility="hidden";
   			}else{
   				document.getElementById("blockdate").style.visibility="visible";
   			}
   		}
   		

   		function isChecked2(e){
   			if(e.checked==true){
   				document.getElementById("blockablauf").style.visibility="hidden";
   			}else{
   				document.getElementById("blockablauf").style.visibility="visible";
   			}
   		}
   		
   		
   		function isChecked3(e){
   			if(e.checked==true){
   				document.getElementById("block1").style.visibility="hidden";
   				document.getElementById("block2").style.visibility="hidden";
   			}else{
   				document.getElementById("block1").style.visibility="visible";
   				document.getElementById("block2").style.visibility="visible";
   			}
   		}
   		
   		function storno (idwarenkob){
   			var xml = initRequest();
   			xml.onreadystatechange = function(){
   				if(this.readyState==4 && this.status==200){
   				
   				}
   			};
   			
   			xml.open("GET","NeueBestellungLaden?type=bestellungdelete&idwarenkob="+idwarenkob,true);
   			xml.send();
   			
   		}
   		
   		
   		document.getElementById("logout").addEventListener("click",function(event){
   			event.preventDefault();
   		
   			window.location.replace("<%=request.getContextPath()%>/index.jsp");
   		});
   		
   		function neueBestellungLaden(){
   			var XML = initRequest();
   			XML.onreadystatechange = function (){
   				if(this.readyState==4 && this.status==200){
   					if(this.responseText == "vide"){
   						window.location.replace("<%=request.getContextPath()%>/anmeldung.jsp");
   					}else{
   						document.getElementById("neuebestellung").innerHTML= this.responseText;
   					}
   					
   				}
   				
   			};
   			XML.open("GET","NeueBestellungLaden?type=bestellungerhalten",false);
   			XML.send();
   		}
   		
   		
   		function bestellungannahme(e){
   			var XML = initRequest();
   			XML.onreadystatechange = function (){
   				if(this.readyState==4 && this.status==200){
   					if(this.responseText == "true"){
   						if(parseInt(lang)==0){
	   						alert("confirmed"); 
	    			    }else if(parseInt(lang)==1){
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
   		
   		
   		
   		function allonline(){
   			let XmL = initRequest();
			XmL.onreadystatechange = function (){
				if(this.readyState==4 && this.status==200){
					alert(this.responseText);
					
				}
				
			};
			XmL.open("GET","Bestellung_verwaltung_verkaufer?type=allonline",false);
			XmL.send();
   		}
			 
   		function alloffline(){
   			let XmL = initRequest();
			XmL.onreadystatechange = function (){
				if(this.readyState==4 && this.status==200){
					
					alert(this.responseText);
				}
				
			};
			XmL.open("GET","Bestellung_verwaltung_verkaufer?type=alloffline",false);
			XmL.send();
   		}
   		
   		function aktualisieren(){
   			window.location.reload();	  
   		}
   		
   		
		
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
	    		document.getElementById("el11").innerText = "activated";
	    		document.getElementById("el12").innerText = "Your profile has been activated for a year!";
	    		document.getElementById("el13").innerText = "information about your company ";
	    		if(document.getElementById("el14")!=null){
	    			document.getElementById("el14").innerText = "You have not yet created a company. Please switch to profile->'Create Company' and enter all information about your company!";
	    		}
	    		
	    		if(document.getElementById("el15")!=null){
	    			document.getElementById("el15").innerText = "Product Creation and Publishing";
		    		document.getElementById("el16").innerText = "Here you can create a product, insert images for that product that will be seen by your customers, and then publish that product";
		    		document.getElementById("el17").innerText = "name";
		    		document.getElementById("el18").innerText = "description";
		    		document.getElementById("el19").innerText = "price";
		    		document.getElementById("el20").innerText = "brand";
		    		document.getElementById("el21").innerText = "category";
		    		document.getElementById("el22").innerText = "restaurant";
		    		document.getElementById("el23").innerText = "Supermarket";
		    		document.getElementById("el24").innerText = "snack";
		    		document.getElementById("el25").innerText = "kiosk";
		    		document.getElementById("el26").innerText = "shop fashion";
		    		document.getElementById("el27").innerText = "general store";
		    		document.getElementById("el28").innerText = "drugsstore";
		    		document.getElementById("el29").innerText = "electronics";
		    		document.getElementById("el30").innerText = "beverages";
		    		document.getElementById("el31").innerText = "bakery";
		    		document.getElementById("el32").innerText = "others";
		    		document.getElementById("el33").innerText ="Enter quantity and select unit or click unlimited.";
		    		document.getElementById("el34").innerText ="quantity on stock";
		    		document.getElementById("el35").innerText ="piece";
		    		document.getElementById("el36").innerText ="liter";
		    		document.getElementById("el37").innerText ="unlimited";
		    		document.getElementById("el38").innerText ="Choose the expiration date of the product or click 'No date'. ";
		    		document.getElementById("el39").innerText ="expiry date";
		    		document.getElementById("el40").innerText ="No date";
		    		document.getElementById("el41").innerText ="Enter the date until when this offer should remain online.";
		    		document.getElementById("el42").innerText ="online until";
		    		document.getElementById("el43").innerText ="time";
		    		document.getElementById("el44").innerText ="unlimited";
		    		document.getElementById("el45").innerText ="What is the maximum time it should take for the customer to pick up their product. This duration must be in hours, e.g.: 2";
		    		document.getElementById("el46").innerText ="duration";
		    		document.getElementById("el47").innerText ="new oders";
		    		document.getElementById("el48").innerText ="List of created products";
		    		document.getElementById("aktualisieren").innerText ="refresh page";
		    		document.getElementById("erstellen").value ="create";
		    		document.getElementById("el300").innerText = "pharmacies";
	    			
	    		}
	    		
	    		
	    		if(document.getElementById("s1")!=null){
	    			document.getElementById("s1").innerText="name";
	    		}
	    		if(document.getElementById("s2")!=null){
	    			document.getElementById("s2").innerText="location";
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
	 	    	var res10 =document.getElementsByClassName("uhr");
	 	    	
	 	    	
	 	    	for(let i=0;i< res1.length; i++){
	 	    		
	 	    		if(res1[i]!=null){
	 	    			res1[i].innerText= "informations about the customer";
		 	    		
	 	    		}
					if(res2[i]!=null){
						res2[i].innerText="pseudo:	";
		 	    		
	 	    		}
					if(res3[i]!=null){
						res3[i].innerText= "email:	";
		 	    			    			
					}
					if(res4[i]!=null){
						res4[i].innerText= "information about the product:	";
		 	    			
					}
					if(res5[i]!=null){
						res5[i].innerText= "name:	";
		 	    			
					}
					if(res6[i]!=null){
						res6[i].innerText= "price:	";
		 	    			
					}
					if(res7[i]!=null){
						res7[i].innerText= "ordered quantity:	";	
					}
					if(res8[i]!=null){
						res8[i].innerText= "accept";	
					}
					if(res9[i]!=null){
						res9[i].innerText= "reject";	
					}
					if(res10[i]!=null){
						res10[i].innerText= " hour(s)";	
					}
	 	    		
	 	    	}
	 	    	
	 	    	//für bereich produkt laden
	 	    	
	 	    var t1 =document.getElementsByClassName("t1");
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
	 		
	 		
	 		
	 		for(let i=0;i< t1.length; i++){
 	    		
 	    		if(t1[i]!=null){
 	    			t1[i].innerText= "name: ";
	 	    		
 	    		}
				if(t2[i]!=null){
					t2[i].innerText="price:	";
	 	    		
 	    		}
				if(t3[i]!=null){
					t3[i].innerText= "description:	";
	 	    			    			
				}
				if(t4[i]!=null){
					t4[i].innerText= "quantity in stock:	";
	 	    			
				}
				if(t5[i]!=null){
					t5[i].innerText= "expire date:	";
	 	    			
				}
				if(t6[i]!=null){
					t6[i].innerText= "brand :	";
	 	    			
				}
				if(t7[i]!=null){
					t7[i].innerText= "online until:	";	
				}
				if(t8[i]!=null){
					t8[i].innerText= "duration until picking up:   ";	
				}
				if(t9[i]!=null){
					t9[i].innerText= "online";	
				}
				if(t10[i]!=null){
					t10[i].innerText= "offline";	
				}
				if(t11[i]!=null){
					t11[i].innerText= "at ";	
				}
				
 	    		
 	    	}
	 		
	 		var f =document.getElementsByClassName("f");
	 		for(let i=0; i<f.length;i++){
	 			if(f[i]!=null){
					f[i].innerText= abzug2;	
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
    		document.getElementById("el11").innerText = "activé";
    		document.getElementById("el12").innerText = "Votre profile a été provisoirement activé pour une durée d'un an!";
    		document.getElementById("el13").innerText = "information sur votre entreprise ";
    		if(document.getElementById("el14")!=null){
    			document.getElementById("el14").innerText = "Vous n avez pas encore créer d'entreprise. svp cliquez sur profile->'créer votre entreprise,restaurant...etc' et entrer les informations requises sur votre entreprise!";
    		}
    		
    		if(document.getElementById("el15")!=null){
    			document.getElementById("el15").innerText = "Creation et publication de vos produits";
        		document.getElementById("el16").innerText = "Entrez les informations sur votre produit dans le formulaire ci-dessous, une fois cela fais,vous pouvez cliquer sur le produit crée à fin de télécharger ses photos,qui seront visible à vos clients.En fin vous pouvez cliquer sur 'mise en ligne'";
        		document.getElementById("el17").innerText = "nom";
        		document.getElementById("el18").innerText = "description";
        		document.getElementById("el19").innerText = "prix";
        		document.getElementById("el20").innerText = "marque";
        		document.getElementById("el21").innerText = "catégorie";
        		document.getElementById("el22").innerText = "restaurant";
        		document.getElementById("el23").innerText = "supermarché";
        		document.getElementById("el24").innerText = "fastfood";
        		document.getElementById("el25").innerText = "kiosque";
        		document.getElementById("el26").innerText = "boutique de mode";
        		document.getElementById("el27").innerText = "boutique normale";
        		document.getElementById("el28").innerText = "boutique d object ménagers";
        		document.getElementById("el29").innerText = "electronique";
        		document.getElementById("el30").innerText = "boisson";
        		document.getElementById("el31").innerText = "boulangerie";
        		document.getElementById("el32").innerText = "autres";
        		document.getElementById("el33").innerText =" Entrez la quantité puis choisir l unité ou cliquez sur illimité (unlimited)";
        		document.getElementById("el34").innerText ="quantité en stock";
        		document.getElementById("el35").innerText ="pièce";
        		document.getElementById("el36").innerText ="litre";
        		document.getElementById("el37").innerText ="illimité";
        		document.getElementById("el38").innerText ="choisissez la date d'expiration du produit ou cliquez sur 'aucune date'";
        		document.getElementById("el39").innerText ="date d'expration";
        		document.getElementById("el40").innerText ="aucune date";
        		document.getElementById("el41").innerText ="Entrer la date jusqu'à laquelle votre produits est sensé resté en ligne";
        		document.getElementById("el42").innerText ="en ligne jusqu'au ";
        		document.getElementById("el43").innerText ="temps";
        		document.getElementById("el44").innerText ="illimité";
        		document.getElementById("el45").innerText ="Quel est la durée maximale qu il faut à votre client pour que celui-ci ait récupéré ce produit chez vous. cette durée doit etre en heure et entier exemple: 2 .se qui veut dire dans 2 heures";
        		document.getElementById("el46").innerText ="durée";
        		document.getElementById("el47").innerText ="nouvelles commandes";
        		document.getElementById("el48").innerText ="Liste de produits crées";
        		document.getElementById("aktualisieren").innerText ="actualiser la page";
        		document.getElementById("erstellen").value ="créer";
        		document.getElementById("el300").innerText = "pharmacies";
        		
    			
    		}
    		
    		if(document.getElementById("s1")!=null){
    			document.getElementById("s1").innerText="nom";
    		}
    		if(document.getElementById("s2")!=null){
    			document.getElementById("s2").innerText="lieu";
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
 	    	var res10 =document.getElementsByClassName("uhr");
 	    	
 	    	
 	    	for(let i=0;i< res1.length; i++){
 	    		
 	    		if(res1[i]!=null){
 	    			res1[i].innerText= "informations sur le client";
	 	    		
 	    		}
				if(res2[i]!=null){
					res2[i].innerText="pseudo:	";
	 	    		
 	    		}
				if(res3[i]!=null){
					res3[i].innerText= "email:	";
	 	    			    			
				}
				if(res4[i]!=null){
					res4[i].innerText= "informations sur le produit	";
	 	    			
				}
				if(res5[i]!=null){
					res5[i].innerText= "name:	";
	 	    			
				}
				if(res6[i]!=null){
					res6[i].innerText= "prix:	";
	 	    			
				}
				if(res7[i]!=null){
					res7[i].innerText= "quantity commandé:	";	
				}
				if(res8[i]!=null){
					res8[i].innerText= "accepter";	
				}
				if(res9[i]!=null){
					res9[i].innerText= "rejéter";	
				}
				if(res10[i]!=null){
					res10[i].innerText= " heure(s)";	
				}
 	    		
 	    	}
 	    	
 	    	//für bereich produkt laden
 	    	
 	    var t1 =document.getElementsByClassName("t1");
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
 		
 		
 		
 		for(let i=0;i< t1.length; i++){
	    		
	    		if(t1[i]!=null){
	    			t1[i].innerText= "nom: ";
 	    		
	    		}
			if(t2[i]!=null){
				t2[i].innerText="prix:	";
 	    		
	    		}
			if(t3[i]!=null){
				t3[i].innerText= "description:	";
 	    			    			
			}
			if(t4[i]!=null){
				t4[i].innerText= "quantité en stock:	";
 	    			
			}
			if(t5[i]!=null){
				t5[i].innerText= "date d expiration:	";
 	    			
			}
			if(t6[i]!=null){
				t6[i].innerText= "marque :	";
 	    			
			}
			if(t7[i]!=null){
				t7[i].innerText= "en ligne jusqu au:	";	
			}
			if(t8[i]!=null){
				t8[i].innerText= "durée pour récupération:   ";	
			}
			if(t9[i]!=null){
				t9[i].innerText= "en ligne";	
			}
			if(t10[i]!=null){
				t10[i].innerText= "hors ligne";	
			}
			if(t11[i]!=null){
				t11[i].innerText= "à ";	
			}
			
	    		
	    	}
 		
 		var f =document.getElementsByClassName("f");
 		for(let i=0; i<f.length;i++){
 			if(f[i]!=null){
				f[i].innerText= abzug3;	
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
    		document.getElementById("el11").innerText = "aKtiviert";
    		document.getElementById("el12").innerText = "Ihr Profil ist zunächst 1 Jahrlang activiert!";
    		document.getElementById("el13").innerText = "Informationen über Ihr Unternehmen ";
    		if(document.getElementById("el14")!=null){
    			document.getElementById("el14").innerText = "Sie haben bisher kein Unternehmen erstellt. Bitte wechseln Sie auf Profil->'Unternehmen erstellen' und geben Sie notwendigen Informationen auf Ihr Unternehmen!";
    		}
    		
    		if(document.getElementById("el15")!=null){
    			document.getElementById("el15").innerText = "Produkterstellung und Veröffentlichung";
        		document.getElementById("el16").innerText = "Geben Sie die Informationen zu Ihrem Produkt in das untenstehende Formular ein, sobald Sie fertig sind, können Sie auf 'erstellen' klicken, um seine Bilder hochzuladen, die für Ihre Kunden sichtbar sein werden. Am Ende können Sie auf „Online“ klicken.";
        		document.getElementById("el17").innerText = "Name";
        		document.getElementById("el18").innerText = "Beschreibung";
        		document.getElementById("el19").innerText = "Preis";
        		document.getElementById("el20").innerText = "Marke";
        		document.getElementById("el21").innerText = "Kategorie";
        		document.getElementById("el22").innerText = "Restaurant";
        		document.getElementById("el23").innerText = "Supermarkt";
        		document.getElementById("el24").innerText = "Imbiss";
        		document.getElementById("el25").innerText = "Kiosk";
        		document.getElementById("el26").innerText = "Shop mode";
        		document.getElementById("el27").innerText = "allgemeine Shop";
        		document.getElementById("el28").innerText = "Drogerie Markt";
        		document.getElementById("el29").innerText = "Electronik";
        		document.getElementById("el30").innerText = "Getraenke";
        		document.getElementById("el31").innerText = "Baekerei";
        		document.getElementById("el32").innerText = "sonstiges";
        		document.getElementById("el33").innerText ="Geben Se die Menge im Lager sowie die Einheit ein oder klicken Sie auf unbegrenzt.";
        		document.getElementById("el34").innerText ="Menge im Lager";
        		document.getElementById("el35").innerText ="Stueck";
        		document.getElementById("el36").innerText ="Liter";
        		document.getElementById("el37").innerText ="unbegrenzt";
        		document.getElementById("el38").innerText ="Geben Sie das Ablaufdatum dieses Produkt oder klicken Sie auf 'Kein Datum'. ";
        		document.getElementById("el39").innerText ="Ablaufdatum";
        		document.getElementById("el40").innerText ="Kein Datum";
        		document.getElementById("el41").innerText ="Bis wann soll dieses Produkt Online bleiben.";
        		document.getElementById("el42").innerText ="Online bis";
        		document.getElementById("el43").innerText ="Uhrzeit";
        		document.getElementById("el44").innerText ="unbegenzt";
        		document.getElementById("el45").innerText ="Wie lange soll es dauern bis der Kunde dieses Produkt abgeholt hat. diese dauer muss in Stunden sein, zb: 2";
        		document.getElementById("el46").innerText ="Dauer";
        		document.getElementById("el47").innerText ="neue Bestellungen";
        		document.getElementById("el48").innerText ="Liste der erstellen Produkte";
        		document.getElementById("aktualisieren").innerText ="Seite aktualisieren";
        		document.getElementById("erstellen").value ="erstellen";
        		document.getElementById("el300").innerText = "Apotheken";
    		}
    		
    		
    		if(document.getElementById("s1")!=null){
    			document.getElementById("s1").innerText="Name";
    		}
    		if(document.getElementById("s2")!=null){
    			document.getElementById("s2").innerText="Standort";
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
 	    	var res10 =document.getElementsByClassName("uhr");
 	    	
 	    	
 	    	for(let i=0;i< res1.length; i++){
 	    		
 	    		if(res1[i]!=null){
 	    			res1[i].innerText= "informations auf den Kunden";
	 	    		
 	    		}
				if(res2[i]!=null){
					res2[i].innerText="Pseudo:	";
	 	    		
 	    		}
				if(res3[i]!=null){
					res3[i].innerText= "Email:	";
	 	    			    			
				}
				if(res4[i]!=null){
					res4[i].innerText= "information auf das produkt:	";
	 	    			
				}
				if(res5[i]!=null){
					res5[i].innerText= "Name:	";
	 	    			
				}
				if(res6[i]!=null){
					res6[i].innerText= "Preis:	";
	 	    			
				}
				if(res7[i]!=null){
					res7[i].innerText= "bestellte Menge:	";	
				}
				if(res8[i]!=null){
					res8[i].innerText= "annehmen";	
				}
				if(res9[i]!=null){
					res9[i].innerText= "ablehnen";	
				}
				if(res10[i]!=null){
					res10[i].innerText= "Stunde(n)";	
				}
 	    		
 	    	}
 	    	
 	    	//für bereich produkt laden
 	    	
 	    var t1 =document.getElementsByClassName("t1");
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
 		
 		
 		
 		for(let i=0;i< t1.length; i++){
	    		
	    		if(t1[i]!=null){
	    			t1[i].innerText= "Name: ";
 	    		
	    		}
			if(t2[i]!=null){
				t2[i].innerText="Preis:	";
 	    		
	    		}
			if(t3[i]!=null){
				t3[i].innerText= "Beschreibung:	";
 	    			    			
			}
			if(t4[i]!=null){
				t4[i].innerText= "Menge im Lager:	";
 	    			
			}
			if(t5[i]!=null){
				t5[i].innerText= "Ablaufdatum:	";
 	    			
			}
			if(t6[i]!=null){
				t6[i].innerText= "Marke :	";
 	    			
			}
			if(t7[i]!=null){
				t7[i].innerText= "Online bis:	";	
			}
			if(t8[i]!=null){
				t8[i].innerText= "dauer bis zur abholung:   ";	
			}
			if(t9[i]!=null){
				t9[i].innerText= "Online";	
			}
			if(t10[i]!=null){
				t10[i].innerText= "Offline";	
			}
			if(t11[i]!=null){
				t11[i].innerText= "um ";	
			}
			
	    		
	    	}
 		
 		var f =document.getElementsByClassName("f");
 		for(let i=0; i<f.length;i++){
 			if(f[i]!=null){
				f[i].innerText= abzug1;	
			}
 		}
 	    	
	 }
	    	
	    	
	    
			
	  			
	  	},10000);
	  		
	  		
	    	
		
		//language end
			
   </script>
</body>
</html>