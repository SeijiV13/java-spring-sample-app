package Mappers;

import java.util.ArrayList;

import Models.Customer;

public interface CustomerMapper {
   
	public ArrayList<Customer> getAllCustomers();
	public ArrayList<Customer> getFilteredCustomers(String customer_code, String description, String agent);

}
