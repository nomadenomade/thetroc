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
import Model.Betreiber;
import Model.Foto;
import Model.Kaufer;
import Model.Person;
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
			    result+="<div class='col-sm-8 mt-5'>";
			    result+="<button type='button' style='background-color:white;border:1px solid white;' data-mdb-toggle='modal' data-mdb-target='#windowimageproduct'>";
			    if(prod.getProduktBilder().size()!=0) {
			    	 result+="<img src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+prod.getProduktBilder().get(0).getName()+"' style='width:100%; height:auto; margin:5px;' alt='productimage'/>";
			    }
			    result+="</button>";
			    result+="<div id='windowimageproduct' class='modal fade' tabindex='-1' aria-labelledby='windowimageproductlabel' aria-hidden='true'>";
				    result+="<div class='modal-dialog'>";
					    result+="<div class='modal-content'>";
					    result+="<div class='modal-body' style='min-height:500px;'>";
					    //carousel start
					    	result+="<div class='carousel slide' id='carousel1' data-mdb-ride='carousel'>";
					    		int counter1 =1;
					    		//indicators
					    		result+="<div class='carousel-indicators'>";
						    		result+="<button type='button' class='active' aria-current='true' data-mdb-target='#carousel1Indicators' data-mdb-slide-to='0' aria-label='Slide 1'>";
					    			result+="</button>";
					    		for(Foto foto: prod.getProduktBilder()) {
					    			result+="<button type='button' data-mdb-target='#carousel1Indicators' data-mdb-slide-to='"+counter1+"' aria-label='Slide "+(counter1 +1)+"'>";
					    			result+="</button>";
					    			counter1++;
					    		}
					    		result+="</div>";
					    		//indicator end
					    		result+="<div class='carousel-inner'>";
					    			result+="<div class='carousel-item active'>";
					    				result+="<img class='d-block w-100' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+prod.getProduktBilder().get(0).getName()+"' style='width:100%; height:auto; margin:5px;' alt='productimage'/>";
					    			result+="</div>";
					    			for(Foto foto: prod.getProduktBilder()) {
					    				result+="<div class='carousel-item'>";
					    					result+="<img alt='bild' class='produkt d-block w-100' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
					    				result+="</div>";
					    			}
					    		result+="</div>";
					    		result+="<button type='button' class='carousel-control-prev' data-mdb-target='#carousel1' data-mdb-slide='prev'>";
					    			result+="<span class='carousel-control-prev-icon' aria-hidden='true'></span>";
					    			result+="<span class='visually-hidden'>Preview</span>";
					    		result+="</button>";
					    		result+="<button type='button' class='carousel-control-next' data-mdb-target='#carousel1' data-mdb-slide='next'>";
				    				result+="<span class='carousel-control-next-icon'  aria-hidden='true'></span>";
				    				result+="<span class='visually-hidden'>Next</span>";
				    		    result+="</button>";
					    	result+="</div>";
					    //carousel end	
					    result+="</div>";
					    //modalbody end
					    result+="</div>";
				    result+="</div>";
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
			    
			    //zweiter new
			    result+="<button type='button' style='background-color:white;border:1px solid white;' data-mdb-toggle='modal' data-mdb-target='#windowimageseller'>";
			    if(prod.getVerkaufer().getUnternehmen().getBilder().size()!=0) {
			    	 result+="<img src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+prod.getVerkaufer().getUnternehmen().getBilder().get(0).getName()+"' style='width:100%; height:auto; margin:5px;' alt='productimage'/>";
			    }
			    result+="</button>";
			    result+="<div id='windowimageseller' class='modal fade' tabindex='-1' aria-labelledby='windowimagesellerlabel' aria-hidden='true'>";
				    result+="<div class='modal-dialog'>";
					    result+="<div class='modal-content'>";
					    result+="<div class='modal-body' style='min-height:500px;'>";
					    //carousel start
					    	result+="<div class='carousel slide' id='carousel2' data-mdb-ride='carousel'>";
					    		int counter =1;
					    		//indicators
					    		result+="<div class='carousel-indicators'>";
						    		result+="<button type='button' class='active' aria-current='true' data-mdb-target='#carousel2Indicators' data-mdb-slide-to='0' aria-label='Slide 1'>";
					    			result+="</button>";
					    		for(Foto foto: prod.getVerkaufer().getUnternehmen().getBilder()) {
					    			result+="<button type='button' data-mdb-target='#carousel2Indicators' data-mdb-slide-to='"+counter+"' aria-label='Slide "+(counter +1)+"'>";
					    			result+="</button>";
					    			counter1++;
					    		}
					    		result+="</div>";
					    		//indicator end
					    		result+="<div class='carousel-inner'>";
					    			result+="<div class='carousel-item active'>";
					    				result+="<img class='d-block w-100' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+prod.getVerkaufer().getUnternehmen().getBilder().get(0).getName()+"' style='width:100%; height:auto; margin:5px;' alt='productimage'/>";
					    			result+="</div>";
					    			for(Foto foto: prod.getVerkaufer().getUnternehmen().getBilder()) {
					    				result+="<div class='carousel-item'>";
					    					result+="<img alt='bild' class='produkt d-block w-100' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
					    				result+="</div>";
					    			}
					    		result+="</div>";
					    		result+="<button type='button' class='carousel-control-prev' data-mdb-target='#carousel2' data-mdb-slide='prev'>";
					    			result+="<span class='carousel-control-prev-icon' aria-hidden='true'></span>";
					    			result+="<span class='visually-hidden'>Preview</span>";
					    		result+="</button>";
					    		result+="<button type='button' class='carousel-control-next' data-mdb-target='#carousel2' data-mdb-slide='next'>";
				    				result+="<span class='carousel-control-next-icon'  aria-hidden='true'></span>";
				    				result+="<span class='visually-hidden'>Next</span>";
				    		    result+="</button>";
					    	result+="</div>";
					    //carousel end	
					    result+="</div>";
					    //modalbody end
					    result+="</div>";
				    result+="</div>";
			    result+="</div>";
			    // end zweiter new
			   
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
				    //neu block image
				    if(prod.getProduktBilder().size()!=0) {
				    	 //carousel start
				    	result+="<div class='carousel slide carousel-dark' id='carousel"+prod.getIdProdukt()+"' data-mdb-touch='false' data-mdb-ride='carousel'>";
				    		int counter1 =1;
				    		//indicators
				    		result+="<div class='carousel-indicators'>";
					    		result+="<button type='button' class='active' aria-current='true' data-mdb-target='#carousel"+prod.getIdProdukt()+"Indicators' data-mdb-slide-to='0' aria-label='Slide 1'>";
				    			result+="</button>";
				    		for(Foto foto: prod.getProduktBilder()) {
				    			result+="<button type='button' data-mdb-target='#carousel"+prod.getIdProdukt()+"Indicators' data-mdb-slide-to='"+counter1+"' aria-label='Slide "+(counter1 +1)+"'>";
				    			result+="</button>";
				    			counter1++;
				    		}
				    		result+="</div>";
				    		//indicator end
				    		result+="<div class='carousel-inner'>";
				    			result+="<div class='carousel-item active'>";
				    				result+="<img class='d-block w-100' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+prod.getProduktBilder().get(0).getName()+"' style='width:100%; height:auto; margin:5px;' alt='productimage'/>";
				    			result+="</div>";
				    			for(Foto foto: prod.getProduktBilder()) {
				    				result+="<div class='carousel-item'>";
				    					result+="<img alt='bild' class='produkt d-block w-100' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
				    				result+="</div>";
				    			}
				    		result+="</div>";
				    		result+="<button type='button' class='carousel-control-prev' data-mdb-target='#carousel"+prod.getIdProdukt()+"' data-mdb-slide='prev'>";
				    			result+="<span class='carousel-control-prev-icon' aria-hidden='true'></span>";
				    			result+="<span class='visually-hidden'>Preview</span>";
				    		result+="</button>";
				    		result+="<button type='button' class='carousel-control-next' data-mdb-target='#carousel"+prod.getIdProdukt()+"' data-mdb-slide='next'>";
			    				result+="<span class='carousel-control-next-icon'  aria-hidden='true'></span>";
			    				result+="<span class='visually-hidden'>Next</span>";
			    		    result+="</button>";
				    	result+="</div>";
				    //carousel end	
				    }
			        //neu block end
				  
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
				Betreiber betreiber = (Betreiber)request.getSession().getAttribute("betreiber");
				Kaufer kaufer = (Kaufer)request.getSession().getAttribute("kaufer");
				
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
				    //bereich zahlung
				    result+="<div class='d-flex justify-content-center'>";
				    //start modal2
				    result+="<div class='payblock'>";
				    result+="<div class='paytext' style='font-weight:bold; font-size:0.9em;'>You can try paying your oder with your 'Thetroc gains' before confirming to have taken your product !";
				    result+="</div>";
				    result+="<button type='button' class='pay' style='width:100px; border:1px solid blue;border-radius:200px; padding:5px; font-size:0.9em;background-color:white;color:blue; margin:auto;' data-mdb-toggle='modal' data-mdb-target='#exampleModal2"+count+"'>Pay</button>";
				    result+="</div>";
				    result+="<div class='modal fade'  id='exampleModal2"+count+"' tabindex='-1' aria-labelledby='exampleModal2Label"+count+"' aria-hidden='true'>";
				    	result+="<div class='modal-dialog' >";
				    		result+="<div class='modal-content'>"; 
				    			result+="<div class='modal-body p-2' style='min-height: 400px;'>";
				    				result+="<button type='button' class='btn-close'  data-mdb-dismiss='modal' aria-label='Close'></button>";
				    				//
				    				if(betreiber !=null && betreiber.getGutscheinfunction().equals("activated")) {
				    					Person pers = kaufer.getPerson();
				    					kaufer.setPerson(dao.getPerson(pers.getId()));
				    					String gewinn = kaufer.getPerson().getGewinn();
				    					double gewinnDoubleValue = 0;
				    					double preisprodukt = Double.valueOf(prod.getPreis());
				    					if(gewinn !=null) {
				    						gewinnDoubleValue = Double.valueOf(gewinn);
				    						if(gewinnDoubleValue >= preisprodukt) {
				    							double rest = gewinnDoubleValue-preisprodukt;
				    							result+="<div class='mt-5 mb-4 paytext2' style='text-align: center; font-weight: bold; font-size:1.3em; color:#48D1CC;' >Please click on 'thetroc money' to pay  !</div>";
				    							result+="<div class='lead  ms-2 mb-2'><span class=' paytext3' style='font-size:0.9em;'>Amount to pay :</span><span class='fw-bold' style='font-size:1em; color:blue;'>"+prod.getPreis()+"</span> <span>"+prod.getWährung()+"</span></div>";
				    							result+="<div class='lead  ms-2' mb-3><span class=' paytext4' style='font-size:0.9em;'>Your actual Thetroc Gains :</span><span class='fw-bold' style='font-size:1em; color:green;'>"+kaufer.getPerson().getGewinn()+"</span> <span>"+prod.getWährung()+"</span></div>";
				    							result+="<div class'mb-2' style='border-bottom:3px dotted black'></div>";
				    							result+="<div class='lead  ms-2 mb-2'><span class=' paytext5' style='font-size:0.9em;'>Remaining Thetroc Gains :</span><span class='fw-bold' style='font-size:1em; color:#D2691E;'>"+rest+"</span> <span>"+prod.getWährung()+"</span></div>";
				    							result+="<div class='d-flex justify-content-center'>";
				    							result+="<div><button style='min-width:120px; background-color:white; padding:3px; border:1px solid blue; border-color:blue; border-radius:100px;' onclick='thetrocpay(\""+barcode+"\","+kaufer.getPerson().getId()+",\""+kaufer.getPseudo()+"\",\""+kaufer.getPerson().getEmail()+"\","+prod.getVerkaufer().getIdVerkaufer()+",\""+prod.getPreis()+"\",\""+prod.getName()+"\","+rest+","+count+","+prod.getWarenkob().getIdWarenkob()+")'><img src='img/moneylogo.png' width='70px' /> <span class='lead fw-bold 'style='font-size:1.1em;color:#48D1CC;'>Pay</span></button></div>";
				    							result+="<div class='mt-2' id='paytextconfirmsticker"+count+"'></div>";
				    							result+="<div class='mt-2' id='paytextconfirmtext"+count+"'></div>";
				    							result+="</div>";
				    							
				    							
				    							
				    						}else {
				    							double rest=0;
				    							result+="<div class='mt-5 mb-4 paytext8' style='text-align: center; font-weight: bold; font-size:1.3em; color:orange;' >Your Thetroc gains are not enought to pay the total amount of this oder!</div>";
				    							result+="<div class='lead  ms-2 mb-2'><span class=' paytext3' style='font-size:0.9em;'>Amount to pay :</span><span class='fw-bold' style='font-size:1em; color:blue;'>"+prod.getPreis()+"</span> <span>"+prod.getWährung()+"</span></div>";
				    							result+="<div class='lead  ms-2' mb-3><span class=' paytext4' style='font-size:0.9em;'>Your actual Thetroc Gains :</span><span class='fw-bold' style='font-size:1em; color:green;'>"+kaufer.getPerson().getGewinn()+"</span> <span>"+prod.getWährung()+"</span></div>";
				    							result+="<div class'mb-2' style='border-bottom:3px dotted black'></div>";
				    							result+="<div class='lead  ms-2 mb-3'><span class=' paytext5' style='font-size:0.9em;'>Remaining Thetroc Gains :</span><span class='fw-bold' style='font-size:1em; color:#D2691E;'>0 </span> <span>"+prod.getWährung()+"</span></div>";
				    							result+="<div class='text-justify mb-2 lead paytext7' style='font-size:0.8em;'>your can nevertheless pay a part of the amount if the seller accept it. For this operation put the QR String Code of the seller in the following field !</div>";
				    							result+="<div class='form-outline mb-2'><input type='password' class='form-control' id='paycodefield"+count+"'  /><label class='form-label' for='paycodefield"+count+"'>QRcode here</label></div>";
				    							result+="<div class='d-flex justify-content-center'>";
				    							result+="<div><button style='min-width:120px; background-color:white; padding:3px; border:1px solid blue; border-color:blue; border-radius:100px;' onclick='thetrocpay2(\""+barcode+"\","+kaufer.getPerson().getId()+",\""+kaufer.getPseudo()+"\",\""+kaufer.getPerson().getEmail()+"\","+prod.getVerkaufer().getIdVerkaufer()+",\""+prod.getPreis()+"\",\""+prod.getName()+"\","+rest+","+count+","+prod.getWarenkob().getIdWarenkob()+")'><img src='img/moneylogo.png' width='70px' /> <span class='lead fw-bold'style='font-size:1.1em;color:#48D1CC;'>Pay</span></button></div>";
				    							result+="<div class='mt-2' id='paytextconfirmsticker"+count+"'></div>";
				    							result+="<div class='mt-2' id='paytextconfirmtext"+count+"'></div>";
				    							result+="</div>";
				    						}
				    					}
				    					
				    				}else {
				    					result+="<div class='mt-5  paytext6' style='text-align: center; font-weight: bold; font-size:1.3em; color:red;' >This Functionality has been temporaly deactivated !</div>";
				    				}
				    				
				    				//
				    		  result+="</div>";
				        
				    	   result+="</div>";
				     result+="</div>";
				  result+="</div>";
				    //end modal2
				    result+="</div>";
				    //end bereich zahlung
				    result+="</div>";  
				    //ende erster grossen Spalte
				    
				    //beginn zweiter grossen Spalte
				    result+= "<div class='col-sm-4 mt-5'>";
				    
				    //neu block image
				    if(prod.getProduktBilder().size()!=0) {
				    	 //carousel start
				    	result+="<div class='carousel slide carousel-dark' id='carousel"+prod.getIdProdukt()+"' data-mdb-touch='false' data-mdb-ride='carousel'>";
				    		int counter1 =1;
				    		//indicators
				    		result+="<div class='carousel-indicators'>";
					    		result+="<button type='button' class='active' aria-current='true' data-mdb-target='#carousel"+prod.getIdProdukt()+"Indicators' data-mdb-slide-to='0' aria-label='Slide 1'>";
				    			result+="</button>";
				    		for(Foto foto: prod.getProduktBilder()) {
				    			result+="<button type='button' data-mdb-target='#carousel"+prod.getIdProdukt()+"Indicators' data-mdb-slide-to='"+counter1+"' aria-label='Slide "+(counter1 +1)+"'>";
				    			result+="</button>";
				    			counter1++;
				    		}
				    		result+="</div>";
				    		//indicator end
				    		result+="<div class='carousel-inner'>";
				    			result+="<div class='carousel-item active'>";
				    				result+="<img class='d-block w-100' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+prod.getProduktBilder().get(0).getName()+"' style='width:100%; height:auto; margin:5px;' alt='productimage'/>";
				    			result+="</div>";
				    			for(Foto foto: prod.getProduktBilder()) {
				    				result+="<div class='carousel-item'>";
				    					result+="<img alt='bild' class='produkt d-block w-100' src='Dateien/"+prod.getVerkaufer().getPerson().getEmail()+"/"+foto.getName()+"'/>";
				    				result+="</div>";
				    			}
				    		result+="</div>";
				    		result+="<button type='button' class='carousel-control-prev' data-mdb-target='#carousel"+prod.getIdProdukt()+"' data-mdb-slide='prev'>";
				    			result+="<span class='carousel-control-prev-icon' aria-hidden='true'></span>";
				    			result+="<span class='visually-hidden'>Preview</span>";
				    		result+="</button>";
				    		result+="<button type='button' class='carousel-control-next' data-mdb-target='#carousel"+prod.getIdProdukt()+"' data-mdb-slide='next'>";
			    				result+="<span class='carousel-control-next-icon'  aria-hidden='true'></span>";
			    				result+="<span class='visually-hidden'>Next</span>";
			    		    result+="</button>";
				    	result+="</div>";
				    //carousel end	
				    }
			        //neu block end
				   
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
