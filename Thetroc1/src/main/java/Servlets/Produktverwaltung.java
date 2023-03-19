package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VerkauferDAO;
import Model.Verkaufer;

/**
 * Servlet implementation class Produktverwaltung
 */
@WebServlet("/Produktverwaltung")
public class Produktverwaltung extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Produktverwaltung() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idprodukt = request.getParameter("idprodukt");
		String funktion = request.getParameter("funktion");
		//zum Test
		
		String userEmail = ((Verkaufer)request.getSession().getAttribute("verkaufer")).getPerson().getEmail();
		int lang = (int)request.getSession().getAttribute("language");
		//end
		VerkauferDAO dao = new VerkauferDAO();
		if(idprodukt !=null && funktion!=null) {
			if(funktion.equals("loeschen")) {
				if(dao.produktloeschen(Integer.valueOf(idprodukt),userEmail)) {
					response.getWriter().print("ok");
				}else {
					if(lang == 0) {
						response.getWriter().println("the product could'nt be deleted");
					}else if(lang == 1) {
						response.getWriter().println("impossible de surprimer le produit");
					}else {
						response.getWriter().println("Produkt konnte nicht gelöscht werden");
					}
					
				}
			}else if(funktion.equals("online")) {
				
				if(dao.produktVeroeffentlichen(Integer.valueOf(idprodukt), "online")) {
					if(lang == 0) {
						response.getWriter().println("your product is now online ");
					}else if(lang == 1) {
						response.getWriter().println("votre produit a été mis en ligne avec succes");
					}else {
						response.getWriter().println("Ihr Produkt ist jetzt Online");
					}
					
				}else {
					if(lang == 0) {
						response.getWriter().println("Error!!!! your product could not be put online ");
					}else if(lang == 1) {
						response.getWriter().println("Erreur System!!!!! Impossible de mettre le produit en ligne");
					}else {
						response.getWriter().println("Error!!!!!!!!!Produkt konnte nicht Online gestellt werden");
					}
					
				}
			}else if(funktion.equals("offline")) {
				if(dao.produktVeroeffentlichen(Integer.valueOf(idprodukt), "offline")) {
					if(lang == 0) {
						response.getWriter().println("your product is now offline ");
					}else if(lang == 1) {
						response.getWriter().println("votre produit a été mis hors ligne avec succes");
					}else {
						response.getWriter().println("Ihr Produkt  ist nun Online ");
					}
					
					response.getWriter().println("Ihr Produkt wurde erfolgreich Offline gestellt");
				}else {
					if(lang == 0) {
						response.getWriter().println("Error!!!! your product could not be put online");
					}else if(lang == 1) {
						response.getWriter().println("Erreur System!!!!! Impossible de mettre le produit hors ligne");
					}else {
						response.getWriter().println("Ihr produkt konnte nicht Offline gestellt werden");
					}
					
					
				}
			}
			
			
		}else {
			System.out.print("wir sind raus");
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
