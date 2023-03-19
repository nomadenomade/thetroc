package Servlets;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UnternehmenDAO;
import DAO.VerkauferDAO;
import Model.Foto;
import Model.Person;
import Model.Produkt;
import Model.Unternehmen;
import Model.Verkaufer;

/**
 * Servlet implementation class Bildunternehmenloeschen
 */
@WebServlet("/Bildunternehmenloeschen")
public class Bildunternehmenloeschen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bildunternehmenloeschen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
				UnternehmenDAO dao = new UnternehmenDAO();
						
				boolean rueck =dao.bildlöschen(dao.getBildProduktInfos(request.getParameter("bildname"), request.getParameter("bildsize")));
				
				String result="";
				
				if(rueck) {
					File file = new File("C:\\Users\\user\\eclipse-workspace\\Thetroc1\\src\\main\\webapp\\Dateien\\"+verkaufer.getPerson().getEmail()+"\\"+request.getParameter("bildname"));
					
					if(file.exists()) {
						
						if(file.delete()) {
							List<Foto> listfoto = dao.getBilderUnternehmen(verkaufer.getUnternehmen());
							result+="<div class='row'>";
							for (Foto foto : listfoto) {
								result+="<div class='col-sm'>";
								result+="<div class='card'>";
								result+="<div class='card-body'>";
								result+="<p class='text-info'>"+foto.getName()+"</p>";
								result+="<img alt='bild' class='produkt' src='Dateien/"+verkaufer.getPerson().getEmail()+"/"+foto.getName()+"'/>";
								result+="<button type='button' class='btn btn-sm btn-danger' onclick=\"deleteBild('"+foto.getName()+"','"+foto.getSize()+"')\">löschen</button>";
								result+="</div>";
								result+="</div>";
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
				
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
