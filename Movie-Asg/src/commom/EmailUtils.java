package commom;

import java.util.Properties;

import domain.Email;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailUtils {
	
	
	
	public static void send(Email email) throws Exception {
		Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");		
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props,new Authenticator()
        		 
        {
        	  protected PasswordAuthentication getPasswordAuthentication() {
	 	         return new PasswordAuthentication(email.getFrom(),email.getFromPassword()); 
        }
    });
        
        try {
   
          MimeMessage message = new MimeMessage(session);
          message.setFrom(new InternetAddress(email.getFrom()));
          message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.getTo()));
          message.setSubject(email.getSubject());
          message.setText(email.getContent() ,"utf-8");
          message.setHeader("Content-Type", "text/html; charset=UTF-8");
          /* Transport class is used to deliver the message to the recipients */
          Transport.send(message);
      }
      catch(Exception e) {
  	     e.printStackTrace();
  	     throw e;
      }

	}

}
