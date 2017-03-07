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
		  ArrayList<Agent> agents = agentImplem.getAllAgents(); 
		  
		  session.setAttribute("customers", customers);
		  session.setAttribute("agents", agents);
		  return "CustomerFile";
	}
}
