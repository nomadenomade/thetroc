package Servlets;

import java.io.IOException;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.userDAO;
import Model.Person;
import helpklasse.Registrationresult;
import helpklasse.datacheck;

/**
 * Servlet implementation class registrierung
 */
@WebServlet("/registrierung")
public class registrierung extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registrierung() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Name = request.getParameter("Name");
		String Vorname = request.getParameter("Vorname");
		String Geburtsdatum = request.getParameter("Geburtsdatum");
		String Geburtsort = request.getParameter("Geburtsort");
		String Adresse = request.getParameter("Adresse");
		String Email = request.getParameter("Email");
		String Telephon = request.getParameter("Telephon");
		String Passwort = request.getParameter("Passwort");
		String Rolle = request.getParameter("radiob");
		String Pseudo = request.getParameter("Pseudo");
		String datum = new Date().toString();
		Person person = new Person(Name,Vorname,Geburtsdatum,Geburtsort,Adresse,Email,Telephon,Passwort,Rolle,Pseudo,datum);
		//Überprüft die Daten auf korrektheit
		
		datacheck check = new datacheck(person,request);
		
		userDAO dao = new userDAO();
		boolean checkwert =false;
		HttpSession session = request.getSession(true);
		//Check ob die Email schon existriert
		if(dao.iSemailSchonVorhanden(Email)) {
			check.getRegistrationresult().setCheckEmail(Registrationresult.EMAIL_SHON_VORHANDEN);
			request.setAttribute("fehlermeldung", check.getRegistrationresult());
			request.setAttribute("Name", Name);
			request.setAttribute("Vorname", Vorname);
			request.setAttribute("Geburtsdatum", Geburtsdatum);
			request.setAttribute("Geburtsort", Geburtsort);
			request.setAttribute("Adresse", Adresse);
			request.setAttribute("Email", Email);
			request.setAttribute("Telephon", Telephon);
			request.setAttribute("Rolle", Rolle);
			request.setAttribute("Passwort", Passwort);
			request.setAttribute("Pseudo", Pseudo);
			request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}else {
			

			 //Überprüfung,ob alle usereingaben auf dem registrierungsformular korrekt sind 
			if(check.getCheckAlldata()) {
				//check ob der Kaufer ein Pseudo eingegeben hat
				if(Rolle.equals("Kaufer")&&!check.getRegistrationresult().getCheckpseudo().equals("")) {
					request.setAttribute("fehlermeldung", check.getRegistrationresult());
					request.setAttribute("Name", Name);
					request.setAttribute("Vorname", Vorname);
					request.setAttribute("Geburtsdatum", Geburtsdatum);
					request.setAttribute("Geburtsort", Geburtsort);
					request.setAttribute("Adresse", Adresse);
					request.setAttribute("Email", Email);
					request.setAttribute("Telephon", Telephon);
					request.setAttribute("Rolle", Rolle);
					request.setAttribute("Passwort", Passwort);
					request.setAttribute("Pseudo", Pseudo);
					request.getServletContext().getRequestDispatcher("/registrierung.jsp").forward(request, response);
				}else {
					checkwert = dao.registrierung(person);
					if(checkwert) {
						session.setAttribute("erfolg","ok");
						session.setAttribute("user", person);
						request.getServletContext().getRequestDispatcher("/registrierung.jsp").forward(request, response);
						
					}else {
						request.setAttribute("pseudovorhanden", "Diese pseudo is bereits vorhanden");
						request.setAttribute("fehlermeldung", check.getRegistrationresult());
						request.setAttribute("Name", Name);
						request.setAttribute("Vorname", Vorname);
						request.setAttribute("Geburtsdatum", Geburtsdatum);
						request.setAttribute("Geburtsort", Geburtsort);
						request.setAttribute("Adresse", Adresse);
						request.setAttribute("Email", Email);
						request.setAttribute("Telephon", Telephon);
						request.setAttribute("Rolle", Rolle);
						request.setAttribute("Passwort", Passwort);
						request.setAttribute("Pseudo", Pseudo);
						//response.getWriter().print("Ein Fehler ist bei der Registrierung aufgetreten");
						request.getServletContext().getRequestDispatcher("/registrierung.jsp").forward(request, response);
						
						
					}
				}
				
			}else {
				request.setAttribute("fehlermeldung", check.getRegistrationresult());
				request.setAttribute("Name", Name);
				request.setAttribute("Vorname", Vorname);
				request.setAttribute("Geburtsdatum", Geburtsdatum);
				request.setAttribute("Geburtsort", Geburtsort);
				request.setAttribute("Adresse", Adresse);
				request.setAttribute("Email", Email);
				request.setAttribute("Telephon", Telephon);
				request.setAttribute("Rolle", Rolle);
				request.setAttribute("Passwort", Passwort);
				request.setAttribute("Pseudo", Pseudo);
				
				
				request.getServletContext().getRequestDispatcher("/registrierung.jsp").forward(request, response);
			}
			
			
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
