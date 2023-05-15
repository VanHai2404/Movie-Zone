package Listener;


import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionEvent;

/**
 * Application Lifecycle Listener implementation class AppListener
 *
 */
@WebListener
public class AppListener implements  ServletContextListener, ServletContextAttributeListener {

    public void attributeAdded(HttpSessionEvent scae)  { 
    	HttpSession session = scae.getSession();
    	ServletContext application = session.getServletContext();
    	Integer visitors = (Integer) application.getAttribute("visitors");
    	application.setAttribute("visitors", visitors + 1);
        
    }

	
    public void attributeRemoved(HttpSessionEvent scae)  { 
         
    }

	
    public void sessionDidActivate(HttpSessionEvent se)  { 
     
    }


    public void contextDestroyed(ServletContextEvent sce)  { 
    
    }


    public void sessionWillPassivate(HttpSessionEvent se)  { 
        
    }


  
    public void contextInitialized(ServletContextEvent sce)  { 
         
    }
	
}
