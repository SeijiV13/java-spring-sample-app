package Controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import Implem.UserImplem;

@Controller
public class ChangePasswordController {
    @Autowired                
	private UserImplem userImplem;
	@RequestMapping(value = "/ChangePassword", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){

		ModelAndView changePassword = new ModelAndView("ChangePassword");
		return changePassword;
		
	}
	
	@RequestMapping(value ="/ChangePasswordSubmit", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request){
		  
		   String username = (String)request.getSession().getAttribute("username");
		   String oldpassword = request.getParameter("oldpassword");
		   String newpassword = request.getParameter("newpassword");
		   //CHECK IF SAME PASSWORD
		   //ADDED BY SAV 2016/11/26
		   if(oldpassword.equals(newpassword)){
			   request.setAttribute("errorMessage", "samePassword");
			   return "ChangePassword";
		   }
		   
		   //CHECK OLD PASSWORD IF CORRECT
		   boolean match = userImplem.checkPasswordValidity(username, oldpassword);
		   if(!match){
			  request.setAttribute("errorMessage", "oldPasswordIncorrect");   
		      //Name of Page
			  return "ChangePassword";
		   }
		   //PASSWORD VALIDITY CHECK (CHANGE PASSWORD METHOD CALL)
		   userImplem.changePassword(newpassword, username);
		   
		   //SET ACKNOWLEDGMENT PROPERTIES (IMPORTANT FOR AUDITING)
		   Date date = new Date();
		   SimpleDateFormat dateFormatter = new SimpleDateFormat("EEEE, MMMM d, yyyy");

         
	       request.setAttribute("transactionDetails", "Changing of password Successful");
	       request.setAttribute("currentDate", dateFormatter.format(date));
		   return "AcknowledgementPage";
		
	}
	
}
