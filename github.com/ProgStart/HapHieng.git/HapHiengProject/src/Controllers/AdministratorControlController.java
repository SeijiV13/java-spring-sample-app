package Controllers;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import Implem.UserImplem;

@Controller
public class AdministratorControlController {
@Autowired
UserImplem userImplem;
	
	@RequestMapping(value ="/AdministratorControl", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		
		
		HttpSession session = request.getSession();
		
		ModelAndView AdministratorControl = new ModelAndView("AdministratorControl");
		
		//GET ALL USERS IN TABLE
		ArrayList<String> usersList = userImplem.retrieveAllUsers();
		session.setAttribute("usersList", usersList);
		
		
		
		//FUNCTIONS OF ENTRIES HASHMAP
		HashMap<String, String> entriesFunctions = new HashMap<String, String>();
		
		entriesFunctions.put("sales_entries",  "Sales Entries");
		entriesFunctions.put("sales_return_entries", "Sales Return Entries");
		entriesFunctions.put("purchase_entries", "Purchase Entries");
		entriesFunctions.put("purchase_return_entries", "Purchase Return Entries");
	 	entriesFunctions.put("inventory_quantity_adjustment_entries", "Inventory Quantity Adjustment Entries");
		entriesFunctions.put("inventory_damage_entries", "Inventory Damage Entries");

		entriesFunctions.put("generate_sales_counter_receipts","Generate Sales Counter Receipts");
		entriesFunctions.put("collection_from_customers_entries","Collection from Customers Entries");
		entriesFunctions.put("payment_to_suppliers_entries","Payment to Suppliers Entries");
	    
		//FUNCTIONS OF FILES HASHMAP
		HashMap<String, String> filesFunctions = new HashMap<String,String>();
		filesFunctions.put("inventory_file", "Inventory File");
		filesFunctions.put("customer_file", "Customer File");
		filesFunctions.put("supplier_file", "Supplier File");
		filesFunctions.put("agent_file", "Agent File");
		filesFunctions.put("customer_bank_file", "Customer Bank File");
		
		//FUNCTIONS OF REPORTS HASHMAP
		HashMap<String, String> reportsFunctions = new HashMap<String, String>();
		reportsFunctions.put("sales_reports", "Sales Reports");
		reportsFunctions.put("sales_return_reports", "Sales Return Reports");
		reportsFunctions.put("purchase_reports", "Purchase Reports");
		reportsFunctions.put("purchase_return_reports", "Purchase Return Reports");
		reportsFunctions.put("item_in_out_transactions", "Item In Out Transactions");
		reportsFunctions.put("product_list", "Product List");
		reportsFunctions.put("customers_list", "Customers List");
		reportsFunctions.put("suppliers_list", "Suppliers List");
		reportsFunctions.put("agent_list", "Agent List");
		
		HashMap<String, String> productListFunctions = new HashMap<String, String>();
		productListFunctions.put("price_list_imported", "Price List (Imported)");
		productListFunctions.put("price_list_local", "Price List (Local)");
		productListFunctions.put("external_imported", "(External) - List All Products (Imported)");
		productListFunctions.put("external_local", "(External) - List All Products (Local)");
		productListFunctions.put("external_no_price", "(External) - List All Products (No Price)");
		productListFunctions.put("internal", "(Internal) - List All Products");
		productListFunctions.put("list_products_by_category", "List Products by Category");
		productListFunctions.put("damaged_inventory_summary", "Damaged Inventory Summary");
		productListFunctions.put("quantity_adjustment_inventory", "Quantity Adjustment Inventory");
		
		HashMap<String, String> toolsFunctions  = new HashMap<String, String>();
		toolsFunctions.put("view_edit_sales", "View/Edit Sales");
		toolsFunctions.put("view_edit_sales_returns", "View/Edit Sales Returns");
		toolsFunctions.put("view_edit_purchases", "View/Edit Purchases");
		toolsFunctions.put("view_edit_purchases_returns", "View/Edit Purchases Returns");
		toolsFunctions.put("view_edit_counter_receipts", "View/Edit Counter Receipts");
		toolsFunctions.put("view_edit_quantity_stock_adjustments", "View/Edit Quantity Stock Adjustments");
		toolsFunctions.put("view_edit_inventory_damages", "View/Edit Inventory Damages");
		toolsFunctions.put("customer_transactions", "Customer Transactions");
		toolsFunctions.put("supplier_transactions", "Supplier Transactions");
		toolsFunctions.put("administrator_control", "Administrator Control");
		toolsFunctions.put("change_password", "Change Password");
		
		
		session.setAttribute("entriesFunctions", entriesFunctions);
		session.setAttribute("filesFunctions", filesFunctions);
		session.setAttribute("reportsFunctions", reportsFunctions);
		session.setAttribute("productlistFunctions", productListFunctions);
		session.setAttribute("toolsFunctions", toolsFunctions);
		
		return AdministratorControl;
		
		
		
	}
	
	@RequestMapping(value= "/AdministratorControlSubmit", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request){
		
		String user = request.getParameter("user-field");
		String transactionTab = request.getParameter("trans-field");
		
		//IF MODIFIED IS ENTRIES
		if(transactionTab.equals("entries")){
			int se_active,sre_active,pe_active, pre_active,iqae_active,
			 ide_active, gscr_active,cfce_active, ptse_active;
			
			String sales_entries = request.getParameter("sales_entries");
			String sales_return_entries = request.getParameter("sales_return_entries");
			String purchase_entries = request.getParameter("purchase_entries");
			String purchase_return_entries = request.getParameter("purchase_return_entries");
			String inventory_quantity_adjustment_entries = request.getParameter("inventory_quantity_adjustment_entries");
			String inventory_damage_entries = request.getParameter("inventory_damage_entries");
			String generate_sales_counter_receipts = request.getParameter("generate_sales_counter_receipts");
			String collection_from_customers_entries = request.getParameter("collection_from_customers_entries");
			String payment_to_suppliers_entries = request.getParameter("payment_to_suppliers_entries");
			
			
			if(sales_entries == null){
			    se_active = 0;
			}
			else{
				se_active = 1;
			}
			
			if(sales_return_entries == null){
				sre_active = 0;
			}
			else{
				sre_active = 1;
			}
			
			if(purchase_entries == null){
				pe_active = 0;
			}
			else{
				pe_active = 1;
			}
			
			if(purchase_return_entries == null){
				pre_active = 0;
			}
			else{
				pre_active = 1;
			}
			
			if(inventory_quantity_adjustment_entries == null){
			    iqae_active = 0;
			}
			else{
				iqae_active = 1;
			}
			
			if(inventory_damage_entries == null){
				ide_active = 0;
			}
			else{
				ide_active = 1;
			}
			
			if(generate_sales_counter_receipts  == null){
				gscr_active = 0;
			}
			else{
				gscr_active = 1;
			}
			
			if(collection_from_customers_entries == null){
				cfce_active = 0;
			}
			else{
				cfce_active = 1;
			}
			if(payment_to_suppliers_entries == null){
				ptse_active = 0;
			}
			else{
				ptse_active = 1;
			}
			//UPDATE ENTRIES ACCESS OF THE USER
			userImplem.modifyEntriesofUser(user, se_active, sre_active, pe_active, pre_active, iqae_active, ide_active, gscr_active, cfce_active, ptse_active);
		
		}
		
		//IF MODIFIED IS FILES
		if(transactionTab.equals("files")){
			int if_active, cf_active, sf_active, af_active, cbf_active;
			String inventory_file = request.getParameter("inventory_file");
			String customer_file = request.getParameter("customer_file");
			String supplier_file = request.getParameter("supplier_file");
			String agent_file = request.getParameter("agent_file");
			String customer_bank_file = request.getParameter("customer_bank_file");
			
			if(inventory_file == null){
				if_active = 0;
			}
			else{
				if_active = 1;
			}
			
			if(customer_file == null){
				cf_active = 0;
			}
			
			else{
				cf_active = 1;
			}
			if(supplier_file == null){
				sf_active = 0;
			}
			else{
				sf_active = 1;
			}
			if(agent_file == null){
				af_active = 0;
			}
			else{
				af_active = 1;
			}
			if(customer_bank_file == null){
				cbf_active = 0;
			}
			
			else{
				cbf_active = 1;
			}
			
			//UPDATE FILES ACCESS OF THE USER
			userImplem.modifyFilesofUser(user, if_active, cf_active, sf_active, af_active, cbf_active);
 		}
		
		
		//IF MODIFIED IS REPORTS
		if(transactionTab.equals("reports")){
			//FOR REPORTS TABLE
			int sr_active, srr_active, pr_active, prr_active, iiot_active, cl_active, sl_active, al_active;
			//FOR PRODUCT LIST TABLE
			int pli_active, pll_active, ei_active, el_active, enp_active, i_active, lpbc_active, dis_active, qai_active;
		    
			String sales_reports = request.getParameter("sales_reports");
			String sales_return_reports = request.getParameter("sales_return_reports");
			String purchase_reports = request.getParameter("purchase_reports");
			String purchase_return_reports = request.getParameter("purchase_return_reports");
			String item_in_out_transactions = request.getParameter("item_in_out_transactions");
		    String customers_list = request.getParameter("customers_list");
		    String suppliers_list = request.getParameter("suppliers_list");
		    String agent_list = request.getParameter("agent_list");
		    
		    
		    String price_list_imported = request.getParameter("price_list_imported");
		    String price_list_local = request.getParameter("price_list_local");
		    String external_imported = request.getParameter("external_imported");
		    String external_local = request.getParameter("external_local");
		    String external_no_price = request.getParameter("external_no_price");
		    String internal = request.getParameter("internal");
		    String list_products_by_category = request.getParameter("list_products_by_category");
		    String damaged_inventory_summary = request.getParameter("damaged_inventory_summary");
		    String quantity_adjustment_inventory = request.getParameter("quantity_adjustment_inventory");
		    
		    if(sales_reports == null){
		      sr_active = 0;	
		    }
		    else{
		      sr_active = 1;
		    }
		    
		    if(sales_return_reports == null){
		    	srr_active = 0;
		    }
		    
		    else{
		    	srr_active = 1;
		    }
		    
		    
		    if (purchase_reports == null){
		    	pr_active = 0;
		    }
		    else{
		    	pr_active = 1;
		    }
		    
		    if(purchase_return_reports == null){
		    	prr_active = 0;
		    }
		    else{
		    	prr_active = 1;
		    }
		
		    if(item_in_out_transactions == null){
		    	iiot_active = 0;
		    }
		    else{
		    	iiot_active = 1;
		    }
		    
		    
		    if(customers_list == null){
		    	cl_active = 0;
		    }
		    else{
		    	cl_active = 1;
		    }
		    
		    if(suppliers_list == null){
		    	sl_active = 0;
		    }
		    else{
		    	sl_active = 1;
		    }
		    
		    if(agent_list == null){
		    	al_active = 0;
		    }
		    else{
		    	al_active = 1;
		    }
		    
		    
		    
		    if (price_list_imported == null){
		    	pli_active = 0;
		    }
		    else{
		    	pli_active = 1;
		    }
		    
		    if(price_list_local == null){
		    	pll_active = 0;
		    }
		    else{
		    	pll_active = 1;
		    }
		    if(external_imported == null){
		    	ei_active = 0;
		    }
		    else{
		    	ei_active = 1;
		    }
		    if(external_local == null){
		    	el_active = 0;
		    }
		    else{
		    	el_active = 1;
		    }
		    if(external_no_price == null){
		    	enp_active = 0;
		    }
		    else{
		    	enp_active = 1;
		    }
		    if(internal == null){
		    	i_active = 0;
		    }
		    else{
		    	i_active = 1;
		    }
		    
		    if(list_products_by_category == null){
		    	lpbc_active = 0;
		    }
		    else{
		    	lpbc_active = 1;
		    }
		    
		    if(damaged_inventory_summary == null){
		    	dis_active = 0;
		    }
		    else{
		    	dis_active = 1;
		    }
		    if(quantity_adjustment_inventory == null){
		    	qai_active = 0;
		    }
		    else{
		    	qai_active = 1;
		    }
		    
		    
		    //UPDATE REPORTS ACCESS OF THE USER
		    userImplem.modifyReportsofUser(user, sr_active, srr_active, pr_active, prr_active, iiot_active, cl_active, sl_active, al_active);
		    
		    //UPDATE PRODUCT LIST ACCESS OF THE USER
		    userImplem.modifyProductListofUser(user, pli_active, pll_active, ei_active, el_active, enp_active, i_active, lpbc_active, dis_active, qai_active);
		    
		}
		
		if(transactionTab.equals("tools")){
			//FOR TOOLS TABLE
			int ves_active, vesr_active, vep_active, vepr_active, vecr_active, veqsa_active, veid_active, ct_active, st_active, ac_active, cp_active;
		     
			String view_edit_sales = request.getParameter("view_edit_sales");
			String view_edit_sales_returns = request.getParameter("view_edit_sales_returns");
			String view_edit_purchases = request.getParameter("view_edit_purchases");
		    String view_edit_purchases_returns = request.getParameter("view_edit_purchases_returns");
		    String view_edit_counter_receipts = request.getParameter("view_edit_counter_receipts");
		    String view_edit_quantity_stock_adjustments = request.getParameter("view_edit_quantity_stock_adjustments");
		    String view_edit_inventory_damages = request.getParameter("view_edit_inventory_damages");
		    String customer_transactions = request.getParameter("customer_transactions");
		    String supplier_transactions = request.getParameter("supplier_transactions");
		    String administrator_control = request.getParameter("administrator_control");
		    String change_password = request.getParameter("change_password");
		    
		    if(view_edit_sales == null){	
		       ves_active = 0;
		    }
		    else{
		    	ves_active = 1;
		    }
		    
		    
		    
		    if(view_edit_sales_returns == null){
		    	vesr_active = 0;
		    }
		    
		    else{
		    	vesr_active = 1;
		    }
		    
		    
		    
		    if(view_edit_purchases == null){
		    	vep_active = 0;
		    }
		    else{
		    	vep_active = 1;
		    }
		    
		    
		    
		    if(view_edit_purchases_returns == null){
		    	vepr_active = 0;
		    }
		    else{
		    	vepr_active = 1;
		    }
		    
		    
		    if(view_edit_counter_receipts == null){
		    	vecr_active = 0;
		    }
		    else{
		    	vecr_active = 1;
		    }
		    
		    
		    if(view_edit_quantity_stock_adjustments == null){
		    	veqsa_active = 0;
		    }
		    
		    else{
		    	veqsa_active = 1;
		    }
		    
		    if(view_edit_inventory_damages == null){
		    	veid_active = 0;
		    }
		    
		    else{
		    	veid_active = 1;
		    }
 		    
		    if(customer_transactions == null){
		    	ct_active = 0;
		    }
		    else{
		    	ct_active = 1;
		    }
		    
		    if(supplier_transactions == null){
		    	st_active = 0;
		    }
		    else{
		    	st_active = 1;
		    }
		
		    
		    if(administrator_control == null){
		    	ac_active = 0;
		    }
		    else{
		    	ac_active = 1;
		    }
		    
		    if(change_password == null){
		    	cp_active = 0;
		    }
		    else{
		    	cp_active = 1;
		    }
		    
		    //UPDATE TOOLS ACCESS LIST OF THE USER
		     userImplem.modifyToolsOfUser(user, ves_active, vesr_active, vep_active, vepr_active, vecr_active, veqsa_active, veid_active, ct_active, st_active, ac_active, cp_active);
		     
		}
	 
		 //SET ACKNOWLEDGMENT PROPERTIES (IMPORTANT FOR AUDITING)
		 Date date = new Date();
		 SimpleDateFormat dateFormatter = new SimpleDateFormat("EEEE, MMMM d, yyyy");

        
	    request.setAttribute("transactionDetails", "Access Modified for user " + user);
	    request.setAttribute("currentDate", dateFormatter.format(date));
		

		return "AcknowledgementPage";
	}
}
