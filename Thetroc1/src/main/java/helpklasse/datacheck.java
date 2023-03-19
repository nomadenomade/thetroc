package helpklasse;

import javax.servlet.http.HttpServletRequest;

import Model.Person;
//Diese Klasse überprüft, ob alle usereingaben auf dem Formular korrekt sind
public class datacheck {
	
	Registrationresult registrationResult;
	Person person;
	boolean checkname;
	boolean checkvorname;
	boolean checkemail;
	boolean checkadresse;
	boolean checkpassw;
	boolean checkrolle;
	boolean checkpseudo;
	HttpServletRequest request;
	
	
	
	public datacheck(Person person, HttpServletRequest request) {
		
		this.request = request;
		registrationResult = new Registrationresult();
		this.person = person;
		checkname = checkName();
		checkvorname = checkVorname();
		checkemail = checkEmail();
		checkadresse = checkAdresse();
		checkpassw = checkPasswort();
		checkrolle = checkRolle();
		checkpseudo = checkPseudo();
		
		
	}
	
	public boolean checkName() {
		boolean rueckwert= false;
		if(person.getName() == null || person.getName().trim().equals("") ){
			
			if(request!=null && request.getSession().getAttribute("language").equals(0)) {
				
				registrationResult.setCheckname("please give a value here");
			}else {
				registrationResult.setCheckname(Registrationresult.FIELD_LEER);
			}
			
		}else {
			registrationResult.setCheckname("");
			rueckwert = true;
		}
		
		return rueckwert;
	}
	
	public boolean checkVorname() {
		boolean rueckwert= false;
		if(person.getVorname() == null || person.getVorname().trim().equals("")){
			if(request!=null &&request.getSession().getAttribute("language").equals(0)) {
				registrationResult.setCheckVorname("please give a value here");
			}else {
				registrationResult.setCheckVorname(Registrationresult.FIELD_LEER);
			}
			
		}else {
			registrationResult.setCheckVorname("");
			rueckwert = true;
		}
		
		return rueckwert;
	}
	
	public boolean checkAdresse() {
		boolean rueckwert= false;
		
		if(person.getAdresse() == null || person.getAdresse().equals("")|| person.getVorname().equals(" ")){
			if(request!=null &&request.getSession().getAttribute("language").equals(0)) {
				registrationResult.setCheckAdresse("please give a value here");
			}else {
				registrationResult.setCheckAdresse(Registrationresult.FIELD_LEER);
			}
			
		}else {
			registrationResult.setCheckAdresse("");
			rueckwert = true;
			
		}
		return rueckwert;
	}
	
	public boolean checkEmail() {
		boolean rueckwert= false;
		
		if(person.getEmail() == null || person.getEmail().trim().equals("")){
			if(request!=null &&request.getSession().getAttribute("language").equals(0)) {
				registrationResult.setCheckEmail("please give a value here");
			}else {
				registrationResult.setCheckEmail(Registrationresult.FIELD_LEER);
			}
			
		}else {
			String email[] = person.getEmail().split("");
			for(String e: email) {
				if(e.equals("@")) {
					registrationResult.setCheckEmail("");
					rueckwert =true;
					break;
				}else {
					if(request!=null &&request.getSession().getAttribute("language").equals(0)) {
						registrationResult.setCheckEmail("please give a value here");
					}else {
						registrationResult.setCheckEmail("wrong value");
					}
					
				
					
				}
			}	
		}
		
		
		return rueckwert;
		
	}
	
	public boolean checkPasswort() {
		boolean checkgb=false;
		boolean checkkb=false;
		boolean checkzahl=false;
		boolean checksz=false;
		boolean checkl=false;
		boolean rueckwert= false;
		
		String passwort= person.getPasswort();
		String passw[] = passwort.split("");
		String zeichen[]= {".",",",";",":","_","-","@","/","|","#","'","!","%","&","§","$","?","="};
		
		if(passwort!=null && passwort.length()>=8) {
			checkl=true;
		}
		
		for(String e : passw) {
			if(e.toLowerCase().equals(e)){
				checkkb= true;
				break;
			}
		}
		
		for(String e : passw) {
			if(e.toUpperCase().equals(e)){
				checkgb= true;
				break;
			}
		}
		for(String e: zeichen) {
			for(String i : passw) {
				if(i.equals(e)) {
					checksz=true;
					break;
				}
			}
			if(checksz==true) {
				break;
			}
		}
		if(passwort!=null && !passwort.equals("")) {
			for(String e: passw) {
				if(e.matches("[+-]?\\d*(\\.\\d+)?")) {
					checkzahl =true ;
					break;
				}
			}
			
		}
		
		
		
		
		if(checkgb && checkkb && checksz && checkzahl && checkl) {
			registrationResult.setCheckPasswort("");
			rueckwert= true;
		}else {
			
			if(request!=null &&request.getSession().getAttribute("language").equals(0)) {
				registrationResult.setCheckPasswort("The password must have an upper case letter, lower case letter, special character, a number and be at least 8 characters long");
			}else {
				registrationResult.setCheckPasswort(Registrationresult.PASSWORT_FALSCH);
			}
			
			
		}
		
		return rueckwert;
	}
	
	public boolean checkRolle() {
		boolean rueck=false;
		if(person.getRolle() == null || person.getRolle().trim().equals("")){
			if(request!=null &&request.getSession().getAttribute("language").equals(0)) {
				registrationResult.setCheckRolle("please choose your function");
			}else {
				registrationResult.setCheckRolle(Registrationresult.ROLLE_LEER);
			}
			
		}else {
			registrationResult.setCheckRolle("");
			rueck = true;
		}
		return rueck;
	}
	
	
	public boolean checkPseudo() {
		boolean rueckwert= false;
		if(person.getPseudo() == null || person.getPseudo().trim().equals("")){
			if(request!=null &&request.getSession().getAttribute("language").equals(0)) {
				registrationResult.setCheckpseudo("Select buyer and then enter pseudo or select seller");
			}else {
				registrationResult.setCheckpseudo(Registrationresult.ROLLE_WARNING);
			}
			
			
			
		}else {
			registrationResult.setCheckpseudo("");
			rueckwert = true;
		}
		
		return rueckwert;
	}

	public Registrationresult getRegistrationresult() {
		return registrationResult;
	}
    public boolean getCheckAlldata() {
    	return checkname && checkvorname&&checkadresse&&checkemail&&checkpassw&&checkrolle;
    }
	
	




}
