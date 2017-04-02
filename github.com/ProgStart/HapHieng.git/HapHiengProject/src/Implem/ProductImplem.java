package Implem;

import java.util.ArrayList;

import org.springframework.security.web.PortMapper;

import Mappers.ProductMapper;
import Models.InOutTransaction;
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
	public Product selectProduct(String itemId) {
		Product product = productMapper.selectProduct(itemId);
		return product;
	}
	
	public void addNewProduct(String item_code, String category, String description, String gross_price, String less_rc, String less_wc, String total, String w1, String w2, String quantity_pack_big, String quantity_pack_small, String image, String location, String remarks1, String remarks2, String product_line, String importeditem, String unit, String minimum_quantity){
		productMapper.addNewProduct(item_code, category, description, gross_price, less_rc, less_wc, total, w1, w2, quantity_pack_big, quantity_pack_small, image, location, remarks1, remarks2, product_line, importeditem, unit, minimum_quantity);
	}
	
	public ArrayList<InOutTransaction> getAllInOutTransactions(){
		return productMapper.getAllInOutTransactions();
	}
	

	
}
 