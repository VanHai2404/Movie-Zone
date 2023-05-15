package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.Video;

public class VideoDao extends AbstracEntityDao<Video> {

	public VideoDao() {
		super(Video.class);
		
	}

	
	
	public  List<Video> Top6Views(){
		
		EntityManager em=jpaUtils.getEntityManager();
		TypedQuery<Video> query = em.createQuery("SELECT v FROM Video v ORDER BY v.views DESC", Video.class);
		query.setMaxResults(6);
		List<Video> results = query.getResultList();
		return results;
		
	}
	public List<Video> findVideoByVideoTitle(String title) {

		EntityManager em = jpaUtils.getEntityManager();

		TypedQuery<Video> query = em.createQuery("SELECT v FROM Video v WHERE v.title LIKE :title", Video.class);
		query.setParameter("title", "%" + title + "%");
		List<Video> videos = query.getResultList();
		return videos;
	}
	public List<Video> findVideoByVideoNation(String nation) {

		EntityManager em = jpaUtils.getEntityManager();

		String jpql = "SELECT v FROM Video v WHERE v.nation = :nation";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("nation", nation);
		return query.getResultList();
	}
	
	public List<Video> findLikedVideosByUser(String userId) {
		EntityManager em = jpaUtils.getEntityManager();
		String jpql = "SELECT f.video FROM Favorite f WHERE f.user.username = :username";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("username", userId);
		return query.getResultList();
		}
	
	
	public List<Video> findAllFavoriteVideos() {
	    EntityManager em = jpaUtils.getEntityManager();
	    TypedQuery<Video> query = em.createQuery("SELECT f.video FROM Favorite f", Video.class);
	    return query.getResultList();
	}
	
	public List<Object[]> findAllFavoritesWithUserAndDateLiked() {
	    EntityManager em = jpaUtils.getEntityManager();
	    String jpql = "SELECT v, f.likeddate, u.username "
	                 + "FROM Video v "
	                 + "JOIN v.favorites f "
	                 + "JOIN f.user u"+"GROUP BY f.favorites.likeddate";
	    TypedQuery<Object[]> query = em.createQuery(jpql, Object[].class);
	    return query.getResultList();
	}

}
