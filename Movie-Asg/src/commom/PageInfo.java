package commom;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageInfo {
//	định nghĩa danh sách các địa chỉ sẽ thức hiện vào trang layout.jsp
	public static Map<PageType, PageInfo> pageRoute= new HashMap();
	// sử dụng phường thực tính
	static {
		pageRoute.put(PageType.USER_MANAGEMENT_PAGE, new PageInfo("User Admin Management", "/admin/users/user-management.jsp",null));
		pageRoute.put(PageType.HOME_MANAGEMENT_PAGE, new PageInfo("Home Admin Management", "/admin/reprorts/Home-dashboard.jsp",null));

		                                                      // title                 // contentUrl          
		pageRoute.put(PageType.VIDEO_MANAGEMENT_PAGE, new PageInfo("Video Admin Management", "/admin/videos/video-management.jsp",null));
		pageRoute.put(PageType.REPORTS_MANAGEMENT_PAGE, new PageInfo("Reports Admin Management", "/admin/reprorts/reports-management.jsp",null));

		
		
		
		pageRoute.put(PageType.HOME_MOVIE_PAGE, new PageInfo("Home Movie Page", "/client/videos/home.jsp",null));
		pageRoute.put(PageType.DETAILS_MOVIE_PAGE, new PageInfo("Detail Movie Page", "/client/videos/movie-details.jsp",null));
		pageRoute.put(PageType.WATCH_MOVIE_PAGE, new PageInfo("Watch Movie Page", "/client/videos/watch-movie.jsp",null));
		pageRoute.put(PageType.LIST_MOVIE_PAGE, new PageInfo("List Movie Page", "/client/videos/listMovies.jsp",null));

		
		
		pageRoute.put(PageType.LOGIN_MOVIE_PAGE, new PageInfo("Login Movie Page", "/client/users/login.jsp",null));
		pageRoute.put(PageType.SHASE_MOVIE_PAGE, new PageInfo("Shase Movie Page", "/client/users/shase.jsp",null));
		pageRoute.put(PageType.SIGN_UP_MOVIE_PAGE, new PageInfo("Sign-up Movie Page", "/client/users/sign-up.jsp",null));
		pageRoute.put(PageType.EDIT_PROFILE_PAGE, new PageInfo("Edit Profile Movie Page", "/client/users/edit-profile.jsp",null));
		pageRoute.put(PageType.FORGOT_PASSWORD_MOVIE_PAGE, new PageInfo("Forgot-Password Movie Page", "/client/users/forgot-password.jsp",null));
		pageRoute.put(PageType.CHANGE_PASSWORD_PAGE, new PageInfo("Change Password Movie Page", "/client/users/changePassword.jsp",null));
		
		
	}
// phường thức chuyển nội dung cho trang layout kém theo page
	public static void prepareAndForword( HttpServletRequest request,HttpServletResponse response,PageType pageType) throws ServletException, IOException {
		PageInfo info =pageRoute.get(pageType);
		request.setAttribute("page", info);
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
		}
	
	
	// phường thức chuyển nội dung cho trang layout kém theo page
		public static void clientAndForword( HttpServletRequest request,HttpServletResponse response,PageType pageType) throws ServletException, IOException {
			PageInfo info =pageRoute.get(pageType);
			request.setAttribute("page", info);
			request.getRequestDispatcher("/client/layoutClient.jsp").forward(request, response);
		}
		public static void formAndForword( HttpServletRequest request,HttpServletResponse response,PageType pageType) throws ServletException, IOException {
			PageInfo info =pageRoute.get(pageType);
			request.setAttribute("page", info);
			request.getRequestDispatcher("/client/users/formMain.jsp").forward(request, response);
			
			}
//	
	private String title;
	private String contentUrl;
	private String scriptUrl;
	
	public PageInfo(String title, String contentUrl, String scriptUrl) {
		super();
		this.title = title;
		this.contentUrl = contentUrl;
		this.scriptUrl = scriptUrl;
	}
	
	public static Map<PageType, PageInfo> getPageRoute() {
		return pageRoute;
	}
	public static void setPageRoute(Map<PageType, PageInfo> pageRoute) {
		PageInfo.pageRoute = pageRoute;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentUrl() {
		return contentUrl;
	}
	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}
	public String getScriptUrl() {
		return scriptUrl;
	}
	public void setScriptUrl(String scriptUrl) {
		this.scriptUrl = scriptUrl;
	}
		

}
