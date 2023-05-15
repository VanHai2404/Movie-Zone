package client.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.PageInfo;
import commom.PageType;

/**
 * Servlet implementation class DetailsMovieServlet
 */
@WebServlet("/DetailsMovie")
public class DetailsMovieServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PageInfo.clientAndForword(request, response, PageType.DETAILS_MOVIE_PAGE);
		String id = request.getParameter("videoId");
		System.out.println("ID Details Movie :" +id);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String id = request.getParameter("videoId");
		System.out.println("ID Details Movie Post :" +id);
	
	}

}
