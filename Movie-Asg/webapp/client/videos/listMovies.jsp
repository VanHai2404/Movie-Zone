<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-fluid listmovies text-center">
	<h3 class="table-title" style="margin-bottom: 20px;"> ${name }</h3>
	<div class="row row-cols-5">
	<c:forEach var="item" items="${videos}">
	
	<div class="col">
		<div class="card card-trengding">
			<img src="${item.poster}" alt="...">
			<!-- card-body -->
			<div class="card-body">
				<!-- icon card -->
				<section class="d-flex justify-content-between">
					<div class="btn-icon">
					
						<a href="HomeMoviePage/play?videoId=${item.videoId }" style="text-decoration: none;">
							<i class="bi bi-play-circle-fill card-icon"></i>
						</a>
							<a href="LikeVideo?videoId=${item.videoId }" style="text-decoration: none;">
							  <i class="fa fa-heart card-icon"></i>
						</a>
						
					</div>
					<div class="btn-icon">
						<!-- <i class="bi bi-arrow-down-circle card-icon"></i> -->
						<a href="ShaseMovie?videoId=${item.videoId }" style="text-decoration: none;"> <i
								class="fa-solid fa-share card-icon"></i>
						</a>
					</div>
				</section>
				<!-- icon card end -->
				<!-- nội dụng phim -->
				<section class="d-flex align-items-center justify-content-between">
					<p class="netflix-card-text m-0" style="color: rgb(0, 186, 0);">97%
						match</p>
					<span class="m-1 netflix-card-text text-white">${item.title}</span>
					<span class="border netflix-card-text p-1 text-white">+HD</span>
				</section>
				<span class="netflix-card-text text-white"> ${item.category }</span>
				<!-- nội dụng phim end -->
			</div>
			<!--  -->
		</div>
	</div>
	
</c:forEach>
</div>
</div>