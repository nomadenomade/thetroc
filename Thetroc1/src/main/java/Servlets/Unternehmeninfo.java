package Servlets;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import DAO.UnternehmenDAO;
import DAO.VerkauferDAO;
import Model.Foto;
import Model.Person;
import Model.Unternehmen;
import Model.Verkaufer;
import helpklasse.Checkfotosresult;
import helpklasse.Checkproduktfoto;

/**
 * Servlet implementation class Unternehmeninfo
 */
@WebServlet("/Unternehmeninfo")
public class Unternehmeninfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Unternehmeninfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 String name = request.getParameter("name");
	 String adresse = request.getParameter("adresse");
	 String stadt = request.getParameter("stadt");
	 String latitude = request.getParameter("latitude");
	 String longitude = request.getParameter("longitude");
	 System.out.println("lat:"+latitude);
	 System.out.println("lng:"+longitude);
	 
	 String fehler1=null;
	 String fehler2=null;
	 Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
	 
	 if(name !=null && !name.equals("")) {
		 fehler1 ="";
	 }else {
		 if(request.getSession().getAttribute("language")!=null && request.getSession().getAttribute("language").equals(0)){
			 fehler1="please give the name of your company, shop, restaurant...etc";
		 }else if(request.getSession().getAttribute("language")!=null && request.getSession().getAttribute("language").equals(1)) {
			fehler1="s'il vous plait, donner le nom de votre entreprise,magasin,boutique,restaurant ...etc";
		 }else {
			 fehler1 ="Sie müssen den Namen Ihres Unternehmen oder laden, restaurant...etc eingeben";  
		 }
	 }
	 
	 if(adresse !=null && !adresse.equals("")) {
		 fehler2 ="";
	 }else {
		 
		 if(request.getSession().getAttribute("language")!=null && request.getSession().getAttribute("language").equals(0)){
			 fehler2="please where is your company,shop...etc located?";
		 }else if(request.getSession().getAttribute("language")!=null && request.getSession().getAttribute("language").equals(1)) {
			fehler2="où est situé votre entreprise,magasin,boutique,restaurant ...etc";
		 }else {
			 fehler2 ="Wo befindet sich ihr Unternehmen, laden, restaurant...etc eingeben";  
		 }
	 }
	 
	 if(fehler1!=null && fehler1.equals("") && fehler2 !=null && fehler2.equals("")) {
		 Unternehmen unternehmen = new Unternehmen();
		 unternehmen.setName(name);
		 unternehmen.setStandort(adresse);
		 unternehmen.setStadt(stadt);
		 unternehmen.setGeolatidude(latitude);
		 unternehmen.setGeolongitude(longitude);
		 
		 
			
			
			unternehmen.setVerkaufer(verkaufer);		
			UnternehmenDAO dao = new UnternehmenDAO();
			
			if(dao.isUnternehmenVorhanden(unternehmen)) {
				
				if(dao.infoUpdate(unternehmen)) {
					 if(request.getSession().getAttribute("language")!=null && request.getSession().getAttribute("language").equals(0)){
						 request.setAttribute("erfolg", "Update completed successfully");
					 }else if(request.getSession().getAttribute("language")!=null && request.getSession().getAttribute("language").equals(1)) {
						 request.setAttribute("erfolg", "données actualisées avec succès");
					 }else {
						 request.setAttribute("erfolg", "Update erfolgreicht durchgeführt");
					 }
				
					
				}
			}else {
				
				if(dao.infoSpeichern(unternehmen)) {
					verkaufer.setUnternehmen(dao.getUnternehmen(verkaufer.getIdVerkaufer()));
					request.setAttribute("verkaufer", verkaufer);
					 if(request.getSession().getAttribute("language")!=null && request.getSession().getAttribute("language").equals(0)){
						 request.setAttribute("erfolg", "Data saved successfully");
					 }else if(request.getSession().getAttribute("language")!=null && request.getSession().getAttribute("language").equals(1)) {
						 request.setAttribute("erfolg", "données sauvegardées avec succès");
					 }else {
						 request.setAttribute("erfolg", "Daten erfolgreich gespeichert");
					 }
					
			}
			
			}
			
			
	 }else {
		 
		 request.setAttribute("fehler1", fehler1);
		 request.setAttribute("fehler2", fehler2);
		 
	 }
	
		request.setAttribute("name", name);
		request.setAttribute("adresse", adresse);
		request.getRequestDispatcher("WEB-INF/Unternehmeninfo.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		int dateigroesse = 1048*1048*4;
		factory.setSizeThreshold(dateigroesse);
		factory.setRepository(new File (request.getContextPath()+"/Dateien/files"));
		
		ServletFileUpload upload = new ServletFileUpload(factory);
	
		Checkproduktfoto check ;
		Foto foto = new Foto();
		UnternehmenDAO dao = new UnternehmenDAO();
		Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
		
		
		//end
		List <String> list = new ArrayList<>();
		List <String> bildname = new ArrayList<>();
		List <String> bildsize = new ArrayList<>();
		HttpSession session = request.getSession(true);
		session.setAttribute("userEmail",verkaufer.getPerson().getEmail());
		int idUnternehmen = verkaufer.getUnternehmen().getIdUnternehmen();
		session.setAttribute("unternehmenid", idUnternehmen);
		if(idUnternehmen==0) {
			int language = (int)request.getSession().getAttribute("language");
			if(language==0) {
				request.setAttribute("fehlermeldung2", "you should create a company first to purchase this task");
			}else if(language==1) {
				request.setAttribute("fehlermeldung2", "Vous avez d abord créer votre entreprise sur le formulaire dédié");
				
			}else if(language==2) {
				request.setAttribute("fehlermeldung2", "Sie haben noch kein Unternehmen erstellt");
			}
			request.getRequestDispatcher("WEB-INF/Unternehmeninfo.jsp").forward(request, response);
		
		}
		
		
		if(idUnternehmen!=0 &&dao.isAnzahlBilderErreicht(idUnternehmen)){
			try {
				List<FileItem> items = upload.parseRequest(request);
				if(items!=null) {
					for (FileItem item : items) {
						if(!item.isFormField()) {
							
							//result+="Name:"+item.getName()+",Size:"+item.getSize()+",ismemory:"+item.isInMemory()+"Contenttype:"+item.getContentType()+"<br>";
							String name= item.getName();
							if(name!=null && !name.equals("")) {
								
								String extension = item.getName().substring(item.getName().lastIndexOf(".")+1, (item.getName().length()));
								
								foto.setName(item.getName());
								foto.setExtension(extension);
								foto.setSize(item.getSize());
								
								bildname.add(item.getName());
								bildsize.add(String.valueOf(item.getSize()));
								
								check = new Checkproduktfoto(foto);
								
								
								if(check.checkAll()) {
									
									
									boolean rueck =dao.bilderUnternehmenSpeichern(verkaufer.getUnternehmen().getIdUnternehmen(), foto);
									request.setAttribute("fehlermeldung2",rueck);
									list.add(item.getName());
									//Verzeichnis für User mit entspechender Email erzeugen falls noch nicht geschiehen 
									//Die entsprechende Datei wird dann in diesem Ordner gespeichert
									//
									String pfad ="C:\\Users\\user\\eclipse-workspace\\Thetroc1\\src\\main\\webapp\\Dateien\\";
									String contextpfad =this.getServletContext().getContextPath();
									if(rueck) {
										File userOrdner = new File(pfad+verkaufer.getPerson().getEmail());
										if(!userOrdner.exists()) {
											if(userOrdner.mkdir()) {
												File file = new File(pfad+verkaufer.getPerson().getEmail()+"\\"+item.getName());
												try {
													item.write(file);
												} catch (Exception e) {
													// TODO Auto-generated catch block
													e.printStackTrace();
												}
												
											}
										}else {
											File file = new File(pfad+verkaufer.getPerson().getEmail()+"\\"+item.getName());
											try {
												item.write(file);
											} catch (Exception e) {
												// TODO Auto-generated catch block
												e.printStackTrace();
											}
											
										}
									}
									
									
								}else {
									int language = (int)request.getSession().getAttribute("language");
									if(language==0) {
										request.setAttribute("fehlermeldung2", "the give file type ist not allowed ");
									}else if(language==1) {
										request.setAttribute("fehlermeldung2", "le type de fichier que vous venez de charger n est pas autoriser");
										
									}else if(language==2) {
										request.setAttribute("fehlermeldung2", "Achtung! "+Checkfotosresult.DATEI_FORMAT_FALSCH+","+ Checkfotosresult.DATEI_ZU_GROSS);
										
									}
									
									break;
									
									
								}
							}
							
							
							
						}
					}
				}else {
					int language = (int)request.getSession().getAttribute("language");
					if(language==0) {
						request.setAttribute("fehlermeldung2", "you habe not yet upload any images ");
					}else if(language==1) {
						request.setAttribute("fehlermeldung2", "Vous n'avez jusqu'à présent télécharger aucune images");
						
					}else if(language==2) {
						request.setAttribute("fehlermeldung2", "Sie haben kein Bild geladen");
					}
					
				}
				
				
				session.setAttribute("listbilderunternehmen", list);
				session.setAttribute("bildnameunternehmen", bildname);
				session.setAttribute("bildsizeunternehmen", bildsize);
				request.setAttribute("produktname","");
				session.setAttribute("unternehmenid", verkaufer.getUnternehmen().getIdUnternehmen());
				try {
					Thread.sleep(2500);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getRequestDispatcher("WEB-INF/Unternehmeninfo.jsp").forward(request, response);
				
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			//false bereits 4 Bilder in der DB vorhanden ist
			int language = (int)request.getSession().getAttribute("language");
			if(language==0) {
				request.setAttribute("fehlermeldung2", "you habe already uploaded 4 images, you should delete one of them to upload again ");
			}else if(language==1) {
				request.setAttribute("fehlermeldung2", "Vous avez déjà télécharger 4 images, Supprimer en une pour en telecharger davantage");
				
			}else if(language==2) {
				request.setAttribute("fehlermeldung2", "Sie haben bereits 4 Bilder hochgeladen.Bitte löschen Sie mindesten ein Bild,um ein neues hochladen zu können");
			}
			request.getRequestDispatcher("WEB-INF/Unternehmeninfo.jsp").forward(request, response);
		}
		
		
		
		
		//doGet(request, response);
	}

}
