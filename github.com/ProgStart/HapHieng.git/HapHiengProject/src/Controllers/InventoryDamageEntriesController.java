package Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class InventoryDamageEntriesController {
	
	@RequestMapping(value="/InventoryDamageEntries", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		
		ModelAndView InventoryDamageEntries = new ModelAndView("InventoryDamageEntries");
		
		return InventoryDamageEntries;
	}
}
