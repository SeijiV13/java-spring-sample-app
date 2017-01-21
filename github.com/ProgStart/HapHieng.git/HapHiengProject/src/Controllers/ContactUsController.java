package Controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class ContactUsController {

@Autowired
private JavaMailSender mailSender;
	
	@RequestMapping(value ="/ContactUs", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		

		ModelAndView contactUs = new ModelAndView("ContactUs");
		return contactUs;
	}
	
	@RequestMapping(value ="/ContactUs", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request){
		 String issues = request.getParameter("issues");
	   
		 SimpleMailMessage email = new SimpleMailMessage();
		 //email recipient
		 email.setTo("villafrancasra@gmail.com");
		 //email default title
		 email.setSubject("HapHieng System Issues");
		 //content of the email
		 email.setText(issues);
		 
		 //send Message
		 mailSender.send(email);
		 
		 //SET ACKNOWLEDGMENT PROPERTIES (IMPORTANT FOR AUDITING)
		  Date date = new Date();
		  SimpleDateFormat dateFormatter = new SimpleDateFormat("EEEE, MMMM d, yyyy");

       
	      request.setAttribute("transactionDetails", "Your message has been sent to the developers");
	      request.setAttribute("currentDate", dateFormatter.format(date));
		  return "AcknowledgementPage";
		   
		
	}
}
