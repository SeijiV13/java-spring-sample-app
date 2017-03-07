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

@Controller
public class CustomerBankFileController {
	@Autowired
	private CustomerImplem customerImplem ;
	@RequestMapping(value="/CustomerBankFile", method=RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
		ArrayList<Customer> customers = customerImplem.getAllCustomers();
		
		session.setAttribute("customers", customers);
		ModelAndView customerBankFile = new ModelAndView("CustomerBankFile");
		
		return customerBankFile;
	}
}
