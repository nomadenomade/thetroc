package helpklasse;


public class Distance {
	
	public Distance() {
		
		abstand( 7.100000,  50.733334, 6.953101, 50.935173);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	new Distance();
	}

	public void abstand(double lng1, double lat1,double lng2, double lat2) {
		double ab = (Math.acos(Math.sin(Math.toRadians(lat1))*Math.sin(Math.toRadians(lat2)) + Math.cos(Math.toRadians(lat1))*Math.cos(Math.toRadians(lat2))*Math.cos(Math.toRadians(lng1-lng2)))*6367445)/1000;		
		System.out.println("Abstand:"+ab);
	}
}
