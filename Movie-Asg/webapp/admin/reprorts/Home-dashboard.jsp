<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


  <div class="container pt-4">
    <div class="row pt-2">
      <div class="col-xl-3 col-lg-6 col-md-12 col-12 mb-5">
          <!-- card -->
          <div class="card1 h-100 card-lift">
              <!-- card body -->
              <div class="card-body">
                  <!-- heading -->
                  <div class="d-flex justify-content-between align-items-center mb-3 ">
                      <div>
                          <h4 class="mb-0">Movies</h4>
                      </div>
                      <div class="icon-shape icon-md bg-primary-soft text-primary rounded-2">
                          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-briefcase"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg>
                      </div>
                  </div>
                  <!-- project number -->
                  <div class="lh-1">
                      <h1 class=" mb-1 fw-bold">${Tolat_video}</h1>
                  </div>
              </div>
          </div>
      </div>
      <div class="col-xl-3 col-lg-6 col-md-12 col-12 mb-5">
          <!-- card -->
          <div class="card1 h-100 card-lift">
              <!-- card body -->
              <div class="card-body">
                  <!-- heading -->
                  <div class="d-flex justify-content-between align-items-center
  mb-3">
                      <div>
                          <h4 class="mb-0">Active User</h4>
                      </div>
                      <div class="icon-shape icon-md bg-primary-soft text-primary
    rounded-2">
    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
                      </div>
                  </div>
                  <!-- project number -->
                  <div class="lh-1">
                      <h1 class="  mb-1 fw-bold"></h1>
                  </div>
              </div>
          </div>
      </div>
      <div class="col-xl-3 col-lg-6 col-md-12 col-12 mb-5">
          <!-- card -->
          <div class="card1 h-100 card-lift">
              <!-- card body -->
              <div class="card-body">
                  <!-- heading -->
                  <div class="d-flex justify-content-between align-items-center
  mb-3">
                      <div>
                          <h4 class="mb-0">Registered users</h4>
                      </div>
                      <div class="icon-shape icon-md bg-primary-soft text-primary
    rounded-2">
    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                      </div>
                  </div>
                  <!-- project number -->
                  <div class="lh-1">
                      <h1 class="  mb-1 fw-bold">${Total_user}</h1>
                  </div>
              </div>
          </div>

      </div>
      <div class="col-xl-3 col-lg-6 col-md-12 col-12 mb-5">
          <!-- card -->
          <div class="card1 h-100 card-lift">
              <!-- card body -->
              <div class="card-body">
                  <!-- heading -->
                  <div class="d-flex justify-content-between align-items-center
  mb-3">
                      <div>
                          <h4 class="mb-0">Total views</h4>
                      </div>
                      <div class="icon-shape icon-md bg-primary-soft text-primary
    rounded-2">
    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-target"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="6"></circle><circle cx="12" cy="12" r="2"></circle></svg>
                      </div>
                  </div>
                  <!-- project number -->
                  <div class="lh-1">
                      <h1 class="  mb-1 fw-bold">${Tolat_views }</h1>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <div class="row pt-2">
     <h5>Like Video News</h5>
    <table class="table align-middle mb-0 bg-white ">
      <thead class="bg-light">
        <tr>
          <th>Video ID</th>
          <th>Video Title</th>
          <th>Views Count</th>
          <th>Status</th>
 
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
               
                
              </tr>
              	</c:forEach>

      

      </tbody>
    </table>
  </div>
</div>