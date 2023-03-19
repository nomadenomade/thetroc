package tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import DAO.userDAO;
import Model.Person;

public class checkaufantwort_kunde_verkauferTest {

	
@Test
 void check () {
	userDAO dao = new userDAO();
	int rueck = dao.checkaufantwort_kunde_verkaufer("kaufer", 3, new Person());
	
	assertEquals(1,rueck);
	
}
	
}
