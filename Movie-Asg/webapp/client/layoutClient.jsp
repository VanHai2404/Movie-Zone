<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <!--  -->
 
 <!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <!-- font Aww-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/client.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/responsive.css">
 
  <!-- <link rel="stylesheet" href="CSS/responsive.css"> -->
  <base href="/Movie-Asg/">
  <title>${page.title }</title>

</head>

<body>
  <!-- movie navbar -->
  <nav class="navbar navbar-expand-lg netflix-navbar netflix-padding-left netflix-padding-right">
    <div class="container-fluid">
      <div class="netflix-row">
        <!-- lèt -->
        <section class="left d-flex align-items-center">
          <a class="navbar-brand" href="https://www.facebook.com/login">
            <img src="images/logo/logo5.png" alt="">
          </a>
          <!-- dropdown -->
          <div class="netflix-dropdown-box dropdown">
            <button class="netflix-dropdown dropdown-toggle" type="button" id="dropdownMenuButton1"
              data-bs-toggle="dropdown" aria-expanded="false">
              Browse
            </button>
            <ul class="dropdown-menu " aria-labelledby="dropdownMenuButton1">
              <li><a class="dropdown-item" href="HomeMoviePage">Home</a></li>       
              <li><a class="dropdown-item" href="Movie/list">Movies</a></li>
              <li><a class="dropdown-item" href="#">News</a></li>
              <c:if test="${isLogin }">                  
                  <li><a class="dropdown-item" href="Movie/like">My Like</a></li>
              </c:if>      
            </ul>
          </div>
          <!-- tbas -->
          <div class="netflix-nav">
            <section>
              <button type="button"  onclick="location.href='HomeMoviePage'">Home</button>
              <button type="button"  onclick="location.href='Movie/list'">Movies</button>
              <button>News </button>
             <c:if test="${isLogin }">
            <button type="button"  onclick="location.href='Movie/like'">My Like</button>
                          
             </c:if>
            </section>
           
          </div>

        </section>
        <section class="right d-flex align-items-center">
       <form method="get" action="Movie/search">
    <div class="input-group">
    <input type="search" class="form-control rounded border-0 search" placeholder="Search" aria-label="Search" name="title" aria-describedby="search-addon" style="background-color:rgba(255, 255, 255, 0.477);">
    <button class="btn" type="submit"><i class="bi bi-search"></i></button>
    
    </div>
      </form>
        
        
          <i class="bi bi-bell-fill"></i>

          <div class="netflix-profile nav-item dropdown">
   <c:if test="${empty applicationScope.Loginusername}">
    <h4 class="text-center" role="button" data-bs-toggle="dropdown" aria-expanded="false">
         .
    </h4>
</c:if>
<c:if test="${not empty applicationScope.Loginusername}">
    <h4 class="text-center" role="button" data-bs-toggle="dropdown" aria-expanded="false">
         ${applicationScope.Loginusername}
    </h4>
</c:if>   
            
            <ul class="dropdown-menu dropdown-menu-end " aria-labelledby="navbarDropdownMenuLink" >
            <c:if test="${ ! isLogin }">
              <li><a class="dropdown-item" href="Login">Login</a></li>
              <li><a class="dropdown-item" href="SignUpMovie">Sign Up</a></li>
              <li><a class="dropdown-item" href="ForPasswordMovieServlet">Forgot Password</a></li>
           
           
              
           </c:if>
           <c:if test="${isLogin }">
              <li><a class="dropdown-item" href="EditProfile">Edit Profile</a></li>
              <li><a class="dropdown-item" href="ChangePassword">Change Password </a></li>
              <li><a class="dropdown-item" href="LogOut">Log out</a></li>              
       
            </c:if>
            </ul>
          </div>
        </section>


      </div>

    </div>
  </nav>

  <!-- netflit navbar -- end--->
 <!-- demo -->
 <!-- demo-end -->

  <!-- sider contents -->
 
  <!-- Main --> 
      <jsp:include page="${page.contentUrl }"></jsp:include>

<!-- Main end -->



  <!-- footer -->
  <div class="container-fluid">

    <!-- Footer -->
<footer class="text-center text-white">
    <!-- Section: Social media -->
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
      <!-- Left -->
      <div class="me-5 d-none d-lg-block">
        <span>Kết nối với chúng tôi trên các mạng xã hội:</span>
      </div>
      <!-- Left -->
  
      <!-- Right -->
      <div>
        <a href="https://www.facebook.com/login" class="me-4 link-secondary">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="https://twitter.com/i/flow/login" class="me-4 link-secondary">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="https://www.bing.com/search?q=gg+login&qs=AS&pq=gg+lo&sc=10-5&cvid=FC266D9F12C04E8ABE210315E3CCEAAC&FORM=QBRE&sp=1&ghc=1&lq=0" class="me-4 link-secondary">
          <i class="fab fa-google"></i>
        </a>
        <a href="https://www.instagram.com/" class="me-4 link-secondary">
          <i class="fab fa-instagram"></i>
        </a>
        <a href="https://www.linkedin.com/" class="me-4 link-secondary">
          <i class="fab fa-linkedin"></i>
        </a>
        <a href="https://github.com/loginhttps://github.com/login" class="me-4 link-secondary">
          <i class="fab fa-github"></i>
        </a>
      </div>
      <!-- Right -->
    </section>
    <!-- Section: Social media -->
  
    <!-- Section: Links  -->
    <section class="">
      <div class="container text-center text-md-start mt-5">
        <!-- Grid row -->
        <div class="row mt-3">
          <!-- Grid column -->
          <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
            <!-- Content -->
            <h6 class="text-uppercase fw-bold mb-4">
              <i class="fas fa-gem me-3 text-secondary"></i> PhimVip.com
            </h6>
            <p>
                Tại đây, bạn có thể sử dụng các hàng và cột để sắp xếp nội dung chân trang của mình. Lorem ipsum
                dolor sit amet, consectetur adipisizing elit.
            </p>
          </div>
          <!-- Grid column -->
  
          <!-- Grid column -->
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4">
                Liên kết 
            </h6>
            <p>
              <a href="#!" class="text-reset">Định giá</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Cài đặt</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Liên hệ</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Trở giúp</a>
            </p>
          </div>
          <!-- Grid column -->
  
          <!-- Grid column -->
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4">
                Liên kết hữu ích
            </h6>
            <p>
              <a href="#!" class="text-reset">Định giá</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Cài đặt</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Liên hệ</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Trở giúp</a>
            </p>
          </div>
          <!-- Grid column -->
          <!-- Grid column -->
          <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4">LIÊN HỆ</h6>
            <p><i class="fas fa-home me-3 text-secondary"></i> 137 nguyễn thị thập, Đà Nẵng</p>
            <p>
              <i class="fas fa-envelope me-3 text-secondary"></i>
              hai@example.com
            </p>
            <p><i class="fas fa-phone me-3 text-secondary"></i> + 01 234 567 88</p>
            <p><i class="fas fa-print me-3 text-secondary"></i> + 01 234 567 89</p>
          </div>
          <!-- Grid column -->
        </div>
        <!-- Grid row -->
      </div>
    </section>
    <!-- Section: Links  -->
    <!-- Copyright -->
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
      © 2023 Copyright:
      <a class="text-reset fw-bold" href="https://hai.com/">hovanhai24042003@l.com</a>
    </div>
    <!-- Copyright -->
  </footer>
  <!-- Footer -->
  </div>


  <!-- /foor--end -->
  <script>
let items = document.querySelectorAll('.carou .carou-item')

items.forEach((el) => {
  const minPerSlide = 4
  let next = el.nextElementSibling
  for (var i=1; i<minPerSlide; i++) {
    if (!next) {
        // wrap carousel by using first child
        next = items[0]
    }
    let cloneChild = next.cloneNode(true)
    el.appendChild(cloneChild.children[0])
    next = next.nextElementSibling
}
})

$(document).ready(function(){
    $(window).scroll(function(){
        var scroll = $(window).scrollTop();
        if (scroll > 100) {
          $(".netflix-navbar").css("background" , "#0C0C0C");
        }
  
        else{
            $(".netflix-navbar").css("background" , "transparent");  	
        }
    });

  })
  
    </script>

 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
    
      <c:if test="${not empty page.scriptUrl }">
    <jsp:include page="${page.scriptUrl }"></jsp:include>
    </c:if>
    

  <!-- Option 2: Separate Popper and Bootstrap JS -->
  <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>

</html>