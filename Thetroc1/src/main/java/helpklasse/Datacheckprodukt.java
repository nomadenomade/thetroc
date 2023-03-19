package helpklasse;

import javax.servlet.http.HttpServletRequest;

import Model.Produkt;

public class Datacheckprodukt {
	
	private Produkt produkt;
	Registrationresult registrationresult;
	HttpServletRequest request;
	public Datacheckprodukt(Produkt produkt,HttpServletRequest request) {
		this.request = request;
		registrationresult = new Registrationresult();
		this.produkt = produkt;
		
	}

	

	public boolean checkName() {
		boolean check =false;
		if(produkt.getName()!=null && !produkt.getName().equals("")) {
			registrationresult.setChecknameprodukt("");
			check=true;
		}else {
			if(request!=null && request.getSession().getAttribute("language").equals(0)) {
				registrationresult.setChecknameprodukt("give a name to this product");
			}else if(request!=null && request.getSession().getAttribute("language").equals(1)){
				registrationresult.setChecknameprodukt("donnez le nom du produit");
			}else if(request!=null && request.getSession().getAttribute("language").equals(2)) {
				registrationresult.setChecknameprodukt(Registrationresult.FIELD_LEER);
			}
						
		}
		return check;
	}

	
	public boolean checkPreis() {
		boolean check= false;
		if(produkt.getPreis()!=null && !produkt.getPreis().equals("")) {
			registrationresult.setCheckpreisprodukt("");
			check=true;
		}else {
			if(request!=null && request.getSession().getAttribute("language").equals(0)) {
				registrationresult.setCheckpreisprodukt("give a price to this product");
			}else if(request!=null && request.getSession().getAttribute("language").equals(2)) {
				registrationresult.setCheckpreisprodukt(Registrationresult.FIELD_LEER);
			}else if(request!=null && request.getSession().getAttribute("language").equals(1)) {
				registrationresult.setCheckpreisprodukt("donnez le prix de ce produit");
			}
			
			
		}
		return check;
	}

	

	public boolean checkKategorie() {
		boolean check= false;
		if(produkt.getKategorie()!=null && !produkt.getKategorie().equals("")) {
			registrationresult.setCheckkategorieprodukt("");
			check=true;
		}else {
			if(request!=null && request.getSession().getAttribute("language").equals(0)) {
				registrationresult.setCheckkategorieprodukt("please choose a category for this product");
			}else if(request!=null && request.getSession().getAttribute("language").equals(2)) {
				registrationresult.setCheckkategorieprodukt(Registrationresult.FIELD_LEER);
			}else if(request!=null && request.getSession().getAttribute("language").equals(1)) {
				registrationresult.setCheckkategorieprodukt("choisissez une catégorie pour ce produit");
			}
			
			
		}
		return check;
	}

	

	public boolean checkOnlinedate() {
		boolean check= false;
		if(produkt.getOnlinebis()!=null && !produkt.getOnlinebis().equals("")) {
			registrationresult.setCheckonlinedate("");
			check = true;
		}else {
			if(request!=null && request.getSession().getAttribute("language").equals(0)) {
				registrationresult.setCheckonlinedate("please give the deadline until this product should remain visible for your customers");
			}else if(request!=null && request.getSession().getAttribute("language").equals(2)){
				registrationresult.setCheckonlinedate(Registrationresult.FIELD_LEER);
			}else if(request!=null && request.getSession().getAttribute("language").equals(1)) {
				registrationresult.setCheckonlinedate("jusqu à quand votre produit est-il sensé etre en ligne?");
			}
			
			
		}
		return check;
	}

	

	public boolean checkDauer() {
		boolean check=false;
		if(produkt.getDauerbisabholung()!=null && !produkt.getDauerbisabholung().equals("")) {
			registrationresult.setCheckdauerabholprodukt("");
			check=true;
		}else {
			if(request!=null && request.getSession().getAttribute("language").equals(0)) {
				registrationresult.setCheckdauerabholprodukt("please give maximal time for your customers to pickup this product");
			}else if(request!=null && request.getSession().getAttribute("language").equals(2)){
				registrationresult.setCheckdauerabholprodukt(Registrationresult.FIELD_LEER);
			}else if(request!=null && request.getSession().getAttribute("language").equals(1)) {
				registrationresult.setCheckdauerabholprodukt("donnez la durée maximal dont le client aura besoin pour récupérer son produit");
			}
			
			
		}
		return check;
	}

	

	public boolean checktAblauf() {
		boolean check =false;
		if(produkt.getAblaufdatum()!=null && !produkt.getAblaufdatum().equals("")) {
			registrationresult.setCheckablaufdatum("");
			check =true;
		}else {
			if(request!=null && request.getSession().getAttribute("language").equals(0)) {
				registrationresult.setCheckablaufdatum("please select an expiry date");
			}else if(request!=null && request.getSession().getAttribute("language").equals(2)){
				registrationresult.setCheckablaufdatum(Registrationresult.FIELD_LEER);	
			}else if(request!=null && request.getSession().getAttribute("language").equals(1)) {
				registrationresult.setCheckablaufdatum("selectionner la date d'expiration");	
			}
					
		}
		return check;
	}

	public boolean checkAll() {
		boolean checkname=checkName() ;
		boolean checkpreis = checkPreis();
		boolean checkkategorie=checkKategorie();
		boolean checkdauer =checkDauer();
		boolean checkablauf = checktAblauf();
		boolean checkonlinebis = checkOnlinedate();
		
		return checkname && checkpreis && checkkategorie && checkablauf && checkdauer && checkonlinebis;
		
		
	}
	public Registrationresult getRegistrationresult() {
		return registrationresult;
	}

	
}
