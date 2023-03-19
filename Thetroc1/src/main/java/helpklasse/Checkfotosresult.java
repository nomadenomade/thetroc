package helpklasse;

public class Checkfotosresult {

	public static final String DATEI_ZU_GROSS ="Die Dateigroesse darf nicht 4MB überschreiten";
	public static final String DATEI_FORMAT_FALSCH ="Nur JPG,PNG,JPEG sind zugelassen";
	
	private String checkgroesseresult;
	public String getCheckgroesseresult() {
		return checkgroesseresult;
	}
	public void setCheckgroesseresult(String checkgroesseresult) {
		this.checkgroesseresult = checkgroesseresult;
	}
	public String getCheckformatresult() {
		return checkformatresult;
	}
	public void setCheckformatresult(String checkformatresult) {
		this.checkformatresult = checkformatresult;
	}
	private String checkformatresult;
	
}
