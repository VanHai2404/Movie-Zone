package admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import commom.PageInfo;
import commom.PageType;
import dao.UserDao;
import model.User;
import model.Video;

/**
 * Servlet implementation class UserMaaegementServlet
 */
@WebServlet({"/Adim/UserManagement","/Admin/UserManagement/create","/Admin/UserManagement/update",
	"/Admin/UserManagement/delete","/Admin/UserManagement/reset","/Admin/UserManagement/edit"})
public class UserManagementServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String url =request.getRequestURL().toString();
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
		findAll(request, response);
	  PageInfo.prepareAndForword(request, response, PageType.USER_MANAGEMENT_PAGE);
	  
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String url= request.getRequestURL().toString();
		
		if (url.contains("create")) {
			insert(request, response);
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
//	

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			UserDao dao = new UserDao();
			User oldUser =dao.findbyId(user.getUsername()); // lấy người dùng nhập từ bàn phim
		    dao.update(user);
		    request.setAttribute("message", "User update Successfully !!");
		    findAll(request, response);   
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error :" +e.getMessage());
		}
		
		 PageInfo.prepareAndForword(request, response, PageType.USER_MANAGEMENT_PAGE);
	}

	private void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("user", new User());
		findAll(request, response);
		PageInfo.prepareAndForword(request, response, PageType.USER_MANAGEMENT_PAGE);	
	}


	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String UserId = request.getParameter("UserId");
		UserDao dao =new UserDao();
		if(UserId==null) {
			request.setAttribute("message", "User Id is requset !");
			findAll(request, response);
			PageInfo.prepareAndForword(request, response, PageType.USER_MANAGEMENT_PAGE);	
			return;
		}
		    List<Video> list= dao.findVideoFavoriteUserId(UserId);
		      if(list.size() >0) {
		    	request.setAttribute("message", "User is Favarite Video Not delete !!");
			   findAll(request, response);
			   PageInfo.prepareAndForword(request, response, PageType.USER_MANAGEMENT_PAGE);	
			   return;
		   }
		try {
			dao.delete(UserId);
			request.setAttribute("message", "delete user Successfully !!");
		   findAll(request, response);
		   PageInfo.prepareAndForword(request, response, PageType.USER_MANAGEMENT_PAGE);	
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error"+e.getMessage());
		}
		
		
	}


	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String UserId =request.getParameter("UserId");
		if(UserId==null) {
			request.setAttribute("message", "User Id is request !");
			PageInfo.prepareAndForword(request, response, PageType.USER_MANAGEMENT_PAGE);
			return;
		}
		
		try {
			UserDao dao = new UserDao();
			User user =dao.findbyId(UserId);
			request.setAttribute("user", user);
			findAll(request, response);
			PageInfo.prepareAndForword(request, response, PageType.USER_MANAGEMENT_PAGE);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error : "+e.getMessage());		
		}
		
	}


	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			UserDao dao= new UserDao();
			dao.insert(user);
			request.setAttribute("message", "Insert User Successfully !!");
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error"+e.getMessage());
		}
		PageInfo.prepareAndForword(request, response, PageType.USER_MANAGEMENT_PAGE);	
	}
	
	private void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User user= new User();
			UserDao dao = new UserDao();
			List<User> list= dao.findAll();
			request.setAttribute("users", list);	
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error :"+e.getMessage());
		}
	}

}
