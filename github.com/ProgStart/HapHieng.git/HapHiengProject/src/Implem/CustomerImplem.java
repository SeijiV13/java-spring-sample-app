package Implem;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import Mappers.CustomerMapper;
import Models.Customer;
import Models.PriceList;
import Models.Sales;

public class CustomerImplem {

	@Autowired
	private CustomerMapper customerMapper;

	public void setCustomerMapper(CustomerMapper customerMapper) {
		this.customerMapper = customerMapper;
	}

	public ArrayList<Customer> getAllCustomers() {
		return customerMapper.getAllCustomers();
	}

	public ArrayList<Customer> getFilteredCustomers(String customer_code, String description, String agent) {

		return customerMapper.getFilteredCustomers("%" + customer_code + "%", "%" + description + "%",
				"%" + agent + "%");
	}

	public ArrayList<Customer> getAllCustomersWithBankFile() {
		return customerMapper.getAllCustomersWithBankFile();
	}

	public void editCustomerDetails(String customer_code, String description, String agent, String address,
			String address2, String telephone, String resident_phone, String fax, String cellphone, String terms,
			String tin_number, String contact_person, String email, String credit_limit, String initial_balance,
			String remaining, String customer_type, String remarks) {
		customerMapper.editCustomerDetails(customer_code, description, agent, address, address2, telephone,
				resident_phone, fax, cellphone, terms, tin_number, contact_person, email, credit_limit, initial_balance,
				remaining, customer_type, remarks);
	}

	public ArrayList<PriceList> getCustomerPriceList() {
		return customerMapper.getCustomerPriceList();
	}
	
	
	public void editCustomerBankDetails(String customer_code, String account_no,  String account_name, String bank, String branch, String status, String bank_remarks){
		customerMapper.editCustomerBankDetails(customer_code, account_no, account_name, bank, branch, status, bank_remarks);
	}
	
	public ArrayList<Sales> getAllCustomerSales(){
		return customerMapper.getAllCustomerSales();
	}
	
	public ArrayList<Sales> getFilteredCustomerSales(String customer_code, String reference_no){
		return customerMapper.getFilteredCustomerSales("%" + customer_code + "%", "%" + reference_no + "%");
	}
	
	public ArrayList<Sales> getAllCustomerSalesReturns(){
		return customerMapper.getAllCustomerSalesReturns();
	}
	
	public ArrayList<Sales> getFilteredCustomerSalesReturns(String customer_code, String sr_no){
		return customerMapper.getFilteredCustomerSalesReturns("%" + customer_code + "%", "%" + sr_no + "%");
	}
	public void addNewCustomer(String customer_code, String description, String agent, String address, String address2, String telephone, String resident_phone, String fax, String cellphone, String terms, String tin_number, String contact_person, String email, String credit_limit, String initial_balance, String remaining, String customer_type, String remarks){
		customerMapper.addNewCustomer(customer_code, description, agent, address, address2, telephone, resident_phone, fax, cellphone, terms, tin_number, contact_person, email, credit_limit, initial_balance, remaining, customer_type, remarks);
	}
	
	public void addNewCustomerBankFIle(String customer_code){
		customerMapper.addNewCustomerBankFile(customer_code);
	}
}
