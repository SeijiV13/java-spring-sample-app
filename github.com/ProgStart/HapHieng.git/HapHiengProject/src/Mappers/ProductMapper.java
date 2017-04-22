package Mappers;

import java.util.ArrayList;

import Models.InOutTransaction;
import Models.Product;

public interface ProductMapper {
     
	public ArrayList<Product> getAllProducts();
	public Product selectProduct(String itemId);
	public ArrayList<String> getAllCategories();
	public ArrayList<String> getAllProductLine();
	public ArrayList<Product> getAllFilteredProducts(String product_line, String category);
	public void addNewProduct(String item_code, String category, String description, String gross_price, String less_rc, String less_wc, String total, String w1, String w2, String quantity_pack_big, String quantity_pack_small, String image, String location, String remarks1, String remarks2, String product_line, String importeditem, String unit, String minimum_quantity);
	public ArrayList<InOutTransaction> getAllInOutTransactions();
	public void addNewSale(String refNo, String date, String customerCode, String terms, String po, double amount,
			double balance, String ctr_ref);
	public void addNewInOut_sale(String item_code, String date, String refNo, String client, double price,
			String currency, int quantity_in, int quantity_out, int quantity_adjustment, double balance,
			String agent);
}
