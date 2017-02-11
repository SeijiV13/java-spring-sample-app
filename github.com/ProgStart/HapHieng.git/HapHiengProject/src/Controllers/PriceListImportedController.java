package Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class PriceListImportedController {
	
	
	@RequestMapping(value="/PriceListImported", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		
		ModelAndView priceListImported = new ModelAndView("PriceListImported");
		
		return priceListImported;
		
	}

}
