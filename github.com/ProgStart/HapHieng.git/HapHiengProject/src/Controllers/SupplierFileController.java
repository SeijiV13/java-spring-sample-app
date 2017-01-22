package Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;


@Controller
public class SupplierFileController {
	@RequestMapping(value="/SupplierFile", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest requst){
		
		
		ModelAndView supplierFile = new ModelAndView("SupplierFile");
		
		return supplierFile;
	}
}
