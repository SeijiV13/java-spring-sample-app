package Controllers;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import Implem.ProductImplem;
import Models.Product;

@Controller
public class SalesEntriesController {

	@Autowired
	ProductImplem productImplem;
	
	@RequestMapping(value="/SalesEntries", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		
		ModelAndView salesEntries = new ModelAndView("SalesEntries");
		ArrayList<Product> products = productImplem.getAllProducts();
		
		salesEntries.addObject("products", products);
		return salesEntries;
	}
	
	
	@RequestMapping(value="/entries")
	@ResponseBody 
    public String salesEntry2(@RequestParam("itemId") String itemId) {
        /*JSONObject obj = new JSONObject();

        obj.put("itemid", itemId);
        obj.put("name", "Sample Item");
        obj.put("desc", "Short Description");
        obj.put("stock", new Integer(100));
        obj.put("amount", new Double(1000.21));
        */
    	String sample = "{\"itemid\": "+ itemId +", \"name\": \"Sample Item "+ itemId +"\", \"desc\": \"Short Desc\", \"stock\": "+ 100 * Integer.parseInt(itemId) + ", \"amount\": "+ 1000 * Integer.parseInt(itemId) + "}";
    	return sample;
    }
	
}
