package client.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.EmailUtils;
import commom.PageInfo;
import commom.PageType;
import dao.UserDao;
import domain.Email;
import model.User;


@WebServlet("/ForPasswordMovie")
public class ForPasswordMovieServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PageInfo.formAndForword(request, response, PageType.FORGOT_PASSWORD_MOVIE_PAGE);	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			
			String emailAddress=request.getParameter("email");
			String username=request.getParameter("username");
			System.out.println("email :" +emailAddress);
			System.out.println("username :" +username);
			UserDao dao =new UserDao();
			User user = dao.findByIdAndEmail(username, emailAddress);
			if(user==null) {
				request.setAttribute("error", "Username or email are incorrect");
			}else {
				System.out.println("send email");
				Email email =new Email();
				email.setFrom("hovanhai24042003@gmail.com");
				email.setFromPassword("lnfmhmtuzrmbspof");
				email.setTo(emailAddress);
				email.setSubject("Forgot Password Function");
				StringBuilder sb = new StringBuilder();
				sb.append("Dear").append(username).append("<br>");
				sb.append("You are used the forgot password function .<br>");
				sb.append("Your Password is :  <b>").append(user.getPassword());
				email.setContent(sb.toString());
				EmailUtils.send(email);			
				request.setAttribute("message", "Email send to the email Address , Please check and your password");	
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error :"+e.getMessage());
		}
		PageInfo.formAndForword(request, response, PageType.FORGOT_PASSWORD_MOVIE_PAGE);
		
	}

}
