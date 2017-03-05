package Mappers;
import java.util.ArrayList;

import Models.Agent;
public interface AgentMapper {
	
	public ArrayList<Agent> getAllAgents();
	public ArrayList<Agent> getFilteredAgents(String name, String description, String address);

}
