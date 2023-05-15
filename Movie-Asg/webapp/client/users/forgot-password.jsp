<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="login">
	<div class="login-top">
		<img src="images/logo/logo5.png" alt="">
	</div>

	<div class="d-flex justify-content-center algn-item-center"
		style="width: 100vw;">
		<section class="login-box">
		
			<form action="ForPasswordMovie" class="mt-4" method="post">
			    <jsp:include page="/common/infrom.jsp"></jsp:include>
			    	<h2 class="text-white text-center">Forgot password</h2>
				<div class="mb-3 bg-white rounded px-2">
					<label for="exampleInputEmail1" class="form-label email-text">Username</label>
					<input type="text" class="form-control border-0 p-0"  aria-describedby="emailHelp" name="username"
						required placeholder="name">
				</div>
				<div class="mb-3 bg-white rounded px-2">
					<label for="exampleInputPassword1" class="form-label email-text">Email</label>
					<input type="email" class="form-control border-0 p-0" name="email" placeholder="Email">
				</div>
				<button type="submit" class="btn btn-danger mt-5"
					style="width: 100%;">Retrieve</button>
			</form>
		</section>

	</div>


</div>