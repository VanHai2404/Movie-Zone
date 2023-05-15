package admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.FavoriteReport;
import domain.FavoriteUserReport;
import model.Video;
import commom.PageInfo;
import commom.PageType;
import dao.FavoriteDao;
import dao.VideoDao;


/**
 * Servlet implementation class ReportsManagementServlet
 */
@WebServlet("/ReportsManagement")
public class ReportsManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 findCoutVideo(request, response);
		 findFavoriteUserByVideo(request, response);
		 
		PageInfo.prepareAndForword(request, response, PageType.REPORTS_MANAGEMENT_PAGE);
		

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}
	
	protected void findCoutVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
		try {
			FavoriteDao dao = new FavoriteDao();
			List<FavoriteReport> list = dao.findCountVideo();
			request.setAttribute("favList", list);
		} catch (Exception e) {
			request.setAttribute("error", "Error"+e.getMessage());
			
		}
	}
	
	
	protected void findFavoriteUserByVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		try {
			String videoUserId =request.getParameter("videoUserId"); // input
			System.out.println("videoUserId : " +videoUserId);
			
			VideoDao vdao = new VideoDao();
			List<Video> vList=vdao.findAll();
		   
			
			if(videoUserId==null && vList.size()>0) {
				videoUserId =vList.get(0).getVideoId();	
			}
	
			
			FavoriteDao dao = new FavoriteDao();
			List<FavoriteUserReport> list = dao.reporFavoriteUserByVideo(videoUserId);

			request.setAttribute("videoUserId", videoUserId);
			request.setAttribute("vidList", vList);
			
			request.setAttribute("favUsers", list);
			
		} catch (Exception e) {
			request.setAttribute("error", "Error"+e.getMessage());
			
		}
	
		
	}
   

}
