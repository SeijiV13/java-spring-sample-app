package Controllers;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
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
		HttpSession session = request.getSession();
		
		ArrayList<Product> products = productImplem.getAllProducts();
		
		session.setAttribute("products", products);
		return salesEntries;
	}
	
	
	@RequestMapping(value="/entries")
	@ResponseBody 
    public String salesEntry2(@RequestParam("itemId") String itemId) throws JSONException {
		Product product = productImplem.selectProduct(itemId);
        JSONObject obj = new JSONObject();

        obj.put("itemid", product.getItem_code());
        obj.put("name", product.getDescription());
        obj.put("desc", product.getDescription());
        obj.put("stock", product.getQuantity_pack_big());
        obj.put("amount", product.getGross_price());
        
        //System.out.println(obj.toString());
        
		//Product product = productImplem.selectProduct(itemId);
    	//String sample = "{\"itemid\": "+ itemId +", \"name\": \"Sample Item "+ itemId +"\", \"desc\": \"Short Desc\", \"stock\": "+ 100 * Integer.parseInt(itemId) + ", \"amount\": "+ 1000 * Integer.parseInt(itemId) + "}";
    	return obj.toString();
    }
	
}
