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
		<div>
			<h1 class="text-center text-white mt-3" style="font-weight:bold;" id="el3"> Bisherige Rechnungen</h1>
			
			<div class="row mt-2">
				<div class="col-sm-2 mb-3">
					<div style= "background-color:white;padding:2px;margin:auto; width:95%;">
						<div class="mt-1 text-center" style="max-width: 85%; margin:auto; font-size:0.8em;" id="el4"> Mit diesem Filter können Sie Liste der Rechnungsergebnisse angrenzen, indem Sie ein Datum definieren</div>
						<h3 class="text-center mt-1" style="color:#48D1CC;" id="el5" >Filter:</h3>
						<input type="date" class="form-control mt-1" id="el6"/>
						<button class="btn btn-sm btn-primary mt-1" id="filterbutton" onclick="filtern()" >filtern</button>
					</div>		
				</div>
				<div class="col-sm-10">
					<div  id="inhalt"></div>
				</div>
			</div>
			
			<h1 class="text-center text-white mt-3 mb-1" style="font-weight:bold;" id="el7"> Gesamts-Geldausgabe</h1>
			
			<div id="gesamtpreis" class ="text-center" style =" font-size:4.0em;margin-bottom:10px;color: green; background-color: white; margin:auto; height:300px; width:300px;padding:90px; border: 1px solid white; border-radius:50%;">
					
			</div>
			
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
    	  
  // Load bills
  		  var XmL = initRequest();
    		  XmL.onreadystatechange = function(){
    			  if(this.readyState==4 && this.status==200){
    				 document.getElementById("inhalt").innerHTML= this.responseText;
    			  }
    				 
    		  };
    		  
    		  XmL.open("GET","Myinfos?type=autoload_rechnung_kaufer",true);
    		  XmL.send();
    		  
    		  var xmL = initRequest();
    		  xmL.onreadystatechange = function(){
    			  if(this.readyState==4 && this.status==200){
    				 document.getElementById("gesamtpreis").innerHTML= this.responseText;
    			  }
    				 
    		  };
    		  
    		  xmL.open("GET","Myinfos?type=gesamtpreis_kaufer",true);
    		  xmL.send();
    		  
    	  function filtern(){
    		  var datum = document.getElementById("el6").value;
    		  var XML = initRequest();
    		  XML.onreadystatechange = function(){
    			  if(this.readyState==4 && this.status==200){
    				 document.getElementById("inhalt").innerHTML= this.responseText;
    			  }
    				 
    		  };
    		  
    		  XML.open("GET","Myinfos?datum="+datum+"&type=rechnung_filtern_kaufer",true);
    		  XML.send();
    	  }
    	      
    	  
    	//language
          
          setInterval(function(){
  	    	var lg = <%= request.getSession().getAttribute("language")%>
  	    	
  	    	if(parseInt(lg)==0){
  	    		
  	    		
  	    		document.getElementById("el2").innerText = "Back";
  	    		document.getElementById("el3").innerText = "Current bills !";
  	    		document.getElementById("el4").innerText = "With this Filter you can limit the billsresult by defining a date";
  	    		document.getElementById("el5").innerText = "Filter";
  	    		document.getElementById("el7").innerText = "total expense";
  	    		document.getElementById("filterbutton").innerText = "filter";
  	    		
  	    		if(document.getElementById("res1")!=null){
  	    			document.getElementById("res1").innerText= "ID-Number";
  	  	    		document.getElementById("res2").innerText= "Name";
  	  	    		document.getElementById("res3").innerText= "Quantity";
  	  	    		document.getElementById("res4").innerText="Price";
  	  	    		document.getElementById("res5").innerText="Seller";
  	  	    		document.getElementById("res6").innerText="Location"
  	  	    		document.getElementById("res7").innerText="City";
  	  	    		document.getElementById("res8").innerText="Date";
  	    		}
  	    		
  	    			
  	 	    	
  	    	}else if(parseInt(lg)==1){
  	    		
  	    		document.getElementById("el2").innerText = "retour";
  	    		document.getElementById("el3").innerText = "Tout les Factures actuelle!";
  	    		document.getElementById("el4").innerText = "Limitez le resultat de la recherche avec le filtre ci-dessous";
  	    		document.getElementById("el5").innerText = "Filtre";
  	    		document.getElementById("el7").innerText = "Dépense total";
  	    		document.getElementById("filterbutton").innerText = "filtrer";
  	    		
  	    		if(document.getElementById("res1")!=null){
  	    			document.getElementById("res1").innerText= "Numéro";
  	  	    		document.getElementById("res2").innerText= "Nom";
  	  	    		document.getElementById("res3").innerText= "Quantité";
  	  	    		document.getElementById("res4").innerText="Prix";
  	  	    		document.getElementById("res5").innerText="Vendeur";
  	  	    		document.getElementById("res6").innerText="Lieu"
  	  	    		document.getElementById("res7").innerText="Cité";
  	  	    		document.getElementById("res8").innerText="Date";
  	    		}
  	    			
  	    		
  	    	}else if(parseInt(lg)==2){
  	    		document.getElementById("el2").innerText = "zurück";
  	    		document.getElementById("el3").innerText = "Alle actuelle Rechnungen! ";
  	    		document.getElementById("el4").innerText = "Mit diesem Filter können Sie Liste der Rechnungsergebnisse angrenzen, indem Sie ein Datum definieren";
  	    		document.getElementById("el5").innerText = "Filter";
  	    		document.getElementById("filterbutton").innerText = "filtern";
  	    		document.getElementById("el7").innerText = "Gesamts-Geldausgabe";
  	    		
  	    		if(document.getElementById("res1")!=null){
  	    			document.getElementById("res1").innerText= "ID-Nummer";
  	  	    		document.getElementById("res2").innerText= "Name";
  	  	    		document.getElementById("res3").innerText= "Menge";
  	  	    		document.getElementById("res4").innerText="Preis";
  	  	    		document.getElementById("res5").innerText="Verkaufer";
  	  	    		document.getElementById("res6").innerText="Standort"
  	  	    		document.getElementById("res7").innerText="Stadt";
  	  	    		document.getElementById("res8").innerText="Datum";
  	    		}
  	    			
  	    	}
  	    	
  	    	
  	    },500);
  	    
      
        
        //end
    	  
    </script>
  </body>
</html>
