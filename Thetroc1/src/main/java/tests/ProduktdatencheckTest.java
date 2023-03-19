package tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import Model.Produkt;
import helpklasse.Datacheckprodukt;

public class ProduktdatencheckTest {
	Produkt produkt;
	Datacheckprodukt checkprodukt;
	
	@Test
	void checkname() {
		produkt = new Produkt();
		produkt.setName("reis");
		//checkprodukt = new Datacheckprodukt(produkt);
		//assertEquals(true,checkprodukt.checkName());
				
	}
	@Test 
	void checkpreis() {
		produkt = new Produkt();
		produkt.setPreis("8");
		//checkprodukt = new Datacheckprodukt(produkt);
		//assertEquals(true,checkprodukt.checkPreis());
	}
	@Test 
	void checkkategorie(){
		produkt = new Produkt();
		produkt.setKategorie("imbiss");
		//checkprodukt = new Datacheckprodukt(produkt);
		//assertEquals(true,checkprodukt.checkKategorie());
	}
	@Test
	void checkonlinebis() {
		produkt = new Produkt();
		produkt.setOnlinebis("12.08.2021");
		//checkprodukt = new Datacheckprodukt(produkt);
		//assertEquals(true,checkprodukt.checkOnlinedate());
	}
	@Test
	void checkablaufdatum() {
		produkt = new Produkt();
		produkt.setAblaufdatum("12-03");;
		//checkprodukt = new Datacheckprodukt(produkt);
		assertEquals(true,checkprodukt.checktAblauf());
		System.out.print(checkprodukt.getRegistrationresult().getCheckablaufdatum());
	}
	@Test
	void checkdauerbisabholung() {
		produkt = new Produkt();
		produkt.setDauerbisabholung("2");
		//checkprodukt = new Datacheckprodukt(produkt);
		assertEquals(true,checkprodukt.checkDauer());
	}

}
