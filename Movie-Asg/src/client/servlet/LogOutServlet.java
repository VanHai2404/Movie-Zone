package client.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.CookieUtils;
import commom.SessionUtils;

/**
 * Servlet implementation class LogOutServlet
 */
@WebServlet("/LogOut")
public class LogOutServlet extends HttpServlet {
     
        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        	 CookieUtils.add("username", null, 0, response); 
        	 SessionUtils.invalidate(request);
        	 
             request.setAttribute("isLogin",false);
             ServletContext application = getServletContext();
             application.removeAttribute("Loginusername");
            request.getRequestDispatcher("/HomeMoviePage").forward(request, response);

        }

}
