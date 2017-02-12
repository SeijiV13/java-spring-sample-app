package Implem;

import java.util.ArrayList;

import org.springframework.security.web.PortMapper;

import Mappers.ProductMapper;
import Models.Product;

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
	
	public ArrayList<Product> getAllFilteredProducts(String product_line, String category){
		
		ArrayList<Product> products = productMapper.getAllFilteredProducts(product_line, category);
		return products;
	 
	}
	
}
 