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
}
