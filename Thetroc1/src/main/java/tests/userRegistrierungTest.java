package tests;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import DAO.userDAO;
import Model.Person;

public class userRegistrierungTest {
	Person person;
	userDAO dao;
	
	@Test
	public void userregistrierung() {
		dao = new userDAO();
		person = new Person();
		person.setName("Musk");
		person.setVorname("geese");
		person.setAdresse("bonner str");
		person.setEmail("Musk@gmail.com");
		person.setRolle("Verkaufer");
		//person registrieren
		assertEquals(true,dao.registrierung(person));
		//Person löschen
		assertEquals(true,dao.deletePerson(person));
	}

}
