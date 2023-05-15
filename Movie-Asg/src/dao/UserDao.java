package dao;

import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import model.User;
import model.Video;

public class UserDao extends AbstracEntityDao<User>{

	public UserDao() {
		super(User.class);
		
	}
	
	// tìm video theo user người dung nhập vào 
	public List<Video> findVideoFavoriteUserId(String uID) {

		EntityManager em = jpaUtils.getEntityManager();
		String jpql = "SELECT f.video from Favorite f where f.user.username= :name";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("name", uID);
		return query.getResultList();
	}
	
	// đối mất khẩu 
	public void changePassord(String username,String oldPassword , String newPassord) throws Exception {
		EntityManager em=jpaUtils.getEntityManager();
		EntityTransaction trans =em.getTransaction();
		String jpql =" SELECT u  from User u where u.username = :username and u.password=:password";
		try {
			trans.begin();
			TypedQuery<User> query=em.createQuery(jpql,User.class);
			query.setParameter("username", username); // thiết lập tra tri cho các tham số
			query.setParameter("password", oldPassword);
			
			User user= query.getSingleResult(); // tim kiếm nếu đk thua thi trả User 			
			if(user ==null) {
				throw new Exception("Current password or Username are incorrect");
			}
			
			user.setPassword(newPassord);
			
			em.merge(user);
			
			trans.commit();	
		} catch (Exception e) {
			trans.rollback();
			
			throw e;
			
		} finally {
			em.close();
		}
	}
	
	// 
	public User findByIdAndEmail(String username , String email) {
		
		EntityManager em =jpaUtils.getEntityManager();
		String jpql="SELECT u  from User u where u.username = :username and u.email= :email";
		try {
			TypedQuery<User> query =em.createQuery(jpql,User.class);
			query.setParameter("username", username);
			query.setParameter("email", email);
			
			return query.getSingleResult();
		} finally {
			em.close();
			
		}
		
			
		
	}
	
	public int getTotalUser() {

		EntityManager em = jpaUtils.getEntityManager();
		String jpql = "SELECT COUNT(u) FROM User u";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		
		Long count = query.getSingleResult();
		return count.intValue();
	}
	
	public int getTotalMovie() {

		EntityManager em = jpaUtils.getEntityManager();
		String jpql = "SELECT COUNT(v) FROM Video v";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		
		Long count = query.getSingleResult();
		return count.intValue();
	}
	public long getTotalViews() {
	    EntityManager em = jpaUtils.getEntityManager();
	    String jpql = "SELECT SUM(v.views) FROM Video v";
	    TypedQuery<Long> query = em.createQuery(jpql, Long.class);
	    Long totalViews = query.getSingleResult();
	    return totalViews != null ? totalViews : 0;
	}

}
