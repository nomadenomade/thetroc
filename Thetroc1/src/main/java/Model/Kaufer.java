package Model;

public class Kaufer {
	
	private int idKaufer;
	private String pseudo;
	private Person person;
	
	
	public Kaufer() {
		
	}
	
	
	public Kaufer(int idKaufer, String pseudo, Person person) {
		super();
		this.idKaufer = idKaufer;
		this.pseudo = pseudo;
		this.person = person;
	}
	
	
	
	
	public int getIdKaufer() {
		return idKaufer;
	}
	public void setIdKaufer(int idKaufer) {
		this.idKaufer = idKaufer;
	}
	public String getPseudo() {
		return pseudo;
	}
	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	

}
