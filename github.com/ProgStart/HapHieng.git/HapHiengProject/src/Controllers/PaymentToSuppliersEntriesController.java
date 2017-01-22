package Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class PaymentToSuppliersEntriesController {
	@RequestMapping(value="/PaymentToSuppliersEntries", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest requst){
		
		
		ModelAndView paymentToSuppliersEntries = new ModelAndView("PaymentToSuppliersEntries");
		
		return paymentToSuppliersEntries;
	}
}
