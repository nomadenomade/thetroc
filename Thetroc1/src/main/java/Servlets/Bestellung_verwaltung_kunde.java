package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.userDAO;
import Model.Betreiber;
import Model.Bewertung;
import Model.Foto;
import Model.Gutschein;
import Model.Kaufer;
import Model.Produkt;
import Model.Warenkob;

/**
 * Servlet implementation class Bestellung_verwaltung_kunde
 */
@WebServlet("/Bestellung_verwaltung_kunde")
public class Bestellung_verwaltung_kunde extends HttpServlet {
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String idWarenkob = request.getParameter("idwarenkob");
		String id = (String)request.getSession().getAttribute("idkaufer");
		int idkaufer=0;
		userDAO dao = new userDAO();
		Betreiber betreiber = null;
		List <Betreiber>listbetreiber = dao.getListBetreiber();
		if(listbetreiber.size()>0) {
			betreiber = listbetreiber.get(0);
		}
		request.getSession().setAttribute("betreiber", betreiber);
		
		if(id!=null) {
			idkaufer =Integer.valueOf(id);
			
			
			if(type.equals("stornieren")) {
				if(idWarenkob!=null) {
					boolean rueck = dao.deleteWarenkob(Integer.valueOf(idWarenkob));
					if(rueck==true) {
						response.getWriter().print("Bestellung gelöscht");
					}else {
						response.getWriter().print("Die Bestellung konnte nicht gelöscht werden");
					}
				}
			}else if(type.equals("notification") && idkaufer!=0) {
				String result="<div class='card dropdown-item' style='height:400px; overflow-y:scroll;'>";
				result="<div class='card-body'>";
				Map<String,List<String>> map = dao.notification(idkaufer);
				List<String> list = map.get("produktname");
				List<String> list2 = map.get("idwarenkob");
				
				for(int i=0;i<list.size();i++) {
					
					result +="<div class='card mb-2' style='background-color:#F0F8FF; padding:10px; font-size:0.7em;' onclick='alsgelesenmarkieren("+list2.get(i)+")'>Ihre Bestellung auf das Produkt: <span style='color:green; font-weight:bold;'>"+list.get(i)+"</span> wurde bestaetigt<br>klicken Sie hier</div>";
				}
				
			    result +="</div>";
			    result +="</div>";
			    request.getSession().setAttribute("notif-zahl", list.size());
			    response.getWriter().print(result);
			    //end card
			}else if(type.equals("notif-gelesen")) {
				String idwarenkob = request.getParameter("idwarenkob");
				int idw =0;
				if (idwarenkob !=null) {
					idw = Integer.valueOf(idwarenkob);
				}
				
				if(idw !=0) {
					boolean check = dao.updateWarekob(idw, "notification",null,null);
					if(check== true) {
						request.getRequestDispatcher("WEB-INF/liste_de_commande_client.jsp").forward(request, response);
					}else {
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
					
				}
			}else if(type.equals("antwortja")) {
				String idwarenkob = request.getParameter("idwarenkob");
				int idw =0;
				if (idwarenkob !=null) {
					idw = Integer.valueOf(idwarenkob);
				}
				
				if(idw !=0) {
					response.getWriter().print(dao.updateWarekob(idw, "confirmkundeja",null,null));
				}
				
			}else if(type.equals("antwortnein")) {
				String idwarenkob = request.getParameter("idwarenkob");
				int idw =0;
				if (idwarenkob !=null) {
					idw = Integer.valueOf(idwarenkob);
				}
				
				if(idw !=0) {
					response.getWriter().print(dao.updateWarekob(idw, "confirmkundenein",null,null));
				}
				
			}else if(type.equals("checkaufantwort")) {
				int rueck = dao.checkaufantwort("kaufer", idkaufer);
				response.getWriter().print(rueck);
				
			}else if(type.equals("zeitabgelaufen")) {
				int idw=0;
				if (idWarenkob !=null) {
					idw = Integer.valueOf(idWarenkob);
				}
				
				if(idw !=0) {
					boolean rueck = dao.updateWarekob(idw, "zeitabgelaufen",null,null);
					if(rueck==true) {
						String lat = request.getParameter("lat");
						String lng = request.getParameter("lng");
						if(dao.checkifgeolocationvorhanden(idw)==1) {
							rueck = dao.updateWarekob(idw, "geolocation",lat,lng);
							
						}
						
					}
					response.getWriter().print(rueck);
				}
				
			}else if(type.equals("bewertung")) {
				String result="";
				
				List<Warenkob>listwarenkob = dao.getListBestellungKundeOhnebewertet(idkaufer);
				List<Produkt>list = new ArrayList<>();
				String dateveroeffentlichung="";
				String  uhrzeit="";
				
				for(Warenkob wa: listwarenkob) {
					list.add(wa.getProdukt());
				}
				int counter =0;
				for (Produkt prod : list) {
					
					
					if(prod.getDatum()!=null) {
						dateveroeffentlichung =prod.getDatum().split(" ")[0];
						 uhrzeit = prod.getDatum().split(" ")[1];
					}
					//zweiter Card
					result+="<div class='card mb-5 bewertungbody' style='background-color:#F8F8FF; margin:auto;'>";
					result+="<div class='card-body'>";
					//blockbegin
					result+="<div class='row'>";
					result+= "<div class='col-sm-3 mt-5'>";
					result+= "<div class='card text-black'>";
					
					
					result+="<div class='card-body'>";
					result+="<div class='row'>";
					//erste Spalte des Block produktsinformation
					result+="<div class='col'>";
					result+="<div><span class='lead mb-2 tes1' style='font-weight:bold; font-size:0.7em; font-style:italic;'><u>veröffentlicht am</u> :  </span><span class='lead' style='font-size:0.7em;font-style:italic'>"+dateveroeffentlichung+" um "+uhrzeit+" </span></div>";
					result+="<div><span class='lead tes2' style='font-weight:bold; font-size:0.8em;'>Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getName()+"</span></div>";
					result+="<div><span class='lead tes3' style='font-size:0.8em;font-weight:bold;'>Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
				    result+="<div><span class='lead tes4' style='font-weight:bold; font-size:0.8em;'>Stadt               : </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStadt()+"</span></div>";
				    result+="<div><span class='lead tes5' style='font-weight:bold; font-size:0.8em;'><u>genauer Standort              </u> :  </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStandort()+"</span></div>";   
				   
				    result+="</div>";
				    //zweite spalte des Block produktsinformation
				   
				    result+="</div>";//end row
				    
				    result+="</div>";
				    result+="</div>";
				   
				    result+="</div>";  
				    //ende erster grossen Spalte
				    
				    //beginn zweiter grossen Spalte
				    result+= "<div class='col-sm-3 mt-5'>";
				    result+="<div class='card' style='height:500px;overflow-y:auto;'>";
				    result+="<div class='card-body'>";
				    
				    //produktsbilder laden
				    if(prod.getProduktBilder().size()!=0) {
				    	 for(Foto foto: prod.getProduktBilder()) {
				    		 result+="<img alt='bild'  style='width:100%; height:auto; margin:5px;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
						
				    	 }
				    }else {
				    	 result+="<h1>Keine Fotos vorhanden</h1>";
				    }
				   
				    result+="</div>";
				    result+="</div>";
				    result+= "</div>";
				    //ende zweiter grossen Spalte
				    
				    //BewertungsBereich
				    result+= "<div class='col-sm-6'>";
				    result+= "<div class='text-center lead mt-2 tes6' Style='font-size:2.5em; font-weight:bold;'>Bitte Ihre Bewertung zu diesem Produkt</div>";
				    //
				    result+="<div class='form-check'>";
				    result+="<input type='radio' name='auswahl"+counter+"' value='1' class='form-check-input' id='auswahl'/>";
				    result+="<label for='auswahl1' class='form-check-label'><img src='"+request.getContextPath()+"/img/sterne1.png' width='100' height='auto'/></label>";
				    result+="</div>";
				    //
		
				    result+="<div class='form-check'>";
				    result+="<input type='radio' name='auswahl"+counter+"' value='2' class='form-check-input' id='auswahl'/>";
				    result+="<label for='auswahl1' class='form-check-label'><img src='"+request.getContextPath()+"/img/sterne2.png' width='100' height='auto'/></label>";
				    result+="</div>";
				    //
				    result+="<div class='form-check'>";
				    result+="<input type='radio' name='auswahl"+counter+"' value='3' class='form-check-input' id='auswahl'/>";
				    result+="<label for='auswahl1' class='form-check-label'><img src='"+request.getContextPath()+"/img/sterne3.png' width='100' height='auto'/></label>";
				    result+="</div>";
				    //
				    result+="<div class='form-check'>";
				    result+="<input type='radio' name='auswahl"+counter+"' value='4' class='form-check-input' id='auswahl'/>";
				    result+="<label for='auswahl1' class='form-check-label'><img src='"+request.getContextPath()+"/img/sterne4.png' width='100' height='auto'/></label>";
				    result+="</div>";
				    //
				    result+="<div class='form-check'>";
				    result+="<input type='radio' name='auswahl"+counter+"' value='5' class='form-check-input' id='auswahl'/>";
				    result+="<label for='auswahl1' class='form-check-label'><img src='"+request.getContextPath()+"/img/sterne5.png' width='100' height='auto'/></label>";
				    result+="</div>";
				    //
				    
				    result+="<div class='form-outline mt-4'>";
				    result+="<textarea id='kommentar' rows='4' cols='6' name='kommentar' class='form-control' style='background-color:#FFF8DC;'></textarea>";
				    result+="<label class='form-label tes7' for='kommentar'>Kommentar</label>";
				    result+="</div>";
				   //
				    result+="<button class=' mt-2 tes8 buttoncomment1' style=\"width:200px; border:1px solid #48D1CC;border-radius:200px; padding:5px; font-size:0.8em;background-color:#48D1CC;color: white; \" onclick='kommentierenja("+prod.getIdProdukt()+','+prod.getWarenkob().getIdWarenkob()+','+counter+")'>senden</button>";
				    result+="<button class=' mt-2 tes9 buttoncomment2' style=\"width:200px; border:1px solid #D3D3D3;border-radius:200px; padding:5px; font-size:0.8em;background-color:#D3D3D3;color: white; \"  onclick='kommentierennein("+prod.getWarenkob().getIdWarenkob()+")'>nein danke</button>";
				    
				    result+= "</div>";
				    //Bewertungsend
				
				    result +="</div>";//ende row
				   
				    
					result+="</div>";//ende card-body
					result+="</div>";
					
					//blockend
					
					result+="</div>";//end card-body
					result+="</div>";
					
					counter++;
					//end zweiter Card
				}
				
				response.getWriter().print(result);
				
			}else if(type.equals("kommentierenja")) {
				String kommentar = request.getParameter("kommentar");
				String sterne = request.getParameter("sterne");
				String idProdukt = request.getParameter("idprodukt");
				String idwarenk = request.getParameter("idwarenk");
				int idprod =0;
				int idwaren=0;
				if(idProdukt !=null && idwarenk !=null) {
					idprod = Integer.valueOf(idProdukt);
					idwaren = Integer.valueOf(idwarenk);
					
				}
				
				if(idprod !=0 && idwaren !=0) {
					int rueck= dao.insertBewertung(kommentar, sterne, idkaufer, idprod,idwaren,"ja");
				
					response.getWriter().print(rueck);
				}
				
			}else if(type.equals("kommentierennein")) {
				String idwarenk = request.getParameter("idwarenk");
				int idwaren=0;
				if(idwarenk !=null) {
					idwaren = Integer.valueOf(idwarenk);
					
				}
				int rueck= dao.insertBewertung(null, null,0, 0,idwaren,"nein");
				
				response.getWriter().print(rueck);
			}else if(type.equals("autodeletebewertung")) {
				SimpleDateFormat dataformat = new SimpleDateFormat("dd-MM-yyyy");
				Date date = new Date();
				String datestring = dataformat.format(date);
				String datum1[] = datestring.split("-");
				int tag1 = Integer.valueOf(datum1[0]);
				List<Warenkob>list = dao.getListabgeholteBestellungKunde(idkaufer);
				for(Warenkob wa: list) {
					String datum[] = wa.getConfirmdatumkunde().split("-");
					int tag = Integer.valueOf(datum[0]);
					if(tag<28) {
						
						if((tag+4)<tag1) {
							 dao.insertBewertung(null, null,0, 0,wa.getIdWarenkob(),"nein");
						}
					}else {
						if(tag1>2) {
							 dao.insertBewertung(null, null,0, 0,wa.getIdWarenkob(),"nein");
						}
					}
				}
				
			}else if(type.equals("warning")) {
				Kaufer kaufer = (Kaufer)request.getSession().getAttribute("kaufer");
				int rueck=80;
				if(kaufer!=null) {
					rueck  = dao.checkaufantwort_kunde_verkaufer("kaufer", idkaufer,kaufer.getPerson());
				}
				
				response.getWriter().print(rueck);
			}else if(type.equals("checkbuttonnachweisauto")) {
				int rueck = dao.checkAufClickaufButtonNachweisAuto(idkaufer, "bevorclick", null);
				if(rueck ==0) {
					String browserid = request.getParameter("browserid");
					
					if(browserid !=null) {
						rueck = dao.checkAufClickaufButtonNachweisAuto(idkaufer, "nachclick", browserid);
						if(rueck==0) {
							rueck=12;
						}
						response.getWriter().print(rueck);
					}
				}else {
					
					response.getWriter().print(11);
				}
				
				
			}else if(type.equals("buttonnachweisautoclick")) {
				String browserid = request.getParameter("browserid");
				int rueck = 0;
				if(browserid !=null) {
					rueck = dao.buttonNachweisAutoclick(idkaufer, browserid);
					response.getWriter().print(rueck);
				}
				
			}
			
			
		   }
		
		 if(type.equals("bewertunganzeige")) {
			
			String idp = (String)request.getSession().getAttribute("idprodukt");
			int idprodukt=0;
			String result= "<div class='text-center text-white mt-5 mb-3 lead'  style='font-weight:bold;font-size:2.3em;' id='b1'>Bewertung</div>";
			//start-card
			result +="<div class='card bewertung' >";	
			result +="<div class='card-body'>";
			
			if(idp != null) {
				idprodukt = Integer.valueOf(idp);
			}
			
			if(idprodukt !=0) {
				List<Bewertung>list = dao.getBewertungkundeseite(idprodukt);
				List<Integer>rate =berechnenRateBewertung(list);
			
				if(list.size()>0) {
					//start-row
					result+="<div class='row'>";
					//start column 1
					result+="<div class='col-sm-4'>";
					result+="<div class='text-center lead mt-3 mb-3' style='font-size:2.3em;' id='b2'>Bewertung Statistik</div>";
					
					result+="<img src='"+request.getContextPath()+"/img/sterne1.png' width='100'/><span class='text-success' style='font-size:1.3em;'>"+rate.get(0)+"</span><span>%</span><br>";
					result+="<img src='"+request.getContextPath()+"/img/sterne2.png' width='100'/><span class='text-success' style='font-size:1.3em;'>"+rate.get(1)+"</span><span>%</span><br>";
					result+="<img src='"+request.getContextPath()+"/img/sterne3.png' width='100'/><span class='text-success' style='font-size:1.3em;'>"+rate.get(2)+"</span><span>%</span><br>";
					result+="<img src='"+request.getContextPath()+"/img/sterne4.png' width='100'/><span class='text-success' style='font-size:1.3em;'>"+rate.get(3)+"</span><span>%</span><br>";
					result+="<img src='"+request.getContextPath()+"/img/sterne5.png' width='100'/><span class='text-success' style='font-size:1.3em;'>"+rate.get(4)+"</span><span>%</span><br>";
					
					result+="</div>";
					//end column 1
					//start column 2
					result+="<div class='col-sm-8'>";
					for(Bewertung b: list) {
						
						if(b.getKommentar().equals("")|| b.getKommentar()==null) {
							
						}else {
							
							result+="<div class='card mt-2' >";
							result+="<div class='card-body'>";
							//start unter-row
							result+="<div class='row'>";
							//start untercolumn 1
							result+="<div class='col-4'>";
							result+="<span class='lead mt-3' style='font-weight:bold;font-size:0.9em;'>"+b.getKaufer().getPseudo()+"<span> <img src='"+getLinkSterne(b, request)+"' width='100'/>";
							//end column 1
							result+="</div>";	
							//start untercolumn 2
							result+="<div class='col-8'>";
							
							result+="<div class='lead mt-3' style='padding:2px;font-size:0.8em;'>"+b.getKommentar()+"</div>";
							//end column 2
							result+="</div>";
							//end-unterrow
							result+="</div>";
							//end-card-body
							result+="</div>";
							result+="</div>";
						}
					
					}
					
					result+="</div>";
					//end column 2
					//end-row
					result+="</div>";
				}else {
					result+="<div class='lead mt-5 mb-5 text-center'id='b3'>Keine Bewertung Vorhanden</div>";
				}
				
				
			}
			//end-card-body
			result+="</div>";
			//end-card
			result+="</div>";
			response.getWriter().print(result);
			
		}else if (type.equals("gewinnberechnung")) {
			idkaufer =Integer.valueOf(id);
			Kaufer kaufer= (Kaufer)request.getSession().getAttribute("kaufer");
	        int idperson = kaufer.getPerson().getId();
	        response.getWriter().print(dao.gewinnBerechnung(idkaufer, idperson));
		}else if(type.equals("loadgewinn")) {
			Kaufer kaufer= (Kaufer)request.getSession().getAttribute("kaufer");
			int idperson = kaufer.getPerson().getId();
			if(betreiber.getGutscheinfunction().equals("activated")) {
				  response.getWriter().print(dao.getPerson(idperson).getGewinn());
			}else {
				  response.getWriter().print(-1);
			}
	        
		}else if(type.equals("thetrocpay")) {
			String idperson1= request.getParameter("idperson");
			String pseudo = request.getParameter("pseudo");
			String emailkaufer = request.getParameter("emailkaufer");
			String idverkaufer1 = request.getParameter("idverkaufer");
			String preiszuzahlen = request.getParameter("preiszuzahlen");
			String nameprodukt = request.getParameter("nameprodukt");
			String restgewinn = request.getParameter("restgewinn");
			String idw = request.getParameter("idwarenkob");
		
			int idperson=0,idverkaufer = 0,idwarenkob=0;
			if(idperson1 !=null && idverkaufer1 !=null){
				idperson = Integer.valueOf(idperson1);
				idverkaufer = Integer.valueOf(idverkaufer1);
				idwarenkob= Integer.valueOf(idw);
			}
			
			if(idperson!=0) {
				
				response.getWriter().print(dao.thetrocPay(idperson, restgewinn, idverkaufer, preiszuzahlen, pseudo, emailkaufer, nameprodukt,idwarenkob));
				
			}
			
		}else if(type.equals("quittungladen")) {
			Kaufer kaufer= (Kaufer)request.getSession().getAttribute("kaufer");
			String result="<div class='table-responsive-sm'>";
			result+="<table class='table mt-5 ms-1 me-1 table-stripped' style='font-size:0.8em;'>";
			result+="<thead style='background-color:#48D1CC; color:white;'>";
			result+="<tr>";
			result+="<th id='res1'>ID-Payment</th><th id='res2'>ID-Oder</th><th id='res3'>Pseudo</th><th id='res4'>Email</th><th id='res5'>Name Product</th><th id='res6'>Price</th><th id='res7'>Date</th>";
			result+="</tr>";
			result+="</thead>";
			result+="<tbody style='background-color:white;' >";
			for(Gutschein gut: dao.getListGutscheinKaufer(kaufer.getPseudo(), kaufer.getPerson().getEmail())) {
				result+="<tr>";
				result+="<td>"+gut.getIdgutschein()+"</td>";
				result+="<td>"+gut.getIdwarenkob()+"</td>";
				result+="<td>"+gut.getPseudokaufer()+"</td>";
				result+="<td>"+gut.getEmailkaufer()+"</td>";
				result+="<td>"+gut.getNameprodukt()+"</td>";
				result+="<td>"+gut.getBetrag()+"</td>";
				result+="<td>"+gut.getDatumguschein()+"</td>";
				result+="</tr>";
			}
			result+="</tbody>";
			result+="</table>";
			result+="</div>";
			
			response.getWriter().print(result);
		}

	}
	
	public List<Integer>berechnenRateBewertung(List<Bewertung> list){
		
		List <Integer>result = new ArrayList<>();
		int stern1=0, stern2=0,stern3=0,stern4=0,stern5=0;
		for(Bewertung b : list) {
			int st = Integer.valueOf(b.getSterne());
			if(st==1) {
				stern1++;
			}else if(st ==2) {
				stern2++;
			}else if(st ==3) {
				stern3++;
			}else if(st ==4) {
				stern4++;
			}else if(st ==5) {
				stern5++;
			}
		}
		if(list.size()>0) {
			result.add((int)(((double)stern1/list.size())*100));
			result.add((int)(((double)stern2/list.size())*100));
			result.add((int)(((double)stern3/list.size())*100));
			result.add((int)(((double)stern4/list.size())*100));
			result.add((int)(((double)stern5/list.size())*100));
		}
		
		return result;
	}
	
	public String getLinkSterne(Bewertung b,HttpServletRequest request) {
		String link="";
		if(b.getSterne()!=null) {
			if(b.getSterne().equals("1")) {
				link = request.getContextPath()+"/img/sterne1.png";
			}if(b.getSterne().equals("2")) {
				link = request.getContextPath()+"/img/sterne2.png";
			}if(b.getSterne().equals("3")) {
				link = request.getContextPath()+"/img/sterne3.png";
			}if(b.getSterne().equals("4")) {
				link = request.getContextPath()+"/img/sterne4.png";
			}if(b.getSterne().equals("5")) {
				link = request.getContextPath()+"/img/sterne5.png";
			}
			
		}
		
		return link;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
