package Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class CollectionFromCustomersEntriesController {
	@RequestMapping(value="/CollectionFromCustomersEntries", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest requst){
		
		
		ModelAndView collectionFromCustomersEntries = new ModelAndView("CollectionFromCustomersEntries");
		
		return collectionFromCustomersEntries;
	}
}
