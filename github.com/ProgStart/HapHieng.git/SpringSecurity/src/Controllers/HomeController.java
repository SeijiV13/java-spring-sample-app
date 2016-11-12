package Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/" , method = RequestMethod.GET)
	public String defaultPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
		String username = ((UserDetails)principal).getUsername();
		 session.setAttribute("username", username);
		} else {
		String username = principal.toString();
		 session.setAttribute("username", username);
		}
		

	    return "home";

	}
	
	@RequestMapping(value="/about", method=RequestMethod.GET)
	public String about(){
		return "about";
	}
	
	@RequestMapping(value="/logout", method  =RequestMethod.GET)
	public String logout(){
		return "logout";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {
		
	  ModelAndView model = new ModelAndView();
	  if (error != null) {
		
		model.addObject("error", "Invalid username and password!");
	  }

	  if (logout != null) {
		model.addObject("msg", "You've been logged out successfully.");
	  }
	  model.setViewName("login");

	  return model;

	}
	

}
