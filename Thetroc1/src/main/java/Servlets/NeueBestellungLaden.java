package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VerkauferDAO;
import DAO.userDAO;
import Model.Foto;
import Model.Verkaufer;
import Model.Warenkob;

/**
 * Servlet implementation class NeueBestellungLaden
 */
@WebServlet("/NeueBestellungLaden")
public class NeueBestellungLaden extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VerkauferDAO dao = new VerkauferDAO();
		userDAO dao2 = new userDAO();
		String param = request.getParameter("type");
		
		String result = "";
		Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
		
		if(param.equals("bestellungerhalten")) {
			
			if(request.getSession().getAttribute("verkaufer") !=null){
				List <Warenkob> list = dao.getListAktuellBestellung(verkaufer.getIdVerkaufer());
				if(list.size()==0) {
					result+="<div class='row'>";
					result+="<div class='col-sm-4 mt-5'></div>";
					result+="<div class='col-sm-4 mt-5'><img src='"+request.getContextPath()+"/img/empty2.png' width='100%' height='auto' alt='empty'/></div>";
					result+="<div class='col-sm-4 mt-5'></div>";
					result+="</div>";
				}else {
					for(Warenkob warenkob: list) {
						result+="<div class='card mb-3' style='background-color:#F0F8FF;'>";
						result+="<div class='card-body'>";
						result+="<div class='row'>";
						result+="<div class='col-sm'>";//erste Spalte
						result+="<div class='text-center res1' style='font-weight:bold; font-size:1em;'>Infos über den Kaufer</div>";
						result+="<div><span class='lead res2' style='font-weight:bold; font-size:0.8em;'>Pseudo          :  </span><span class='lead' style='font-size:0.7em;'>"+warenkob.getKaufer().getPseudo()+"</span></div>";
						result+="<div><span class='lead res3' style='font-weight:bold; font-size:0.8em;'>Email           :  </span><span class='lead' style='font-size:0.7em;'>"+warenkob.getIdKaufer().getPerson().getEmail()+"</span></div>";			
						
						result+="</div>";//ende erster Spalte
						result+="<div class='col-sm'>";//zweiter Spalte
						result+="<div class='text-center res4' style='font-weight:bold; font-size:1em;'>Infos über das Produkte</div>";
						result+="<div><span class='lead res5' style='font-weight:bold; font-size:0.8em;'>Name        :  </span><span class='lead' style='font-size:0.7em;'>"+warenkob.getProdukt().getName()+"</span></div>";
						result+="<div><span class='lead res6' style='font-size:0.8em;font-weight:bold;'>Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+warenkob.getProdukt().getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+warenkob.getProdukt().getWährung()+"</span></div>";	   
						result+="<div><span class='lead res7' style='font-weight:bold; font-size:0.8em;'>bestellte Anzahl         :  </span><span class='lead' style='font-size:0.7em;'>"+warenkob.getMenge()+"</span></div>";			
						//foto
						Foto firstfoto = dao.getFirstFotoProdukt(warenkob.getProdukt().getIdProdukt());
						
						if(firstfoto!=null && firstfoto.getName()!=null ) {
							
							result+="<img alt='bild' class='produkt card-img-top' style='width:100%; height:auto;' src='Dateien/"+verkaufer.getPerson().getEmail()+"/"+firstfoto.getName()+"'/>";
							
						}
						//foto end
						result+="<button class=' ml-1 mr-3 mt-2 mb-1 res8' style='margin:auto;width:200px; border:1px solid green;border-radius:200px; padding:5px; font-size:0.8em;background-color:green;color: white;'  onclick='bestellungannahme("+warenkob.getIdWarenkob()+")'>annehmen</button>";
						result+="<button class=' res9' style=\"margin:auto;width:200px; border:1px solid red;border-radius:200px; padding:5px; font-size:0.8em;background-color:red;color: white; \" onclick='storno("+warenkob.getIdWarenkob()+")'>absagen</button>";
						
						result+="</div>";//ende zweiter Spalte
						result+="</div>";
						result+="</div>";//end card-body
						result+="</div>";
					}
				}
				
			}else{
				result="vide";
			}
			
			response.getWriter().print(result);
		}else if(param.equals("bestellungconfirm")) {
			
			String idwaren = request.getParameter("idwarenkob");
			SimpleDateFormat dataformat = new SimpleDateFormat("dd-MM-yyyy,k:mm:ss");
			Date date = new Date();
			String datestring = dataformat.format(date);
			
			if(idwaren!=null) {
				int idwarenkob = Integer.valueOf(idwaren);
				boolean rueck=dao.updateWarenkob(datestring,"bestaetigt",idwarenkob);
				response.getWriter().print(rueck);
			}
			
			
		}else if (param.equals("bestellungdelete")) {
			String idwaren = request.getParameter("idwarenkob");
			
			if(idwaren!=null) {
				int idwarenkob = Integer.valueOf(idwaren);
				boolean rueck=dao2.deleteWarenkob(idwarenkob);
				response.getWriter().print(rueck);
			}
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
