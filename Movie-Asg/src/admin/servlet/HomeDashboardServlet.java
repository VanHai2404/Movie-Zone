package admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.PageInfo;
import commom.PageType;
import dao.UserDao;
import dao.VideoDao;
import model.Video;

/**
 * Servlet implementation class HomeDashboardServlet
 */
@WebServlet("/Adim/HomeDashboard")
public class HomeDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try {
			
			UserDao dao = new UserDao();
		  request.setAttribute("Total_user", dao.getTotalUser());
		  request.setAttribute("Tolat_video", dao.getTotalMovie());
		  request.setAttribute("Tolat_views", dao.getTotalViews());	
		  
		  
		  VideoDao  dao2 = new VideoDao();
		  List<Video> list = dao2.findAllFavoriteVideos();
		  request.setAttribute("videos", list);
	
		} catch (Exception e) {
			e.printStackTrace();
		}

		  PageInfo.prepareAndForword(request, response, PageType.HOME_MANAGEMENT_PAGE);
		  
		  
		  
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
