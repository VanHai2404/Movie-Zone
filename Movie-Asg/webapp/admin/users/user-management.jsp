<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- giao diện trang user -->

<div class="container pt-4">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="userEditting-tab"
				data-bs-toggle="tab" data-bs-target="#userEditting" type="button"
				role="tab" aria-controls="userEditting" aria-selected="true">User
				Editting</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="userList-tab" data-bs-toggle="tab"
				data-bs-target="#userList" type="button" role="tab"
				aria-controls="userList" aria-selected="false">User List</button>
		</li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="userEditting"
			role="tabpanel" aria-labelledby="userEditting-tab">
			<!--Video Editting-->
			<form action="Adim/UserManagement" method="post">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<h4 class="text-center">Edit Thông Tin User</h4>
							<jsp:include page="/common/infrom.jsp"></jsp:include>
						</div>
						<div class="row mb-4">
							<div class="col">
								<div class="form-outline">
									<label class="form-label" for="form6Example1">Username</label>
									<input type="text" id="form6Example1" name="username"
										class="form-control" value="${user.username }"
										${not empty user.username ? 'readonly="true"' : ''} />
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
									<label class="form-label" for="form6Example2">Password</label>
									<input type="password" id="form6Example2" class="form-control"
										name="password" />
								</div>
							</div>
						</div>
						<div class="row mb-4">
							<div class="col">
								<div class="form-outline">
									<label class="form-label" for="form6Example2">Full name</label>
									<input type="text" id="form6Example2" name="fullname"
										class="form-control" value="${user.fullname }" />
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
									<label class="form-label" for="form6Example2">Email</label> <input
										type="email" id="form6Example2" class="form-control"
										name="email" value="${user.email }" />
								</div>
							</div>
						</div>
						<div class="form-check form-check-inline d-flex">
							<table>
								<input type="radio" class="form-check-input" value="true"
									name="admin" ${video.admin? 'checked':'' } /> Admin
							</table>
							<table>
								<input type="radio" class="form-check-input ms-3 " value="false"
									name="admin" ${! video.admin? 'checked':'' } /> User
							</table>

						</div>
					</div>
					<div class="card-footer text-muted ">
						<c:choose>
							<c:when test="${empty user.username}">
                             <button type="submit" class="btn btn-success" formaction="Admin/UserManagement/create">Create</button>
							</c:when>
							<c:otherwise>
						<button type="submit" class="btn btn-danger" formaction="Admin/UserManagement/update">Update</button>
						<button type="submit" class="btn btn-warning" formaction="Admin/UserManagement/delete">Delete</button>
						<button type="submit" class="btn btn-info" formaction="Admin/UserManagement/reset">Reset</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</form>
			<!--Video Editting end-->
		</div>
		<div class="tab-pane fade" id="userList" role="tabpanel"
			aria-labelledby="userList-tab">

			<!--Video list-->
			<table class="table align-middle mb-0 bg-white">
				<thead class="bg-light">
					<tr>
						<th>Username</th>
						<th>Fullname</th>
						<th>Email</th>
						<th>Role</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${users }">
						<tr>
							<td>
								<p class="fw-normal mb-1">${item.username }</p>

							</td>
							<td>
								<p class="fw-bold mb-1">${item.fullname }</p>
							</td>
							<td>
								<p class="text-muted mb-0">${item.email }</p>

							</td>
							<td><span class="fw-normal mb-1">${item.admin ? 'Admin':'User'}</span>
							</td>
							<td><a
								href="Admin/UserManagement/edit?UserId=${item.username }"
								style="text-decoration: none;"><i class="fa-solid fa-gear"
									aria-hidden="true"></i></a> <a
								href="Admin/UserManagement/delete?UserId=${item.username }"
								style="text-decoration: none;"><i
									class="fa-solid fa-square-minus" aria-hidden="true"></i></a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<!--Video list end-->
		</div>

	</div>


</div>