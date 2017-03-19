package Controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import Implem.AgentImplem;
import Implem.CustomerImplem;
import Models.Customer;
import Models.PriceList;
import Models.Agent;

@Controller
public class CustomerFileController {

	@Autowired
	private CustomerImplem customerImplem;
	@Autowired
	private AgentImplem agentImplem;

	@RequestMapping(value = "/CustomerFile", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request) {

		HttpSession session = request.getSession();
		// get al customers in the table
		ArrayList<Customer> customers = customerImplem.getAllCustomers();
		session.setAttribute("customers", customers);

		
		//get all price list
		ArrayList<PriceList> priceList = customerImplem.getCustomerPriceList();
		session.setAttribute("priceList", priceList);
        
		ModelAndView CustomerFile = new ModelAndView("CustomerFile");
		return CustomerFile;
	}

	@RequestMapping(value = "/CustomerFileSubmit", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request) {
          HttpSession session = request.getSession();
		  String customer_code = request.getParameter("customer_code");
		  String description = request.getParameter("description");
		  String agent = request.getParameter("agent");
		  
		  
		  ArrayList<Customer> customers = customerImplem.getFilteredCustomers(customer_code, description, agent);
          
		  
		  session.setAttribute("customers", customers);
		  
		  
		  return "CustomerFile";
	}
	
	@RequestMapping(value="/CustomerFileModify", method=RequestMethod.POST)
	public String onModify(HttpServletRequest request){
		HttpSession session = request.getSession();
		String hasError = null;
		String customer_code = request.getParameter("customercode");
		String description = request.getParameter("description");
		String agent = request.getParameter("agent");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String telephone = request.getParameter("telephone");
		String resident_phone = request.getParameter("residentphone");
		String fax = request.getParameter("fax");
		String cellphone = request.getParameter("cellphone");
		String terms = request.getParameter("terms");
		String tin_number = request.getParameter("tin");
		String contact_person = request.getParameter("contactperson");
		String email = request.getParameter("email");
		String credit_limit = request.getParameter("creditlimit");
		String initial_balance = request.getParameter("initialbalance");
		String remaining = request.getParameter("remainingbalance");
		String customer_type = request.getParameter("optradio");
		String remarks = request.getParameter("remarks");
		//update chosen customer
		if(customer_code == ""){
			hasError = "true";
			request.setAttribute("hasError", hasError);
		}else{
			hasError="false";
			request.setAttribute("hasError", hasError);
			customerImplem.editCustomerDetails(customer_code, description, agent, address, address2, telephone, resident_phone, fax, cellphone, terms, tin_number, contact_person, email, credit_limit, initial_balance, remaining, customer_type, remarks);
			
			ArrayList<Customer> customers = customerImplem.getAllCustomers();
			session.setAttribute("customers", customers);
		}
		return "CustomerFile";
		
		
	}
}
