package Controllers;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
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
		ArrayList<Product> suspendProducts = productImplem.getAllProducts();
		
		session.setAttribute("products", products);
		session.setAttribute("suspendProducts", suspendProducts);
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
	
	@RequestMapping(value="/postEntries")
	@ResponseBody 
    public String salesEntry3(@RequestParam("request") String json, @RequestParam("refNo") String refNo, @RequestParam("details") String details) throws JSONException {
		JSONObject home = new JSONObject(details);
		String customer = home.getString("customer");
		String dateIn = home.getString("date");	
		
		JSONArray jsonArray = new JSONArray(json);
		for(int i=0; i<jsonArray.length(); i++) {
		    JSONObject jsonObject = jsonArray.getJSONObject(i);
		    String agent = jsonObject.getString("Agent");
		    int qty = jsonObject.getInt("Qty");
		    double amount = jsonObject.getDouble("Amount");
		    String itemCode = jsonObject.getString("Item code");
		    
		    productImplem.addNewItemSuspend(itemCode, dateIn, refNo, customer, amount, "PHP", 0, qty, 0, 0.00, agent);
		}
	
    	return "success";
    }

	@RequestMapping(value="/postEntry")
	@ResponseBody 
    public String salesEntry4(@RequestParam("details") String details) throws JSONException {
		//JSONArray jsonArray = new JSONArray(details);
		
		JSONObject home = new JSONObject(details);
		String customer = home.getString("customer");
		String terms = home.getString("terms");
		double totalAmt = home.getDouble("totalAmt");
		String dateIn = home.getString("date");
		String refNo = home.getString("refno");
		String currency = "PHP";
		 
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String todayDate = dateFormat.format(date);
		
		productImplem.addNewSale(todayDate, dateIn, customer, terms, "po", totalAmt, 0.00, refNo, currency);
		
    	return todayDate;
    }	
}
