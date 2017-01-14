package Controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Implem.UserImplem;
import Models.User;

@Controller
// HOME METHOD 
public class HomeController {
@Autowired
UserImplem userImplem;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homePage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String user;
        
		Date dateToday  = new Date();
        SimpleDateFormat dateFormatter = new SimpleDateFormat("EEEE, MMMM d, yyyy");

        
		//CHECK PRINCIPAL IF SET OF USERDETAILS
		if (principal instanceof UserDetails) {
			String username = ((UserDetails) principal).getUsername();
			user = username;
			session.setAttribute("username", username);
		} else {
			String username = principal.toString();
			user = username;
			session.setAttribute("username", username);
		}
		//SETS THE CURRENT DATE
		session.setAttribute("dateToday", dateFormatter.format(dateToday));
		
		//TABS INITIALIZATION ADDED BY SAV(2016/1/8)
	    User retrievedEntriesAccess = userImplem.retrieveUserEntriesAccess(user);
	    User retrievedFilesAccess = userImplem.retrieveUserFilesAccess(user);
	    User retrievedReportsAccess = userImplem.retrieveUserReportsAccess(user);
	    User retreivedProductListAccess = userImplem.retrieveUserProductListAccess(user);
	    User retrievedToolsAccess = userImplem.retrieveUserToolsAccess(user);
	    
	    //ENTRIES TAB INITIALIZATION
	    session.setAttribute("salesEntries", retrievedEntriesAccess.getSalesEntries());
		session.setAttribute("salesReturnEntries", retrievedEntriesAccess.getSalesReturnEntries());
		session.setAttribute("purchaseEntries", retrievedEntriesAccess.getPurchaseEntries());
		session.setAttribute("purchaseReturnEntries", retrievedEntriesAccess.getPurchaseReturnEntries());
		session.setAttribute("inventoryQuantityAdjustmentEntries", retrievedEntriesAccess.getInventoryQuantityAdjustmentEntries());
		session.setAttribute("inventoryDamageEntries", retrievedEntriesAccess.getInventoryDamageEntries());
	    session.setAttribute("generateSalesCounterReceipts", retrievedEntriesAccess.getGenerateSalesCounterReceipts());
	    session.setAttribute("collectionFromCustomersEntries", retrievedEntriesAccess.getCollectionFromCustomersEntries());
	    session.setAttribute("paymentToSuppliersEntries", retrievedEntriesAccess.getPaymentToSuppliersEntries());
		
	    //CHECK IF ENTRIES TAB IS VISIBLE 
	    int entriesIsVisible = retrievedEntriesAccess.getSalesEntries() + 
	    		               retrievedEntriesAccess.getSalesReturnEntries() +
	    		               retrievedEntriesAccess.getPurchaseEntries() +
	    		               retrievedEntriesAccess.getPurchaseReturnEntries() +
	    		               retrievedEntriesAccess.getInventoryQuantityAdjustmentEntries() +
	    		               retrievedEntriesAccess.getInventoryDamageEntries() +
	    		               retrievedEntriesAccess.getGenerateSalesCounterReceipts() +
	    		               retrievedEntriesAccess.getCollectionFromCustomersEntries() +
	    		               retrievedEntriesAccess.getPaymentToSuppliersEntries();
	    
	    session.setAttribute("entriesIsVisible", entriesIsVisible);
		//FILES TAB INITIALIZATION
	    session.setAttribute("inventoryFile", retrievedFilesAccess.getInventoryFile());
	    session.setAttribute("customerFile", retrievedFilesAccess.getCustomerFile());
	    session.setAttribute("supplierFile", retrievedFilesAccess.getSupplierFile());
	    session.setAttribute("agentFile", retrievedFilesAccess.getAgentFile());
	    session.setAttribute("customerBankFile", retrievedFilesAccess.getCustomerBankFile());
	    
	    int filesIsVisible =  retrievedFilesAccess.getInventoryFile() +
	    		              retrievedFilesAccess.getCustomerFile() +
	    		              retrievedFilesAccess.getSupplierFile() +
	    		              retrievedFilesAccess.getAgentFile() +
	    		              retrievedFilesAccess.getCustomerBankFile();
	    		              
	    session.setAttribute("filesIsVisible", filesIsVisible);		              
       
	    //REPORTS TAB INITIALIZATION 
	    session.setAttribute("salesReports", retrievedReportsAccess.getSalesReports());
	    session.setAttribute("salesReturnReports", retrievedReportsAccess.getSalesReturnReports());
	    session.setAttribute("purchaseReports", retrievedReportsAccess.getPurchaseReports());
	    session.setAttribute("purchaseReturnReports", retrievedReportsAccess.getPurchaseReturnReports());
	    session.setAttribute("itemInOutTransactions", retrievedReportsAccess.getItemInOutTransactions());
	    session.setAttribute("customersList", retrievedReportsAccess.getCustomersList());
	    session.setAttribute("suppliersList", retrievedReportsAccess.getSuppliersList());
	    session.setAttribute("agentList", retrievedReportsAccess.getAgentList());
	    
	    //PRODUCT LIST TAB INITIALIZATION
	    session.setAttribute("priceListImported",  retreivedProductListAccess.getPriceListImported());
	    session.setAttribute("priceListLocal",  retreivedProductListAccess.getPriceListLocal());
	    session.setAttribute("externalImported",  retreivedProductListAccess.getExternalImported());
	    session.setAttribute("externalLocal",  retreivedProductListAccess.getExternalLocal());
	    session.setAttribute("externalNoPrice",  retreivedProductListAccess.getExternalNoPrice());
	    session.setAttribute("internal",  retreivedProductListAccess.getInternal());
	    session.setAttribute("listProductsByCategory",  retreivedProductListAccess.getListProductsByCategory());
	    session.setAttribute("damagedInventorySummary",  retreivedProductListAccess.getDamagedInventorySummary());
	    session.setAttribute("quantityAdjustmentInventory",  retreivedProductListAccess.getQuantityAdjustmentInventory());
	    
	    int productListIsVisible = retreivedProductListAccess.getPriceListImported() +
	    		                   retreivedProductListAccess.getPriceListLocal() +
	    		                   retreivedProductListAccess.getExternalImported() +
	    		                   retreivedProductListAccess.getExternalLocal() +
	    		                   retreivedProductListAccess.getExternalNoPrice() +
	    		                   retreivedProductListAccess.getInternal() +
	    		                   retreivedProductListAccess.getListProductsByCategory() +
	    		                   retreivedProductListAccess.getDamagedInventorySummary() +
	    		                   retreivedProductListAccess.getQuantityAdjustmentInventory();
	    
	    
	    session.setAttribute("productListIsVisible", productListIsVisible);
	    
	    int reportsIsVisible = retrievedReportsAccess.getSalesReports() +
	    		               retrievedReportsAccess.getSalesReturnReports() +
	    		               retrievedReportsAccess.getPurchaseReports() +
	    		               retrievedReportsAccess.getPurchaseReturnReports() +
	    		               retrievedReportsAccess.getItemInOutTransactions() +
	    		               retrievedReportsAccess.getCustomersList() +
	    		               retrievedReportsAccess.getSuppliersList() +
	    		               retrievedReportsAccess.getAgentList() +
	    		               productListIsVisible;
	    
	    session.setAttribute("reportsIsVisible", reportsIsVisible);
	    
	    //TOOLS TAB INITIALIZATION
	    session.setAttribute("viewEditSales", retrievedToolsAccess.getViewEditSales());
	    session.setAttribute("viewEditSalesReturns", retrievedToolsAccess.getViewEditSalesReturns());
	    session.setAttribute("viewEditPurchases", retrievedToolsAccess.getViewEditPurchases());
	    session.setAttribute("viewEditPurchasesReturns", retrievedToolsAccess.getViewEditPurchasesReturns());
	    session.setAttribute("viewEditCounterReceipts", retrievedToolsAccess.getViewEditCounterReceipts());
	    session.setAttribute("viewEditQuantityStockAdjustments", retrievedToolsAccess.getViewEditQuantityStockAdjustments());
	    session.setAttribute("viewEditInventoryDamages", retrievedToolsAccess.getViewEditInventoryDamages());;
	    session.setAttribute("customerTransactions", retrievedToolsAccess.getCustomerTransactions());
	    session.setAttribute("supplierTransactions", retrievedToolsAccess.getSupplierTransactions());
	    session.setAttribute("administratorControl", retrievedToolsAccess.getAdministratorControl());
	    session.setAttribute("changePassword", retrievedToolsAccess.getChangePassword());
	    
	    int toolsIsVisible = retrievedToolsAccess.getViewEditSales() +
	    		             retrievedToolsAccess.getViewEditSalesReturns() +
	    		             retrievedToolsAccess.getViewEditPurchases() +
	    		             retrievedToolsAccess.getViewEditPurchasesReturns() +
	    		             retrievedToolsAccess.getViewEditCounterReceipts() +
	    		             retrievedToolsAccess.getViewEditQuantityStockAdjustments() +
	    		             retrievedToolsAccess.getInventoryDamageEntries() +
	    		             retrievedToolsAccess.getCustomerTransactions() +
	    		             retrievedToolsAccess.getSupplierTransactions() +
	    		             retrievedToolsAccess.getAdministratorControl() +
	    		             retrievedToolsAccess.getChangePassword();
	   
	    session.setAttribute("toolsIsVisible", toolsIsVisible);
	    return new ModelAndView("home");
	}
	
	//LOGOUT METHOD
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request){
		ModelAndView model = new ModelAndView();
		//ADD MESSAGE IF LOGOUT
		model.addObject("message", "logout");
		model.setViewName("login");
		return model;
	}

 
	//LOGIN METHOD
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {

		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
		
	}


}
