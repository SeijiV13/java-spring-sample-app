package Controllers;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import Implem.AgentImplem;
import Models.Agent;

@Controller
public class AgentFileController {
	@Autowired
	private AgentImplem agentImplem;
	@Autowired
	private ServletContext servletContext;
	@RequestMapping(value = "/AgentFile", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request) {
		HttpSession session = request.getSession();

		ArrayList<Agent> agents = agentImplem.getAllAgents();
		session.setAttribute("agents", agents);
		ModelAndView agentFile = new ModelAndView("AgentFile");

		return agentFile;
	}

	@RequestMapping(value = "/AgentFileSubmit", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request) {
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String address = request.getParameter("address");

		HttpSession session = request.getSession();

		ArrayList<Agent> agents = agentImplem.getFilteredAgents("%" + name + "%", "%" + description + "%",
				"%" + address + "%");
		session.setAttribute("agents", agents);
		return "AgentFile";
	}

	@RequestMapping(value = "/AgentFileModify", method = RequestMethod.POST)
	public String onModify(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String hasError = null;
		String name = request.getParameter("agentname");
		String description = request.getParameter("description");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String telephone = request.getParameter("telephone");
		String cellphone = request.getParameter("cellphone");
		String email = request.getParameter("email");
		String remarks = request.getParameter("remarks");
		if (name == "") {
			hasError = "true";
			request.setAttribute("hasError", hasError);
		} else {
			hasError = "false";
			request.setAttribute("hasError", hasError);
			// modify details of user
			agentImplem.editAgentDetails(name, description, address, address2, telephone, cellphone, email, remarks);
			ArrayList<Agent> agents = agentImplem.getAllAgents();
			session.setAttribute("agents", agents);
		}
		return "AgentFile";

	}
	
	@RequestMapping(value = "/AgentFileInsert", method = RequestMethod.POST)
	public String onInsert(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// url where request of insert is triggered
		String requestingUrl = request.getParameter("requestingurl");
		String[] urlArray = requestingUrl.split("/");
		String url = urlArray[6].replace(".jsp", "");
	    //get details of agent
		String name = request.getParameter("agentname");
		String description = request.getParameter("description");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String telephone = request.getParameter("telephone");
		String cellphone = request.getParameter("cellphone");
		String email = request.getParameter("email");
		String remarks = request.getParameter("remarks");
		
		//apply insert on agent
		agentImplem.addNewAgent(name, description, address, address2, telephone, cellphone, email, remarks);
		request.setAttribute("insertSuccess", "true");
		//restart list of agents
		
		
		//restart applicationScope agents
        ArrayList<Agent> agents = agentImplem.getAllAgents(); 
        servletContext.setAttribute("agents", agents);
        session.setAttribute("agents", agents);
		return url;
	}
	
}
