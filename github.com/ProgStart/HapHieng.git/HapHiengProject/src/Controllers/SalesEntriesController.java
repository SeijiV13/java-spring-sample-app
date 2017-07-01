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

import Implem.AgentImplem;
import Implem.CustomerImplem;
import Implem.ProductImplem;
import Models.Agent;
import Models.Customer;
import Models.Product;
import Models.Transaction;

@Controller
public class SalesEntriesController {

	@Autowired
	ProductImplem productImplem;
	@Autowired
	CustomerImplem customerImplem;
	@Autowired
	AgentImplem agentImplem;
	
	@RequestMapping(value="/SalesEntries", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		
		ModelAndView salesEntries = new ModelAndView("SalesEntries");
		HttpSession session = request.getSession();
		
		ArrayList<Product> products = productImplem.getAllProducts();
		ArrayList<Transaction> suspendProducts = productImplem.getAllSuspendedSales();
		ArrayList<Customer> customers = customerImplem.getAllCustomers();
		ArrayList<Agent> agents = agentImplem.getAllAgents();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date date = new Date();
		String dateToday = dateFormat.format(date);
		
		session.setAttribute("dateToday", dateToday);
		session.setAttribute("products", products);
		session.setAttribute("customers", customers);
		session.setAttribute("agents", agents);
		session.setAttribute("suspendProducts", suspendProducts);
		return salesEntries;
	}
	
	
	@RequestMapping(value="/entries")
	@ResponseBody 
    public String getItem(@RequestParam("itemId") String itemId) throws JSONException {
		Product product = productImplem.selectProduct(itemId);
        JSONObject obj = new JSONObject();

        obj.put("itemid", product.getItem_code());
        obj.put("name", product.getDescription());
        obj.put("desc", product.getDescription());
        obj.put("stock", product.getQuantity_pack_big());
        obj.put("amount", product.getGross_price());
        
        return obj.toString();
    }
	
	@RequestMapping(value="/postEntries")
	@ResponseBody 
    public String postTransaction(@RequestParam("request") String json, @RequestParam("details") String details) throws JSONException {
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
		
		productImplem.addNewSale(refNo, dateIn, customer, terms, wcrc, totalAmt, 0.00, dateToday, currency);
		
		JSONArray jsonArray = new JSONArray(json);
		for(int i=0; i<jsonArray.length(); i++) {
		    JSONObject jsonObject = jsonArray.getJSONObject(i);
		    String agent = jsonObject.getString("Agent");
		    int qty = jsonObject.getInt("Qty");
		    double amount = jsonObject.getDouble("Amount");
		    String itemCode = jsonObject.getString("Item code");
		    
		    productImplem.addNewInOut_sale(itemCode, dateIn, refNo, customer, amount, currency, 0, qty, 0, 0.00, agent);
		}
		productImplem.deleteSuspendedTrans(refNo, "SALES");
		productImplem.deleteSuspendedItems(refNo);
	
    	return "Success! Transaction Posted.";
    }
	
	@RequestMapping(value="/getNextID")
	@ResponseBody 
    public String getNextID(@RequestParam("request") String input) throws JSONException {
		// GET RECORD OF COUNTS, if none existing, return 00
		String suspend = (productImplem.getNextSuspendID(input+"%") + "").equals("null") 
				? "00" : productImplem.getNextSuspendID(input+"%");
		String sales = (productImplem.getNextSalesID(input+"%") + "").equals("null") 
				? "00" : productImplem.getNextSalesID(input+"%");

		long num;
		// GET COUNTS (remove first LETTER DIGIT
		long suspendInt = Integer.parseInt(suspend.substring(1));
		long salesInt = Integer.parseInt(sales.substring(1));
		
		if(suspendInt >= salesInt){
			num = suspendInt + 1;
		} else {
			num = salesInt + 1;
		}
		// Format to pad leading zeroes
		String output = String.format("%014d", num);
    	return output;
    }	
}
