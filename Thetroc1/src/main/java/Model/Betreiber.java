package Model;

public class Betreiber {
	private Person person;
	private int idBetreiber;
	double ratekaufer;
	double rateverkaufer;
	String gutscheinfunction;
	
	public double getRatekaufer() {
		return ratekaufer;
	}
	public void setRatekaufer(double ratekaufer) {
		this.ratekaufer = ratekaufer;
	}
	public double getRateverkaufer() {
		return rateverkaufer;
	}
	public void setRateverkaufer(double rateverkaufer) {
		this.rateverkaufer = rateverkaufer;
	}
	public String getGutscheinfunction() {
		return gutscheinfunction;
	}
	public void setGutscheinfunction(String gutscheinfunction) {
		this.gutscheinfunction = gutscheinfunction;
	}
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
