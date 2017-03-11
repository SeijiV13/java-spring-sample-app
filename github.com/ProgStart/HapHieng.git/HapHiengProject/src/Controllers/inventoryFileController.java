package Controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Implem.ProductImplem;
import Models.Product;

@Controller
public class inventoryFileController {
	
	@Autowired
	ProductImplem productImplem;
	
	@RequestMapping(value = "/InventoryFile", method = RequestMethod.GET)
	public String formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		ArrayList<Product> products = productImplem.getAllProducts();
		double totalCost = 0;
		for(Product product: products){
			totalCost = totalCost + product.getGross_price();
	
		}
		session.setAttribute("products", products);
		session.setAttribute("totalCost", totalCost); 
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
		
		session.setAttribute("products", products);
		session.setAttribute("totalCost", totalCost);
		return "InventoryFile";
	}
	
	@RequestMapping(value="/InventoryFileAddCustomer", method = RequestMethod.POST)
	public String onAddCustomer(HttpServletRequest request){
		HttpSession session = request.getSession();
		String importeditem = request.getParameter("importeditem");
		String unit = request.getParameter("unit");
		String itemcode = request.getParameter("itemcode");
	    String location = request.getParameter("location");
	    String category = request.getParameter("category");
	    String minimumquantity = request.getParameter("minimumquantity");
	    String description = request.getParameter("description");
	    //image
	    double grossprice= Double.parseDouble(request.getParameter("grossprice"));
	    double less15 = Double.parseDouble(request.getParameter("less15"));
	    double less35 = Double.parseDouble(request.getParameter("less35"));
	    double total = Double.parseDouble(request.getParameter("total"));
	    int w1 = Integer.parseInt(request.getParameter("w1"));
	    int w2 = Integer.parseInt(request.getParameter("w2"));
	    int packageqtybig = Integer.parseInt(request.getParameter("packageqtybig"));
	    int packageqtysmall = Integer.parseInt(request.getParameter("pacakageqtysmall"));
		String remarks1 = request.getParameter("remarks1");
		String remarks2 = request.getParameter("remarks2"); 
		
		Product product = new Product();
		
		
		return "InventoryFile";
	}

}
