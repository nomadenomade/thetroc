package DAO;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import Model.Person;

public class Jpa {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EntityManagerFactory factory ;
		EntityManager entitymanager;
		
		factory = Persistence.createEntityManagerFactory("thetroc");
		entitymanager = factory.createEntityManager();
		
		EntityTransaction trans = entitymanager.getTransaction();
		Person person = new Person();
		person.setName("Blaise");
		person.setVorname("geese");
		
		trans.begin();
			entitymanager.persist(person);
		trans.commit();
	}

}
