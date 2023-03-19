package helpklasse;

import javax.servlet.http.HttpServletRequest;

public class Registrationresult {
	//für benutzereingabe registrierung ---start
	private String checkname;
	
	private String checkVorname;
	private String checkGeburtsdatum;
	private String checkAdresse;
	private String checkEmail;
	private String checkPasswort;
	private String checkRolle;
	private String checkpseudo;
	private String checkmenge;
	//---end
	
	//für produkt
	
	private String checknameprodukt;
	private String checkkategorieprodukt;
	private String checkpreisprodukt;
	private String checkablaufdatum;
	private String checkonlinedate;
	private String checkdauerabholprodukt;
	
	
	public static final String RICHTIG= "daten richtig";
	public static final String FALSCH ="daten falsch";
	public static final String ROLLE_LEER = "Wählen Sie bitte eine Rolle";
	public static final String FIELD_LEER = "geben Sie bitte einen Wert ein";
	public static final String PASSWORT_FALSCH= "Das Passwort muss einen Großbuchstaben,kleinen Großbuchstaben,sonderzeichen,eine Zahl haben und mindesten 8 zeichenlang sein ";
	public static final String ROLLE_WARNING ="Wählen Sie Kaufer und dann geben Sie ein Pseudo ein Oder Wählen Sie Verkaufer";
	public static final String EMAIL_SHON_VORHANDEN ="Diese Email hat schon ein Konto. Bitte loggen Sie sich ein";
	
	
	public String getChecknameprodukt() {
		return checknameprodukt;
	}

	public void setChecknameprodukt(String checknameprodukt) {
		this.checknameprodukt = checknameprodukt;
	}

	public String getCheckkategorieprodukt() {
		return checkkategorieprodukt;
	}

	public void setCheckkategorieprodukt(String checkkategorieprodukt) {
		this.checkkategorieprodukt = checkkategorieprodukt;
	}

	public String getCheckpreisprodukt() {
		return checkpreisprodukt;
	}

	public void setCheckpreisprodukt(String checkpreisprodukt) {
		this.checkpreisprodukt = checkpreisprodukt;
	}

	public String getCheckablaufdatum() {
		return checkablaufdatum;
	}

	public void setCheckablaufdatum(String checkablaufdatum) {
		this.checkablaufdatum = checkablaufdatum;
	}

	public String getCheckonlinedate() {
		return checkonlinedate;
	}

	public void setCheckonlinedate(String checkonlinedate) {
		this.checkonlinedate = checkonlinedate;
	}

	public String getCheckdauerabholprodukt() {
		return checkdauerabholprodukt;
	}

	public void setCheckdauerabholprodukt(String checkdauerabholprodukt) {
		this.checkdauerabholprodukt = checkdauerabholprodukt;
	}

	
	public Registrationresult() {
	
	}
	
	public String getCheckVorname() {
		return checkVorname;
	}
	public void setCheckVorname(String checkVorname) {
		this.checkVorname = checkVorname;
	}
	public String getCheckGeburtsdatum() {
		return checkGeburtsdatum;
	}
	public void setCheckGeburtsdatum(String checkGeburtsdatum) {
		this.checkGeburtsdatum = checkGeburtsdatum;
	}
	public String getCheckAdresse() {
		return checkAdresse;
	}
	public void setCheckAdresse(String checkAdresse) {
		this.checkAdresse = checkAdresse;
	}
	public String getCheckEmail() {
		return checkEmail;
	}
	public void setCheckEmail(String checkEmail) {
		this.checkEmail = checkEmail;
	}
	public String getCheckPasswort() {
		return checkPasswort;
	}
	public void setCheckPasswort(String checkPasswort) {
		this.checkPasswort = checkPasswort;
	}
	public String getCheckRolle() {
		return checkRolle;
	}
	public void setCheckRolle(String checkRolle) {
		this.checkRolle = checkRolle;
	}

	public String getCheckname() {
		return checkname;
	}

	public void setCheckname(String checkname) {
		this.checkname = checkname;
	}

	public String getCheckpseudo() {
		return checkpseudo;
	}

	public void setCheckpseudo(String checkpseudo) {
		this.checkpseudo = checkpseudo;
	}

	public String getCheckmenge() {
		return checkmenge;
	}

	public void setCheckmenge(String checkmenge) {
		this.checkmenge = checkmenge;
	}
	
	

}
