package dao;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;



public class jpaUtils {
	public static EntityManager getEntityManager() {
	 return	Persistence.createEntityManagerFactory("Movie-Asg").createEntityManager();
		
	}

}
