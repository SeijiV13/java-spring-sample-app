package Implem;

import java.util.ArrayList;

import Mappers.ProductMapper;
import Models.InOutTransaction;
import Models.Product;
import Models.Transaction;

public class ProductImplem {
    
	
	private ProductMapper productMapper;
	
	public void setProductMapper(ProductMapper productMapper){
		this.productMapper = productMapper;
	}
	
	//Get all categories in the database
	public ArrayList<String> getAllCategories(){
		
		ArrayList<String> categories = productMapper.getAllCategories();
		return categories;
	}
	
	//Get all product line in database
	public ArrayList<String> getAllProductLine(){
		ArrayList<String> productLine = productMapper.getAllProductLine();
		return productLine;
	}
	
	public ArrayList<Product> getAllProducts(){
		ArrayList<Product> products = productMapper.getAllProducts();
		
		return products;
	}

	public ArrayList<Transaction> getAllSuspendedSales(){
		ArrayList<Transaction> transaction = productMapper.getAllSuspendedSales();
		return transaction;
	}
	
	public ArrayList<Transaction> getAllSuspendedSalesReturn(){
		ArrayList<Transaction> transaction = productMapper.getAllSuspendedSalesReturn();
		return transaction;
	}

	public Transaction getSuspendedSalesTrans(String reference_no){
		Transaction transaction = productMapper.getSuspendedSalesTrans(reference_no);
		return transaction;
	}	
	
	public ArrayList<InOutTransaction> getSuspendedItemSales(String reference_no){
		ArrayList<InOutTransaction> transaction = productMapper.getSuspendedItemSales(reference_no);
		return transaction;
	}	
	
	public ArrayList<Product> getAllFilteredProducts(String product_line, String category){
		
		ArrayList<Product> products = productMapper.getAllFilteredProducts(product_line, category);
		return products;
	 
	}
	
	public String selectSuspendID(String refno){
		return productMapper.selectSuspendID(refno);
	}
	
	public String getNextSuspendID(String input){
		return productMapper.getNextSuspendID(input);
	}

	public String getNextSalesID(String input){
		return productMapper.getNextSalesID(input);
	}
	
	public Product selectProduct(String itemId) {
		Product product = productMapper.selectProduct(itemId);
		return product;
	}
	
	public void addNewProduct(String item_code, String category, String description, String gross_price, String less_rc, String less_wc, String total, String w1, String w2, String quantity_pack_big, String quantity_pack_small, String image, String location, String remarks1, String remarks2, String product_line, String importeditem, String unit, String minimum_quantity){
		productMapper.addNewProduct(item_code, category, description, gross_price, less_rc, less_wc, total, w1, w2, quantity_pack_big, quantity_pack_small, image, location, remarks1, remarks2, product_line, importeditem, unit, minimum_quantity);
	}

	public void addNewSale(String refNo, String date, String customerCode, String terms, String po, double amount, double balance, String ctr_ref, String currency){
		productMapper.addNewSale(refNo, date, customerCode, terms, po, amount, balance, ctr_ref, currency);
	}
	
	public void addNewSalesReturn(String refNo, String date, String customerCode, String terms, String po, double amount, double balance, String ctr_ref, String currency){
		productMapper.addNewSalesReturn(refNo, date, customerCode, amount, balance);
	}

	public void addNewInOut_sale(String item_code, String date, String refNo, String client, double price, String currency, int quantity_in, int quantity_out, int quantity_adjustment, double balance, String agent){
		productMapper.addNewInOut_sale(item_code, date, refNo, client, price, currency, quantity_in, quantity_out, quantity_adjustment, balance, agent);
	}
	
	public void addNewInOut_salesReturn(String item_code, String date, String refNo, String client, double price, String currency, int quantity_in, int quantity_out, int quantity_adjustment, double balance, String agent, String indicator, String good, String category){
		productMapper.addNewInOut_salesReturn(item_code, date, refNo, client, price, currency, quantity_in, quantity_out, quantity_adjustment, balance, agent, indicator, good, category);
	}
	
	public ArrayList<InOutTransaction> getAllInOutTransactions(){
		return productMapper.getAllInOutTransactions();
	}

	public void addNewSuspend(String refNo, String date, String customerCode, String terms, String po, double amount, double balance, String ctr_ref, String currency, String entry) {
		productMapper.addNewSuspend(refNo, date, customerCode, terms, po, amount, balance, ctr_ref, currency, entry);
	}

	public void updateSuspend(String refNo, String date, String customerCode, String terms, String po, double amount, double balance, String ctr_ref, String currency, String entry) {
		productMapper.updateSuspend(refNo, date, customerCode, terms, po, amount, balance, ctr_ref, currency, entry);
	}
	
	public void addNewItemSuspend(String item_code, String date, String refNo, String client, double price, String currency, int quantity_in, int quantity_out, int quantity_adjustment, double balance, String agent) {
		productMapper.addNewItemSuspend(item_code, date, refNo, client, price, currency, quantity_in, quantity_out, quantity_adjustment, balance, agent);
	}

	public void deleteSuspendedTrans(String refNo, String entry) {
		productMapper.deleteSuspendedTrans(refNo, entry);
	}
	
	public String getLastOrderedPrice(String item_code, String client){
		return productMapper.getLastOrderedPrice(item_code, client);
	}

	public void deleteSuspendedItems(String refNo) {
		productMapper.deleteSuspendedItem(refNo);
	}
	
}
 