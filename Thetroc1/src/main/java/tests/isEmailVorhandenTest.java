package tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import DAO.userDAO;
import Model.Person;

public class isEmailVorhandenTest {
	Person person;
	userDAO dao ;
	
	@Test
	void isemailVorhanden() {
		dao = new userDAO();
		person = new Person();
		person.setName("Musk");
		person.setVorname("geese");
		person.setAdresse("bonner str");
		person.setEmail("Musk@gmail.com");
		person.setRolle("Verkaufer");
		//person registrieren
		assertEquals(true,dao.registrierung(person));
		//Test ob email vorhanden ist
		assertEquals(true,dao.iSemailSchonVorhanden("Musk@gmail.com"));
		//Person löschen
		assertEquals(true,dao.deletePerson(person));
	}

}
