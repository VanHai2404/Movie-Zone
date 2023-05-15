package client.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import commom.PageInfo;
import commom.PageType;
import commom.SessionUtils;
import dao.VideoDao;
import model.Video;

/**
 * Servlet implementation class HomeMovieServlet
 */
@WebServlet({"/HomeMoviePage","/HomeMoviePage/play"})
public class HomeMovieServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
//		
		try {
		
			VideoDao dao = new VideoDao();
			List<Video> list =dao.findAll();
			request.setAttribute("videos", list);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" +e.getMessage() );	
		}
		String url = request.getRequestURL().toString();
		if(url.contains("play")) {
			playdetails(request, response);
			return;
		}
		Top6views(request, response);
		
		
		
		PageInfo.clientAndForword(request, response,PageType.HOME_MOVIE_PAGE);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username =SessionUtils.getLoginUsername(request);
		if(username!=null) {		
			HttpSession session = request.getSession();
	    	ServletContext application = session.getServletContext();
	    	char firstChar  =username.charAt(0);
	    	String Loginusername = Character.toString(firstChar).toUpperCase();	    	
	    	application.setAttribute("Loginusername", Loginusername);
	        System.out.println("H"+Loginusername);

		}
       doGet(request, response);
		
		
	}
	
	protected void playdetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String videoId =request.getParameter("videoId");
		System.out.println("ID : " +videoId);
		
		try {
			VideoDao dao = new VideoDao();
			Video video = dao.findbyId(videoId);
			request.setAttribute("video", video);
			request.getRequestDispatcher("/DetailsMovie").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error"+e.getMessage());
			PageInfo.clientAndForword(request, response,PageType.HOME_MOVIE_PAGE);
		}		
	}
	
	protected void Top6views(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		try {
			VideoDao dao = new VideoDao();
			List<Video> list =dao.Top6Views();
			Video vid =list.get(0);
			request.setAttribute("Topvideo", vid);
			request.setAttribute("Topvideos", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error"+e.getMessage());
			PageInfo.clientAndForword(request, response,PageType.HOME_MOVIE_PAGE);
		}		
	}
	
	

}
