package tests;

import java.util.Map;

import org.junit.jupiter.api.Test;

import DAO.VerkauferDAO;

public class getKommentarbeiVerkauferTest {
	
@Test
void getKommentar() {
	VerkauferDAO dao = new VerkauferDAO();
	Map<Integer,Map<String,String>> map = dao.getProdid_Commentkaufer_sternkaufer_(1);
	Map<String,String>map2;
	for(Integer key: map.keySet()) {
		map2= map.get(key);
		for(String k:map2.keySet()) {
			System.out.println("idprodukt:"+key+",Pseudokaufer:"+k+", Kommentar:"+map.get(key).get(k));
		}
	}
}

}
