package Controllers;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
    public String suspendItemEntries(@RequestParam("request") String json, @RequestParam("refNo") String refNo, @RequestParam("details") String details) throws JSONException {
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

	@RequestMapping(value="/suspendEntry")
	@ResponseBody 
    public String suspendEntries(@RequestParam("details") String details) throws JSONException {
		//JSONArray jsonArray = new JSONArray(details);
		
		JSONObject home = new JSONObject(details);
		String customer = home.getString("customer");
		String terms = home.getString("terms");
		double totalAmt = home.getDouble("totalAmt");
		String dateIn = home.getString("date");
		String refNo = home.getString("refno");
		String currency = "PHP";
		String entry = "SALES";
		 
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String todayDate = dateFormat.format(date);
		
		productImplem.addNewSuspend(todayDate, dateIn, customer, terms, "po", totalAmt, 0.00, refNo, currency, entry);
		
    	return todayDate;
    }	
}

