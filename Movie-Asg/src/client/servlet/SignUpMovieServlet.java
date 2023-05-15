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
import dao.UserDao;
import model.User;

/**
 * Servlet implementation class SignUpMovieServlet
 */
@WebServlet("/SignUpMovie")
public class SignUpMovieServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PageInfo.formAndForword(request, response,PageType.SIGN_UP_MOVIE_PAGE);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		User user = new User();
		try {
			
			BeanUtils.populate(user, request.getParameterMap());
			UserDao dao = new UserDao();
			dao.insert(user);
			request.setAttribute("user", new User());
			request.getRequestDispatcher("/Login").forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
	    
		PageInfo.formAndForword(request, response,PageType.SIGN_UP_MOVIE_PAGE);

		
		
	}

}
