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
 * Servlet implementation class WatchMovieServlet
 */
@WebServlet("/WatchMovie")
public class WatchMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		Kiểm Tra 

		String id = request.getParameter("videoId");
		System.out.println("ID Details Movie :" +id);
		try {
			VideoDao dao = new VideoDao();
			Video video =dao.findbyId(id);
			request.setAttribute("video", video);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		PageInfo.clientAndForword(request, response,PageType.WATCH_MOVIE_PAGE);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

}
