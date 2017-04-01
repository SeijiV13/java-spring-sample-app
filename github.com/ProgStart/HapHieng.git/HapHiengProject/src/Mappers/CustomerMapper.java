package Mappers;

import java.util.ArrayList;

import Models.Customer;
import Models.PriceList;
import Models.Sales;

public interface CustomerMapper {
   
	public ArrayList<Customer> getAllCustomers();
	public ArrayList<Customer> getFilteredCustomers(String customer_code, String description, String agent);
    public ArrayList<Customer> getAllCustomersWithBankFile();
    public void editCustomerDetails(String customer_code, String description, String agent, String address, String address2, String telephone, String resident_phone, String fax, String cellphone, String terms, String tin_number, String contact_person, String email, String credit_limit, String initial_balance, String remaining, String customer_type, String remarks );
    public  ArrayList<PriceList> getCustomerPriceList();
    public void editCustomerBankDetails(String customer_code, String account_no,  String account_name, String bank, String branch, String status, String bank_remarks);
    public ArrayList<Sales> getAllCustomerSales();
    public ArrayList<Sales> getFilteredCustomerSales(String customer_code, String reference_no);
    public ArrayList<Sales> getAllCustomerSalesReturns();
    public ArrayList<Sales> getFilteredCustomerSalesReturns(String customer_code, String sr_no);
    public void addNewCustomer(String customer_code, String description, String agent, String address, String address2, String telephone, String resident_phone, String fax, String cellphone, String terms, String tin_number, String contact_person, String email, String credit_limit, String initial_balance, String remaining, String customer_type, String remarks);
    public void addNewCustomerBankFile(String customer_code);

}  
