package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VerkauferDAO;
import DAO.userDAO;
import Model.Bewertung;
import Model.Foto;
import Model.Produkt;
import Model.Warenkob;

/**
 * Servlet implementation class Bestellung_verwaltung_verkaufer
 */
@WebServlet("/Bestellung_verwaltung_verkaufer")
public class Bestellung_verwaltung_verkaufer extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type= request.getParameter("type");
		int idverkaufer = (int)request.getSession().getAttribute("idverkaufer");
		userDAO dao = new userDAO();
		List<Produkt>ausstehend = new ArrayList<>();
		List<Produkt>bestaetigt = new ArrayList<>();
		List<Produkt>abgeholt = new ArrayList<>();
		List<String>listdatum = new ArrayList<>();
		
		String idwarenk = request.getParameter("idwarenkob");
		int idwarenkob =0;
		if(idwarenk !=null) {
			idwarenkob = Integer.valueOf(idwarenk);
		}
		
		if(type.equals("listeallebestellung")) {
			
			//Start of block
			
			List <Warenkob> list = dao.getListBestellungverkaufer(idverkaufer);
			String dateveroeffentlichung =""; 
			String uhrzeit =""; 
			
			String result ="<div class='row'>";
		    
			for (Warenkob warenkob : list) {
				Produkt prod = warenkob.getProdukt();
				prod.setWarenkob(warenkob);
				if(prod!=null) {
					
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
					
					if(prod.getDatum()!=null) {
						dateveroeffentlichung =prod.getDatum().split(" ")[0];
						 uhrzeit = prod.getDatum().split(" ")[1];
					}
					
					//Foto firstfoto = dao1.getFirstFotoProdukt(prod.getIdProdukt());
					//start column
					
					
					
					if(warenkob.getStatus().trim().equals("austehend")) {
						ausstehend.add(prod);
						
					}else if(warenkob.getStatus().equals("bestaetigt")) {
						bestaetigt.add(prod);
						listdatum.add(warenkob.getDatum());
						
					}else if(warenkob.getStatus().equals("abgeholt")) {
						abgeholt.add(prod);
					
					}
					
					
					
					
					
				
				
				}
				
				
				
			}
			
			result+= "<div class='col mt-5'>";
			//Block für ausstehende Bestellungen
			result+="<div  class='lead mb-2 text-center text-warning res1' style='font-weight:bold; font-size:2em;'>ausstehende Bestellungen...</div>";
			if(ausstehend.size()==0) {
				result+="<div class='row'>";
				result+="<div class='col-sm-4 mt-5'></div>";
				result+="<div class='col-sm-4 mt-5'><img src='"+request.getContextPath()+"/img/empty2.png' width='100%' height='auto' alt='empty'/></div>";
				result+="<div class='col-sm-4 mt-5'></div>";
				result+="</div>";
			}else {
				for (Produkt prod : ausstehend) {
					if(prod.getDatum()!=null) {
						dateveroeffentlichung =prod.getDatum().split(" ")[0];
						 uhrzeit = prod.getDatum().split(" ")[1];
					}
					//erster Card
					result+="<div class='card mt-3 '>";
					result+="<div class='card-body'>";
					
					result+="<div class='row'>";
					//erste groesse Spalte start
					result+= "<div class='col-sm-4 mt-5'>";
					result+="<div class='lead mt-3 mb-3 ' style='font-size:2.5em;text-align:center;'><u class='res2'>Kauferinfos</u></div>";
					result+="<span class='lead res3' style='font-size:0.8em;font-weight:bold;'>Pseudo    : </span><span class='text-success' style='font-size:2.3em;font-weight:bold;'>"+prod.getWarenkob().getKaufer().getPseudo()+"</span>";
					result+="</div>";
					//erste gS end
					result+= "<div class='col-sm-4 mt-5'>";
					result+= "<div class='card text-black'>";
					
					
					result+="<div class='card-body'>";
					result+="<div class='row'>";
					//zweite Spalte des Block produktsinformation
					result+="<div class='col-sm-6'>";
					result+="<div><span class='lead mb-2' style='font-weight:bold; font-size:0.7em; font-style:italic;'><u class='res4'>veröffentlicht am</u> :  </span><span class='lead' style='font-size:0.7em;font-style:italic'>"+dateveroeffentlichung+" um "+uhrzeit+" </span></div>";
					result+="<div><span class='lead res5' style='font-weight:bold; font-size:0.8em;'>Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getName()+"</span></div>";
					result+="<div><span class='lead res6' style='font-size:0.8em;font-weight:bold;'>Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
				    result+="<div><span class='lead res7' style='font-weight:bold; font-size:0.8em;'>Stadt               : </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStadt()+"</span></div>";
				    result+="<div><span class='lead res8' style='font-weight:bold; font-size:0.8em;'><u>genauer Standort              </u> :  </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStandort()+"</span></div>";   
				    result+="</div>";
				    //zweite spalte des Block produktsinformation
				    result+="<div class='col-sm-6'>";
				    result+="<div><span class='lead res9' style='font-weight:bold; font-size:0.8em;'>Beschreibung		: </span><span class='lead' style='font-size:0.7em'>"+prod.getBeschreibung()+" </span></div>";
				    result+="<div><span class='lead res10' style='font-weight:bold; font-size:0.8em;'>Marke		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMarke()+" </span></div>";
				    result+="<div><span class='lead res11' style='font-weight:bold; font-size:0.8em;'>Menge im Lager		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMenge()+",Einheit : </span><span class='lead' style='font-size:0.7em'>"+prod.getMengeeinheit()+"</span></div>";
					   
				    result+="</div>";
				    //
				    result+="</div>";//end row
				    result+="</div>";
				    result+="</div>";//end-card
				    result+="<button class=' mb-1 res12'  style=\"width:200px; border:1px solid green;border-radius:200px; padding:5px; font-size:0.7em;background-color:green;color: white; margin:auto;\" onclick='bestellungannahme("+prod.getWarenkob().getIdWarenkob()+")'>annehmen</button>";
				    result+="<button class=' res13'   style=\"width:200px; border:1px solid red;border-radius:200px; padding:5px; font-size:0.7em;background-color:red;color: white; margin:auto;\" onclick='storno("+prod.getWarenkob().getIdWarenkob()+")'>absagen</button>";
				    
				    result+="</div>";
				    //ende zweiter grossen Spalte
				    
				    //beginn dritter grossen Spalte
				    result+= "<div class='col-sm-4 mt-5'>";
				    result+="<div class='card' style='height:500px;overflow-y:auto;'>";
				    result+="<div class='card-body'>";
				    
				    //produktsbilder laden
				    if(prod.getProduktBilder().size()!=0) {
				    	 for(Foto foto: prod.getProduktBilder()) {
				    		 result+="<img alt='bild' class='produkt card-img-top' style='width:100%; height:auto; margin:5px;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
						
				    	 }
				    }else {
				    	 result+="<h1 class='res14'>Keine Fotos vorhanden</h1>";
				    }
				   
				    result+="</div>";
				    result+="</div>";
				    result+= "</div>";
				    //ende zweiter grossen Spalte
				
				    result +="</div>";//ende row
					result+="</div>";//ende card-body
					result+="</div>";
					
					result+="</div>";
					result+="</div>";
				
					//end erster Card
				}
			}
			
			
			//Block für bestätigt Bestellungen
			
			result+="<div  class='lead mb-2 mt-2 text-center text-success t1' style='font-weight:bold; font-size:2em;'>Bestaetigte Bestellungen</div>";
			int count =0;
			
			if(bestaetigt.size()==0) {
				result+="<div class='row'>";
				result+="<div class='col-sm-4 mt-5'></div>";
				result+="<div class='col-sm-4 mt-5'><img src='"+request.getContextPath()+"/img/empty2.png' width='100%' height='auto' alt='empty'/></div>";
				result+="<div class='col-sm-4 mt-5'></div>";
				result+="</div>";
			}else {
				for (Produkt prod : bestaetigt) {
					
					request.getSession().setAttribute("bestaetigt", "true");
					if(prod.getDatum()!=null) {
						dateveroeffentlichung =prod.getDatum().split(" ")[0];
						 uhrzeit = prod.getDatum().split(" ")[1];
					}
					//zweiter Card
					result+="<div class='card mb-3'>";
					result+="<div class='card-body'>";
					//blockbegin
					result+="<div class='row'>";
					//erste groesse Spalte start
					result+= "<div class='col-sm-4 mt-5'>";
					result+="<div class='lead mt-3 mb-3 t2' style='font-size:2.5em;text-align:center;'>Kauferinfos</div>";
					result+="<span class='lead t3' style='font-size:0.8em;font-weight:bold;'>Pseudo    : </span><span class='text-success' style='font-size:2.3em;font-weight:bold;'>"+prod.getWarenkob().getKaufer().getPseudo()+"</span>";
					result+="</div>";
					//erste gS end
					result+= "<div class='col-sm-4 mt-5'>";
					result+= "<div class='card text-black'>";
					
					
					result+="<div class='card-body'>";
					result+="<div class='row'>";
					//erste Spalte des Block produktsinformation
					result+="<div class='col'>";
					result+="<div><span class='lead mb-2' style='font-weight:bold; font-size:0.7em; font-style:italic;'><u class='t4'>veröffentlicht am</u> :  </span><span class='lead' style='font-size:0.7em;font-style:italic'>"+dateveroeffentlichung+" um "+uhrzeit+" </span></div>";
					result+="<div><span class='lead t5' style='font-weight:bold; font-size:0.8em;'>Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getName()+"</span></div>";
					result+="<div><span class='lead t6' style='font-size:0.8em;font-weight:bold;'>Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
				    result+="<div><span class='lead t7' style='font-weight:bold; font-size:0.8em;'>Stadt               : </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStadt()+"</span></div>";
				    result+="<div><span class='lead t8' style='font-weight:bold; font-size:0.8em;'><u>genauer Standort              </u> :  </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStandort()+"</span></div>";   
				   
				    result+="</div>";
				    //zweite spalte des Block produktsinformation
				    result+="<div class='col'>";
				    result+="<div><span class='lead t9' style='font-weight:bold; font-size:0.8em;'>Beschreibung		: </span><span class='lead' style='font-size:0.7em'>"+prod.getBeschreibung()+" </span></div>";
				    result+="<div><span class='lead t10' style='font-weight:bold; font-size:0.8em;'>Marke		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMarke()+" </span></div>";
				    result+="<div><span class='lead t11' style='font-weight:bold; font-size:0.8em;'>Menge im Lager		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMenge()+",Einheit : </span><span class='lead' style='font-size:0.7em'>"+prod.getMengeeinheit()+"</span></div>";
				    result+="</div>";
				    //
				    result+="</div>";//end row
				    
				    result+="</div>";
				    result+="</div>";
				    //Bereich für Timer
				    result+="<div class='card mt-2 mb-1' style='background-color:#F8F8FF;'>";
				    result+="<div class='card-body'>";
				    result+="<img alt='bild'  style='width:25px; height:auto; margin:5px;' src='img/timer.png'/>";
				    result+="<div id='"+count+"' style='color:green;font-size:2.5em'></div>";
				    result+="<div class='fehlermeldung mt-2 text-danger' style='font-size:0.8em;'></div>";
				    result+="<div class='infomeldung mt-2 ' id='infomeldung"+count+"' style='font-size:0.8em;'></div>";
				    result+="<button class='mt-2 me-2 infomeldungbutton' id='infomeldungbutton"+count+"' style=\"width:100px; border:1px solid black;border-radius:200px; padding:5px; font-size:0.7em;background-color:black;color: white; margin:auto;\" onclick='antwortja("+prod.getWarenkob().getIdWarenkob()+")'>Ja</button>";
				    result+="</div>";
				    result+="</div>";
				    result+="<div class='blockantwort' style='visibility:hidden;'>";
				    result+="<p class='text-center mt-2 t12'>Hat dieser Kunde sein Produkt abgeholt?</p>";
				    result+="<div style='width:20%; margin:auto;'>";
				    result+="<button class=' mb-1 t13' style=\"width:100px; border:1px solid green;border-radius:200px; padding:5px; font-size:0.7em;background-color:green;color: white; margin:auto;\" onclick='antwortja("+prod.getWarenkob().getIdWarenkob()+")'>Ja</button>";
				    result+="<button class=' t14' style=\"width:100px; border:1px solid red;border-radius:200px; padding:5px; font-size:0.7em;background-color:red;color: white; margin:auto;\" onclick='antwortnein("+prod.getWarenkob().getIdWarenkob()+")'>Nein</button>"; 
				    result+="</div>";
				    result+="</div>";
				   
				    //end Timerbereich
				    result+="</div>";  
				    //ende erster grossen Spalte
				    
				    //beginn zweiter grossen Spalte
				    result+= "<div class='col-sm-4 mt-5'>";
				    result+="<div class='card' style='height:500px;overflow-y:auto;'>";
				    result+="<div class='card-body'>";
				    
				    //produktsbilder laden
				    if(prod.getProduktBilder().size()!=0) {
				    	 for(Foto foto: prod.getProduktBilder()) {
				    		 result+="<img alt='bild'  style='width:100%; height:auto; margin:5px;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
						
				    	 }
				    }else {
				    	 result+="<h1 class='t15'>Keine Fotos vorhanden</h1>";
				    }
				   
				    result+="</div>";
				    result+="</div>";
				    result+= "</div>";
				    //ende zweiter grossen Spalte
				
				    result +="</div>";//ende row
					result+="</div>";//ende card-body
					result+="</div>";
					
					//blockend
					
					result+="</div>";//end card-body
					result+="</div>";
					result+="<input type='hidden' name='datum' value='"+listdatum.get(count)+"'/>";
					result+="<input type='hidden' name='abholung' value='"+prod.getDauerbisabholung()+"'/>";
					result+="<input type='hidden' class='idwarenkob' value='"+prod.getWarenkob().getIdWarenkob()+"'/>";
								
					count++;
					
					//end zweiter Card
				}
			}
			
			
			//Block für abgeholte Bestellungen
			//result+="<div  class='lead mb-2 mt-2 text-center' style='font-weight:bold; font-size:2em;'>abgeholte Bestellungen</div>";
			for (Produkt prod : abgeholt) {
				if(prod.getDatum()!=null) {
					dateveroeffentlichung =prod.getDatum().split(" ")[0];
					 uhrzeit = prod.getDatum().split(" ")[1];
				}
				//dritte Card
				result+="<div class='card mb-1'>";
				result+="<div class='card-body'>";
					
				//block begin
				
				result+="<div class='row'>";
				result+= "<div class='col-sm-8 mt-5'>";
				result+= "<div class='card text-black'>";	
				result+="<div class='card-body'>";
				result+="<div class='row'>";
				//erste Spalte des Block produktsinformation
				result+="<div class='col'>";
				result+="<div><span class='lead mb-2' style='font-weight:bold; font-size:0.7em; font-style:italic;'><u>veröffentlicht am</u> :  </span><span class='lead' style='font-size:0.7em;font-style:italic'>"+dateveroeffentlichung+" um "+uhrzeit+" </span></div>";
				result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'>Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getName()+"</span></div>";
				result+="<div><span class='lead' style='font-size:0.8em;font-weight:bold;'>Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'>Stadt               : </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStadt()+"</span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'><u>genauer Standort              </u> :  </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStandort()+"</span></div>";   
			    result+="</div>";
			    //zweite spalte des Block produktsinformation
			    result+="<div class='col'>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'>Beschreibung		: </span><span class='lead' style='font-size:0.7em'>"+prod.getBeschreibung()+" </span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'>Marke		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMarke()+" </span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'>Menge im Lager		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMenge()+",Einheit : </span><span class='lead' style='font-size:0.7em'>"+prod.getMengeeinheit()+"</span></div>";
				   
			    result+="</div>";
			    //
			    result+="</div>";//end row
			    
			    result+="</div>";
			    result+="</div></div>";
			    //ende erster grossen Spalte
			    
			    //beginn zweiter grossen Spalte
			    result+= "<div class='col-sm-4 mt-5'>";
			    result+="<div class='card' style='height:500px;overflow-y:auto;'>";
			    result+="<div class='card-body'>";
			    
			    //produktsbilder laden
			    if(prod.getProduktBilder().size()!=0) {
			    	 for(Foto foto: prod.getProduktBilder()) {
			    		 result+="<img alt='bild' class='produkt card-img-top' style='width:100%; height:auto; margin:5px;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
					
			    	 }
			    }else {
			    	 result+="<h1>Keine Fotos vorhanden</h1>";
			    }
			   
			    result+="</div>";
			    result+="</div>";
			    result+= "</div>";
			    //ende zweiter grossen Spalte
			
			    result +="</div>";//ende row
				result+="</div>";//ende card-body
				result+="</div>";
				
				//bloclend
				result+="</div>";
				result+="</div>";
				//dritter Card
			}
			
			result+="</div>";
			result+="</div>";
			//end column
			

			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			response.getWriter().print(result);
			
			
			
			//end of block
		}else if(type.equals("antwortja")) {
			if(idwarenkob !=0) {
				dao.updateWarekob(idwarenkob, "confirmverkauferja",null,null);
				
			}
			
		}else if(type.equals("antwortnein")) {
			if(idwarenkob !=0) {
				dao.updateWarekob(idwarenkob, "confirmverkaufernein",null,null);
				
			}
		}else if(type.equals("kommentarverkaufer")) {
			VerkauferDAO dao2 = new VerkauferDAO();
			String result ="<div style='padding:5px;'>";
			Map<Integer,Map<String,String>> map = dao2.getProdid_Commentkaufer_sternkaufer_(idverkaufer);
			Map<String,String>map2;
			if(map.keySet().size()==0) {
				result+="<div class='row'>";
				result+="<div class='col-sm-4 mt-5'></div>";
				result+="<div class='col-sm-4 mt-5'><img src='"+request.getContextPath()+"/img/empty2.png' width='100%' height='auto' alt='empty'/></div>";
				result+="<div class='col-sm-4 mt-5'></div>";
				result+="</div>";
			}else {
				for(Integer key: map.keySet()) {
					Produkt prod = dao.getProdukt(key);
					//produktblock start
					result+="<div class='row'>";
					result+="<div class='col-sm-4'>";//erste spalte
					/////////////////////////////////
					result+="<div class='card mb-1' style='background-color:#F0F8FF;'>";
					result+="<div class='card-body'>";
						
					//block begin
					
					result+="<div class='row'>";
					result+= "<div class='col-sm-8 mt-5'>";
					result+="<div class='row'>";
					//erste Spalte des Block produktsinformation
					result+="<div class='col'>";
					result+="<div><span class='lead res1' style='font-weight:bold; font-size:0.8em;'>Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getName()+"</span></div>";
					result+="<div><span class='lead res2' style='font-size:0.8em;font-weight:bold;'>Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
				    result+="</div>";
				    //zweite spalte des Block produktsinformation
				    result+="<div class='col'>";
				    result+="<div><span class='lead res3' style='font-weight:bold; font-size:0.8em;'>Beschreibung		: </span><span class='lead' style='font-size:0.7em'>"+prod.getBeschreibung()+" </span></div>";
				    result+="<div><span class='lead res4' style='font-weight:bold; font-size:0.8em;'>Marke		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMarke()+" </span></div>";
				     
				    result+="</div>";
				    //
				    result+="</div>";//end row 
				    result+="</div>";
				    //ende erster grossen Spalte
				    
				    //beginn zweiter grossen Spalte
				    result+= "<div class='col-sm-4 mt-5'>";
				    result+="<div style='max-height:500px;overflow-y:auto;'>";
				    //produktsbilder laden
				    if(prod.getProduktBilder().size()!=0) {
				    	 for(Foto foto: prod.getProduktBilder()) {
				    		 result+="<img alt='bild' class='produkt card-img-top' style='width:100%; height:auto; margin:5px;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
						
				    	 }
				    }else {
				    	 result+="<h1 class='res5'>Keine Fotos vorhanden</h1>";
				    }
				   
				    result+="</div>";
				    result+= "</div>";
				    //ende zweiter grossen Spalte
				
				    result +="</div>";//ende row
					result+="</div>";//ende card-body
					result+="</div>";
					
					//bloclend
					
					
					////////////////////////////////
					result+="</div>";//end erster Grosse Spalte
					result+="<div class='col-sm-8'>";
					map2= map.get(key);
					result+="<div class='card' style='max-height:500px; overflow-y:scroll;'>";
					result+="<div class='card-body'>";
					
					for(String k:map2.keySet()) {
			
					
						///////
						
						//start unter-row
						
							result+="<div class='row'>";
							//start untercolumn 1
							result+="<div class='col-sm-4'>";
							result+="<span class='lead mt-3' style='font-weight:bold;font-size:0.9em;'>"+k.split("-")[0]+"<span> <img src='"+getLinkSterne(map2.get(k).split("~")[1], request)+"' width='100'/>";
							//end column 1
							result+="</div>";	
							//start untercolumn 2
							result+="<div class='col-sm-8'>";
							result+="<div class='card mt-1 mb-1' style='padding:1px;background-color:#F5F5DC;'>";
							result+="<div class='card-body'>";
							result+="<div class='lead mt-3' style='padding:1px;font-size:0.8em;'>"+map2.get(k).split("~")[0]+"</div>";
							result+="</div>";// end card-body
							result+="</div>";// end-card
							//end column 2
							result+="</div>";
							//end-unterrow
							result+="</div>";
							
					
						
						//////
						
					}
					result+="</div>";//end card-body
					result+="</div>";//end card
					result+="</div>";//end zweiter Grosse Spalte
					result+="</div>";
					//produktblock end
				}
			}
			
			
			
			result+="</div>";
			
			response.getWriter().print(result);
		}else if(type.equals("checkaufconfirmabhohlung")) {
			VerkauferDAO dao2 = new VerkauferDAO();
			if(dao2.checkIfverkauferKonfirm(idverkaufer)==0) {
				request.getSession().setAttribute("checkifverkauferconfirm", 0);
				response.getWriter().print(0);
			}else {
				request.getSession().setAttribute("checkifverkauferconfirm", 1);
				response.getWriter().print(1);
			}
		}else if(type.equals("allonline")){
			VerkauferDAO dao2 = new VerkauferDAO();
			int rueck =dao2.updateprodukt("status", "online", idverkaufer);
			if(rueck==0) {
				response.getWriter().print("alle Waren konnten leider nicht online gestellt werden");
			}else {
				response.getWriter().print("waren erfolgreich online gestellt");		
			}
		}else if(type.equals("alloffline")) {
			VerkauferDAO dao2 = new VerkauferDAO();
			int rueck =dao2.updateprodukt("status", "offline", idverkaufer);
			if(rueck==0) {
				response.getWriter().print("alle Waren konnten leider nicht offline gestellt werden");
			}else {
				response.getWriter().print("waren erfolgreich offline gestellt");		
			}
		}else if(type.equals("commentsread")) {
			int rueck = dao.checkIfBewertunggelesen(idverkaufer);
			response.getWriter().print(rueck);
		}else if(type.equals("commentsalreadyread")) {
			 dao.UpdateBewertung("commentalreadyread", idverkaufer);
			
		}else if(type.equals("isnewcommandread")) {
			VerkauferDAO dao2 = new VerkauferDAO();
			int rueck = dao2.getwaitingcommandnummber(idverkaufer);
			
			response.getWriter().print(rueck);
		}
				
		
		
	}

	public String getLinkSterne(String b,HttpServletRequest request) {
		String link="";
		if(b!=null) {
			if(b.equals("1")) {
				link = request.getContextPath()+"/img/sterne1.png";
			}if(b.equals("2")) {
				link = request.getContextPath()+"/img/sterne2.png";
			}if(b.equals("3")) {
				link = request.getContextPath()+"/img/sterne3.png";
			}if(b.equals("4")) {
				link = request.getContextPath()+"/img/sterne4.png";
			}if(b.equals("5")) {
				link = request.getContextPath()+"/img/sterne5.png";
			}
			
		}
		
		return link;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
