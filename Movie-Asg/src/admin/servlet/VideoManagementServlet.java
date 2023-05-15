package admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.beanutils.BeanUtils;

import commom.PageInfo;
import commom.PageType;
import commom.SessionUtils;
import commom.UploatUtils;
import dao.VideoDao;
import model.Video;

/**
 * Servlet implementation class VideoManagement
 */
@WebServlet({ "/Admin/VideoManagement", "/Admin/VideoManagement/create", "/Admin/VideoManagement/update",
		"/Admin/VideoManagement/delete", "/Admin/VideoManagement/reset", "/Admin/VideoManagement/edit" })
@MultipartConfig
public class VideoManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(!SessionUtils.isLogin(request)) {
			PageInfo.formAndForword(request, response, PageType.LOGIN_MOVIE_PAGE);

			return;
		}		
		HttpSession session =request.getSession();
        boolean getAdmin=(boolean) session.getAttribute("admin");
       
       
             System.out.println("ADmin"+getAdmin);
		if (getAdmin) {
			request.getRequestDispatcher("Adim/VideoManagement").forward(request, response);
		
		}else {
			   response.sendError(HttpServletResponse.SC_NOT_FOUND, "Sorry, bạn không được phép vào trang này ,cút nhành lên");
			return;					
		}
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String url = request.getRequestURL().toString(); // lấy url xem người dung chọn url nào
	
		// kiếm tra
		if (url.contains("edit")) {
			edit(request, response);
			return;

		}
		if (url.contains("delete")) {
			delete(request, response);
			return;

		}
		if (url.contains("reset")) {
			reset(request, response);
			return;

		}

		Video video = new Video();
		video.setPoster("images/video_img/movie-1.png");

		findAll(request, response);
		request.setAttribute("video", video);
		PageInfo.prepareAndForword(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
//		
		String url = request.getRequestURL().toString(); // lấy url xem người dung chọn url nào
		System.out.println("url post: " + url);

		if (url.contains("create")) {
			create(request, response);
			return;
		}
		if (url.contains("update")) {
			update(request, response);
			return;
		}
		if (url.contains("delete")) {
			delete(request, response);
			return;
		}
		if (url.contains("reset")) {
			reset(request, response);
			return;
		}

	}

	private void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();
		video.setPoster("images/video_img/movie-1.png");
		
		request.setAttribute("video", new Video());
		   findAll(request, response);
		PageInfo.prepareAndForword(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("videoId"); // lấy id do người dung gởi tới
		System.out.println("IDVideo" + id);
		if (id == null) {
			request.setAttribute("error", "Video id is requse");
			PageInfo.prepareAndForword(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
			return;
		}
		try {
			VideoDao dao = new VideoDao();
			dao.delete(id);
			request.setAttribute("message", "delete Video success!!");
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error"+e.getMessage());
		}
		PageInfo.prepareAndForword(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();
		try {
			BeanUtils.populate(video, request.getParameterMap());
			VideoDao dao = new VideoDao();
			Video oldVideo = dao.findbyId(video.getVideoId()); // lấy video theo id người dung nhập trên from
			if (request.getPart("cover").getSize() == 0) {
				video.setPoster(oldVideo.getPoster());
			} else {
				video.setPoster("uploads/" + UploatUtils.processUploatField("cover", request, "/uploads", null));
			}
			dao.update(video);
			
			request.setAttribute("video", video);
			System.out.println("Video" + oldVideo.getVideoId());
			request.setAttribute("message", "Successfully uploat Video !! ");
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error" + e.getMessage());
		}
		PageInfo.prepareAndForword(request, response, PageType.VIDEO_MANAGEMENT_PAGE);

	}

	private void findAll(HttpServletRequest request, HttpServletResponse response) {

		try {
			VideoDao dao = new VideoDao();

			List<Video> list = dao.findAll();
			request.setAttribute("videos", list);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error" + e.getMessage());
		}

	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("videoId"); // lấy id do người dung gởi tới
		System.out.println("IDVideo" + id);
		if (id == null) {
			request.setAttribute("error", "Video id is requse");
			PageInfo.prepareAndForword(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
			return;
		}

		try {
			VideoDao dao = new VideoDao();
			Video video = dao.findbyId(id);
			request.setAttribute("video", video);

			findAll(request, response);
			PageInfo.prepareAndForword(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error" + e.getMessage());
		}
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();
		try {
			BeanUtils.populate(video, request.getParameterMap());

			video.setPoster("uploads/" + UploatUtils.processUploatField("cover", request, "/uploads", null));
			System.out.println("Title: " + video.getTitle());

			VideoDao dao = new VideoDao();
			dao.insert(video);
			request.setAttribute("video", video);
			request.setAttribute("message", "Successfully added new video !!");
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" + e.getMessage());
		}

		PageInfo.prepareAndForword(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

}
