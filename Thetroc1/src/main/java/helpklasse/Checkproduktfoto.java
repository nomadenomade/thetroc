package helpklasse;

import Model.Foto;

public class Checkproduktfoto {
	private Checkfotosresult checkfotosresult;
	private Foto foto;
	private String extension[] = {"PNG","png","JPG","jpg","JPEG","jpeg"};
	public Checkproduktfoto (Foto foto) {
		this.foto = foto;
		this.checkfotosresult = new Checkfotosresult();
	}
	
	public boolean checkGroesse () {
		if(foto.getSize()<=(1048*1048*4)) {
			checkfotosresult.setCheckgroesseresult("");
			return true;
		}else {
			checkfotosresult.setCheckgroesseresult(Checkfotosresult.DATEI_ZU_GROSS);
			return false;
		}
	}
	
	public boolean checkFormat() {
		boolean check= false;
		checkfotosresult.setCheckformatresult(Checkfotosresult.DATEI_FORMAT_FALSCH);
		for(int i=0; i<extension.length;i++) {
			if(foto.getExtension().equals(extension[i])) {
				checkfotosresult.setCheckformatresult("");
				check =true;
				break;
			}
		}
		
		return check;
	}
   public boolean checkAll() {
	   boolean checkgroesse = checkGroesse();
	   boolean checkformat = checkFormat();
	   return checkformat && checkgroesse;
   }

public Checkfotosresult getCheckfotosresult() {
	return checkfotosresult;
}


}
