<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mdb.min.css" />
<style type="text/css">
	#panel2{
		min-width:900px;
		min-height:500px;
		top:200px;
		left:300px;
	}
	#panel3{
		min-width:900px;
		min-height:500px;
		margin:auto;
		top:200px;
		left:300px;
	}
	
	@media screen and (max-width:1020px){
		#panel2{
		min-width:80%;
		min-height:500px;
		top:100px;
		left:50px;
		right: 50px;
		}
		#panel3{
			min-width:80%;
			min-height:500px;
			top:100px;
			left:50px;
			right: 50px;
		}
	@media screen and (max-width:992px){
		#panel2{
		min-width:80%;
		min-height:500px;
		top:100px;
		left:50px;
		right: 50px;
		}
		#panel3{
			min-width:80%;
			min-height:500px;
			top:100px;
			left:50px;
			right: 50px;
		}
	}
	@media screen and (max-width:600px){
		#panel2{
		min-width:100%;
		min-height:500px;
		top:50px;
		left:2px;
		right:2px;
		}
		#panel3{
			min-width:100%;
			min-height:500px;
			top:50px;
			left:2px;
			right: 2px;
			}
	}

</style>
</head>
<body>
	<div>
		<div style="
					height:auto;
			 		position:absolute;
			 		index-z:1;
			 	    ">
			
				<img alt="" width="100%" height="auto" style="margin-top:25%;" src="<%= request.getContextPath()%>/img/logo3.png">
				 
		</div>
		
		<div id ="panel2" style="position:absolute;index-z:2; background-color:black; opacity:0.8;border-radius:5px; ">
		
		</div>
		<div id ="panel3" style="position:absolute;index-z:3; ">
			<div class="lead" style="text-align:center;font-size:2.1em;color:red; font-weight:bold;margin-top:20px;">The following account has temporaly been locked !</div>
			<div class="mt-4 text-center text-white lead" id="emailuser" style="font-weight:bold; font-size:1.2em;"><span class="text-danger" >Email :</span><%= request.getSession().getAttribute("email") %></div>
			<div class="mt-2  text-center text-white lead" id="pseudo" style="font-weight:bold; font-size:1.2em;"><span class="text-danger">Pseudo :</span><%= request.getSession().getAttribute("pseudo") %></div>
			<div class="text-white text-center lead mt-3" style="font-weight:bold; font-size:1.0em;"><span class="lead ml-2 text-success">Reason: </span> You have already used all your 4 account's lives </div>
			<div class="text-white text-center  lead mt-5" style="font-weight:bold; font-size:1.0em;">Please contact us at <span class="lead ml-2 text-success"> thetroc-service-support@gmail.com </span> to know the modalities to unlock it !</div>
		
		</div>
	</div>

</body>
</html>