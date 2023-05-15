
    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!-- video-management --> 
  <div class="container pt-4">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="videoEditting-tab" data-bs-toggle="tab" data-bs-target="#videoEditting"
            type="button" role="tab" aria-controls="videoEditting" aria-selected="true">Video Editting</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="videoList-tab" data-bs-toggle="tab" data-bs-target="#videoList" type="button"
            role="tab" aria-controls="videoList" aria-selected="false"> Video List</button>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="videoEditting" role="tabpanel" aria-labelledby="videoEditting-tab">
          <!--Video Editting-->
          <form action="Admin/VideoManagement" method="post" enctype="multipart/form-data">
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <div class="col-3">
                    <div class="border-0 p-3">
                      <img src="${video.poster !=null?video.poster :'images/video_img/movie-5.png'}" alt="" class="img-fluid">
                      <div class="input-group mb3-3 mt-3">
                      <div class="input-group-prepend">
                      <span class="input-group-text">Uploat</span>
                      </div>
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="cover" name="cover" />
                        <table for="cover" > Choose File</table>
                      </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-9">
                     <jsp:include page="/common/infrom.jsp"></jsp:include>
                    <h6 class="text-center"> Thông Tin Video</h6>
                    <!-- Text input -->
                    <div class="row mb-4">
							<div class="col">
								<div class="form-outline">
									<label class="form-label" for="form6Example4">Video ID</label>
                                <input type="text" id="form6Example4" class="form-control" name="videoId" value="${video.videoId}" ${not empty video.videoId ? 'readonly="true"' : ''}/>
                               <small class="form-text text-muted"> Video id is Required</small>
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
									 <label class="form-label" for="form6Example4">URL Video</label>
                             <input type="text" id="form6Example4" class="form-control" name="url" value="${video.url}"/>
                             <small class="form-text text-muted">URL Video is Required</small>
								</div>
							</div>
						</div>
                 
                    <div class="form-outline mb-1">
                              <label class="form-label" for="form6Example4">Video Title</label>
                               <input type="text" id="form6Example4" class="form-control" name="title" value="${video.title}"/>
                               <small class="form-text text-muted"> Video Title id is Required</small>
                    </div>              
                    <div class="row mb-4">
							<div class="col">
								<div class="form-outline">
					             <label class="form-label" for="form6Example4">View Count</label>
                                 <input type="text" id="form6Example4" class="form-control" name="views" value="${video.views}"/>
                                 <small class="form-text text-muted"> View Count is Required</small>
   
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
								 
					            <label class="form-label" for="form6Example4">Nation </label>
                                <input type="text" id="form6Example4" class="form-control" name="nation" value="${video.nation}"/>
                               <small class="form-text text-muted"> Nation is Required</small>
   
								</div>
							</div>
								<div class="col">
								<div class="form-outline">
								 
					            <label class="form-label" for="form6Example4">Category </label>
                                <input type="text" id="form6Example4" class="form-control" name="category" value="${video.category}"/>
                               <small class="form-text text-muted"> Category is Required</small>
   
								</div>
							</div>
						</div>
                    
                    
                    <div class="form-check form-check-inline d-flex">
                      <table> <input type="radio" class="form-check-input"     value="true" name="active" ${video.active? 'checked':'' }> Active
                      </table>
                      <table> <input type="radio" class="form-check-input ms-3 " value="false" name="active" ${! video.active? 'checked':'' } > Inactive</table>

                    </div>

                  </div>
                </div>
                <div class="row">
                  <div class="col">
                    <label for="description">Description</label>
                    <textarea name="description" id="description" cols="10" rows="5" class="form-control">${video.description}</textarea>
                  </div>
                </div>
              </div>
              <div class="card-footer text-muted ">
                <c:choose>
					<c:when test="${empty video.videoId}">
                        <button type="submit" class="btn btn-success" formaction="Admin/VideoManagement/create">Create</button>
					</c:when>
					<c:otherwise>
						 <button type="submit" class="btn btn-danger" formaction="Admin/VideoManagement/update">Update</button>
                         <button type="submit" class="btn btn-warning" formaction="Admin/VideoManagement/delete">Delete</button>
                         <button type="submit" class="btn btn-info" formaction="Admin/VideoManagement/reset">Reset</button>
					</c:otherwise>
				</c:choose>

              </div>
            </div>
          </form>
          <!--Video Editting end-->

        </div>
        <div class="tab-pane fade" id="videoList" role="tabpanel" aria-labelledby="videoList-tab">

          <!--Video list-->
          <table class="table align-middle mb-0 bg-white">
            <thead class="bg-light">
              <tr>
                <th>Video ID</th>
                <th>Video Title</th>
                <th>Views Count</th>
                <th>Status</th>
                <th>&nbsp;</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${videos }">
              <tr>
                <td>
                  <p class="fw-normal mb-1">${item.videoId }</p>
                  
                </td>
                <td>
                  <div class="d-flex align-items-center">
                    <img src="${item.poster}" alt="" style="width: 45px; height: 45px"
                      class="rounded-circle" />
                    <div class="ms-3">
                      <p class="fw-bold mb-1"> ${item.title }</p>
                      <p class="text-muted mb-0">${item.description }</p>
                    </div>
                  </div>
                </td>
                <td>
                  <p class="fw-normal mb-1">${item.views }</p>
                  <p class="text-muted mb-0">...</p>
               
                </td>
                <td>
                  <span class="fw-normal mb-1">${item.active ? 'Active':'Deactive' }</span>
                </td>
               
                <td>
                  <a href="Admin/VideoManagement/edit?videoId=${item.videoId }"style="text-decoration: none;"><i class="fa-solid fa-gear" aria-hidden="true"></i></a>
                 <a href="Admin/VideoManagement/delete?videoId=${item.videoId }" style="text-decoration: none;"><i class="fa-solid fa-square-minus" aria-hidden="true"></i></a>
                </td>
              </tr>
              	</c:forEach>
            </tbody>
          </table>

          <!--Video list end-->
        </div>

      </div>


    </div>