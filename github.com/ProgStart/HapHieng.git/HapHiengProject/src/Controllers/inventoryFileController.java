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
		session.setAttribute("products", products);
		
		return "InventoryFile";
	}
	
	
	@RequestMapping(value = "/InventoryFileSubmit", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request){
		HttpSession session = request.getSession();
		String product_line = request.getParameter("productLineFilter");
		String category = request.getParameter("categoryFilter");
		
		
		ArrayList<Product> products = productImplem.getAllFilteredProducts("%"+product_line+"%", "%"+category+"%");
		session.setAttribute("products", products);
		return "InventoryFile";
	}

}
