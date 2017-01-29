package Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class ViewEditCounterReceiptsController {
	
	@RequestMapping(value ="/ViewEditCounterReceipts", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		
		ModelAndView viewEditCounterReceipts = new ModelAndView("ViewEditCounterReceipts");
		
		return viewEditCounterReceipts;
	}
}
