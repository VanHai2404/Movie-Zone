<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--  -->
<div class="container pt-4">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="favorites-tab"
				data-bs-toggle="tab" data-bs-target="#favorites" type="button"
				role="tab" aria-controls="favorites" aria-selected="true">Favorites</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="FavoriteUser-tab" data-bs-toggle="tab"
				data-bs-target="#FavoriteUser" type="button" role="tab"
				aria-controls="FavoriteUser" aria-selected="false">
				Favorite User</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="ShareFriend-tab" data-bs-toggle="tab"
				data-bs-target="#ShareFriend" type="button" role="tab"
				aria-controls="ShareFriend" aria-selected="false">Share
				Friends</button>
		</li>

	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="favorites" role="tabpanel"
			aria-labelledby="favorites-tab">
			<!--Video list-->
			<table class="table align-middle mb-0 bg-white">
				<thead class="bg-light">
					<tr>
						<th>Video Title</th>
						<th>Favorites Count</th>
						<th>Lasted Date</th>
						<th>Oldest Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${favList }">
						<tr>
							<td>
								<div class="d-flex align-items-center">
									<img src="${item.poster}" alt=""
										style="width: 45px; height: 45px" class="rounded-circle" />
									<div class="ms-3">
										<p class="fw-bold mb-1">${item.videoTitle }</p>
									</div>
								</div>
							</td>
							<td>
								<p class="fw-normal mb-1">${item.favoriteCount }</p>

							</td>
							<td>
								<p class="fw-normal mb-1">${item.newestDate }</p>


							</td>
							<td><span class="fw-normal mb-1">${item.oldesttDate }</span></td>


						</tr>
					</c:forEach>


				</tbody>
			</table>

			<!--Video list end-->


		</div>
		<div class="tab-pane fade" id="FavoriteUser" role="tabpanel"
			aria-labelledby="FavoriteUser-tab">
			<form action="ReportsManagement" method="get">
				<div class="row align-items-center">
					<div class="col-2">
						<table class="text-white">Title Video</table>
					</div>

					<div class="col-3 mt-2">
						<select name="videoUserId" class="form-select" id="videoId">
							<c:forEach var="item" items="${vidList }">
								<option value="${item.videoId }"
									${item.videoId==videoUserId? 'selected':''}>${item.title }</option>
							</c:forEach>

						</select>
					</div>
					<div class="col mt-2">
						<button type="submit" class="btn btn-primary">Report</button>
					</div>
				</div>
				<!-- Lọc -->
				<!-- Lọc end -->
				<table class="table align-middle mb-0 bg-white">
					<thead class="bg-light">
						<tr>
							<th>Username</th>
							<th>FullName</th>
							<th>Email</th>
							<th>Favorite Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${favUsers }">
							<tr>
								<td>${item.username }</td>
								<td>${item.fullname }</td>
								<td>${item.email }</td>
								<td>${item.likeDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>

		</div>

	<!-- 	<div class="tab-pane fade" id="ShareFriend" role="tabpanel"
			aria-labelledby="ShareFriend-tab">

			<div class="row align-items-center">
				<div class="col-2">
					<table class="text-white">Title Video
					</table>
				</div>

				<div class="col-3 mt-2">
					<select class="form-select">
						<option value="1">Thanh Gươm Diệt Quỷ</option>
						<option value="2">Thanh Gươm Diệt Quỷ</option>
						<option value="3">Thanh Gươm Diệt Quỷ</option>
						<option value="4">Thanh Gươm Diệt Quỷ</option>

					</select>
				</div>
				<div class="col mt-2">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
			Lọc
			Lọc end
			<table class="table align-middle mb-0 bg-white">
				<thead class="bg-light">
					<tr>
						<th>Sender Name</th>
						<th>Sender Email</th>
						<th>Receiver Email</th>
						<th>Sender Date</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<td></td>
						<td></td>
						<td></td>


					</tr>
				</tbody>
			</table>

		</div>
 -->
	</div>


</div>