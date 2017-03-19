package Controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;

import Implem.CustomerImplem;
import Models.Customer;
import Models.Supplier;

@Controller
public class CustomerBankFileController {
	@Autowired
	private CustomerImplem customerImplem ;
	@RequestMapping(value="/CustomerBankFile", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
		ArrayList<Customer> customers = customerImplem.getAllCustomersWithBankFile();
		
		session.setAttribute("customers", customers);
		ModelAndView customerBankFile = new ModelAndView("CustomerBankFile");
		
		return customerBankFile;
	}
	
	
	@RequestMapping(value="/CustomerBankFileSubmit", method=RequestMethod.POST)
	public String onSubmit(HttpServletRequest request, @RequestParam String customercode){
		System.out.print(customercode);
		HttpSession session = request.getSession();
		ArrayList<Customer> customers = customerImplem.getAllCustomers();
			
		return "CustomerBankFile";
	}
	
	@RequestMapping(value="/CustomerBankFileModify", method=RequestMethod.POST)
	public String onModify(HttpServletRequest request){
		HttpSession session = request.getSession();
		String hasError = null;
		String customer_code = request.getParameter("customercode");
		String account_no = request.getParameter("accountnumber");
		String account_name = request.getParameter("accountname");
		String bank = request.getParameter("bank");
		String branch = request.getParameter("branch");
		String status = request.getParameter("status");
		String bank_remarks = request.getParameter("remarks");
		
		  //update bank file of chosen customer
  		if(customer_code == ""){
  			hasError = "true";
  			request.setAttribute("hasError", hasError);
  		}else{
  			hasError="false";
  			request.setAttribute("hasError", hasError);
  			customerImplem.editCustomerBankDetails(customer_code, account_no, account_name, bank, branch, status, bank_remarks);
  			ArrayList<Customer> customers = customerImplem.getAllCustomersWithBankFile();
  			
  			session.setAttribute("customers", customers);
  		}
		return "CustomerBankFile";
		
		
	}
}
	

