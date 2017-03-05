package Implem;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import Mappers.CustomerMapper;
import Models.Customer;

public class CustomerImplem {
   
	@Autowired
	private CustomerMapper customerMapper;
	public void setCustomerMapper(CustomerMapper customerMapper){
		this.customerMapper = customerMapper;
	}
	
	public ArrayList<Customer> getAllCustomers(){
		return customerMapper.getAllCustomers();
	}
	
	public ArrayList<Customer> getFilteredCustomers(String customer_code, String description, String agent){
		 
		return customerMapper.getFilteredCustomers("%"+customer_code+"%", "%"+description+"%", "%"+agent+"%");
	}
} 
