package Controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import Models.Customer;

@Controller
public class TransferingStockEntriesController {
	@RequestMapping(value="/TransferingStockEntries", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
	
	
		ModelAndView transferringStockEntries = new ModelAndView("TransferingStockEntries");
		
		return transferringStockEntries;
	}
}
