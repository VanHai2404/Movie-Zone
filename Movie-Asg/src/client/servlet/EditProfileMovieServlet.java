package client.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import commom.PageInfo;
import commom.PageType;
import commom.SessionUtils;
import dao.UserDao;
import model.User;

/**
 * Servlet implementation class EditProfileMovieServlet
 */
@WebServlet("/EditProfile")
public class EditProfileMovieServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     
		String username=SessionUtils.getLoginUsername(request);
		if(username==null) {
			request.getRequestDispatcher("/Login").forward(request, response);
			return;
		}
		try {
			UserDao dao = new UserDao();
			User user =dao.findbyId(username);
			request.setAttribute("user", user);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		
		
		PageInfo.formAndForword(request, response, PageType.EDIT_PROFILE_PAGE);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			
		String username=SessionUtils.getLoginUsername(request);
			UserDao dao = new UserDao();
			User oldUser =dao.findbyId(username);
			user.setAdmin(oldUser.getAdmin());
			dao.update(user);

			request.setAttribute("message", "User profile Update !!");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			
		}
		PageInfo.formAndForword(request, response, PageType.EDIT_PROFILE_PAGE);

	}

}
