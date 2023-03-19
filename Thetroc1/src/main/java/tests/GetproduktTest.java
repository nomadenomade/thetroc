package tests;

import org.junit.jupiter.api.Test;

import DAO.userDAO;
import Model.Foto;

public class GetproduktTest {
	
@Test
void getProdukt() {
	userDAO dao = new userDAO();
	System.out.println(dao.getProdukt(12));
	System.out.println("-----------------------");
	for (Foto p: dao.getProdukt(12).getProduktBilder()) {
		System.out.println(p);
	}
}

}
