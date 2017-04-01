package Mappers;
import java.util.ArrayList;

import Models.Agent;
public interface AgentMapper {
	
	public ArrayList<Agent> getAllAgents();
	public ArrayList<Agent> getFilteredAgents(String name, String description, String address);
    public void editAgentDetails(String name, String description, String address, String address2, String telephone, String cellphone, String email, String remarks);
    public void addNewAgent(String name, String description, String address, String address2, String telephone, String cellphone, String email, String remarks);
}
