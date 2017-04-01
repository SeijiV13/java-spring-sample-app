package Controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Implem.CustomerImplem;
import Implem.ProductImplem;
import Models.PriceList;
import Models.Product;

@Controller
public class inventoryFileController {
	@Autowired
	ServletContext servletContext;
	@Autowired
	ProductImplem productImplem;
	@Autowired
	CustomerImplem customerImplem;
	
	@RequestMapping(value = "/InventoryFile", method = RequestMethod.GET)
	public String formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		ArrayList<Product> products = productImplem.getAllProducts();
		double totalCost = 0;
		for(Product product: products){
			totalCost = totalCost + product.getGross_price();
	
		}
		//get price list for the pricing table
		ArrayList<PriceList> priceList = customerImplem.getCustomerPriceList();
	
		session.setAttribute("products", products);
		session.setAttribute("totalCost", totalCost); 
		session.setAttribute("priceList", priceList);
		return "InventoryFile";
	}
	
	
	@RequestMapping(value = "/InventoryFileSubmit", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request){
		HttpSession session = request.getSession();
		String product_line = request.getParameter("productLineFilter");
		String category = request.getParameter("categoryFilter");
		
		
		ArrayList<Product> products = productImplem.getAllFilteredProducts("%"+product_line+"%", "%"+category+"%");
		//get total inventory cost
		ArrayList<Product> allProducts = productImplem.getAllProducts();
		double totalCost = 0;
		for(Product product: allProducts){
			totalCost = totalCost + product.getGross_price();
	
		}
		//get price list for the pricing table
		ArrayList<PriceList> priceList = customerImplem.getCustomerPriceList();
		session.setAttribute("products", products);
		session.setAttribute("totalCost", totalCost);
		session.setAttribute("priceList", priceList);
		return "InventoryFile";
	}
	
	@RequestMapping(value="/InventoryFileInsert", method = RequestMethod.POST)
	public String onAddCustomer(MultipartHttpServletRequest request, @RequestParam("image") MultipartFile file) throws IOException {
		//Save the uploaded file to this folder
	    String UPLOADED_FOLDER = servletContext.getAttribute("imageurl").toString();
		HttpSession session = request.getSession();
		
		String importeditem = request.getParameter("importeditem");
		String unit = request.getParameter("unit");
		String item_code = request.getParameter("itemcode");
	    String location = request.getParameter("location");
	    String category = request.getParameter("category");
	    String minimum_quantity = request.getParameter("minimumquantity");
	    String description = request.getParameter("description");
	    //image file upload
        Path path = Paths.get(UPLOADED_FOLDER +  file.getOriginalFilename());
        Files.write(path, file.getBytes()); 
        String image = file.getOriginalFilename();
	    String gross_price= request.getParameter("grossprice");
	    String less_rc = request.getParameter("less15");
	    String less_wc =request.getParameter("less35");
	    String total = request.getParameter("total");
	    String w1 = request.getParameter("w1");
	    String w2 = request.getParameter("w2");
	    String quantity_pack_big = request.getParameter("packageqtybig");
	    String quantity_pack_small = request.getParameter("pacakageqtysmall");
		String remarks1 = request.getParameter("remarks1");
		String remarks2 = request.getParameter("remarks2"); 
		String product_line = request.getParameter("productline");
		productImplem.addNewProduct(item_code, category, description, gross_price, less_rc, less_wc, total, w1, w2, quantity_pack_big, quantity_pack_small, image, location, remarks1, remarks2, product_line, importeditem, unit, minimum_quantity);
		
		return "InventoryFile";
	}

}
