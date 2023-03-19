package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Language
 */
@WebServlet("/Language")
public class Language extends HttpServlet {
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if(type.equals("english")) {
			request.getSession().setAttribute("languagechoosen",100);
			request.getSession().setAttribute("language", 0);
		}else if(type.equals("french")) {
			request.getSession().setAttribute("languagechoosen",100);
			request.getSession().setAttribute("language", 1);
		}else if(type.equals("german")) {
			request.getSession().setAttribute("languagechoosen",100);
			request.getSession().setAttribute("language", 2);
		}else if(type.equals("default")){
			 request.getSession().setAttribute("language", 0);
			 request.getSession().setAttribute("numm", 0);
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
