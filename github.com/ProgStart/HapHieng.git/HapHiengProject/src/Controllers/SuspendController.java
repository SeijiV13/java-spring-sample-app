package Controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import Models.InOutTransaction;
import Models.Product;
import Models.Transaction;

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
		String wcrc = home.getString("wcrc");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddmmHHss");
		Date date = new Date();
		String dateToday = dateFormat.format(date);
		 
		//CHECK IF ALREADY IN SUSPEND TABLE, UPDATE IF ALREADY
		System.out.println("-" + productImplem.selectSuspendID(refNo) + "-");
		if((productImplem.selectSuspendID(refNo) + "").equals("null")){
			productImplem.addNewSuspend(refNo, dateIn, customer, terms, wcrc, totalAmt, 0.00, dateToday, currency, "SALES");
		} else {
			productImplem.updateSuspend(refNo, dateIn, customer, terms, wcrc, totalAmt, 0.00, dateToday, currency, "SALES");
			productImplem.deleteSuspendedItems(refNo);
		}
		JSONArray jsonArray = new JSONArray(json);
		for(int i=0; i<jsonArray.length(); i++) {
		    JSONObject jsonObject = jsonArray.getJSONObject(i);
		    String agent = jsonObject.getString("Agent");
		    int qty = jsonObject.getInt("Qty");
		    double amount = jsonObject.getDouble("Amount");
		    String itemCode = jsonObject.getString("Item code");
		    
		    productImplem.addNewItemSuspend(itemCode, dateIn, refNo, customer, amount/qty, currency, 0, qty, 0, 0.00, agent, "", "");
		}
		
    	return "Success! Transaction Suspended.";
    }
	
	@RequestMapping(value="/resumeEntries")
	@ResponseBody 
    public String resumeTransaction(@RequestParam("details") String details) throws JSONException {
		
		Transaction trans = productImplem.getSuspendedSalesTrans(details);
		ArrayList<InOutTransaction> itemList = productImplem.getSuspendedItemSales(details);
		
		JSONObject output = new JSONObject();
		output.append("ref_no", trans.getReference_no());
		output.append("date", trans.getDate());
		output.append("currency", trans.getCurrency());
		output.append("cust_code", trans.getCustomer_code());
		//output.append("terms", trans.getTerms());
		output.append("total", trans.getAmount());
		//output.append("wcrc", trans.getPo());
		
		JSONArray items = new JSONArray();
		items.put(itemList);	

		for(int i=0; i< itemList.size(); i++) {
			Product product = productImplem.selectProduct(itemList.get(i).getItem_code());
	        JSONObject obj = new JSONObject();
	
	        obj.put("itemid", product.getItem_code());
	        obj.put("name", product.getDescription());
	        obj.put("desc", product.getDescription());
	        obj.put("stock", product.getQuantity_pack_big());
	        
	        obj.put("itemPrice", itemList.get(i).getPrice());
	        String lastPrice = productImplem.getLastOrderedPrice(product.getItem_code(),  trans.getCustomer_code());     
	        obj.put("lastamount", ((lastPrice+"").equals("null")) ? "0.00" : lastPrice);
	        obj.put("quantity", itemList.get(i).getQuantity_out());
	        obj.put("agent", itemList.get(i).getAgent());

	        output.accumulate("items", obj); 
		}
        
		System.out.println(output.toString());
	
    	return output.toString();
    }	
	
	
	@RequestMapping(value="/resumeSalesReturnEntries")
	@ResponseBody 
    public String resumeSalesReturnTransaction(@RequestParam("details") String details) throws JSONException {
		
		Transaction trans = productImplem.getSuspendedSalesReturnTrans(details);
		System.out.print(trans);
		ArrayList<InOutTransaction> itemList = productImplem.getSuspendedItemSales(details);
		JSONObject output = new JSONObject();
		output.append("ref_no", trans.getReference_no());
		output.append("date", trans.getDate());
		output.append("currency", trans.getCurrency());
		output.append("cust_code", trans.getCustomer_code());
		//output.append("terms", trans.getTerms());
		output.append("total", trans.getAmount());
		//output.append("wcrc", trans.getPo());
		
		JSONArray items = new JSONArray();
		items.put(itemList);	

		for(int i=0; i< itemList.size(); i++) {
			Product product = productImplem.selectProduct(itemList.get(i).getItem_code());
	        JSONObject obj = new JSONObject();
	
	        obj.put("itemid", product.getItem_code());
	        obj.put("name", product.getDescription());
	        obj.put("desc", product.getDescription());
	        obj.put("stock", product.getQuantity_pack_big());
	         
	        obj.put("itemPrice", itemList.get(i).getPrice());
	        obj.put("good", itemList.get(i).getGood());
	        obj.put("warehouse", itemList.get(i).getWarehouse());
	        String lastPrice = productImplem.getLastOrderedPrice(product.getItem_code(),  trans.getCustomer_code());     
	        obj.put("lastamount", ((lastPrice+"").equals("null")) ? "0.00" : lastPrice);
	        obj.put("quantity", itemList.get(i).getQuantity_out());
	        obj.put("agent", itemList.get(i).getAgent());

	        output.accumulate("items", obj); 
		}
        
	
    	return output.toString();
    }	
	
	@RequestMapping(value="/suspendSalesReturnEntries")
	@ResponseBody 
    public String suspendSalesReturnTransaction(@RequestParam("request") String json, @RequestParam("details") String details) throws JSONException {
		JSONObject home = new JSONObject(details);
		String customer = home.getString("customer");
		//String terms = home.getString("terms");
		double totalAmt = home.getDouble("totalAmt");
		String dateIn = home.getString("date");
		String refNo = home.getString("refno");
		String currency = home.getString("currency");
		//String wcrc = home.getString("wcrc");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddmmHHss");
		Date date = new Date();
		String dateToday = dateFormat.format(date);
		
		//CHECK IF ALREADY IN SUSPEND TABLE, UPDATE IF ALREADY
		if((productImplem.selectSuspendID(refNo) + "").equals("null")){
			productImplem.addNewSuspend(refNo, dateIn, customer, "", "", totalAmt, 0.00, dateToday, currency, "SALESRETURN");
		} else {
			productImplem.updateSuspend(refNo, dateIn, customer, "", "", totalAmt, 0.00, dateToday, currency, "SALESRETURN");
			productImplem.deleteSuspendedItems(refNo);
		}
		JSONArray jsonArray = new JSONArray(json);
		for(int i=0; i<jsonArray.length(); i++) {
		    JSONObject jsonObject = jsonArray.getJSONObject(i);
		    String good = jsonObject.getString("Good");
		    String warehouse = jsonObject.getString("W1/W2");
		    String agent = jsonObject.getString("Agent");
		    int qty = jsonObject.getInt("Qty");
		    double amount = jsonObject.getDouble("Amount");
		    String itemCode = jsonObject.getString("Item code");
		    
		    productImplem.addNewItemSuspend(itemCode, dateIn, refNo, customer, amount/qty, currency, 0, qty, 0, 0.00, agent, good, warehouse);
		}
		
    	return "Success! Transaction Suspended.";
    }
}

