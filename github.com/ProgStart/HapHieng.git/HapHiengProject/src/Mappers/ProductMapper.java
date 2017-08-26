package Mappers;

import java.util.ArrayList;

import Models.InOutTransaction;
import Models.Product;
import Models.Transaction;

public interface ProductMapper {
     
	public ArrayList<Product> getAllProducts();
	public Product selectProduct(String itemId);
	public ArrayList<String> getAllCategories();
	public ArrayList<String> getAllProductLine();
	public ArrayList<Product> getAllFilteredProducts(String product_line, String category);
	public String getNextSalesID(String input);
	public String getNextSuspendID(String input);
	public void addNewProduct(String item_code, String category, String description, String gross_price, String less_rc, String less_wc, String total, String w1, String w2, String quantity_pack_big, String quantity_pack_small, String image, String location, String remarks1, String remarks2, String product_line, String importeditem, String unit, String minimum_quantity);
	public ArrayList<InOutTransaction> getAllInOutTransactions();
	public void addNewSale(String refNo, String date, String customerCode, String terms, String po, double amount,
			double balance, String ctr_ref, String currency);
	public void addNewSalesReturn(String refNo, String date, String customerCode, double amount,
			double balance);
	public void addNewInOut_sale(String item_code, String date, String refNo, String client, double price,
			String currency, int quantity_in, int quantity_out, int quantity_adjustment, double balance,
			String agent);
	
	public void addNewInOut_salesReturn(String item_code, String date, String refNo, String client, double price,
			String currency, int quantity_in, int quantity_out, int quantity_adjustment, double balance,
			String agent, String indicator, String good, String category);
	public void addNewSuspend(String refNo, String date, String customerCode, String terms, String po, double amount,
			double balance, String ctr_ref, String currency, String entry);
	public void addNewItemSuspend(String item_code, String date, String refNo, String client, double price,
			String currency, int quantity_in, int quantity_out, int quantity_adjustment, double balance, String agent, String good, String warehouse);
	public ArrayList<Transaction> getAllSuspendedSales();
	public void deleteSuspendedTrans(String refNo, String entry);
	public void deleteSuspendedItem(String refNo);
	public Transaction getSuspendedSalesTrans(String reference_no);
	public Transaction getSuspendedSalesReturnTrans(String reference_no);
	public ArrayList<InOutTransaction> getSuspendedItemSales(String reference_no);
	public String selectSuspendID(String refno);
	public String getLastOrderedPrice(String item_code, String client);
	public void updateSuspend(String refNo, String date, String customerCode, String terms, String po, double amount,
			double balance, String ctr_ref, String currency, String entry);
	public ArrayList<Transaction> getAllSuspendedSalesReturn();
}
