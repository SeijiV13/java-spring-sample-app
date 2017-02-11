package Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class SupplierTransactionsController {

	
	
	@RequestMapping(value="/SupplierTransactions", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		
		
		ModelAndView supplierTransactions = new ModelAndView("SupplierTransactions");
	
		return supplierTransactions;
	}
}
