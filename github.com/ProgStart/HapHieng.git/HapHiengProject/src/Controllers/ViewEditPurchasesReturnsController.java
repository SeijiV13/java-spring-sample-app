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
import Models.Purchases;
import Models.Supplier;

@Controller
public class ViewEditPurchasesReturnsController {

	@Autowired
	SupplierImplem supplierImplem;

	@RequestMapping(value = "/ViewEditPurchasesReturns", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// get all suppliers
		ArrayList<Supplier> suppliers = supplierImplem.getAllSuppliers();
		session.setAttribute("suppliers", suppliers);
        
		//get all suppliers purchase returns
		ArrayList<Purchases> purchases = supplierImplem.getAllSupplierPurchasesReturns();
		session.setAttribute("purchases", purchases);
		ModelAndView viewEditPurchasesReturns = new ModelAndView("ViewEditPurchasesReturns");

		return viewEditPurchasesReturns;

	}

	@RequestMapping(value = "/ViewEditPurchasesReturnsSubmit", method = RequestMethod.POST)
	public String onSearch(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String supplier_code = request.getParameter("supplier");
		String reference_no = request.getParameter("refno");
		
		// get all suppliers
		ArrayList<Supplier> suppliers = supplierImplem.getAllSuppliers();
		session.setAttribute("suppliers", suppliers);
        
		//get filtered suppliers purchase returns
		ArrayList<Purchases> purchases = supplierImplem.getFilteredSupplierPurchasesReturns(supplier_code, reference_no);
		session.setAttribute("purchases", purchases);
		
		return "ViewEditPurchasesReturns";

	}
}
