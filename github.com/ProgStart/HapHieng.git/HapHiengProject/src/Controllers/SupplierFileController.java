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
import Models.Customer;
import Models.Supplier;
import Models.SupplierPriceList;

@Controller
public class SupplierFileController {
	@Autowired
	private SupplierImplem supplierImplem;
	@RequestMapping(value="/SupplierFile", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
			
		ArrayList<Supplier> suppliers = supplierImplem.getAllSuppliers();
		ArrayList<SupplierPriceList> supplierPriceList = supplierImplem.getSupplierPriceList();
		session.setAttribute("supplierPriceList", supplierPriceList);
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
		ArrayList<SupplierPriceList> supplierPriceList = supplierImplem.getSupplierPriceList();
		session.setAttribute("supplierPriceList", supplierPriceList);
		session.setAttribute("suppliers", suppliers);
		return "SupplierFile";
	}
	
	@RequestMapping(value="/SupplierFileModify", method=RequestMethod.POST)
	public String onModify(HttpServletRequest request){
		HttpSession session = request.getSession();
		String hasError = null;
	    String supplier_code = request.getParameter("suppliercode");
	    String description = request.getParameter("description");
	    String address = request.getParameter("address");
	    String address2 = request.getParameter("address2");
	    String telephone = request.getParameter("telephone");
	    String fax = request.getParameter("fax");
	    String email = request.getParameter("email");
	    String terms = request.getParameter("terms");
	    String initial_balance = request.getParameter("initialbalance");
	    String remaining = request.getParameter("remaining");
		 
	  //update chosen supplier
	  		if(supplier_code == ""){
	  			hasError = "true";
	  			request.setAttribute("hasError", hasError);
	  		}else{
	  			hasError="false";
	  			request.setAttribute("hasError", hasError);
	  			supplierImplem.editSupplierDetails(supplier_code, description, address, address2, telephone, fax, email, terms, initial_balance, remaining);
	  			ArrayList<Supplier> suppliers = supplierImplem.getAllSuppliers();
	  			ArrayList<SupplierPriceList> supplierPriceList = supplierImplem.getSupplierPriceList();
	  			session.setAttribute("supplierPriceList", supplierPriceList);
	  			session.setAttribute("suppliers", suppliers);
	  		}
		return "SupplierFile";
	}
	
	@RequestMapping(value="/SupplierFileInsert", method=RequestMethod.POST)
	public String onInsert(HttpServletRequest request){
		HttpSession session = request.getSession();
		// url where request of insert is triggered
		String requestingUrl = request.getParameter("requestingurl");
		String[] urlArray = requestingUrl.split("/");
		String url = urlArray[6].replace(".jsp", "");
		
		//get details of supplier
	    String supplier_code = request.getParameter("suppliercode");
	    String description = request.getParameter("description");
	    String address = request.getParameter("address");
	    String address2 = request.getParameter("address2");
	    String telephone = request.getParameter("telephone");
	    String fax = request.getParameter("fax");
	    String email = request.getParameter("email");
	    String terms = request.getParameter("terms");
	    String initial_balance = request.getParameter("initialbalance");
	    String remaining = request.getParameter("remaining");
        
	    request.setAttribute("insertSuccess", "true");
	    //apply insert on supplier
		supplierImplem.addNewSupplier(supplier_code, description, address, address2, telephone, fax, email, terms, initial_balance, remaining);
		
		//get new list of suppliers
		ArrayList<Supplier> suppliers = supplierImplem.getAllSuppliers();
		ArrayList<SupplierPriceList> supplierPriceList = supplierImplem.getSupplierPriceList();
		session.setAttribute("supplierPriceList", supplierPriceList);
		session.setAttribute("suppliers", suppliers);
		return url;
		
	}
}
