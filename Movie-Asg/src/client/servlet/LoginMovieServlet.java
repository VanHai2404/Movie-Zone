package client.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import commom.CookieUtils;
import commom.PageInfo;
import commom.PageType;
import commom.SessionUtils;
import dao.UserDao;
import domain.LoginForm;
import model.User;

@WebServlet("/Login")
public class LoginMovieServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=CookieUtils.get("username", request);
		System.out.println("username cookie :" +username);
		if(username==null) {
			PageInfo.formAndForword(request, response, PageType.LOGIN_MOVIE_PAGE);		
			return;
		}
			SessionUtils.add(request, "username", username);
			request.getRequestDispatcher("/HomeMoviePage").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		try {
			LoginForm form = new LoginForm();
			BeanUtils.populate(form, request.getParameterMap());
			UserDao dao = new UserDao();
			User user =dao.findbyId(form.getUsername());
			System.out.println("form get Username  :" +form.getUsername());
			if(user !=null && user.getPassword().equals(form.getPassword())) {
				SessionUtils.add(request,"username", user.getUsername());
				SessionUtils.add(request,"admin", user.getAdmin());
				if(form.isRemember()) {
					CookieUtils.add("username",form.getUsername(), 24, response);
				}else {
					CookieUtils.add("username",form.getUsername(), 0, response);
				}
				
				if (user.getAdmin()) {
					request.getRequestDispatcher("/Adim/HomeDashboard").forward(request, response);
                     
				}else {
					request.setAttribute("isLogin", true);
					request.setAttribute("name", user.getFullname());
					request.getRequestDispatcher("/HomeMoviePage").forward(request, response);
					System.out.println("doPost Login : ");
					return;					
				}
			
			}
			request.setAttribute("error", "Invalid username or password");
			
			
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}
		
		PageInfo.formAndForword(request, response, PageType.LOGIN_MOVIE_PAGE);
		
	}

}
