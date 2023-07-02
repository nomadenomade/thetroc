package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestReSend
 */
@WebServlet("/RequestReSend")
public class RequestReSend extends HttpServlet {
	
    public RequestReSend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("name");
		String idkaufer = (String)request.getSession().getAttribute("idkaufer");
		
		
		if(param!=null && idkaufer !=null && param.equals("myinfo_client")) {
			
			request.getRequestDispatcher("WEB-INF/myinfo_client.jsp").forward(request, response);
			
		}else if(param!=null && idkaufer !=null && param.equals("liste_de_commande_client")){
			
			request.getRequestDispatcher("WEB-INF/liste_de_commande_client.jsp").forward(request, response);
			
		}else if(param!=null && idkaufer !=null && param.equals("liste_de_commande_client_produkt")){
			
			String idprodukt = (String)request.getParameter("idprodukt");
			request.getRequestDispatcher("WEB-INF/liste_de_commande_client.jsp?idprodukt="+idprodukt).forward(request, response);	
			
		}else if(param!=null && param.equals("produktbestellung")){
			
			String idprodukt = request.getParameter("idprodukt");
			String produktname = request.getParameter("produktname");
			if(idprodukt!=null) {
				request.getRequestDispatcher("WEB-INF/produktbestellung.jsp?idprodukt="+idprodukt+"&produktname="+produktname).forward(request, response);
			
			}else {
				response.getWriter().print("An Error occured on the Server");
			}
			
		}else if(param!=null && param.equals("errorpage")){
			
			request.getRequestDispatcher("WEB-INF/errorpage.jsp").forward(request, response);	
			
		}else if(param!=null &&param.equals("thetrocmoneyreceipt") && idkaufer !=null ){
			request.getRequestDispatcher("WEB-INF/listgutscheinekaufer.jsp").forward(request, response);
			
		}else {
			request.getRequestDispatcher("anmeldung.jsp").forward(request, response);
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
