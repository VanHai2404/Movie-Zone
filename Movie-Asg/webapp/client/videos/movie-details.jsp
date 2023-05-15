<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <!-- details Movie -->
    <article>
        
      <section class="movie-detail">
        <div class="container d-flex justify-content-center">

          <figure class="movie-detail-banner">

            <img src="${video.poster }" alt="Free guy movie poster">

            <button class="play-btn">
            	<a href="WatchMovie?videoId=${video.videoId }" style="text-decoration: none;">
				 <i class="fa-regular fa-circle-play" style="font-size: 60px;"></i>
				</a>
            </button>

          </figure>

          <div class="movie-detail-content" >

            <p class="detail-subtitle">New Episodes</p>

            <h1 class="h1 detail-title" style="color: #fff;">
              Phim : <strong>${video.title }</strong>
            </h1>

            <div class="meta-wrapper">

              <div class="badge-wrapper">
                <div class="badge badge-fill">PG 13</div>

                <div class="badge badge-outline">HD</div>
              </div>

              <div class="ganre-wrapper">
                <a href="#">Comedy,</a>

                <a href="#">Action,</a>

                <a href="#">Adventure,</a>

                <a href="#">Science Fiction</a>
              </div>

              <div class="date-time">

                <div>
                  <ion-icon name="calendar-outline"></ion-icon>

                  <time datetime="2021">2021</time>
                </div>

                <div>
                  <ion-icon name="time-outline"></ion-icon>

                  <time datetime="PT115M">115 min</time>
                </div>

              </div>

            </div>

            <p class="storyline">
             ${video.description }
            </p>

            <div class="details-actions">

              <button class="share align-items-center">
                <i class="fa fa-share-nodes"></i>
                <span>Share</span>
              </button>

              <div class="title-wrapper">
                <p class="title">Prime Video</p>

                <p class="text">Streaming Channels</p>
              </div>
  <a href="WatchMovie?videoId=${video.videoId }" style="text-decoration: none;">
              <button class="btn btn-primary">
                <ion-icon name="play"></ion-icon>
              
			    <span>Watch Now</span>
				
               
              </button>
</a>
            </div>
<!-- 
            <a href="./assets/images/movie-4.png" download class="download-btn">
              <span>Download</span>

              <ion-icon name="download-outline"></ion-icon>
            </a> -->

          </div>

        </div>
      </section>


       </article>
       