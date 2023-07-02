package tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Test;

import DAO.userDAO;
import Model.Produkt;

public class Kunkensuche {
	

	@Test
	void KundenproduktsucheAnzahk() {
		userDAO dao = new userDAO();
		int zahl = dao.getAnzahlDatensatz("rest", "", "", "unbegrenzt", "", "", "","","");
		assertEquals(4, zahl);
		
	}
	
	@Test
	void KundenproduktsuchemitLimit() {
		userDAO dao = new userDAO();
		List<Produkt>list = dao.produktSucheMitLimit("rest", "", "", "unbegrenzt", "", "", "","","",0,3);
		assertEquals(0, list.size());
		
	}
	

}
