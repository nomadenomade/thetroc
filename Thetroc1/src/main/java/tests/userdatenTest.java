package tests;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import Model.Person;
import helpklasse.datacheck;

public class userdatenTest {
	
	Person person;
	datacheck check;
	
	@Test
	public void checkpasswort() {
		person = new Person();
		person.setPasswort("element1B.");
		//check = new datacheck(person);
		
		assertEquals(true,check.checkPasswort());
	}
	
	@Test 
	public void checkemail() {
		person = new Person();
		person.setEmail("em@.de");
	//	check = new datacheck(person);
		assertEquals(true,check.checkEmail());
	}
	
	@Test
	public void checkname() {
		person = new Person();
		person.setName("Elon");
	//	check = new datacheck(person);
		assertEquals(true,check.checkName());
	}

}
