package client.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.PageInfo;
import commom.PageType;
import commom.SessionUtils;
import dao.VideoDao;
import model.Video;

/**
 * Servlet implementation class ListMoviesServlet
 */
@WebServlet({"/Movie","/Movie/list","/Movie/nation","/Movie/search","/Movie/like"})
public class ListMoviesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url =request.getRequestURL().toString();
	
		if (url.contains("nation")) {
			SearchByNation(request, response);
			PageInfo.clientAndForword(request, response,PageType.LIST_MOVIE_PAGE);
			return;

		}
		if (url.contains("search")) {
			SearchTitle(request, response);
			PageInfo.clientAndForword(request, response,PageType.LIST_MOVIE_PAGE);
			return;
		}
		if (url.contains("list")) {
			findAll(request, response);
			PageInfo.clientAndForword(request, response,PageType.LIST_MOVIE_PAGE);
			return;
		}
		if (url.contains("like")) {
			findVideoUserLike(request, response);
			PageInfo.clientAndForword(request, response,PageType.LIST_MOVIE_PAGE);
			return;
		}

	}


	private void findVideoUserLike(HttpServletRequest request, HttpServletResponse response) {
		
		
		String username=SessionUtils.getLoginUsername(request);
		
	try {
			
			VideoDao dao = new VideoDao();
			List<Video> list =dao.findLikedVideosByUser(username);
			if(list.isEmpty()) {
				request.setAttribute("name", "Bạn chưa like bộ phim nào :");
                return;
			}
			request.setAttribute("videos", list);
			request.setAttribute("name", "Các bộ phim đã like");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" +e.getMessage() );	
		}
		
		
	}


	private void SearchByNation(HttpServletRequest request, HttpServletResponse response) {
		String Nation =request.getParameter("nation");
		System.out.println("nation: "+Nation);
		try {
			
			VideoDao dao = new VideoDao();
			List<Video> list =dao.findVideoByVideoNation(Nation);
			if(list.isEmpty()) {
				request.setAttribute("name", "Không tìm thấy các bộ phim :"+Nation);
                return;
			}
			request.setAttribute("videos", list);
			request.setAttribute("name", "Các bộ phim của nước :"+Nation);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" +e.getMessage() );	
		}
		
	}


	private void SearchTitle(HttpServletRequest request, HttpServletResponse response) {
		
		String SearchTitle =request.getParameter("title");
		if(SearchTitle.equals("")) {
			SearchTitle=null;
		}
		System.out.println("title"+SearchTitle);
		try {
			
			VideoDao dao = new VideoDao();
			List<Video> list =dao.findVideoByVideoTitle(SearchTitle);
			System.out.println("Video Tim Thay" +list);
			request.setAttribute("videos", list);
			if(list.isEmpty()|| SearchTitle.equals("")) {
				request.setAttribute("name", "Không tìm thấy bộ phim bạn tìm kiếm !!");
                return;
			}
			request.setAttribute("name", "Movie Search Result");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" +e.getMessage() );	
		}
	
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
	


	protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			
			VideoDao dao = new VideoDao();
			List<Video> list =dao.findAll();
			request.setAttribute("videos", list);
			request.setAttribute("name", "List Movies ");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" +e.getMessage() );	
		}
	}


}
