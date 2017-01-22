package Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class ErrorHandlerController {

	
	@RequestMapping(value="/PageNotFoundError", method = RequestMethod.GET)
	public ModelAndView redirectToPageNotFound(HttpServletRequest request){
		
		ModelAndView pageNotFoundError = new ModelAndView("PageNotFoundError");
		return pageNotFoundError;
	}
	
	
	@RequestMapping(value="/SessionExpiredError", method  =RequestMethod.GET)
	public ModelAndView redirectToSessionExpired(HttpServletRequest request){
		
		ModelAndView sessionExpiredError = new ModelAndView("SessionExpiredError");
		
		return sessionExpiredError;
	}
}
