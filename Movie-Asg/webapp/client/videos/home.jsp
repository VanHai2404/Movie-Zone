<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- intro home, Top trengding, lục mục  -->


<!-- 


<!-- video contents -->
<div class="">
	<section class="netflix-home-video">
		<div class="top"></div>
		<div class="bottom"></div>
		<!--  -->
		<div id="carouselBasicExample" class="carousel slide carousel-fade"
			data-bs-ride="carousel">
			    <!-- Indicators -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/img-intro/Phim4.webp" class="d-block w-100" alt="">
					<!-- Content  -->
					<div class="content">
						<section class="left">
							<img src="images/img-intro/LogoPhim.webp" alt="">
							<div class="mt-2 d-flex">
								<button type="button" class="btn btn-light m-2">
									<i class="bi bi-play-fill" style="color: #000; padding: 0px;"></i>
									Play Now
								</button>
								<button type="button" class="btn btn-secondary m-2">
									<i class="bi bi-info-circle" style="color: #000; padding: 0px;"></i>
									More Info
								</button>
							</div>
						</section>
					</div>
					<!-- Content end -->
				</div>
			


				<div class="carousel-item">
					<img src="images/img-intro/Phim2.webp" class="d-block w-100" alt="">
					<!-- Content  -->
					<div class="content">
						<section class="left">
							<img src="images/img-intro/LoGoPhim2.webp" alt="">
							<div class="mt-2 d-flex">
								<button type="button" class="btn btn-light m-2">
									<i class="bi bi-play-fill" style="color: #000; padding: 0px;"></i>
									Play Now
								</button>
								<button type="button" class="btn btn-secondary m-2">
									<i class="bi bi-info-circle" style="color: #000; padding: 0px;"></i>
									More Info
								</button>
							</div>
						</section>
						<!-- Content end -->


					</div>
				</div>

				<div class="carousel-item">
					<img src="images/img-intro/Phim6.webp" class="d-block w-100" alt="">
					<!-- Content  -->
					<div class="content">
						<section class="left">
							<img src="images/img-intro/Logo6.webp" alt="">
							<div class="mt-2 d-flex">
								<button type="button" class="btn btn-light m-2">
									<i class="bi bi-play-fill" style="color: #000; padding: 0px;"></i>
									Play Now
								</button>
								<button type="button" class="btn btn-secondary m-2">
									<i class="bi bi-info-circle" style="color: #000; padding: 0px;"></i>
									More Info
								</button>
							</div>
						</section>
					</div>
					<!-- Content end -->
				</div>
				<div class="carousel-item">
					<img src="images/img-intro/Phim4.webp" class="d-block w-100" alt="">
					<!-- Content  -->
					<div class="content">
						<section class="left">
							<img src="images/img-intro/LogoPhim.webp" alt="">
							<div class="mt-2 d-flex">
								<button type="button" class="btn btn-light m-2">
									<i class="bi bi-play-fill" style="color: #000; padding: 0px;"></i>
									Play Now
								</button>
								<button type="button" class="btn btn-secondary m-2">
									<i class="bi bi-info-circle" style="color: #000; padding: 0px;"></i>
									More Info
								</button>
							</div>
						</section>
					</div>
					<!-- Content end -->
				</div>
				<div class="carousel-item">
					<img src="images/img-intro/Phim5.webp" class="d-block w-100" alt="">
					<!-- Content  -->
					<div class="content">
						<section class="left">
							<img src="images/img-intro/Logo5.webp" alt="">
							<div class="mt-2 d-flex">
								<button type="button" class="btn btn-light m-2">
									<i class="bi bi-play-fill" style="color: #000; padding: 0px;"></i>
									Play Now
								</button>
								<button type="button" class="btn btn-secondary m-2">
									<i class="bi bi-info-circle" style="color: #000; padding: 0px;"></i>
									More Info
								</button>
							</div>
						</section>
					</div>
					<!-- Content end -->
				</div>
				<div class="carousel-item ">
					<img src="images/img-intro/Phim1.webp" class="d-block w-100" alt="">
					<!-- Content  -->
					<div class="content">
						<section class="left">
							<img src="images/img-intro/logoPhim1.webp" alt="">
							<div class="mt-2 d-flex">
								<button type="button" class="btn btn-light m-2">
									<i class="bi bi-play-fill" style="color: #000; padding: 0px;"></i>
									Play Now
								</button>
								<button type="button" class="btn btn-secondary m-2">
									<i class="bi bi-info-circle" style="color: #000; padding: 0px;"></i>
									More Info
								</button>
							</div>
						</section>
						<!-- Content end -->


					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselBasicExample" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselBasicExample" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!--  -->


	</section>
</div>
<!-- Video -->
<!-- slider -->
<!--  -->
<div class="container-fluid lucmuc">
	<div class="row margin-right margin-title">
		<div class="col">
			<h5></h5>

			<ul class="list-inline">
				<li class="list-inline-item"><a href="Movie/list">Toàn bộ mục video</a></li>
				<li class="list-inline-item"><a href="Movie/nation?nation=Hàn Quốc">Hàn Quốc</a></li>
				<li class="list-inline-item"><a href="Movie/nation?nation=Thái Lan">Thái Lan</a></li>
				<li class="list-inline-item"><a href="Movie/nation?nation=Thụy Sĩ">Thụy Sĩ</a></li>
				<li class="list-inline-item"><a href="Movie/nation?nation=Nhật Bản">Nhật Bản</a></li>
				<li class="list-inline-item"><a href="Movie/nation?nation=Malaysia">Malaysia</a></li>
				<li class="list-inline-item"><a href="Movie/nation?nation=Mỹ">Mỹ</a></li>
				<li class="list-inline-item"><a href="Movie/nation?nation=Anh">Anh</a></li>
				<li class="list-inline-item"><a href="Movie/nation?nation=Việt Nam">Việt Nam</a></li>

			</ul>
		</div>
	</div>
</div>
<!--  -->
<div class="container my-3 top_trengding mt-2">
	<h3 class="table-title">#TOP TRENGDING THÁNG NÀY</h3>
	<div class="row justify-content-center  text-center  ">
		<div class="col-8 d-grid gap-2 d-md-flex justify-content-md-end ">
			<a class="btn btn-outline-dark" href="#recipeCarousel" role="button"
				data-bs-slide="prev"> <i class="fa fa-arrow-left"></i>
			</a> <a class="btn btn-outline-dark" href="#recipeCarousel" role="button"
				data-bs-slide="next"> <i class="fa fa-arrow-right"></i>
			</a>
		</div>
		<div id="recipeCarousel" class="carou carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner" role="listbox">		
		<c:forEach var="item" items="${Topvideos}" begin="1">
	 <div class="carou-item carousel-item">
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
				</div>
				</c:forEach>
				<div class="carou-item carousel-item active">
		<div class="col">
		<div class="card card-trengding">
			<img src="${Topvideo.poster}" alt="...">
			<!-- card-body -->
			<div class="card-body">
				<!-- icon card -->
				<section class="d-flex justify-content-between">
					<div class="btn-icon">
					
						<a href="HomeMoviePage/play?videoId=${Topvideo.videoId }" style="text-decoration: none;">
							<i class="bi bi-play-circle-fill card-icon"></i>
						</a>
							<a href="LikeVideo?videoId=${Topvideo.videoId }" style="text-decoration: none;">
							  <i class="fa fa-heart card-icon"></i>
						</a>
						
					</div>
					<div class="btn-icon">
						<!-- <i class="bi bi-arrow-down-circle card-icon"></i> -->
						<a href="ShaseMovie?videoId=${Topvideo.videoId }" style="text-decoration: none;"> <i
								class="fa-solid fa-share card-icon"></i>
						</a>
					</div>
				</section>
				<!-- icon card end -->
				<!-- nội dụng phim -->
				<section class="d-flex align-items-center justify-content-between">
					<p class="netflix-card-text m-0" style="color: rgb(0, 186, 0);">97%
						match</p>
					<span class="m-1 netflix-card-text text-white">${Topvideo.title}</span>
					<span class="border netflix-card-text p-1 text-white">+HD</span>
				</section>
				<span class="netflix-card-text text-white"> ${Topvideo.category }</span>
				<!-- nội dụng phim end -->
			</div>
			<!--  -->
		</div>
   	</div>
				
	</div>


			</div>
			<a class="carousel-control-prev bg-transparent w-aut"
				href="#recipeCarousel" role="button" data-bs-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span>
			</a> <a class="carousel-control-next bg-transparent w-aut"
				href="#recipeCarousel" role="button" data-bs-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span>
			</a>
		</div>
	</div>
</div>


<!-- Các Phim Khác -->

<div class="container-fluid top_trengding mt-2 text-center">
	<h3 class="table-title" style="margin-bottom: 20px;">#CÁC PHIM HÓT
		KHÁC</h3>
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
	


<!-- end Phim Khác -->

<!-- end Phim Khác -->