package Controllers;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

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
	
	@RequestMapping(value="/postEntries")
	@ResponseBody 
    public String salesEntry3(@RequestParam("request") String json, @RequestParam("refNo") String refNo) throws JSONException {
		JSONArray jsonArray = new JSONArray(json);
		for(int i=0; i<jsonArray.length(); i++) {
		    JSONObject jsonObject = jsonArray.getJSONObject(i);
		    Iterator<String> keys= jsonObject.keys();
		    while (keys.hasNext()) 
		    {
		            String keyValue = (String)keys.next();
		            String valueString = jsonObject.getString(keyValue);
		            System.out.println(valueString);
		    }
		    String jsonObjectAsString = jsonObject.toString();
		    System.out.println(jsonObjectAsString);
		}
		productImplem.addNewInOut_sale("item_code", "date", refNo, "client", "price", "currency", "quantity_in", "quantity_out", "quantity_adjustment", "balance", "agent");
		
    	return "success";
    }

	@RequestMapping(value="/postEntry")
	@ResponseBody 
    public String salesEntry4(@RequestParam("request") String json) throws JSONException {
		JSONArray jsonArray = new JSONArray(json);
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String todayDate = dateFormat.format(date);
		String todayDate2 = dateFormat2.format(date);
		
		productImplem.addNewSale(todayDate, todayDate2, "customerCodeTest", "termstest", "po", "amount", "balance", "ctr_ref");
		
    	return todayDate;
    }	
}
