package Controllers;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import Implem.CustomerImplem;
import Implem.ProductImplem;
import Implem.SupplierImplem;
import Models.Customer;
import Models.InOutTransaction;
import Models.Product;
import Models.Supplier;

@Controller
public class ItemInOutTransactionsController {
    @Autowired
    ProductImplem productImplem;
	@Autowired
	CustomerImplem customerImplem;
	@Autowired
	SupplierImplem supplierImplem;
	@RequestMapping(value="/ItemInOutTransactions", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
		//get all products
		ArrayList<Product> products = productImplem.getAllProducts();
		session.setAttribute("products", products);
		//get all item in out transactions
		ArrayList<InOutTransaction> inOutTransactions = productImplem.getAllInOutTransactions();
		session.setAttribute("inOutTransactions", inOutTransactions);
		
		//get all customers
		ArrayList<Customer> customers = customerImplem.getAllCustomers();
		session.setAttribute("customers", customers);
		//get all suppliers
		ArrayList<Supplier> suppliers = supplierImplem.getAllSuppliers();
        session.setAttribute("suppliers", suppliers);
        
		ModelAndView itemInOutTransactions = new ModelAndView("ItemInOutTransactions");
		return itemInOutTransactions;
	}
}
