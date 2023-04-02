package Servlets;

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
 * Servlet implementation class Bilderautomladen
 */
@WebServlet("/Bilderautomladen")
public class Bilderautomladen extends HttpServlet {
	
    public Bilderautomladen() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//zum Test
		Produkt produkt = new Produkt();
		produkt.setIdProdukt(Integer.valueOf(request.getParameter("idprodukt")));
		Verkaufer verkaufer = (Verkaufer)request.getSession().getAttribute("verkaufer");
		
		//end
		VerkauferDAO dao = new VerkauferDAO();
		String result= "";
		List<Foto> listfoto = dao.getBilderProdukt(produkt);
		
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
