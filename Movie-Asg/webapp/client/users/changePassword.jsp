<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <div id="sign-up">
 <div class="container-fluid">
        <div class="login-top">
         <img src="images/logo/logo5.png" alt="">                 
         </div>
         <div class="form-changepassword mb-4">
            <form action="ChangePassword" method="post">
                <h1 class="card-title">Change Password</h1>
                            <jsp:include page="/common/infrom.jsp"></jsp:include>
                <div class="row mb-4">
                  <div class="col">
                    <div class="form-outline">
                        <label class="form-label" for="form3Example1">Username</label>
                      <input type="text" id="form3Example1" class="form-control" value="${username }" name="username" readonly/>
                    </div>
                  </div>
                  <div class="col">
                    <div class="form-outline">
                        <label class="form-label" for="form3Example2">Current Password</label>
                      <input type="password" id="form3Example2" class="form-control" name="currentPassword"/>
                    </div>
                  </div>
                </div>
                <div class="row mb-4">
                    <div class="col">
                      <div class="form-outline">
                          <label class="form-label" for="form3Example1">Password</label>
                        <input type="password" id="form3Example1" class="form-control" name="password"/>
                      </div>
                    </div>
                    <div class="col">
                      <div class="form-outline">
                          <label class="form-label" for="form3Example2">Confim Password</label>
                        <input type="password" id="form3Example2" class="form-control" name="confirmPassword"/>
                      </div>
                    </div>
                  </div>        
                <!-- Submit button -->
                <button type="submit" class="btn btn1 btn-danger">Change Password</button>

                <!-- Register buttons -->
            
              </form>
         </div>
        </div>
 
 </div>