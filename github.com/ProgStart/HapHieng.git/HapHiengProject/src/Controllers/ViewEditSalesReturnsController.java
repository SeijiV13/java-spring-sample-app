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
import Models.Customer;
import Models.Sales;

@Controller
public class ViewEditSalesReturnsController {

	@Autowired
	CustomerImplem customerImplem;
	
	@RequestMapping(value = "/ViewEditSalesReturns", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		//get all customers
		ArrayList<Customer> customers = customerImplem.getAllCustomers();
		session.setAttribute("customers", customers);
		//get all sales returns
		ArrayList<Sales> sales = customerImplem.getAllCustomerSalesReturns();
		session.setAttribute("sales", sales);
		ModelAndView viewEditSalesReturns = new ModelAndView("ViewEditSalesReturns");
		
		return viewEditSalesReturns;
	}
	
	@RequestMapping(value = "/ViewEditSalesReturnsSubmit", method = RequestMethod.POST)
	public String onSearch(HttpServletRequest request){
		HttpSession session = request.getSession();
		String customer_code = request.getParameter("customer");
		String sr_no = request.getParameter("srno");
		
		//get all customers
		ArrayList<Customer> customers = customerImplem.getAllCustomers();
		session.setAttribute("customers", customers);
		
		//get filtered sales returns
		ArrayList<Sales> sales = customerImplem.getFilteredCustomerSalesReturns(customer_code, sr_no);
		session.setAttribute("sales", sales);
		
		return "ViewEditSalesReturns";
	}
}
