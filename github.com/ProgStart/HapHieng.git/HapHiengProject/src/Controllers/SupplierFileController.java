package Controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import Implem.SupplierImplem;
import Models.Supplier;

@Controller
public class SupplierFileController {
	@Autowired
	private SupplierImplem supplierImplem;
	@RequestMapping(value="/SupplierFile", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
			
		ArrayList<Supplier> suppliers = supplierImplem.getAllSuppliers();	
		session.setAttribute("suppliers", suppliers);
		ModelAndView supplierFile = new ModelAndView("SupplierFile");
		return supplierFile;
	}
	
	@RequestMapping(value="/SupplierFileSubmit", method=RequestMethod.POST)
	public String onSubmit(HttpServletRequest request){
		HttpSession session = request.getSession();
		String supplier_code = request.getParameter("supplier_code");
		String description = request.getParameter("description");
		
		ArrayList<Supplier> suppliers = supplierImplem.getFilteredSuppliers(supplier_code, description);
		session.setAttribute("suppliers", suppliers);
		return "SupplierFile";
	}
}
