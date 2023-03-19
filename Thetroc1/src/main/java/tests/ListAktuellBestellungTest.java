package tests;

import org.junit.jupiter.api.Test;

import DAO.VerkauferDAO;

public class ListAktuellBestellungTest {
	
	@Test
	void getListAktuellBestellung () {
		VerkauferDAO dao = new VerkauferDAO();
		System.out.println(dao.getListAktuellBestellung(1).size());
	}

}
