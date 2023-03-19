package Servlets;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import DAO.VerkauferDAO;
import Model.Foto;
import Model.Person;
import Model.Verkaufer;
import helpklasse.Checkfotosresult;
import helpklasse.Checkproduktfoto;

/**
 * Servlet implementation class Bildprodukthochladen
 */
@WebServlet("/Bildprodukthochladen")
@MultipartConfig(
		fileSizeThreshold= 1048*1048,
		maxFileSize= 1048*1048*10,
		maxRequestSize= 1048*1048*41
		)
public class Bildprodukthochladen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bildprodukthochladen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("you should login again ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pfad = "C:\\Users\\user\\eclipse-workspace\\Thetroc1\\src\\main\\webapp\\Dateien\\";
		
		Collection<Part> partlist = request.getParts();
		
		String result ="";
		Checkproduktfoto check ;
		Foto foto = new Foto();
		VerkauferDAO dao = new VerkauferDAO();
		
		Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
		int idprodukt = Integer.valueOf((String)request.getSession().getAttribute("idprodukt"));
	
		List <String> list = new ArrayList<>();
		List <String> bildname = new ArrayList<>();
		List <String> bildsize = new ArrayList<>();
		HttpSession session = request.getSession(true);
		session.setAttribute("userEmail",verkaufer.getPerson().getEmail());
		
		File userOrdner = new File(pfad+""+verkaufer.getPerson().getEmail());
		if(!userOrdner.exists()) {
			if(userOrdner.mkdir()) {
				 userOrdner = new File(pfad+""+verkaufer.getPerson().getEmail());
			}
		}
		
		if((String)session.getAttribute("idprodukt")!=null &&dao.isAnzahlBilderErreicht(Integer.valueOf((String)session.getAttribute("idprodukt")))){
			
				
				if(partlist !=null) {
					for (Part part: partlist) {
						// start neu
						
						if(part.getSubmittedFileName() !=null && !part.getSubmittedFileName().equals("")) {
							String extension = part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".")+1, (part.getSubmittedFileName().length()));
							
							foto.setName(part.getSubmittedFileName());
							foto.setExtension(extension);
							foto.setSize(part.getSize());
							
							bildname.add(part.getSubmittedFileName());
							bildsize.add(String.valueOf(part.getSize()));
							
							check = new Checkproduktfoto(foto);
							
							if(check.checkAll()) {
								
								
								boolean rueck =dao.bilderProduktSpeichern(idprodukt, foto);
								list.add(part.getSubmittedFileName());
								//Verzeichnis für User mit entspechender Email erzeugen falls noch nicht geschiehen 
								//Die entsprechende Datei wird dann in diesem Ordner gespeichert
								if(rueck) {
											
									try {
										part.write(userOrdner+"\\"+part.getSubmittedFileName());
										} catch (Exception e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
									}
											
								}
								
								
							}else {
								
								request.setAttribute("fehlermeldung", "Achtung! "+Checkfotosresult.DATEI_FORMAT_FALSCH+","+ Checkfotosresult.DATEI_ZU_GROSS);
								
								break;	
								
							}
						}
						
						//end neu
					}
				}else {
					request.setAttribute("fehlermeldung", "Sie haben kein Bild geladen");
				}
			
				System.out.print("idprodukt:"+session.getAttribute("idprodukt"))	;
				session.setAttribute("listbilder", list);
				session.setAttribute("bildname", bildname);
				session.setAttribute("bildsize", bildsize);
				request.setAttribute("produktname","");
				request.setAttribute("idprodukt", session.getAttribute("idprodukt"));
				try {
					Thread.sleep(2500);
					request.getRequestDispatcher("WEB-INF/produktbilderladen.jsp").forward(request, response);
				} catch (InterruptedException e) {
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
			request.getRequestDispatcher("WEB-INF/produktbilderladen.jsp").forward(request, response);
		}
		
		
		
		
		doGet(request, response);
	}

}
