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
import Model.Produkt;

/**
 * Servlet implementation class Kundensuche
 */
@WebServlet("/Kundensuche")
public class Kundensuche extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kategorie = request.getParameter("kategorie");
		String suche = request.getParameter("suche");
		String umkreis =request.getParameter("umkreis");
		String online =request.getParameter("online");
		String stadt = request.getParameter("stadt");
		String stadtviertel = request.getParameter("stadtviertel");
		String unternehmensname = request.getParameter("unternehmensname");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		
		String type = request.getParameter("type");
		String result= "";
		if(kategorie.equals("--")) {
			kategorie= "";
		}
		//diese Angaben werden zuerst auf deutsch übersetzt fall der Benutzer eine andere Sprache verwendet
		
		kategorie =languageconvertCategories(kategorie);
		online = languageConvertOnline(online);
			
		if(umkreis.equals("unlimited") || umkreis.equals("illimité")) {
			umkreis="unbegrenzt";
		}
		
		// calculate the actual year
		SimpleDateFormat dataformat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		String datestring = dataformat.format(date);
		int actualyear= Integer.valueOf(datestring.split("-")[2]);
		
		VerkauferDAO dao1 = new VerkauferDAO();
		userDAO dao = new userDAO();
		//List<Produkt> list = dao.produktSuche(kategorie, suche, umkreis, online, stadt, stadtviertel, unternehmensname,lat,lng);
		List<Produkt> list = null;
		int anzahldatensatz = dao.getAnzahlDatensatz(kategorie, suche, umkreis, online, stadt, stadtviertel, unternehmensname, lat, lng);
		int anzahlpaginationseite = 0;
		int anzahlpaginationseitemodulo=0;
		
		if(type!=null && type.equals("firstload")) {
			if(anzahldatensatz<=10) {
				list = dao.produktSucheMitLimit(kategorie, suche, umkreis, online, stadt, stadtviertel, unternehmensname, lat, lng,0, anzahldatensatz);

			}else {
				list = dao.produktSucheMitLimit(kategorie, suche, umkreis, online, stadt, stadtviertel, unternehmensname, lat, lng,0, 10);
				anzahlpaginationseite = anzahldatensatz/10;
				anzahlpaginationseitemodulo = anzahldatensatz % 10;
			
			}
			
			
			result ="<div class='row'>";
			if(list.size()==0) {
				result+="<div class='col-sm-4 mt-5'></div>";
				result+="<div class='col-sm-4 mt-5'><img src='"+request.getContextPath()+"/img/empty.png' width='100%' height='auto' alt='empty'/></div>";
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
					
					//rueckgabe datereg in der form 11-03-2023 06:28:31
					String datereg = prod.getVerkaufer().getPerson().getDatum();
					int yearregistration = Integer.valueOf(datereg.split(" ")[5]);
					int diffyear = actualyear-yearregistration;

					Foto firstfoto = dao1.getFirstFotoProdukt(prod.getIdProdukt());
					result+= "<div class='col-sm mt-5'><a  href='"+request.getContextPath()+"/RequestReSend?name=produktbestellung&idprodukt="+prod.getIdProdukt()+"&produktname="+prod.getName()+"'>";
					result+= "<div class='card text-black' style=' max-width:320px; margin:auto; height:auto;'>";
					
					if(firstfoto!=null && firstfoto.getName()!=null ) {
						result+="<img alt='bild' class='produkt card-img-top' style='width:100%; height:auto;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+firstfoto.getName()+"'/>";
						
					}
					String dateveroeffentlichung =""; 
					String uhrzeit =""; 
					if(prod.getDatum()!=null) {
						dateveroeffentlichung =prod.getDatum().split(" ")[0];
						 uhrzeit = prod.getDatum().split(" ")[1];
					}
					
					result+="<div class='card-body'>";
					result+="<div class='row'>";
					result+="<div class='col'>";
					result+="<div><span class='lead mb-2 res1' style='font-weight:bold; font-size:0.7em; font-style:italic;'><u>veröffentlicht am</u> :  </span><span class='lead' style='font-size:0.7em;font-style:italic'>"+dateveroeffentlichung+" um "+uhrzeit+" </span></div>";
					result+="<div><span class='lead res2' style='font-weight:bold; font-size:0.8em;'>Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getName()+"</span></div>";
					result+="<div><span class='lead res3' style='font-size:0.8em;font-weight:bold;' >Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
				    result+="<div><span class='lead res4' style='font-weight:bold; font-size:0.8em;' >Online bis               :  </span><span class='lead' style='font-size:0.7em'>"+prod.getOnlinebis()+"   Um: </span><span class='lead' style='font-size:0.7em'>"+prod.getOnlinetime()+"</span></div>";
				    result+="<div><span class='lead mb-2 res5' style='font-weight:bold; font-size:0.8em;' >Dauer bis zur Abholung               :  </span><span class='lead text-primary' style='font-size:0.9em'><u>"+prod.getDauerbisabholung()+" <span class='uhr'>Stunden</span></u></span></div>";
				    result+="<div><span class='lead res6' style='font-weight:bold; font-size:0.8em;' >Stadt               : </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStadt()+"</span></div>";
				    result+="<div><span class='lead res7' style='font-weight:bold; font-size:0.8em;'><u>genauer Standort              </u> :  </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStandort()+"</span></div>";   
				    result+="</div>";
				    result+="</div>";
				    //end first row unten <i class="fas fa-shield"></i>
				    result+="<div class='d-flex justify-content-center'>";
				    result+="<div>";
				   
				    if(diffyear<5) {
				    	 // der neuling
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:#48D1CC;'></i>";
				    	
				    }else if(diffyear>=5 && diffyear<=10) {
				    	//der junior Partner
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:#FF8C00'></i>";
				    }else if(diffyear>=10 && diffyear<20) {
				    	//der Senior Partner
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:#008B8B'></i>";
				    }else if(diffyear>=20 && diffyear<40) {
				    	//der Boss
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:#00008B'></i>";
				    }else if(diffyear>=40 && diffyear<70) {
				    	//der OberBoss
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:#B22222'></i>";
				    }else {
				    	//der Pate
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:black;'></i>";
				    }
				    
				    result+="</div>";
				    result+="</div>";
				    //end d-flex class oben
				    result+="</div>";
				    result+="</div></a></div>";
					
				
				}
				
			}
			
			//end erster row 
			result +="</div>";
			//start zweiter row
			result +="<div class='row mt-3'>";
			
			int seitebeginn =0;
			int seitebeginn2 =0;
			if(anzahlpaginationseite!=0) {
				result +="<p class='lead fw-bold'>Pages ( <span style='color:#48D1CC;'>"+anzahlpaginationseite+"</span> )</p>";
				result +="<nav aria-label='...'";
				result +="<ul class='pagination pagination-circle'>";
				for(int i=0; i<anzahlpaginationseite; i++) {
					result +="<li class='page-item'><a class='page-link' onclick='pagination("+seitebeginn2+",10,\""+kategorie+"\",\""+suche+"\",\""+umkreis+"\",\""+online+"\",\""+stadt+"\",\""+stadtviertel+"\",\""+unternehmensname+"\","+lat+","+lng+")'>"+(seitebeginn+1)+"</a></li>";
					seitebeginn++;
					seitebeginn2 =seitebeginn+10;
				}
				
				if(anzahlpaginationseitemodulo!=0) {
					result +="<li class='page-item'><a class='page-link' onclick='pagination("+seitebeginn2+","+anzahlpaginationseitemodulo+")'>"+(seitebeginn+1)+"</a></li>";
				}
				
				result +="</ul>";
				result +="</nav>";
			}
			
			result +="</div>";
			
		}else {
			String startzahl = request.getParameter("startzahl");
			String anzahldaten = request.getParameter("anzahldaten");
			int start = 0;
			int anzahldaten1 =0;
			if(startzahl!=null && anzahldaten != null) {
				anzahldaten1 = Integer.valueOf(anzahldaten);
				start = Integer.valueOf(startzahl);
			}
			
			if(anzahldatensatz<=10) {
				list = dao.produktSucheMitLimit(kategorie, suche, umkreis, online, stadt, stadtviertel, unternehmensname, lat, lng,start, anzahldaten1);

			}else {
				list = dao.produktSucheMitLimit(kategorie, suche, umkreis, online, stadt, stadtviertel, unternehmensname, lat, lng,start, 10);
				anzahlpaginationseite = anzahldatensatz/10;
				anzahlpaginationseitemodulo = anzahldatensatz % 10;
			
			}
			
			
			result ="<div class='row'>";
			if(list.size()==0) {
				result+="<div class='col-sm-4 mt-5'></div>";
				result+="<div class='col-sm-4 mt-5'><img src='"+request.getContextPath()+"/img/empty.png' width='100%' height='auto' alt='empty'/></div>";
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
					
					Foto firstfoto = dao1.getFirstFotoProdukt(prod.getIdProdukt());
					String datereg = prod.getVerkaufer().getPerson().getDatum();
					int yearregistration = Integer.valueOf(datereg.split(" ")[5]);
					
					int diffyear = actualyear -yearregistration;
					
					result+= "<div class='col-sm mt-5'><a  href='"+request.getContextPath()+"/RequestReSend?name=produktbestellung&idprodukt="+prod.getIdProdukt()+"&produktname="+prod.getName()+"'>";
					result+= "<div class='card text-black' style=' max-width:320px; margin:auto; height:auto;'>";
					
					if(firstfoto!=null && firstfoto.getName()!=null ) {
						result+="<img alt='bild' class='produkt card-img-top' style='width:100%; height:auto;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+firstfoto.getName()+"'/>";
						
					}
					String dateveroeffentlichung =""; 
					String uhrzeit =""; 
					if(prod.getDatum()!=null) {
						dateveroeffentlichung =prod.getDatum().split(" ")[0];
						 uhrzeit = prod.getDatum().split(" ")[1];
					}
					
					result+="<div class='card-body'>";
					result+="<div class='row'>";
					result+="<div class='col'>";
					result+="<div><span class='lead mb-2 res1' style='font-weight:bold; font-size:0.7em; font-style:italic;'><u>veröffentlicht am</u> :  </span><span class='lead' style='font-size:0.7em;font-style:italic'>"+dateveroeffentlichung+" um "+uhrzeit+" </span></div>";
					result+="<div><span class='lead res2' style='font-weight:bold; font-size:0.8em;'>Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getName()+"</span></div>";
					result+="<div><span class='lead res3' style='font-size:0.8em;font-weight:bold;' >Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
				    result+="<div><span class='lead res4' style='font-weight:bold; font-size:0.8em;' >Online bis               :  </span><span class='lead' style='font-size:0.7em'>"+prod.getOnlinebis()+"   Um: </span><span class='lead' style='font-size:0.7em'>"+prod.getOnlinetime()+"</span></div>";
				    result+="<div><span class='lead mb-2 res5' style='font-weight:bold; font-size:0.8em;' >Dauer bis zur Abholung               :  </span><span class='lead text-primary' style='font-size:0.9em'><u>"+prod.getDauerbisabholung()+" <span class='uhr'>Stunden</span></u></span></div>";
				    result+="<div><span class='lead res6' style='font-weight:bold; font-size:0.8em;' >Stadt               : </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStadt()+"</span></div>";
				    result+="<div><span class='lead res7' style='font-weight:bold; font-size:0.8em;'><u>genauer Standort              </u> :  </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStandort()+"</span></div>";   
				    result+="</div>";
				    //end first row unten <i class="fas fa-shield"></i>
				    result+="</div>";
				    result+="<div class='d-flex justify-content-center'>";
				    result+="<div>";
				    if(diffyear<5) {
				    	 // der neuling
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:#48D1CC;'></i>";
				    	
				    }else if(diffyear>=5 && diffyear<10) {
				    	//der junior Partner
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:#FF8C00'></i>";
				    }else if(diffyear>=10 && diffyear<20) {
				    	//der Senior Partner
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:#008B8B'></i>";
				    }else if(diffyear>=20 && diffyear<40) {
				    	//der Boss
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:#00008B'></i>";
				    }else if(diffyear>=40 && diffyear<70) {
				    	//der OberBoss
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:#B22222'></i>";
				    }else {
				    	//der Pate
				    	result+="<i class='fas fa-user-shield fa-2x' style='color:black;'></i>";
				    }
				    
				    result+="</div>";
				    result+="</div>";
				    //end d-flex class oben
				    result+="</div>";
				    result+="</div></a></div>";
					
				
				}
				
			}
			
			//end erster row 
			result +="</div>";
			//start zweiter row
			result +="<div class='row mt-3'>";
			
			int seitebeginn =0;
			int seitebeginn2 =0;
			if(anzahlpaginationseite!=0) {
				
				result +="<p class='lead fw-bold'>Pages ( <span style='color:#48D1CC;'>"+anzahlpaginationseite+"</span> )</p>";
				result +="<nav aria-label='...'";
				result +="<ul class='pagination pagination-circle'>";
				for(int i=0; i<anzahlpaginationseite; i++) {
					result +="<li class='page-item'><a class='page-link' onclick='pagination("+seitebeginn2+",10,\""+kategorie+"\",\""+suche+"\",\""+umkreis+"\",\""+online+"\",\""+stadt+"\",\""+stadtviertel+"\",\""+unternehmensname+"\","+lat+","+lng+")'>"+(seitebeginn+1)+"</a></li>";
					seitebeginn++;
					seitebeginn2 = seitebeginn2 +10;
				}
				
				if(anzahlpaginationseitemodulo!=0) {
					result +="<li class='page-item'><a class='page-link' onclick='pagination("+seitebeginn2+","+anzahlpaginationseitemodulo+")'>"+(seitebeginn+1)+"</a></li>";
				}
				
				result +="</ul>";
				result +="</nav>";
			}
			
			result +="</div>";
			
			
		}
		
		
		
		
		
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(result);
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
		case "électronique":
			rueck="electronik" ;
			break;
		case "boisson":
			rueck="Getraenke";
			break;
		case "pharmacie":
			rueck="Apotheken";
			break;
		case "autres":
			rueck ="sonstiges";
			break;
		case "boulangerie":
			rueck ="baekerei";
			break;
		case "bakery":
			rueck ="baekerei";
			break;
		default :
			rueck= option;
				
		}
		
		return rueck;
	}
	
	public String languageConvertOnline (String option) {
		String rueck=option;
		switch (option) {
		case "unlimited":
			rueck="unbegrenzt";
			break;
		case "today" :
			rueck="heute";
			break;
		case "2 days":
			rueck="2 Tagen" ;
			break;
		case "illimité":
			rueck="unbegrenzt";
			break;
		case "aujourd'hui":
			rueck="heute";
			break;
		case "2 jours":
			rueck ="2 Tagen";
			break;
		default :
			rueck= option;
		}
		
		
	
		return rueck;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
