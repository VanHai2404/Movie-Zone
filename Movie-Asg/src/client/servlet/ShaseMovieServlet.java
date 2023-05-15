package client.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.EmailUtils;
import commom.PageInfo;
import commom.PageType;
import commom.SessionUtils;
import dao.ShareDao;

import domain.Email;
import model.Share;
import model.User;
import model.Video;

/**
 * Servlet implementation class ShaseMovieServlet
 */
@WebServlet("/ShaseMovie")
public class ShaseMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!SessionUtils.isLogin(request)) {
			response.sendRedirect("Login");
			return;
		}
		
		
		
		String videoId =request.getParameter("videoId");
		if(videoId==null) {
			response.sendRedirect("HomeMoviePage");
			return;
		}
		request.setAttribute("videoId", videoId);
		PageInfo.formAndForword(request, response, PageType.SHASE_MOVIE_PAGE);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		try {
			
			String emailAddress=request.getParameter("email");
			String videoId=request.getParameter("videoId");
			String subject =request.getParameter("subject");
			String message =request.getParameter("message");
			
		
			if(videoId==null) {
				request.setAttribute("error", "Video Id is null !");
			}else {
				System.out.println("send email");
				Email email =new Email();
				email.setFrom("hovanhai24042003@gmail.com");
				email.setFromPassword("lnfmhmtuzrmbspof");
				email.setTo(emailAddress);
				email.setSubject("Share Favorite Video ");
				StringBuilder sb = new StringBuilder();
			         sb.append("Dear Ms./Mr.").append(emailAddress).append("<br><br>");
			        sb.append("Tôi mong bạn đang có một ngày tốt lành. Tôi muốn chia sẻ một video thú vị với bạn.<br><br>");
			        sb.append("<strong>Tiêu đề:</strong> ").append(subject).append("<br>");
			        sb.append("<strong>Tin nhắn:</strong> ").append(message).append("<br><br>");
			        sb.append("Vui lòng nhấp vào đường link sau để xem video: <a href='http://localhost:8080/Movie-Asg/HomeMoviePage/play?videoId=V02' ").append(videoId).append("'>Xem Video</a><br><br>");
			        sb.append("Trân trọng,<br>");
			        sb.append("Administrantor");
				email.setContent(sb.toString());
				EmailUtils.send(email);	
				ShareDao dao = new ShareDao();
				Share share = new Share();
				share.setEmails(emailAddress);
				share.setShareDate(new Date());
				String name =SessionUtils.getLoginUsername(request);
				System.out.println("name"+name);
				User user = new User();
				user.setUsername(name);
				share.setUser(user);
				
				Video video = new Video();
				video.setVideoId(videoId);
				System.out.println("video Id"+videoId);
				share.setVideo(video);				
				dao.insert(share);
				request.setAttribute("message", " Video send to email");	
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error :"+e.getMessage());
		}
		PageInfo.formAndForword(request, response, PageType.SHASE_MOVIE_PAGE);
		
	
	}

}
