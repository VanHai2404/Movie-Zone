package domain;

import java.util.Date;

public class FavoriteReport {
	private String videoTitle;
	private String Poster;
	private Long favoriteCount;
	private Date newestDate;
	private Date oldesttDate;
	
	
	
	
	public FavoriteReport() {
		
	}
	public FavoriteReport(String videoTitle, String poster, Long favoriteCount, Date newestDate, Date oldesttDate) {
		
		this.videoTitle = videoTitle;
		Poster = poster;
		this.favoriteCount = favoriteCount;
		this.newestDate = newestDate;
		this.oldesttDate = oldesttDate;
	}
	public String getVideoTitle() {
		return videoTitle;
	}
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
	public String getPoster() {
		return Poster;
	}
	public void setPoster(String poster) {
		Poster = poster;
	}
	public Long getFavoriteCount() {
		return favoriteCount;
	}
	public void setFavoriteCount(Long favoriteCount) {
		this.favoriteCount = favoriteCount;
	}
	public Date getNewestDate() {
		return newestDate;
	}
	public void setNewestDate(Date newestDate) {
		this.newestDate = newestDate;
	}
	public Date getOldesttDate() {
		return oldesttDate;
	}
	public void setOldesttDate(Date oldesttDate) {
		this.oldesttDate = oldesttDate;
	}
	
	
	
}
	
	