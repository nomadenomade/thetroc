package tests;

import java.util.List;

import org.junit.jupiter.api.Test;

import DAO.userDAO;
import Model.Produkt;

public class Kunkensuche {
	
	@Test
	void Kundenproduktsuche() {
		userDAO dao = new userDAO();
		List<Produkt>list = dao.produktSuche("", "riz", "", "", "", "", "","","");
		for (Produkt produkt : list) {
			System.out.println(produkt.toString());
		}
	}
	

}
