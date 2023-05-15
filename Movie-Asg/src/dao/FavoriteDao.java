package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import domain.FavoriteReport;
import domain.FavoriteUserReport;
import model.Favorite;

public class FavoriteDao  extends AbstracEntityDao<Favorite> {

	public FavoriteDao() {
		super(Favorite.class);
		
	}
	
	
	
//	Tổng hợp số lượt thích từng video theo cấu trúc (video title, số lượt thích, ngày thích lâu nhất, ngày thích mới nhất)

	public List<FavoriteReport> findCountVideo() {
		
		EntityManager em = jpaUtils.getEntityManager();
		String jpql = " SELECT new domain.FavoriteReport(o.video.title,o.video.poster, count(o), max(o.likeddate), min(o.likeddate)) " +" FROM Favorite o " +"GROUP BY o.video.title ,o.video.poster ";
		TypedQuery<FavoriteReport> query = em.createQuery(jpql, FavoriteReport.class); // lấy đối tưởng
		return query.getResultList(); // trả về danh sách
	}
	
//	Tổng hợp số lượt thích từng video theo cấu trúc (video title, số lượt thích, ngày thích lâu nhất, ngày thích mới nhất)

	public List<FavoriteUserReport> reporFavoriteUserByVideo(String videoId) {
		EntityManager em = jpaUtils.getEntityManager();
		List<FavoriteUserReport> list=null;
		
		String jpql = " SELECT new domain.FavoriteUserReport(o.user.username,o.user.fullname, " 
		+" o.user.email,o.likeddate) FROM Favorite o WHERE o.video.videoId=:videoId";
		try {
			TypedQuery<FavoriteUserReport> query = em.createQuery(jpql, FavoriteUserReport.class); // lấy đối tưởng
			query.setParameter("videoId", videoId);
			list= query.getResultList(); // trả về danh sách
		} catch (Exception e) {
			em.close();
		}
		return list;
	}
	public static boolean isLikedByUser(String videoId, String username) {
		EntityManager em = jpaUtils.getEntityManager();
	    TypedQuery<Long> query = em.createQuery(
	            "SELECT COUNT(f) FROM Favorite f WHERE f.video.videoId = :videoId AND f.user.username = :username", Long.class);
	    query.setParameter("videoId", videoId);
	    query.setParameter("username", username);
	    return query.getSingleResult() > 0;
	}
	
	
	

}
