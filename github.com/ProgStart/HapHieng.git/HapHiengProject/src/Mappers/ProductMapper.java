package Mappers;

import java.util.ArrayList;

public interface ProductMapper {
     
	public ArrayList<String> getAllProducts(String product_line, String category);
	public ArrayList<String> getAllCategories();
	public ArrayList<String> getAllProductLine();
	
}
