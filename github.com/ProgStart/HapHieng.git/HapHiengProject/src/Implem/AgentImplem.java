package Implem;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import Mappers.AgentMapper;
import Models.Agent;
public class AgentImplem {
  @Autowired
  private AgentMapper agentMapper;
  
  public void setAgentMapper(AgentMapper agentMapper){
	  this.agentMapper = agentMapper;
  }
  
  public ArrayList<Agent> getAllAgents(){
	  return agentMapper.getAllAgents();
  }
  
  public ArrayList<Agent> getFilteredAgents(String name, String description, String address){
	  return agentMapper.getFilteredAgents(name, description, address);
  }
  
  public void editAgentDetails(String name, String description, String address, String address2, String telephone, String cellphone, String email, String remarks){
	  //modify details of agent
	  agentMapper.editAgentDetails(name, description, address, address2, telephone, cellphone, email, remarks);
  }
  public void addNewAgent(String name, String description, String address, String address2, String telephone, String cellphone, String email, String remarks){
	  agentMapper.addNewAgent(name, description, address, address2, telephone, cellphone, email, remarks);
  }
}
