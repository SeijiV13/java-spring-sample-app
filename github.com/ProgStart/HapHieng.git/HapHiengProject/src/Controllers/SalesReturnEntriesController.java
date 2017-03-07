package Controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import Implem.ProductImplem;
import Models.Product;

@Controller
public class SalesReturnEntriesController {
	//USE AUTOWIRE
	@Autowired
	private ProductImplem productImplem;
	
	@RequestMapping(value ="/SalesReturnEntries", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
	    HttpSession session = request.getSession();
	    //@CIRINEO SAMPLE IMPLEMENTATION GET ALL PRODUCTS
		ArrayList<Product> products = productImplem.getAllProducts();
		
		session.setAttribute("products", products);
		ModelAndView salesReturnEntries = new ModelAndView("SalesReturnEntries");
		return salesReturnEntries;
		
	}

}
