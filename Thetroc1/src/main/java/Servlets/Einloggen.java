package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UnternehmenDAO;
import DAO.VerkauferDAO;
import DAO.userDAO;
import Model.Kaufer;
import Model.Person;
import Model.Unternehmen;
import Model.Verkaufer;

/**
 * Servlet implementation class Einloggen
 */
@WebServlet("/Einloggen")
public class Einloggen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String passwort = request.getParameter("passwort");
		HttpSession session = request.getSession(true);
		
		userDAO dao1 = new userDAO();
		Person person = dao1.einloggen(email, passwort);
	
		if(person.getId()!=0) {
			
			if(person.getRolle().equals("Verkaufer")) {
				
				VerkauferDAO dao2 = new VerkauferDAO();
				Verkaufer verkaufer = dao2.getVerkaufer(person);
				Unternehmen unternehmen = new UnternehmenDAO().getUnternehmen(verkaufer.getIdVerkaufer());
				verkaufer.setUnternehmen(unternehmen);
				session.setAttribute("verkaufer",verkaufer);
				session.setAttribute("idverkaufer", verkaufer.getIdVerkaufer());
				session.setAttribute("isuser","verkaufer");
				session.setAttribute("userEmail",verkaufer.getPerson().getEmail());
				session.setAttribute("unternehmenid", unternehmen.getIdUnternehmen());
				session.setAttribute("warnungzahl", person.getWarnunganzahl());
				session.setAttribute("unternehmenname",unternehmen.getName());
				session.setAttribute("unternehmenstandort",unternehmen.getStandort());
				
				response.getWriter().println("verkaufer");
			}else if(person.getRolle().equals("Kaufer")) {
				
				session.setAttribute("isuser", "kaufer");
				Kaufer kaufer = dao1.getKaufer(person);
				session.setAttribute("pseudo", kaufer.getPseudo());
				session.setAttribute("kaufer",kaufer);
				session.setAttribute("warnunganzahl", person.getWarnunganzahl());
				session.setAttribute("idkaufer",String.valueOf(kaufer.getIdKaufer()));
				response.getWriter().println("kaufer");
				
			}
			
		}else{
			if(request.getSession().getAttribute("language")!=null &&request.getSession().getAttribute("language").equals(0)) {
				response.getWriter().println("connection failed...maybe wrong data");
			}else {
				response.getWriter().println("Anmeldung fehlgeschlagen");
			}
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
