package Controllers;
import Implem.CustomerImplem;
import Models.Customer;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;



@Controller
public class CustomerTransactionsController {
	@Autowired
	CustomerImplem customerImplem;

	@RequestMapping(value="/CustomerTransactions", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		ArrayList<Customer> customers = customerImplem.getAllCustomers();
		session.setAttribute("customers", customers);
	
		ModelAndView customerTransactions = new ModelAndView("CustomerTransactions");
		return customerTransactions;
	}
	
	@RequestMapping(value="/CustomerTransactionsSubmit", method=RequestMethod.POST)
	public String onSubmit(HttpServletRequest request){
		String customer_code = request.getParameter("customercode");
		
        //get filtered customer transactions

		HttpSession session = request.getSession();
		
		
		return "CustomerTransactions";
	}
}
