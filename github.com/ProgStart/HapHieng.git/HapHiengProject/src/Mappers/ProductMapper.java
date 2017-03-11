package Mappers;

import java.util.ArrayList;

import Models.Product;

public interface ProductMapper {
     
	public ArrayList<Product> getAllProducts();
	public Product selectProduct(String itemId);
	public ArrayList<String> getAllCategories();
	public ArrayList<String> getAllProductLine();
	public ArrayList<Product> getAllFilteredProducts(String product_line, String category);
}
