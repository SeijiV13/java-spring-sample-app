package Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller

// HOME METHOD 
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		//CHECK PRINCIPAL IF SET OF USERDETAILS
		if (principal instanceof UserDetails) {
			String username = ((UserDetails) principal).getUsername();
			session.setAttribute("username", username);
		} else {
			String username = principal.toString();
			session.setAttribute("username", username);
		}
		return "home";
	}
	
	//LOGOUT METHOD
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request){
		ModelAndView model = new ModelAndView();
		//ADD MESSAGE IF LOGOUT
		model.addObject("message", "logout");
		model.setViewName("login");
		return model;
	}

 
	//LOGIN METHOD
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {

		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;

	}


}
