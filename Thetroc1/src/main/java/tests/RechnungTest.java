package tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Test;

import DAO.userDAO;
import Model.Rechnung;

public class RechnungTest {
	/*
	@Test
	void getRechnungKaufer() {
		userDAO dao = new userDAO();
		List<Rechnung> list = dao.getRechnung("rechnung_filtern_kaufer", 3,"23-02-2023");
		assertEquals(1,list.size());
		for(Rechnung rech : list) {
			System.out.println(rech);
		}
		
		
	}
	*/
	
	@Test
	void getSummeGeld() {
		userDAO dao = new userDAO();
		String summe = dao.SummeGeld("kaufer", 3);
		assertEquals("1",summe);
	}


}
