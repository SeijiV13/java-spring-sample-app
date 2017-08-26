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
public class SalesReturnEntriesController {
	//USE AUTOWIRE
	@Autowired
	private ProductImplem productImplem;
	@Autowired
	private CustomerImplem customerImplem;
	@Autowired
	private AgentImplem agentImplem;
	
	@RequestMapping(value ="/SalesReturnEntries", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		ModelAndView salesReturnEntries = new ModelAndView("SalesReturnEntries");
		HttpSession session = request.getSession();
		
		ArrayList<Product> products = productImplem.getAllProducts();
		ArrayList<Transaction> suspendProducts = productImplem.getAllSuspendedSalesReturn();
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
		return salesReturnEntries;
		
	}
	
	@RequestMapping(value="/postSalesReturnEntries")
	@ResponseBody 
    public String postTransaction(@RequestParam("request") String json, @RequestParam("details") String details) throws JSONException {
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
		
		productImplem.addNewSalesReturn(refNo, dateIn, customer, "", "", totalAmt, 0.00, dateToday, currency);
		
		JSONArray jsonArray = new JSONArray(json);
		for(int i=0; i<jsonArray.length(); i++) {
		    JSONObject jsonObject = jsonArray.getJSONObject(i);
		    String agent = jsonObject.getString("Agent");
		    int qty = jsonObject.getInt("Qty");
		    double amount = jsonObject.getDouble("Amount");
		    String itemCode = jsonObject.getString("Item code");
		    String good = jsonObject.getString("Good");
		   Product product =  productImplem.selectProduct(itemCode);		    
		    productImplem.addNewInOut_salesReturn(itemCode, dateIn, refNo, customer, amount/qty, currency, qty, 0, 0, 0.00, agent, "", good, product.getCategory());
		}
		productImplem.deleteSuspendedTrans(refNo, "SALESRETURN");
		productImplem.deleteSuspendedItems(refNo);
	
    	return "Success! Transaction Posted.";
    }

}
