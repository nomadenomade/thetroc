package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.userDAO;

/**
 * Servlet implementation class le_client_commande
 */
@WebServlet("/le_client_commande")
public class le_client_commande extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idprodukt = request.getParameter("idprodukt");
		String idkaufer = (String)request.getSession().getAttribute("idkaufer");
		
		userDAO dao = new userDAO();
		if(idkaufer != null) {
			boolean rueck = dao.insertInToWarenkob(Integer.valueOf(idkaufer),Integer.valueOf(idprodukt),"1","austehend",null);
			response.getWriter().print(rueck);
			
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
