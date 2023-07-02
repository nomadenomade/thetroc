package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Verkaufer;

/**
 * Servlet implementation class RequestReSendSeller
 */
@WebServlet("/RequestReSendSeller")
public class RequestReSendSeller extends HttpServlet {
	
    public RequestReSendSeller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String param = (String)request.getParameter("name");
		String idprodukt = (String)request.getParameter("idprodukt");
		String produktname = (String)request.getParameter("produktname");
	    Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
	    
		if(request.getSession().getAttribute("idverkaufer")==null) {
			request.getRequestDispatcher("anmeldung.jsp").forward(request, response);	
		}else {
			int idverkaufer = (int)request.getSession().getAttribute("idverkaufer");
			if(param!=null&& param.equals("verkaufer_home") && request.getSession().getAttribute("idverkaufer") !=null && idverkaufer !=0 &&verkaufer !=null ) {
				
				request.getRequestDispatcher("WEB-INF/verkaufer_home.jsp").forward(request, response);
				
			}else if(param!=null && request.getSession().getAttribute("idverkaufer") !=null && idverkaufer !=0 && param.equals("kommentarverkaufer")) {
				
				request.getRequestDispatcher("WEB-INF/kommentarverkaufer.jsp").forward(request, response);
				
			}else if(param!=null  && request.getSession().getAttribute("idverkaufer") !=null && idverkaufer !=0 && param.equals("bestellungverkaufer")) {
				
				request.getRequestDispatcher("WEB-INF/bestellungverkaufer.jsp").forward(request, response);
				
			}else if(param!=null  && request.getSession().getAttribute("idverkaufer") !=null && idverkaufer !=0 && param.equals("Unternehmeninfo")) {
				
				request.getRequestDispatcher("WEB-INF/Unternehmeninfo.jsp").forward(request, response);
				
			}else if(param!=null  && request.getSession().getAttribute("idverkaufer") !=null && idverkaufer !=0 && param.equals("produktbilderladen")) {
				
				if(idprodukt!=null ) {
					request.getRequestDispatcher("WEB-INF/produktbilderladen.jsp?produktname="+produktname+"&idprodukt="+idprodukt).forward(request, response);
				}else {
					response.getWriter().print("Error: Unknown product");
				}
				
			}else if(param!=null && param.equals("errorpage2")){
				
				request.getRequestDispatcher("WEB-INF/errorpage2.jsp").forward(request, response);	
				
			}else if(param!=null &&param.equals("thetrocmoneyreceipt") && request.getSession().getAttribute("idverkaufer") !=null && idverkaufer !=0 ){
				request.getRequestDispatcher("WEB-INF/listgutscheinverkaufer.jsp").forward(request, response);
				
			}else {
				request.getRequestDispatcher("anmeldung.jsp").forward(request, response);	
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
