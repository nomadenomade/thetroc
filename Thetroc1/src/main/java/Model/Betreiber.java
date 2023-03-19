package Model;

public class Betreiber {
	private Person person;
	private int idBetreiber;
	
	public Betreiber() {
		super();
	}
	public Betreiber(Person person, int idBetreiber) {
		super();
		this.person = person;
		this.idBetreiber = idBetreiber;
	}
	
	
	
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public int getIdBetreiber() {
		return idBetreiber;
	}
	public void setIdBetreiber(int idBetreiber) {
		this.idBetreiber = idBetreiber;
	}

}
