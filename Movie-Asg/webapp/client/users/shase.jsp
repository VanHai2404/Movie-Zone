<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <div id="shase">
 
  <div class="container-fluid">
        <div class="login-top">
            <img src="images/logo/logo5.png" alt="">
        </div>
        <div class=" mb-4 login-box card_shase">

            <h1 class="card-title">Send Video</h1>
            <form  method="POST" action="ShaseMovie">
             <jsp:include page="/common/infrom.jsp"></jsp:include>
            <input type="hidden" name="videoId" value="${videoId }">
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">Email</label>
                    <input type="email" class="form-control  border-0" id="inputEmail" name="email" required
                        placeholder="Email">
                </div>
                <div class="mb-3">
                    <label for="inputSubject" class="form-label">Subject</label>
                    <input type="text" class="form-control" id="inputSubject" name="subject" required
                        placeholder="Subject">
                </div>
                <div class="mb-3">
                    <label for="inputMessage" class="form-label">Message</label>
                    <textarea class="form-control" id="inputMessage" name="message" rows="5" required
                        placeholder="Thông tin"></textarea>
                </div>
                <button type="submit" class="btn btn-danger btn-shase">Send <i class="fa-solid fa-share card-icon"></i></button>


            </form>

        </div>

    </div>
 
 </div>