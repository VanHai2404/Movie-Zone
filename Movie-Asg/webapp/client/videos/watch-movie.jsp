<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 
   <main>
       <article>
        
      <section class="watch-movie">
        <div class="container">

          <div class="movies">
            <iframe src="${video.url }"  frameborder="0" scrolling="no" allow="autoplay; encrypted-media" allowfullscreen=""></iframe>
          </div>

          <div class="movie-id align-items-center" >

            <p class="detail-subtitle">New Episodes</p>

             <h1 class="h1 detail-title" style="color: #fff;">
              Phim : <strong>${video.title }</strong>
            </h1>

            <div class="meta-wrapper">

              <div class="badge-wrapper">
                <div class="badge badge-fill">PG 13</div>

                <div class="badge badge-outline">HD</div>
              </div>

              <div class="ganre-wrapper">
                <a href="#">Comedy,</a>

                <a href="#">Action,</a>

                <a href="#">Adventure,</a>

                <a href="#">Science Fiction</a>
              </div>

              <div class="date-time">

                <div>
                  <ion-icon name="calendar-outline"></ion-icon>

                  <time datetime="2021">2021</time>
                </div>

                <div>
                  <ion-icon name="time-outline"></ion-icon>

                  <time datetime="PT115M">115 min</time>
                </div>

              </div>

            </div>
           <p class="detail-subtitle">Tóm Tắt</p>
             <p class="storyline">
             ${video.description }
            </p>

       


          </div>

        </div>

      </section>
       </article>
       <div class="container">
        <div class="row bootstrap snippets bootdeys">
            <div class="col-md-8 col-sm-12">
                <div class="comment-wrapper">
                    <div class="panel panel-info">
                        <div class="panel-heading" style="color:  hsl(0, 0%, 74%);">
                            Comment 
                        </div>
                        <div class="panel-body">
                            <textarea class="form-control" placeholder="write a comment..." rows="3"></textarea>
                            <br>
                            <button type="button" class="btn btn-info pull-right">Post</button>
                            <div class="clearfix"></div>
                            <hr>
                            <ul class="media-list">
                                <li class="media">
                                    <a href="#" class="pull-left">
                                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
                                    </a>
                                    <div class="media-body">
                                        <span class="text-muted pull-right">
                                            <small class="text-muted">30 min ago</small>
                                        </span>
                                        <strong class="text-success">@Haivh</strong>
                                        <p>
                                            Phim rất hay .., Web mướt ai code mà đẹp vlll tuyết vời.
                                            Tôi rất yêu bộ Phim này , <a href="#">#PhimMoi </a>.
                                        </p>
                                    </div>
                                </li>
                                <li class="media">
                                    <a href="#" class="pull-left">
                                        <img src="https://bootdey.com/img/Content/user_2.jpg" alt="" class="img-circle">
                                    </a>
                                    <div class="media-body">
                                        <span class="text-muted pull-right">
                                            <small class="text-muted">60 min ago</small>
                                        </span>
                                        <strong class="text-success">@HaidepTrai</strong>
                                        <p>
                                          Phim rất hay .., Web mướt ai code mà đẹp vlll tuyết vời.
                                          Tôi rất yêu bộ Phim này , <a href="#">#PhimMoi </a>.
                                        </p>
                                    </div>
                                </li>
                      
                            </ul>
                        </div>
                    </div>
                </div>
        
            </div>
        </div>
        </div>
      
       

      </main>