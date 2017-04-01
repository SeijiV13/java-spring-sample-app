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
public class SupplierTransactionsController {

	@Autowired
	SupplierImplem supplierImplem;
	
	
	@RequestMapping(value="/SupplierTransactions", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
	    HttpSession session = request.getSession();
		ArrayList<Supplier> suppliers = supplierImplem.getAllSuppliers();
		session.setAttribute("suppliers", suppliers);
	
		ModelAndView supplierTransactions = new ModelAndView("SupplierTransactions");
	
		return supplierTransactions;
	}
}
