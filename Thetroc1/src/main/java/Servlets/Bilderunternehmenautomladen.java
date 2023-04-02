package Servlets;

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
 * Servlet implementation class Bilderunternehmenautomladen
 */
@WebServlet("/Bilderunternehmenautomladen")
public class Bilderunternehmenautomladen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bilderunternehmenautomladen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//zum Test
				Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
				//end
				UnternehmenDAO dao = new UnternehmenDAO();
				String result= "";
				List<Foto> listfoto = dao.getBilderUnternehmen(verkaufer.getUnternehmen());
				
				result+="<div class='row'>";
				for (Foto foto : listfoto) {
					result+="<div class='col-sm'>";
					result+="<p class='text-info'>"+foto.getName()+"</p>";
					result+="<img alt='bild' class='produkt' src='Dateien/"+verkaufer.getPerson().getEmail()+"/"+foto.getName()+"'/>";
					result+="<button type='button' style='border-radius:200px;' class='btn btn-sm btn-danger delet' onclick=\"deleteBild('"+foto.getName()+"','"+foto.getSize()+"')\">delete</button>";
					result+="</div>";
				}
				result+="</div>";
				
				
				response.setCharacterEncoding("utf8");
				response.getWriter().println(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
