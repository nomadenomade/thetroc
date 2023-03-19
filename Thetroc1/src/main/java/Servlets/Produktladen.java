package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VerkauferDAO;
import Model.Foto;
import Model.Person;
import Model.Produkt;
import Model.Verkaufer;

/**
 * Servlet implementation class Produktladen
 */
@WebServlet("/Produktladen")
public class Produktladen extends HttpServlet {
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
		VerkauferDAO dao = new VerkauferDAO();
		List<Produkt>list =dao.getListProdukt(verkaufer);
		verkaufer.setProduktList(list);
		String result ="<div class='row'>";
		if(list.size()==0) {
			result+="<div class='col-sm-4 mt-5'></div>";
			result+="<div class='col-sm-4 mt-5'><img src='"+request.getContextPath()+"/img/empty2.png' width='100%' height='auto' alt='empty'/></div>";
			result+="<div class='col-sm-4 mt-5'></div>";
		}else {
			for (Produkt prod : list) {
				if(prod.getName()==null) {
					prod.setName("");
				}
				if(prod.getBeschreibung()==null) {
					prod.setBeschreibung("");
				}
				if(prod.getPreis()==null) {
					prod.setPreis("");;
				}
				if(prod.getWährung()==null) {
					prod.setWährung("");
				}
				if(prod.getName()==null) {
					prod.setName("");
				}
				if(prod.getKategorie()==null) {
					prod.setKategorie("");
				}
				if(prod.getAblaufdatum()==null) {
					prod.setAblaufdatum("");
				}
				if(prod.getDauerbisabholung()==null) {
					prod.setDauerbisabholung("");
				}
				if(prod.getOnlinebis() ==null) {
					prod.setOnlinebis("");
				}
				if(prod.getOnlinetime()==null) {
					prod.setOnlinetime("");
				}
				if(prod.getMarke()==null) {
					prod.setMarke("");
				}
				if(prod.getMenge()==null) {
					prod.setMenge("");
				}
				if(prod.getMengeeinheit()==null) {
					prod.setMengeeinheit("");
				}
				
				Foto firstfoto = dao.getFirstFotoProdukt(prod.getIdProdukt());
				result+= "<div class='col-sm mt-5'><a  href='"+request.getContextPath()+"/RequestReSendSeller?name=produktbilderladen&idprodukt="+prod.getIdProdukt()+"&produktname="+prod.getName()+"'>";
				result+= "<div class='card text-black' style=' max-width:320px;margin:auto; height:auto;  '>";
				
				if(firstfoto!=null && firstfoto.getName()!=null ) {
					result+="<img alt='bild' class='produkt card-img-top' style='width:100%; height:auto;' src='Dateien/"+verkaufer.getPerson().getEmail()+"/"+firstfoto.getName()+"'/>";
					
				}
				
				result+="<div class='card-body'>";
				result+="<div class='row'>";
				result+="<div class='col-8'>";
				result+="<div><span class='lead t1' style='font-weight:bold; font-size:0.8em;'>Name               :</span><span class='lead' style='font-size:0.7em'>"+prod.getName()+"</span></div>";
				result+="<div><span class='lead t2' style='font-size:0.8em;font-weight:bold;'>Preis               :</span><span class='lead' style='font-size:0.7em;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.7em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
			    result+="<div><span class='lead t3' style='font-weight:bold; font-size:0.8em;'>Beschreibung               :</span><span class='lead' style='font-size:0.7em'>"+prod.getBeschreibung()+"</span></div>";
			    result+="<div><span class='lead t4' style='font-weight:bold; font-size:0.8em;'>Menge im Lager               :</span><span class='lead' style='font-size:0.7em'>"+prod.getMenge()+"</span>  <span class='lead text-primary' style='font-size:0.7em;font-weight:bold;'>"+prod.getMengeeinheit()+"</span></div>";
			    result+="<div><span class='lead t5' style='font-weight:bold; font-size:0.8em;'>Ablaufdatum               :</span><span class='lead' style='font-size:0.7em'>"+prod.getAblaufdatum()+"</span></div>";
			    result+="<div><span class='lead t6' style='font-weight:bold; font-size:0.8em;'>Marke               :</span><span class='lead' style='font-size:0.7em'>"+prod.getMarke()+"</span></div>";
			    result+="<div><span class='lead t7' style='font-weight:bold; font-size:0.8em;'>Online bis               :</span><span class='lead' style='font-size:0.7em'>"+prod.getOnlinebis()+"   <span class='t11'>Um</span>:</span><span class='lead' style='font-size:0.7em'>"+prod.getOnlinetime()+"</span></div>";
			    result+="<div><span class='lead t8' style='font-weight:bold; font-size:0.8em;'>Dauer bis zur Abholung               :</span><span class='lead' style='font-size:0.7em'>"+prod.getDauerbisabholung()+" <span class='uhr'></span></span></div>";
			    result+="</div>";
			    result+="<div class='col-4'>";
			    result+="<h5 class='lead text-center' style='font-weight:bold;'><u>Status</u></h5>";
			    if(prod.getStatus()!=null&& prod.getStatus().equals("online")) {
			    	 result+="<div class='text-success text-center mt-1 t9' style='font-size:0.9em; font-weight:bold;'>Online</div>";
			    }else if(prod.getStatus()!=null&&prod.getStatus().equals("offline")) {
			    	 result+="<div class='text-danger text-center mt-1 t10' style='font-size:0.9em;font-weight:bold;'>Offline</div>";
			    }
			   
			    result+="</div>";
			    result+="</div>";
			    result+="</div>";
			    result+="</div></a></div>";
				
			
			}
		}
		
		
		result +="</div>";
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
