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
public class ViewEditPurchasesController {
    @Autowired
    SupplierImplem supplierImplem;
	@RequestMapping(value ="/ViewEditPurchases", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		ModelAndView viewEditPurchases = new ModelAndView("ViewEditPurchases");
		//get all suppliers
		ArrayList<Supplier> suppliers = supplierImplem.getAllSuppliers();
		session.setAttribute("suppliers", suppliers);
		
		//get all purchases returns
		ArrayList<Purchases> purchases = supplierImplem.getAllSupplierPurchases();
		session.setAttribute("purchases", purchases);
		return viewEditPurchases;
	}
	@RequestMapping(value ="/ViewEditPurchasesSubmit", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request){
		HttpSession session = request.getSession();
		String supplier_code = request.getParameter("supplier");
		String reference_no = request.getParameter("refno");

		//get all suppliers
		ArrayList<Supplier> suppliers = supplierImplem.getAllSuppliers();
		session.setAttribute("suppliers", suppliers);
		
		//get all purchases returns
		ArrayList<Purchases> purchases = supplierImplem.getFilteredSupplierPurchases(supplier_code, reference_no);
		session.setAttribute("purchases", purchases);
		return "ViewEditPurchases";
	}
}
