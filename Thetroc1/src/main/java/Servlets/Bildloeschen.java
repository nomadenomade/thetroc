package Servlets;

import java.io.File;
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
 * Servlet implementation class Bildloeschen
 */
@WebServlet("/Bildloeschen")
public class Bildloeschen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     * Diese Klasse löscht ein äusgewältes Produktbild
     */
    public Bildloeschen() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Zum Testzweck
		Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
		String pfad = "C:\\Users\\user\\eclipse-workspace\\Thetroc1\\src\\main\\webapp\\Dateien\\";
		Produkt produkt = new Produkt();
		produkt.setIdProdukt(Integer.valueOf((String)request.getSession().getAttribute("idprodukt")));
		//end
		VerkauferDAO dao = new VerkauferDAO();
		
		boolean rueck =dao.bildlöschen(dao.getBildProduktInfos(request.getParameter("bildname"), request.getParameter("bildsize")));
		
		String result="";
		
		if(rueck) {
			File file = new File(pfad+""+verkaufer.getPerson().getEmail()+"\\"+request.getParameter("bildname"));
			
			if(file.exists()) {
				
				if(file.delete()) {
					List<Foto> listfoto = dao.getBilderProdukt(produkt);
					result+="<div class='row'>";
					for (Foto foto : listfoto) {
						result+="<div class='col-sm'>";
						result+="<p class='text-info'>"+foto.getName()+"</p>";
						result+="<img alt='bild' class='produkt' src='Dateien/"+verkaufer.getPerson().getEmail()+"/"+foto.getName()+"'/>";
						result+="<button type='button' class='btn btn-sm btn-danger' onclick=\"deleteBild('"+foto.getName()+"','"+foto.getSize()+"')\">delete</button>";
						result+="</div>";
					}
					result+="</div>";
					
					
					response.setCharacterEncoding("utf8");
					response.getWriter().println(result);
				}else {
					
					response.getWriter().println("Die Datei konnte nicht gelöscht werden");
				}
			}else {
				
			}
		}
		//end
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
