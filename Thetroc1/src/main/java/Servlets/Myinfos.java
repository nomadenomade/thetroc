package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.userDAO;
import Model.Rechnung;
import helpklasse.Registrationresult;

/**
 * Servlet implementation class Myinfos
 */
@WebServlet("/Myinfos")
public class Myinfos extends HttpServlet {
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type =request.getParameter("type");
		String datum = request.getParameter("datum");
		String idkaufer = (String)request.getSession().getAttribute("idkaufer");
		userDAO dao = new userDAO();
		
		if(type.equals("autoload_rechnung_kaufer")) {
			if(idkaufer !=null) {
				int idk = Integer.valueOf(idkaufer);
				List<Rechnung> listrechnung = dao.getRechnung("kaufer", idk,null);
				
				String result ="<div class='table-responsive-sm' style='max-height:500px; overflow-y:auto;'>"
						      + " <table class='table table-stripped ' >"
						      + "<thead  style='background-color:#48D1CC; color:white;'><tr>"
						      + "<th id='res1'>Nummer</th>"
						      + "<th id='res2'>Name</th>"
						      + "<th id='res3'>Gesamtmenge</th>"
						      + "<th id='res4'>Gesamtpreis</th>"
						      + "<th id='res5'>Verkaufer</th>"
						      + "<th id='res6'>Standort</th>"
						      + "<th id='res7'>Stadt</th>"
						      + "<th id='res8'>Datum</th>"
						      + "</tr></thead>"
						      + "<tbody  style='background-color:white;'>";
			for(Rechnung rech: listrechnung) {
				result+="<tr style='font-size:0.8em;'>";
				result+="<td>"+rech.getIdRechnung()+"</td>";
				result+="<td>"+rech.getNameProdukte()+"</td>";
				result+="<td>"+rech.getGesamtmenge()+"</td>";
				result+="<td>"+rech.getGesamtpreis()+"</td>";
				result+="<td>"+rech.getVerkaufer().getUnternehmen().getName()+"</td>";
				result+="<td>"+rech.getVerkaufer().getUnternehmen().getStandort()+"</td>";
				result+="<td>"+rech.getVerkaufer().getUnternehmen().getStadt()+"</td>";
				result+="<td>"+rech.getDatum()+"</td>";
				result+="</tr>";
			}
			
			result+="</tbody></table></div>";
			
			response.getWriter().print(result);	
			}
		}else if (type.equals("rechnung_filtern_kaufer")) {
			if(datum !=null) {
				String dat[] = datum.split("-");
				datum = dat[2]+"-"+dat[1]+"-"+dat[0];		
			}
			
			if(idkaufer !=null && datum !=null) {
				int idk = Integer.valueOf(idkaufer);
				List<Rechnung> listrechnung = dao.getRechnung("rechnung_filtern_kaufer", idk,datum);
				
				
				String result ="<div class='table-responsive-sm' style='max-height:500px; overflow-y:auto;'>"
						      + "<table class='table table-dark'>"
						      + "<thead><tr>"
						      + "<th id='res1'>Nummer</th>"
						      + "<th id='res2'>Name</th>"
						      + "<th id='res3'>Gesamtmenge</th>"
						      + "<th id='res4'>Gesamtpreis</th>"
						      + "<th id='res5'>Verkaufer</th>"
						      + "<th id='res6'>Standort</th>"
						      + "<th id='res7'>Stadt</th>"
						      + "<th id='res8'>Datum</th>"
						      + "</tr></thead>"
						      + "<tbody>";
			for(Rechnung rech: listrechnung) {
				result+="<tr style='font-size:0.8em;'>";
				result+="<td>"+rech.getIdRechnung()+"</td>";
				result+="<td>"+rech.getNameProdukte()+"</td>";
				result+="<td>"+rech.getGesamtmenge()+"</td>";
				result+="<td>"+rech.getGesamtpreis()+"</td>";
				result+="<td>"+rech.getVerkaufer().getUnternehmen().getName()+"</td>";
				result+="<td>"+rech.getVerkaufer().getUnternehmen().getStandort()+"</td>";
				result+="<td>"+rech.getVerkaufer().getUnternehmen().getStadt()+"</td>";
				result+="<td>"+rech.getDatum()+"</td>";
				result+="</tr>";
			}
			
			result+="</tbody></table></div>";
			
			response.getWriter().print(result);	
			}
		}else if (type.equals("gesamtpreis_kaufer")) {
			if(idkaufer !=null) {
				response.getWriter().print(dao.SummeGeld("kaufer", Integer.valueOf(idkaufer)));
			}
			
			
			
			
		}else if (type.equals("body_desk_seller")) {
			//begin
			
			String name = (String)request.getSession().getAttribute("name");
			String beschreibung = (String)request.getSession().getAttribute("beschreibung");
			String preis = (String)request.getSession().getAttribute("preis");
			String währung = (String)request.getSession().getAttribute("währung");
			String marke = (String)request.getSession().getAttribute("marke");
			String kategorie = (String)request.getSession().getAttribute("kategorie");
			String menge = (String)request.getSession().getAttribute("menge");
			String einheit = (String)request.getSession().getAttribute("einheit");
			String ablaufdatum = (String)request.getSession().getAttribute("ablaufdatum");
			String ablaufcheckbox = (String)request.getSession().getAttribute("ablaufcheckbox");
			String onlinebis = (String)request.getSession().getAttribute("onlinebis");
			String onlinetime = (String)request.getSession().getAttribute("onlinetime");
			String dateonlinecheckbox = (String)request.getSession().getAttribute("dateonlinecheckbox");
			String dauer = (String)request.getSession().getAttribute("dauer");
			
			Registrationresult result = (Registrationresult)request.getSession().getAttribute("fehlermeldung");
			String fehlermeldungname ="";
			String fehlermeldungpreis="";
			String fehlermeldungmenge="";
			String fehlermeldungablaufdatum="";
			String fehlermeldungonlinedate="";
			String fehlermeldungdauerabholprodukt="";
			
			if(result!=null) {
				fehlermeldungname = result.getChecknameprodukt();
				fehlermeldungpreis =result.getCheckpreisprodukt();
				fehlermeldungmenge = result.getCheckmenge();
				fehlermeldungablaufdatum = result.getCheckablaufdatum();
				fehlermeldungonlinedate = result.getCheckonlinedate();
				fehlermeldungdauerabholprodukt = result.getCheckdauerabholprodukt();
			}
			
			if(name ==null) {
				name="";
			}
			
			if(beschreibung ==null) {
				beschreibung="";
			}
			if(preis ==null) {
				preis="";
			}
			if(währung ==null) {
				währung="";
			}
			if( marke ==null) {
				 marke="";
			}
			if(kategorie ==null) {
				kategorie="";
			}
			if(menge ==null) {
				menge="";
			}
			if(einheit ==null) {
				einheit="";
			}
			if(ablaufdatum ==null) {
				ablaufdatum="";
			}
			if(ablaufcheckbox ==null) {
				ablaufcheckbox="";
			}
			if(onlinebis ==null) {
				onlinebis="";
			}
			if(onlinetime ==null) {
				onlinetime="";
			}
			if(dateonlinecheckbox ==null) {
				dateonlinecheckbox="";
			}
			if(dauer ==null) {
				dauer="";
			}
			
			
			
			
			
			String value ="<div class=\"container-fluid\" id=\"container1\">	\r\n"
					+ "	<hr>\r\n"
					+ "	<h5 class=\"text-white text-center lead\" style=\"font-weight:bold;\"  id=\"el15\">Produkterstellung und Veröffentlichung</h5>\r\n"
					+ "	<div  style=\"width:55%; font-size:0.9em; padding:12px; margin:auto;background-color:#ADD8E6;border-radius:12px;box-shadow: 2px 6px :#ADD8E6\"  id=\"el16\">Hier können Sie ein Produkt erstellen,Bilder für dieses Produkt einfügen,welche von Ihren Kunden werden gesehen werden können,und dieses Produkt dann veröffentlichen</div>\r\n"
					+ "	\r\n"
					///hier
					+ "	<div class=\"row\">\r\n"
					
					+ "		<div class=\"col-md-8 pt-3\">\r\n"
					+ "		\r\n"
					+ "	      <form class=\"mt-5\" action=\"Produkterstellung\">\r\n"
					+ "			<div class=\"card\" style=\"background-color:#F5F5F5; margin-top:50px;\">\r\n"
					+ "				<div class=\"card-body\">\r\n"
					+ "					<div class=\"row\">\r\n"
					+ "						<div class=\"col-sm-4\">\r\n"
					+ "							<span class=\"text-danger\">*</span>\r\n"
					+ "							<div class=\"form-outline mb-4\">\r\n"
					+ "								<input type=\"text\" name=\"nameprodukt\" id=\"nameprodukt\" class=\"form-control\" value=\""+name+"\">\r\n"
					+ "								<label for=\"nameprodukt\" class=\"form-label\"  id=\"el17\">Name</label>\r\n"
					+ "							</div>\r\n"
					+ "							<div id=\"namefehler\" style=\"color:red; font-size: 0.7em;\">"+fehlermeldungname+"</div>\r\n"
					+ "							<div class=\"form-outline mb-4\">\r\n"
					+ "								<textarea rows=\"5\" cols=\"8\" name=\"beschreibung\" id=\"beschreibung\" class=\"form-control\" value=\""+beschreibung+"\"></textarea>\r\n"
					+ "								<label for=\"beschreibung\" class=\"form-label\"  id=\"el18\">Beschreibung</label>\r\n"
					+ "							</div>\r\n"
					+ "						</div>\r\n"
					+ "						<div class=\"col-sm-8\">\r\n"
					+ "							<div class=\"row\">\r\n"
					+ "								<div class=\"col-sm-6\">\r\n"
					+ "								 \r\n"
					+ "								 	<div class=\"row\">\r\n"
					+ "								 		<div class=\"col\">\r\n"
					+ "								 			<span class=\"text-danger\">*</span>\r\n"
					+ "											<div class=\"form-outline mb-4\">\r\n"
					+ "												<input type=\"text\" name=\"preis\" id=\"preis\" class=\"form-control\" value=\""+preis+"\">\r\n"
					+ "												<label for=\"preis\" class=\"form-label\"  id=\"el19\">Preis</label>\r\n"
					+ "								   			</div>\r\n"
					+ "								   			 <div id=\"preisfehler\"  style=\"color:red; font-size: 0.7em;\">"+fehlermeldungpreis+"</div>\r\n"
					+ "								 		</div>\r\n"
					+ "								 		<div class=\"col\">\r\n"
					+ "								 			<span class=\"text-danger\">*</span>\r\n"
					+ "								 			<select class=\"form-control\" name=\"waehrung\" id=\"waehrung\" value=\""+währung+"\">\r\n"
					+ "								 				<option>Euro</option>\r\n"
					+ "								 				<option>Fcfa</option>\r\n"
					+ "								 				<option>dinar</option>\r\n"
					+ "								 				<option>dolar</option>\r\n"
					+ "								 			</select>\r\n"
					+ "								 		</div>\r\n"
					+ "								 	</div>\r\n"
					+ "								 	<div class=\"row\">\r\n"
					+ "								 		<div class=\"col\">\r\n"
					+ "								 			<div class=\"form-outline mb-4\">\r\n"
					+ "												<input type=\"text\" name=\"marke\" id=\"marke\" class=\"form-control\" value=\""+marke+"\">\r\n"
					+ "												<label for=\"marke\" class=\"form-label\"  id=\"el20\">Marke</label>\r\n"
					+ "											</div>\r\n"
					+ "								 		</div>\r\n"
					+ "								 	</div>\r\n"
					+ "									\r\n"
					+ "									\r\n"
					+ "									\r\n"
					+ "								</div>\r\n"
					+ "								<div class=\"col-sm-6\">\r\n"
					+ "								<span class=\"text-danger\">*</span>\r\n"
					+ "								<div class=\"form-group\" style=\"margin:auto;\">\r\n"
					+ "									<label for=\"kategorie\"  id=\"el21\">Kategorie</label>\r\n"
					+ "									<select class=\"form-control\" id=\"kategorie\" name=\"kategorie\" value=\""+kategorie+"\">\r\n"
					+ "										<option  id=\"el22\">Restaurant</option>\r\n"
					+ "										<option  id=\"el23\">Supermarkt</option>\r\n"
					+ "										<option  id=\"el24\">imbiss</option>\r\n"
					+ "										<option  id=\"el25\">kiosk</option>\r\n"
					+ "										<option  id=\"el26\">shop mode</option>\r\n"
					+ "										<option  id=\"el27\">allgemeine shop</option>\r\n"
					+ "										<option  id=\"el28\">Drogerie markt</option>\r\n"
					+ "										<option  id=\"el29\">Elekronik</option>\r\n"
					+ "										<option  id=\"el30\">Getraenke</option>\r\n"
					+ "										<option  id=\"el31\">Baeckerei</option>\r\n"
					+ "										<option  id=\"el300\">Apotheke</option>\r\n"
					+ "										<option  id=\"el32\">Sonstiges</option>\r\n"
					+ "									</select>\r\n"
					+ "								</div>\r\n"
					+ "								\r\n"
					+ "								<div class=\"row \">\r\n"
					+ "								<p style=\"font-size:0.9em\" class=\"lead mt-3 text-center\"  id=\"el33\">Geben Sie die Menge und wählen Sie die Einheit aus oder klicken Sie auf unbegrenzt.</p>\r\n"
					+ "								\r\n"
					+ "									<div class=\"col\">\r\n"
					+ "										<span class=\"text-danger\">*</span>\r\n"
					+ "										<div class=\"form-outline mb-2\" id=\"block1\">\r\n"
					+ "											<input type=\"text\" name=\"menge\" id=\"menge\" class=\"form-control\" value=\""+menge+"\">\r\n"
					+ "											<label for=\"menge\" class=\"form-label\"  id=\"el34\">Menge</label>\r\n"
					+ "										</div>	\r\n"
					+ "										<div id=\"block2\">\r\n"
					+ "											<select id=\"einheit\" name=\"einheit\" class=\"form-control\" value=\""+einheit+"\">\r\n"
					+ "												<option  id=\"el35\">Stueck</option>\r\n"
					+ "												<option>Kg</option>\r\n"
					+ "												<option  id=\"el36\">Liter</option>\r\n"
					+ "											</select>\r\n"
					+ "										</div>\r\n"
					+ "										\r\n"
					+ "										<div id=\"ablauffehler\"  style=\"color:red; font-size: 0.7em;\">"+fehlermeldungmenge+"</div>\r\n"
					+ "									\r\n"
					+ "									</div>\r\n"
					+ "									<div class=\"col\">\r\n"
					+ "										<span style=\"visibility:hidden\">*</span>\r\n"
					+ "										<div class=\"form-check\" id=\"block3\">\r\n"
					+ "											<input type=\"checkbox\" name=\"mengecheckbox\"  onclick=\"isChecked3(this)\" class=\"form-check-input\" id=\"mengecheckbox\">\r\n"
					+ "											<label for=\"mengecheckbox\" class=\"form-check-label\"  id=\"el37\">unbegrenzt </label>\r\n"
					+ "											\r\n"
					+ "										</div>\r\n"
					+ "									</div>\r\n"
					+ "								</div>\r\n"
					+ "								</div>\r\n"
					+ "							</div>\r\n"
					+ "							<div class=\"row\">\r\n"
					+ "								<p style=\"font-size:0.9em\" class=\"lead text-center mt-4\"  id=\"el38\">Wählen Sie das Ablaufdatum des Produkts oder klicken Sie auf \"Kein Datum\"</p>\r\n"
					+ "								<div class=\"col\">\r\n"
					+ "									<div id=\"blockablauf\">\r\n"
					+ "										<span class=\"text-danger\">*</span>\r\n"
					+ "										<div class=\"form-outline\">\r\n"
					+ "											<input type=\"date\" name=\"ablauf\" id =\"ablauf\" class=\"form-control\" value=\""+ablaufdatum+"\">\r\n"
					+ "											<label for=\"ablauf\" class=\"form-label\"  id=\"el39\">ablaufdatum</label>\r\n"
					+ "										</div>\r\n"
					+ "										<div id=\"ablauffehler\"  style=\"color:red; font-size: 0.7em;\">"+fehlermeldungablaufdatum+"</div>\r\n"
					+ "									</div>\r\n"
					+ "									\r\n"
					+ "													\r\n"
					+ "								</div>\r\n"
					+ "								<div class=\"col\">\r\n"
					+ "									<span style=\"visibility:hidden\">*</span>\r\n"
					+ "									<div class=\"form-check\">\r\n"
					+ "											<input type=\"checkbox\" name=\"ablaufcheckbox\" onclick=\"isChecked2(this)\" class=\"form-check-input\" id=\"ab\">\r\n"
					+ "											<label for=\"ab\" class=\"form-check-label\"  id=\"el40\">Kein Datum </label>\r\n"
					+ "											\r\n"
					+ "									</div>\r\n"
					+ "									<input type=\"hidden\" id=\"ablaufcheckboxhidden\" value=\""+ablaufcheckbox+"\">\r\n"
					+ "								</div>\r\n"
					+ "								\r\n"
					+ "							</div>\r\n"
					+ "						</div>		\r\n"
					+ "					</div>\r\n"
					+ "					\r\n"
					+ "					<div class=\"row\">\r\n"
					+ "						<div class=\"row\">\r\n"
					+ "							<div class=\"col-sm\" style=\" margin-top:10px;\">\r\n"
					+ "								<div class=\"card\">\r\n"
					+ "									<div class=\"card-body\">\r\n"
					+ "										<p class=\"text-center lead\" style=\"font-size:0.9em\"  id=\"el41\">geben Sie das Datum, bis wann dieses Angebot Online bleiben soll</p>\r\n"
					+ "										<span class=\"text-danger\">*</span>\r\n"
					+ "											<div id=\"blockdate\">\r\n"
					+ "												<div class=\"form-outline mb-4\">\r\n"
					+ "													<input type=\"date\" name=\"dateonline\"   id =\"dateonline\" class=\"form-control\" value=\""+onlinebis+"\">\r\n"
					+ "													<label for=\"dateonline\" class=\"form-label\"  id=\"el42\">Online bis</label>\r\n"
					+ "												</div>\r\n"
					+ "												<div id=\"onlinedatefehler\"></div>	\r\n"
					+ "												\r\n"
					+ "															\r\n"
					+ "												<div class=\"form-outline mb-4\"> \r\n"
					+ "													<input type=\"time\" name=\"timeonline\"   id=\"timeonline\" class=\"form-control\" class=\"form-control\" value=\""+onlinetime+"\">\r\n"
					+ "													<label for=\"timeonline\" class=\"form-label\"  id=\"el43\">Uhrzeit</label>\r\n"
					+ "												</div>\r\n"
					+ "											</div>\r\n"
					+ "											\r\n"
					+ "											<div class=\"form-check\" id=\"kein1\">\r\n"
					+ "														<input type=\"checkbox\" name=\"dateonlinecheckbox\" onclick=\"isChecked(this)\" class=\"form-check-input\" id=\"doc\">\r\n"
					+ "														<label for=\"doc\" class=\"form-check-label\"  id=\"el44\">unbegrenzt </label>							\r\n"
					+ "											</div>\r\n"
					+ "											<div id=\"onlinetimefehler\"  style=\"color:red; font-size: 0.7em;\">"+fehlermeldungonlinedate+"</div>\r\n"
					+ "											<input type=\"hidden\" id=\"dateonlinecheckboxhidden\" value=\""+dateonlinecheckbox+"\">\r\n"
					+ "									</div>\r\n"
					+ "								</div>				\r\n"
					+ "						</div>\r\n"
					+ "						<div class=\"col-sm\" style=\" margin-top:10px;\">\r\n"
					+ "							<div class=\"card\">\r\n"
					+ "								<div class=\"card-body\">\r\n"
					+ "									<p class=\"text-center lead\" style=\"font-size:0.9em\"  id=\"el45\">wie lange soll es maximal dauer bis der kunde sein Produkt abgeholt hat.Diese Dauer muss in Stunden sein zb: 2</p>\r\n"
					+ "									<span class=\"text-danger\">*</span>\r\n"
					+ "									<div class=\"form-outline mb-4\">					\r\n"
					+ "										<input type=\"text\" name=\"dauer\" id=\"dauer\" class=\"form-control\"value=\""+dauer+"\">\r\n"
					+ "										<label for=\"dauer\" class=\"form-label\"  id=\"el46\">Dauer</label>\r\n"
					+ "									</div>\r\n"
					+ "									<div id=\"dauerfehler\"  style=\"color:red; font-size: 0.7em;\" >"+fehlermeldungdauerabholprodukt+"</div>\r\n"
					+ "								</div>\r\n"
					+ "							</div>\r\n"
					+ "						\r\n"
					+ "						</div>\r\n"
					+ "						</div>\r\n"
					+ "						<div class=\"row mt-5\">\r\n"
					+ "							<div style=\"width:50%; margin:auto;\" class=\"mb-4 \">\r\n"
					+ "								<input type=\"submit\" name=\"erstellen\"   style=\"width:200px; border:1px solid #48D1CC;border-radius:200px; padding:5px; font-size:0.9em;background-color:#48D1CC;color: white; margin:auto;\"  id=\"erstellen\"  value=\"erstellen\">\r\n"
					+ "							</div>		\r\n"
					+ "						</div>\r\n"
					+ "						\r\n"
					+ "					</div>\r\n"
					+ "					\r\n"
					+ "				</div>\r\n"
					+ "			</div>		\r\n"
					+ "			</form>\r\n"			
					+ "		</div>\r\n"
					+ "		<div class=\"col-md-4\">\r\n"
					+ "			<h5 class=\"text-white text-center lead mb-3\"  style=\"margin-top:25px;font-weight:bold;\"  id=\"el47\">neue Bestellungen</h5>\r\n"
					+ "	\r\n"
					+ "			<div class=\"card\" style=\"max-height:800px; overflow-y:auto;\">\r\n"
					+ "			\r\n"
					+ "			<div class=\"card-body\">\r\n"
					+ "				\r\n"
					+ "				<div id=\"neuebestellung\"></div>\r\n"
					+ "			</div>\r\n"
					+ "			\r\n"
					+ "			</div>		\r\n"
					+ "		</div>\r\n"
					+ "	</div>\r\n"
					
					+ "	\r\n"
					+ "	\r\n"
					+ "	\r\n"
					+ "	<hr>\r\n"
					+ "	<h5 class=\"text-white text-center lead\"  style=\"margin-top:25px;font-weight:bold;\"  id=\"el48\">Liste der erstellten Produkte</h5>\r\n"
					+ "	<div class=\"card\">\r\n"
					+ "		<div class=\"card-body\" id=\"content\" Style=\"max-height:600px;overflow-y:auto;background-color:#F5F5F5;\"></div>\r\n"
					+ "	</div>\r\n"
					+ "	\r\n"
					+ "	\r\n"
					+ "	\r\n"
					+ "</div>\r\n"
					+ "<div class=\"mt-4 mb-4 \" id=\"bb\">\r\n"
					+ "	<button  style=\"width:200px; border:1px solid green;border-radius:200px; padding:5px; font-size:0.9em;background-color:green;color: white; margin:auto;\" onclick=\"allonline()\" id=\"online\">all Online</button>\r\n"
					+ "	<button  style=\"width:200px; border:1px solid #red;border-radius:200px; padding:5px; font-size:0.9em;background-color:red;color: white; margin:auto;\" id=\"offline\" onclick=\"alloffline()\">all Offline</button>\r\n"
					+ "	<button  id=\"aktualisieren\" style=' border:1px solid #D3D3D3;border-radius:200px;margin-left:50px;  background-color:#D3D3D3;' onclick=\"aktualisieren()\" >aktualisieren</span>\r\n"
					+ "</div>\r\n"
					+ "";
			
			//end
			response.setContentType("text/html;charset=UTF-8");	
			response.getWriter().print(value);
		}
			
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
