package tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Test;

import DAO.VerkauferDAO;
import Model.Produkt;
import Model.Verkaufer;

public class produktTest {
VerkauferDAO dao;
Produkt produkt;

@Test
void produktErstellung() {
	/*dao = new VerkauferDAO();
	produkt = new Produkt("12", "Supermark", "reis", "12.08.2330", "12.23.4567", "3");
	assertEquals(true,dao.produktErstellung(produkt, 1));
	*/
}
@Test
void getProdukt () {
	
	Verkaufer verkaufer = new Verkaufer();
	verkaufer.setIdVerkaufer(1);
	//
	VerkauferDAO dao = new VerkauferDAO();
	List<Produkt>list =dao.getListProdukt(verkaufer);
	
}
	
}
