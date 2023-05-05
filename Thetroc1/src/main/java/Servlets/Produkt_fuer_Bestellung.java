package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.userDAO;
import Model.Foto;
import Model.Produkt;
import Model.Warenkob;
import helpklasse.QRcode;

/**
 * Servlet implementation class Produkt_fuer_Bestellung
 */
@WebServlet("/Produkt_fuer_Bestellung")
public class Produkt_fuer_Bestellung extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		
		//Serverantwort aubbauen
		
		userDAO dao = new userDAO();
		List<Produkt>ausstehend = new ArrayList<>();
		List<Produkt>bestaetigt = new ArrayList<>();
		List<Produkt>abgeholt = new ArrayList<>();
		List<String>listdatum = new ArrayList<>();
		
		
		if(type.equals("bestellungsansicht")) {
			String idprodukt= (String)request.getSession().getAttribute("idprodukt");
			Produkt prod = dao.getProdukt(Integer.valueOf(idprodukt));
			
			String result ="<div class='row'>";
			result+="<h1 class='text-center lead mt-2' style='font-weight:bold;color:#48D1CC; 'id='res1'>Informationen und Bilder über das Produkt</h1>";
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
				
				//Foto firstfoto = dao1.getFirstFotoProdukt(prod.getIdProdukt());
				result+= "<div class='col-sm-4 mt-5'>";
				result+= "<div class='card text-black' style='background-color:#B0E0E6;'>";
				
				/*if(firstfoto!=null && firstfoto.getName()!=null ) {
					result+="<img alt='bild' class='produkt card-img-top' style='width:100%; height:auto;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+firstfoto.getName()+"'/>";
					
				}*/
				String dateveroeffentlichung =""; 
				String uhrzeit =""; 
				if(prod.getDatum()!=null) {
					dateveroeffentlichung =prod.getDatum().split(" ")[0];
					 uhrzeit = prod.getDatum().split(" ")[1];
				}
				
				
				
				result+="<div class='card-body'>";
				result+="<div class='row'>";
				//erste Spalte des Block produktsinformation
				result+="<div class='col-sm'>";
				result+="<div><span class='lead mb-2' style='font-weight:bold; font-size:0.7em; font-style:italic;'id='res2'><u >veröffentlicht am</u> :  </span><span class='lead' style='font-size:0.7em;font-style:italic'>"+dateveroeffentlichung+" um "+uhrzeit+" </span></div>";
				result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'id='res3'>Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getName()+"</span></div>";
				result+="<div><span class='lead' style='font-size:0.8em;font-weight:bold;'id='res4'>Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'id='res5'>Online bis               :  </span><span class='lead' style='font-size:0.7em'>"+prod.getOnlinebis()+"   Um: </span><span class='lead' style='font-size:0.7em'>"+prod.getOnlinetime()+"</span></div>";
			    result+="<div><span class='lead mb-2' style='font-weight:bold; font-size:0.8em;' id='res6'>Dauer bis zur Abholung               :  </span><span class='lead text-primary' style='font-size:0.9em'><u>"+prod.getDauerbisabholung()+" Stunden</u></span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;' id='res7'>Stadt               : </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStadt()+"</span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'id='res8'><u>genauer Standort              </u> :  </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStandort()+"</span></div>";   
			    result+="</div>";
			    //zweite spalte des Block produktsinformation
			    result+="<div class='col-sm'>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'id='res9'>Beschreibung		: </span><span class='lead' style='font-size:0.7em'>"+prod.getBeschreibung()+" </span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'id='res10'>Marke		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMarke()+" </span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'id='res11'>Menge im Lager		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMenge()+",Einheit : </span><span class='lead' style='font-size:0.7em'>"+prod.getMengeeinheit()+"</span></div>";
				   
			    result+="</div>";
			    //
			    result+="</div>";
			    result+="</div>";
			    result+="</div></div>";
			    //ende erster grossen Spalte
			    
			    //beginn zweiter grossen Spalte
			    result+= "<div class='col-sm-8 mt-5'>";
			    result+="<div style='max-height:500px;overflow-y:auto;'>";
			    
			    //produktsbilder laden
			    if(prod.getProduktBilder().size()!=0) {
			    	 for(Foto foto: prod.getProduktBilder()) {
			    		 result+="<img alt='bild' class='produkt ' style='width:100%; height:auto; margin:5px;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
					
			    	 }
			    }else {
			    	 result+="<h1>Keine Fotos vorhanden</h1>";
			    }
			   
			    result+="</div>";
			    result+= "</div>";
			    //ende zweiter grossen Spalte
			
			    result +="</div>";
			    //Bereich für Infos über das Unternehmen
			    result+="<h1 class='text-center lead mt-5 mb-4' style='font-weight:bold;color:#48D1CC;'id='res12'>Informationen und Bilder über das Unternehmen</h1>";
			    result+="<div class='row mt-4'>";     
			    result+="<div class='col-sm-4'>";
			    result+="<div class='card'>";
			    result+="<div class='card-body'>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'id='res13'>Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getVerkaufer().getUnternehmen().getName()+"</span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'id='res14'>Stadt               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getVerkaufer().getUnternehmen().getStadt()+"</span></div>";
			    result+="<div><span class='lead' style='font-weight:bold; font-size:0.8em;'id='res15'>genauer Position               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getVerkaufer().getUnternehmen().getStandort()+"</span></div>"; 
			    result+="</div>";
			    result+="</div>";
			    result+="</div>";
			    //column zwei
			    result+="<div class='col-sm-8'>";
			    result+="<div style='height:500px;overflow-y:auto;'>";
			   
			    if(prod.getVerkaufer().getUnternehmen().getBilder().size()!=0) {
			    	 for(Foto foto: prod.getVerkaufer().getUnternehmen().getBilder()) {
			    		 result+="<img alt='bild'  style='width:100%; height:auto; margin:5px;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
					//card-img-top
			    	 }
			    }else {
			    	 result+="<h1>Keine Fotos vorhanden</h1>";
			    }
			   
			    result+="</div>";
			    //ende card
			    result+="</div>";
			    result+="</div>";
			    //Ende Info Bereich für Unternehmen
			    
			    //Bereich für geolocalisation
			    result+="<p class='text-center lead mt-5 mb-4' style='color:#48D1CC; font-size:0.8em;'id='res16'>Klicken Sie auf das Bild für geolocation, um das Unternehmen auf der Map zu zeigen</p>";
			    result+="<div class='row mt-4'>";     
			    result+="<div class='col-sm-4'>";
			    result +="<a href='https://www.google.com/maps/search/?api=1&query="+prod.getVerkaufer().getUnternehmen().getGeolatidude()+"%2C"+prod.getVerkaufer().getUnternehmen().getGeolongitude()+"'>";
			    result+="<div class='card'style='margin-left:5px; width:150px; margin:auto;'>";
			    result+="<div class='card-body'>";
			  
			    result+="<img alt='bild' style='width:100%; height:auto; margin:5px;' src='"+request.getContextPath()+"/googlemap.jpg'/>";
			   
			    result+="</div>";
			    result+="</div>";
			    result +="</a>";
			    result+="</div>";
			    result+="</div>";
			    result+="<button class='mt-4 mb-2' style=\"width:200px; border:1px solid green;border-radius:200px; padding:5px; font-size:0.9em;background-color:green;color: white; margin:auto;\" id='bestellenbtn' >bestellen</button>";
			    
			    //Ende geolocalisation
			    
			
			
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			response.getWriter().print(result);
			}else {
				response.getWriter().print("Kein produkt wurde gefunden");
			}
			
		}else {
			
			
			
			
			/////////////////////////////////////////////////
			
			//String idprodukt = request.getParameter("idprodukt");
			String idkaufer = (String)request.getSession().getAttribute("idkaufer");
			int idk =0;
			if(idkaufer !=null) {
				idk =Integer.valueOf(idkaufer);
			}
			List <Warenkob> list = dao.getListBestellungKunde(idk);
			String dateveroeffentlichung =""; 
			String uhrzeit =""; 
			dao.updateWarekobnachiduser(idk, "kaufer");
			
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
					
					
					
					
					
				
				
				}else {
					response.getWriter().print("Kein produkt wurde gefunden");
				}
				
				
				
			}
			
			result+= "<div class='col mt-5'>";
			//Block für ausstehende Bestellungen
			result+="<div  class='lead mb-2 text-center text-warning' style='font-weight:bold; font-size:2em;' id='t1'>ausstehende Bestellungen ...</div>";
			
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
					result+= "<div class='col-sm-8 mt-5'>";
					result+= "<div class='card text-black' style='background-color:#B0E0E6;'>";
					
					
					result+="<div class='card-body'>";
					result+="<div class='row'>";
					//erste Spalte des Block produktsinformation
					result+="<div class='col'>";
					result+="<div><span class='lead mb-2 res1' style='font-weight:bold; font-size:0.7em; font-style:italic;'><u>veröffentlicht am</u> :  </span><span class='lead' style='font-size:0.7em;font-style:italic'>"+dateveroeffentlichung+" um "+uhrzeit+" </span></div>";
					result+="<div><span class='lead res2' style='font-weight:bold; font-size:0.8em;' >Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getName()+"</span></div>";
					result+="<div><span class='lead res3' style='font-size:0.8em;font-weight:bold;' >Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
				    result+="<div><span class='lead res4' style='font-weight:bold; font-size:0.8em;' >Stadt               : </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStadt()+"</span></div>";
				    result+="<div><span class='lead res5' style='font-weight:bold; font-size:0.8em;' ><u>genauer Standort              </u> :  </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStandort()+"</span></div>";   
				    result+="</div>";
				    //zweite spalte des Block produktsinformation
				    result+="<div class='col'>";
				    result+="<div><span class='lead res6' style='font-weight:bold; font-size:0.8em;' >Beschreibung		: </span><span class='lead' style='font-size:0.7em'>"+prod.getBeschreibung()+" </span></div>";
				    result+="<div><span class='lead res7' style='font-weight:bold; font-size:0.8em;' >Marke		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMarke()+" </span></div>";
				    result+="<div><span class='lead res8' style='font-weight:bold; font-size:0.8em;' >Menge im Lager		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMenge()+",Einheit : </span><span class='lead' style='font-size:0.7em'>"+prod.getMengeeinheit()+"</span></div>";
					   
				    result+="</div>";
				    //
				    result+="</div>";//end row
				    
				    result+="</div>";
				    result+="</div></div>";
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
				    	 result+="<h1>Keine Fotos vorhanden</h1>";
				    }
				   
				  
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
			
			result+="<div  class='lead mb-2 mt-2 text-center text-success' style='font-weight:bold; font-size:2em;' id='t2'>Bestaetigte Bestellungen</div>";
			int count =0;
			
			if(bestaetigt.size()==0) {
				result+="<div class='row'>";
				result+="<div class='col-sm-4 mt-5'></div>";
				result+="<div class='col-sm-4 mt-5'><img src='"+request.getContextPath()+"/img/empty2.png' width='100%' height='auto' alt='empty'/></div>";
				result+="<div class='col-sm-4 mt-5'></div>";
				result+="</div>";
			}else {
				String barcode ="";
				String longitude="";
				String latitude="";
				int idwarenk=0;
				
				for (Produkt prod : bestaetigt) {
					barcode = prod.getVerkaufer().getUnternehmen().getBarcode();
					longitude = prod.getVerkaufer().getUnternehmen().getGeolongitude();
					latitude = prod.getVerkaufer().getUnternehmen().getGeolatidude();
					idwarenk = prod.getWarenkob().getIdWarenkob();
					request.getSession().setAttribute("bestaetigt", "true");
					if(prod.getDatum()!=null) {
						dateveroeffentlichung =prod.getDatum().split(" ")[0];
						 uhrzeit = prod.getDatum().split(" ")[1];
					}
					//zweiter Card
					result+="<div class='card mb-3' >";
					result+="<div class='card-body'>";
					//blockbegin
					result+="<div class='row'>";
					result+= "<div class='col-sm-8 mt-5'>";
					result+= "<div class='card text-black' style='background-color:#B0E0E6;' >";
					
					
					result+="<div class='card-body'>";
					result+="<div class='row'>";
					//erste Spalte des Block produktsinformation
					result+="<div class='col'>";
					result+="<div><span class='lead mb-2 res1' style='font-weight:bold; font-size:0.7em; font-style:italic;' ><u>veröffentlicht am</u> :  </span><span class='lead' style='font-size:0.7em;font-style:italic'>"+dateveroeffentlichung+" um "+uhrzeit+" </span></div>";
					result+="<div><span class='lead res2' style='font-weight:bold; font-size:0.8em;'>Name               :  </span><span class='lead' style='font-size:0.7em;'>"+prod.getName()+"</span></div>";
					result+="<div><span class='lead res3' style='font-size:0.8em;font-weight:bold;' >Preis               :  </span><span class='lead' style='font-size:1.5em;color:#48D1CC;'>"+prod.getPreis()+"  </span><span class='lead text-primary' style='font-size:0.8em;font-weight:bold;'>"+prod.getWährung()+"</span></div>";
				    result+="<div><span class='lead res4' style='font-weight:bold; font-size:0.8em;' >Stadt               : </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStadt()+"</span></div>";
				    result+="<div><span class='lead res5' style='font-weight:bold; font-size:0.8em;' ><u>genauer Standort              </u> :  </span><span class='lead' style='font-size:0.7em'>"+prod.getVerkaufer().getUnternehmen().getStandort()+"</span></div>";   
				   
				    result+="</div>";
				    //zweite spalte des Block produktsinformation
				    result+="<div class='col'>";
				    result+="<div><span class='lead res6' style='font-weight:bold; font-size:0.8em;'>Beschreibung		: </span><span class='lead' style='font-size:0.7em'>"+prod.getBeschreibung()+" </span></div>";
				    result+="<div><span class='lead res7' style='font-weight:bold; font-size:0.8em;' >Marke		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMarke()+" </span></div>";
				    result+="<div><span class='lead res8' style='font-weight:bold; font-size:0.8em;' >Menge im Lager		: </span><span class='lead' style='font-size:0.7em'>"+prod.getMenge()+",Einheit : </span><span class='lead' style='font-size:0.7em'>"+prod.getMengeeinheit()+"</span></div>";
				    result+="</div>";
				    //
				    result+="</div>";//end row
				    
				    result+="</div>";
				    result+="</div>";
				    //Bereich für Timer
				    result+="<div class='mt-2 mb-1'>";
				    result+="<img alt='bild'  style='width:25px; height:auto; margin:5px;' src='img/timer.png'/>";
				    result+="<div id='"+count+"' style='color:green;font-size:2.5em'></div>";
				    result+="<button class='storno res13'    style=\"width:200px; border:1px solid #FF8C00;border-radius:200px; padding:5px; font-size:0.9em;background-color:#FF8C00;color: white; margin:auto;\"   id='"+prod.getWarenkob().getIdWarenkob()+"' onclick='storno("+prod.getWarenkob().getIdWarenkob()+")'>stornieren</button>";
				    result+="<div class='fehlermeldung3 mt-2 text-warning' style='font-size:0.8em;'></div>";
				    result+="<div class='fehlermeldung mt-2 text-danger' style='font-size:0.8em;'></div>";
				    
				    //modal start
				    result+="<div class='confirmbuttonblock'>";
				    result+="<div class='textconfirm2' style='font-weight:bold; font-size:0.9em;'>You can also confirm having taken your order before the Time run out !";
				    result+="</div>";
				    result+="<button type='button' class='confirm' style='width:100px; border:1px solid black;border-radius:200px; padding:5px; font-size:0.7em;background-color:black;color: white; margin:auto;' data-mdb-toggle='modal' data-mdb-target='#exampleModal"+count+"'>confirm</button>";
				    result+="</div>";
				    result+="<div class='modal fade'  id='exampleModal"+count+"' tabindex='-1' aria-labelledby='exampleModalLabel"+count+"' aria-hidden='true'>";
				    	result+="<div class='modal-dialog' >";
				    		result+="<div class='modal-content'>"; 
				    			result+="<div class='modal-body p-2' style='min-height: 600px;'>";
				    				result+="<button type='button' class='btn-close'  data-mdb-dismiss='modal' aria-label='Close'></button>";
				    				//neu
				    				result+="<div class='mt-5 mb-4 textconfirm' style='text-align: center; font-weight: bold; font-size=0.8em;' id='textconfirm1'>Please the mean you want to confirm !</div>";
				    				result+="<div class='form-check mx-2'>";
				    					result+="<input type='radio' name='confoption1' onclick='confirmOptionFunction(this,\""+barcode+"\","+longitude+","+latitude+","+idwarenk+","+count+",\""+QRcode.readQRcode(prod.getVerkaufer().getPerson().getEmail())+"\")' class='form-check-input' value='option1' id='check1'>";
				    					result+="<label for='check1' style='font-weight:bold; font-size:0.8em; color:#48D1CC;' class='form-check-label confoption1' ></label>";								
				    				result+="</div>";
				    				result+="<div class='form-check mt-2 mx-2'>";
				    					result+="<input type='radio' name='confoption1' onclick='confirmOptionFunction(this,\""+barcode+"\","+longitude+","+latitude+","+idwarenk+","+count+",\""+QRcode.readQRcode(prod.getVerkaufer().getPerson().getEmail())+"\")' class='form-check-input' value='option2' id='check2'>";
				    					result+="<label for='check2' style='font-weight:bold; font-size:0.8em; color:#48D1CC;' class='form-check-label confoption2' ></label>";								
			    					result+="</div>";
			    					result+="<div id='confcontentoption"+count+"'></div>";
				    				//end neu
				    				/*
				    				result+="<div class='mt-5 mb-3 textconfirm' style='text-align: center; font-weight: bold; font-size=0.8em;' id='textconfirm'>Please put the Code, that you recieve from the seller in following field !</div>";
				    				result+="<div class='mb-1' style='text-align:center; font-weight: bold; font-size: 1.4em; color:#2E8B57;'>Code</div>";
				    			    result+="<div>";
				    					result+="<div class='form-outline mb-2' >";
				    							result+="<input type='password' style='font-size:0.8em;' class='form-control code' name='code' placeholder='e.g: TE123-345-SE12' id='code"+count+"'/>";
				    							result+="<label for='code"+count+"' style='font-size:0.8em;' class='form-label labelconfirm'>Code here</label>";
				    					result+="</div>";
				    					result+="<div class='mt-2' style='width:50%; margin:auto;'>";
				    							result+="<button class='buttonconfirm' onclick='checkCodeSeller(\""+barcode+"\","+longitude+","+latitude+","+idwarenk+","+count+")' style='width:100%; border:1px solid #48D1CC;border-radius:200px; padding:5px; font-size:0.8em;background-color:#48D1CC;color: white; margin:auto;'>send</button>";
				    							result+="<span id='fehler"+count+"' style='width:50%;margin:auto;'></span>";		
				    					result+="</div>";
				    				result+="</div>";
				    				*/
				    		  result+="</div>";
				        
				    	   result+="</div>";
				     result+="</div>";
				  result+="</div>";

				    //modal end
				    result+="</div>";
				    result+="<div class='blockantwort' style='visibility:hidden;'>";
				    result+="<p class='text-center mt-2 res9' >Haben Sie Ihre Bestellung abgeholt?</p>";
				    result+="<div style='width:20%; margin:auto;'>";
				    result+="<button class=' me-2 mb-1 res10' style=\"width:100px; border:1px solid green;border-radius:100px; padding:5px; font-size:0.8em;background-color:green;color: white; margin:auto;\"  onclick='antwortja("+prod.getWarenkob().getIdWarenkob()+")'>Ja</button>";
				    result+="<button class=' me-2 res11' style=\"width:100px; border:1px solid red;border-radius:200px; padding:5px; font-size:0.8em;background-color:red;color: white; margin:auto;\" onclick='antwortnein("+prod.getWarenkob().getIdWarenkob()+")'>Nein</button>"; 
				    result+="</div>";
				    result+="</div>";
				   
				    //end Timerbereich
				    result+="</div>";  
				    //ende erster grossen Spalte
				    
				    //beginn zweiter grossen Spalte
				    result+= "<div class='col-sm-4 mt-5'>";
				    result+="<div style='height:500px;overflow-y:auto;'>";
				   
				    result+="<div class='mt-1 mb-1 lead res12' style='font-size:0.8em;' >holen Sie sich ihre Bestellung bevor der Timer ablaeuft</div>";
				    //produktsbilder laden
				    if(prod.getProduktBilder().size()!=0) {
				    	 for(Foto foto: prod.getProduktBilder()) {
				    		 result+="<img alt='bild'  style='width:100%; height:auto; margin:5px;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
						
				    	 }
				    }else {
				    	 result+="<h1>Keine Fotos vorhanden</h1>";
				    }
				   
				   
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
				result+="<div class='card mb-1' style='background-color:#B0E0E6;'>";
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
			    result+="<div style='max-height:500px;overflow-y:auto;'>";
			   
			    //produktsbilder laden
			    if(prod.getProduktBilder().size()!=0) {
			    	 for(Foto foto: prod.getProduktBilder()) {
			    		 result+="<img alt='bild' class='produkt card-img-top' style='width:100%; height:auto; margin:5px;' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
					
			    	 }
			    }else {
			    	 result+="<h1>Keine Fotos vorhanden</h1>";
			    }
			   
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
			
			
			
		}
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
