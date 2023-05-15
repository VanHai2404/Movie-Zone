<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="sign-up">
	<div class="container-fluid">
		<div class="login-top">
			<img src="images/logo/logo5.png" alt="">

		</div>
		<div class="form-sign-up mb-4">
			<form action="SignUpMovie" method="post">
			  <jsp:include page="/common/infrom.jsp"></jsp:include>
			   
				<h1 class="card-title">Registrasion</h1>
				<!-- 2 column grid layout with text inputs for the first and last names -->
				<div class="row mb-4">
					<div class="col">
						<div class="form-outline">
							<label class="form-label" for="form3Example1">Username</label> <input
								type="text" id="form3Example1" class="form-control"
								name="username" value="${user.username }"/>
						</div>
					</div>
					<div class="col">
						<div class="form-outline">
							<label class="form-label" for="form3Example2">Password</label> <input
								type="password" id="form3Example2" class="form-control"
								name="password" />
						</div>
					</div>
				</div>

				<!-- Email input -->
				<div class="form-outline mb-4">
					<label class="form-label" for="form3Example3"> Fullname</label> <input
						type="text" id="form3Example3" class="form-control"
						name="fullname" value="${user.fullname }" />
				</div>

				<!-- Password input -->
				<div class="form-outline mb-4">
					<label class="form-label" for="form3Example4">Email address</label>
					<input type="email" id="form3Example4" class="form-control"
						name="email" />
				</div>

				<!-- Checkbox -->
				<div class="form-check d-flex justify-content-center mb-4">
					<input class="form-check-input me-2" type="checkbox" value=""
						id="form2Example33" checked /> <label class="form-label"
						for="form2Example33"> Subscribe to our newsletter </label>
				</div>

				<!-- Submit button -->
				<button type="submit" class="btn btn1 btn-danger">Sign Up</button>

				<!-- Register buttons -->
				<div class="text-center">
					<p style="color: #6e6363;">or sign up with:</p>
					<button type="button" class="btn btn-secondary btn-floating mx-1">
						<i class="fab fa-facebook-f"></i>
					</button>

					<button type="button" class="btn btn-secondary btn-floating mx-1">
						<i class="fab fa-google"></i>
					</button>

					<button type="button" class="btn btn-secondary btn-floating mx-1">
						<i class="fab fa-twitter"></i>
					</button>

					<button type="button" class="btn btn-secondary btn-floating mx-1">
						<i class="fab fa-github"></i>
					</button>
				</div>
			</form>
		</div>

	</div>


</div>