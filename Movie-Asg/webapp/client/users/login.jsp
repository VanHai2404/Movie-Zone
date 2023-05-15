<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 
 <div id="login">

    <div class="login-top">
        <img src="images/logo/logo5.png" alt="">
    </div>

    <div class="d-flex justify-content-center algn-item-center" style="width: 100vw;">
        <section class="login-box">
         <jsp:include page="/common/infrom.jsp"></jsp:include>
            <h2 class="text-white">Sign In</h2>
            <form action="Login" class="mt-4" method="post">
               <!--  <div class="mb-3 bg-white rounded px-2">
                  <label for="exampleInputEmail1" class="form-label email-text">Email or Phone Number</label>
                  <input type="email" class="form-control border-0 p-0" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                 -->
                 <div class="mb-3 bg-white rounded px-2">
                  <label for="exampleInputEmail1" class="form-label email-text">Username</label>
                  <input type="text" class="form-control border-0 p-0"  name="username">
                </div>
                <div class="mb-3 bg-white rounded px-2">
                  <label for="exampleInputPassword1" class="form-label email-text">Password</label>
                  <input type="password" class="form-control border-0 p-0" id="exampleInputPassword1" name="password">
                </div>

                <button type="submit" class="btn btn-danger mt-5" style="width: 100%;" >Sign In</button>

                <div class="mb-3 mt-3 form-check">
                  <input type="checkbox" class="form-check-input" id="exampleCheck1">
                  <label class="form-check-label  small-text" for="exampleCheck1" style="color: #b3b3b3;">Remember Me</label>

                </div>
                <div class="mt-3 d-flex">
                    <img width="20px" src="images/logo/facebookLogo.png" alt="">
                    <p class="m-0 small-text " style="color: #b3b3b3;"> Login with Facebook</p>

                </div>
              </form>
        </section>

    </div>
    </div>
   