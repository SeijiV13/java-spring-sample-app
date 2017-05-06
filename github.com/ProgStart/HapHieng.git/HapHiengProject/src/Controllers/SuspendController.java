package Controllers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Implem.ProductImplem;

@Controller
public class SuspendController {

	@Autowired
	ProductImplem productImplem;	
	
	@RequestMapping(value="/suspendEntries")
	@ResponseBody 
    public String suspendTransaction(@RequestParam("request") String json, @RequestParam("details") String details) throws JSONException {
		JSONObject home = new JSONObject(details);
		String customer = home.getString("customer");
		String terms = home.getString("terms");
		double totalAmt = home.getDouble("totalAmt");
		String dateIn = home.getString("date");
		String refNo = home.getString("refno");
		String currency = home.getString("currency");
		
		//CHECK IF ALREADY IN SALES TABLE, CANCEL IF ALREADY
		
		productImplem.addNewSuspend(refNo, dateIn, customer, terms, "po", totalAmt, 0.00, refNo, currency, "SALES");
		
		JSONArray jsonArray = new JSONArray(json);
		for(int i=0; i<jsonArray.length(); i++) {
		    JSONObject jsonObject = jsonArray.getJSONObject(i);
		    String agent = jsonObject.getString("Agent");
		    int qty = jsonObject.getInt("Qty");
		    double amount = jsonObject.getDouble("Amount");
		    String itemCode = jsonObject.getString("Item code");
		    
		    productImplem.addNewItemSuspend(itemCode, dateIn, refNo, customer, amount, currency, 0, qty, 0, 0.00, agent);
		}
	
    	return "Success! Transaction Suspended.";
    }
}

