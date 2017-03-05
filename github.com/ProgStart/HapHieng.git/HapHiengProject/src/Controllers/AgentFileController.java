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
import Models.Agent;

@Controller
public class AgentFileController {
	@Autowired
	private AgentImplem agentImplem;

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

		ArrayList<Agent> agents = agentImplem.getFilteredAgents("%"+name+"%", "%"+description+"%", "%"+address+"%");
		session.setAttribute("agents", agents);
		return "AgentFile";
	}
}
