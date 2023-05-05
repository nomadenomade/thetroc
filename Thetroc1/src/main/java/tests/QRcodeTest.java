package tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import Model.Person;
import Model.Verkaufer;
import helpklasse.QRcode;

public class QRcodeTest {
	
	@Test 
	void getbarcode(){
		Verkaufer ver = new Verkaufer();
		ver.setIdVerkaufer(2345);
		Person pers = new Person();
		pers.setEmail("person@gmail.com");
		pers.setName("Killermoth");
		ver.setPerson(pers);
		String code = QRcode.getBarcode(ver);
		System.out.println(code);
		assertEquals("lilit",code);
	}
	@Test
	void saveQRcode () {
		//QRcode.saveQRcode("blaise","geese@gmail.com");
	}
	@Test
	void getdecodedText() {
		assertEquals("hello",QRcode.readQRcode("geese@gmail.com"));
	}
	
	
}
