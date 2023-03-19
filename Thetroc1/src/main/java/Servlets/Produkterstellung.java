package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VerkauferDAO;
import Model.Produkt;
import Model.Verkaufer;
import helpklasse.Datacheckprodukt;
import helpklasse.Registrationresult;

/**
 * Servlet implementation class Produkterstellung
 */
@WebServlet("/Produkterstellung")
public class Produkterstellung extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name = request.getParameter("nameprodukt");
		String preis = request.getParameter("preis");
		String waehrung= request.getParameter("waehrung");
		String marke =request.getParameter("marke");
		String kategorie = request.getParameter("kategorie");
		String beschreibung =request.getParameter("beschreibung");
		String ablaufdatum =request.getParameter("ablauf");
		String onlinebis =request.getParameter("dateonline");
		String onlinetime = request.getParameter("timeonline");
		String ablaufcheckbox = request.getParameter("ablaufcheckbox");
		String dateonlinecheckbox =request.getParameter("dateonlinecheckbox");
		String dauerbisabholung =request.getParameter("dauer");
		String mengewert = request.getParameter("menge");
		String mengeeinheit = request.getParameter("einheit");
		String mengecheckbox = request.getParameter("mengecheckbox");
		
		Produkt produkt = new Produkt(preis, languageconvertCategories(kategorie), name, dauerbisabholung);
		produkt.setBeschreibung(beschreibung);
		produkt.setWährung(waehrung);
		produkt.setMarke(marke);
		produkt.setStatus("offline");
		//zum Test
		Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
		//
		VerkauferDAO dao = new VerkauferDAO();
		List<Produkt>list =dao.getListProdukt(verkaufer);
		verkaufer.setProduktList(list);
		
		//Überprüfung ob die checkbox bei der erstellung eines Produkt gesetzt wurden
		if(ablaufcheckbox!=null && ablaufcheckbox.equals("on")) {
			ablaufdatum=null;
			if(request!=null && request.getSession().getAttribute("language").equals(0)) {
				produkt.setAblaufdatum(" not specified");
			}else if(request!=null && request.getSession().getAttribute("language").equals(1)) {
				produkt.setAblaufdatum("aucune date");
			}else if(request!=null && request.getSession().getAttribute("language").equals(2)) {
				produkt.setAblaufdatum("nicht vorhanden");
			}
			
		}else {
			
			produkt.setAblaufdatum(ablaufdatum);
		}
		
		if(dateonlinecheckbox !=null && dateonlinecheckbox.equals("on")) {
			
			onlinebis = null;
			onlinetime = null;
			if(request!=null && request.getSession().getAttribute("language").equals(0)) {
				produkt.setOnlinebis("unlimited");
				produkt.setOnlinetime("unlimited");
				
			}else if(request!=null && request.getSession().getAttribute("language").equals(1)) {
				produkt.setOnlinebis("illimité");
				produkt.setOnlinetime("illimité");
				
			}else if(request!=null && request.getSession().getAttribute("language").equals(2)) {
				produkt.setOnlinebis("unbegrenzt");
				produkt.setOnlinetime("unbegrenzt");
				
			}
			
		}else {
			produkt.setOnlinebis(onlinebis);
			produkt.setOnlinetime(onlinetime);
		}
		
		Datacheckprodukt datacheck = new Datacheckprodukt(produkt,request);
		
		//Überprüfung ob der Verkaufer die Menge eingegeben hat
		
		if(mengewert.equals("")  && mengecheckbox==null) {
			

			if(request!=null && request.getSession().getAttribute("language").equals(0)) {
				datacheck.getRegistrationresult().setCheckmenge("you must give a quantity");
				
			}else if(request!=null && request.getSession().getAttribute("language").equals(2)) {
				datacheck.getRegistrationresult().setCheckmenge("Sie müssen eine Menge eingeben");
			}else if(request!=null && request.getSession().getAttribute("language").equals(1)) {
				datacheck.getRegistrationresult().setCheckmenge("vous devez donner la quantité ");
			}
			
			
			
		}else {
			
			if(mengecheckbox!=null && mengecheckbox.equals("on")) {
				
				mengewert = null;
				mengeeinheit = null;
				if(request!=null && request.getSession().getAttribute("language").equals(0)) {
					produkt.setMenge("unlimited");
				}else if(request!=null && request.getSession().getAttribute("language").equals(2)){
					produkt.setMenge("unbegrenzt");
				}else if(request!=null && request.getSession().getAttribute("language").equals(1)) {
					produkt.setMenge("illimité");
				}
				
				datacheck.getRegistrationresult().setCheckmenge("");
				
			}else {
			
				produkt.setMenge(mengewert);
				produkt.setMengeeinheit(mengeeinheit);
				datacheck.getRegistrationresult().setCheckmenge("");
			}
			
		}
		
		if(datacheck.checkAll() && datacheck.getRegistrationresult().getCheckmenge().equals("")) {
			
			boolean check = dao.produktErstellung(produkt, verkaufer.getIdVerkaufer());
			if(check) {
				if(request!=null && request.getSession().getAttribute("language").equals(0)) {
					request.setAttribute("erstellungerfolg", "product successfully created");
					
				}else if(request!=null && request.getSession().getAttribute("language").equals(2)){
					request.setAttribute("erstellungerfolg", "produit crée avec succès");
					
				}else if(request!=null && request.getSession().getAttribute("language").equals(1)) {
					request.setAttribute("erstellungerfolg", "Das Produkt wurde erfolgreich erstellt");
					
				}
				request.getRequestDispatcher("WEB-INF/verkaufer_home.jsp").forward(request, response);
			}
			
		}else {
			
			request.getSession().setAttribute("fehlermeldung",datacheck.getRegistrationresult());
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("preis", preis);
			request.getSession().setAttribute("beschreibung", beschreibung);
			request.getSession().setAttribute("kategorie", kategorie);
			request.getSession().setAttribute("ablaufdatum", ablaufdatum);
			request.getSession().setAttribute("onlinebis", onlinebis);
			request.getSession().setAttribute("onlinetime", onlinetime);
			request.getSession().setAttribute("dauer", dauerbisabholung);
			request.getSession().setAttribute("ablaufcheckbox", ablaufcheckbox);
			request.getSession().setAttribute("dateonlinecheckbox", dateonlinecheckbox);
			request.getSession().setAttribute("marke", marke);
			request.getSession().setAttribute("währung", waehrung);
			request.getSession().setAttribute("menge", mengewert);
			request.getSession().setAttribute("einheit", mengeeinheit);
			request.getRequestDispatcher("WEB-INF/verkaufer_home.jsp").forward(request, response);
		}
		
		
		
	}
	
	
	public String languageconvertCategories(String option) {
		String rueck=option;
		switch(option) {
		case "Restaurant" :
			rueck = "Restaurant";
			break;
		case "Supermarket":
			rueck ="Supermarkt";
			break;
		case "snack":
			rueck= "Imbiss";
			break;
		case "kiosk" :
			rueck = "Kiosk";
			break;
		case "shop fashion":
			rueck ="Shop mode";
			break;
		case "general store":
			rueck="allgemeine Shop";
			break;
		case "drugstore" :
			rueck="Drogerie Markt";
			break;
		case "electronics":
			rueck="electronik" ;
			break;
		case "breverages":
			rueck="Getraenke";
			break;
		case "pharmacies":
			rueck="Apotheken";
			break;
		case "bakery":
			rueck="Baekerei";
			break;
		case "other":
			rueck ="sonstiges";
			break;
		case "Supermarché":
			rueck ="Supermarkt";
			break;
		case "fastfoods":
			rueck= "Imbiss";
			break;
		case "kiosque" :
			rueck = "Kiosk";
			break;
		case "boutique de mode":
			rueck ="Shop mode";
			break;
		case "boutique normale":
			rueck="allgemeine Shop";
			break;
		case "boutique d objet ménagers" :
			rueck="Drogerie Markt";
			break;
		case "electronique":
			rueck="Electronik" ;
			break;
		case "boisson":
			rueck="Getraenke";
			break;
		case "pharmacie":
			rueck="Apotheken";
			break;
		case "boulangerie":
			rueck="Baekerei";
			break;	
		case "autres":
			rueck ="sonstiges";
			break;
		default :
			rueck= option;
				
		}
		
		return rueck;
	}
	
}
