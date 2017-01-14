package Models;

public class User {
  
	String username = null;
	//ENTRIES COLUMN
	int salesEntries = 0;
    int salesReturnEntries = 0;
    int purchaseEntries = 0;
    int purchaseReturnEntries = 0;
	int inventoryQuantityAdjustmentEntries = 0;
	int inventoryDamageEntries = 0;
	int generateSalesCounterReceipts = 0;
	int collectionFromCustomersEntries = 0;
	int paymentToSuppliersEntries = 0;
	
	//FILES COLUMN
	int inventoryFile = 0;
	int customerFile = 0;
	int supplierFile = 0;
	int agentFile = 0;
	int customerBankFile = 0;
	
	//REPORTS COLUMN
	int salesReports = 0;
	int salesReturnReports = 0;
	int purchaseReports = 0;
	int purchaseReturnReports = 0;
	int itemInOutTransactions = 0;
	int customersList = 0;
	int suppliersList = 0;
	int agentList = 0;
	
	//PRODUCT LIST COLUMN
	int priceListImported = 0;
	int priceListLocal = 0;
	int externalImported = 0;
	int externalLocal = 0;
	int externalNoPrice = 0;
	int internal = 0;
	int listProductsByCategory = 0;
	int damagedInventorySummary = 0;
	int quantityAdjustmentInventory = 0;
	
	//TOOLS COLUMN
	int viewEditSales = 0;
	int viewEditSalesReturns = 0;
	int viewEditPurchases = 0;
	int viewEditPurchasesReturns = 0;
	int viewEditCounterReceipts = 0;
	int viewEditQuantityStockAdjustments = 0;
	int viewEditInventoryDamages = 0;
	int customerTransactions = 0;
	int supplierTransactions = 0;
	int administratorControl = 0;
	int changePassword = 0;
	
	
	//ENTRIES GETTER AND SETTER
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getSalesEntries() {
		return salesEntries;
	}
	public void setSalesEntries(int salesEntries) {
		this.salesEntries = salesEntries;
	}
	public int getSalesReturnEntries() {
		return salesReturnEntries;
	}
	public void setSalesReturnEntries(int salesReturnEntries) {
		this.salesReturnEntries = salesReturnEntries;
	}
	public int getPurchaseEntries() {
		return purchaseEntries;
	}
	public void setPurchaseEntries(int purchaseEntries) {
		this.purchaseEntries = purchaseEntries;
	}
	public int getPurchaseReturnEntries() {
		return purchaseReturnEntries;
	}
	public void setPurchaseReturnEntries(int purchaseReturnEntries) {
		this.purchaseReturnEntries = purchaseReturnEntries;
	}
	public int getInventoryQuantityAdjustmentEntries() {
		return inventoryQuantityAdjustmentEntries;
	}
	public void setInventoryQuantityAdjustmentEntries(int inventoryQuantityAdjustmentEntries) {
		this.inventoryQuantityAdjustmentEntries = inventoryQuantityAdjustmentEntries;
	}
	public int getInventoryDamageEntries() {
		return inventoryDamageEntries;
	}
	public void setInventoryDamageEntries(int inventoryDamageEntries) {
		this.inventoryDamageEntries = inventoryDamageEntries;
	}
	public int getGenerateSalesCounterReceipts() {
		return generateSalesCounterReceipts;
	}
	public void setGenerateSalesCounterReceipts(int generateSalesCounterReceipts) {
		this.generateSalesCounterReceipts = generateSalesCounterReceipts;
	}
	public int getCollectionFromCustomersEntries() {
		return collectionFromCustomersEntries;
	}
	public void setCollectionFromCustomersEntries(int collectionFromCustomersEntries) {
		this.collectionFromCustomersEntries = collectionFromCustomersEntries;
	}
	public int getPaymentToSuppliersEntries() {
		return paymentToSuppliersEntries;
	}
	public void setPaymentToSuppliersEntries(int paymentToSuppliersEntries) {
		this.paymentToSuppliersEntries = paymentToSuppliersEntries;
	}
	
	
	//FILES GETTER AND SETTER
	public int getInventoryFile() {
		return inventoryFile;
	}
	public void setInventoryFile(int inventoryFile) {
		this.inventoryFile = inventoryFile;
	}
	public int getCustomerFile() {
		return customerFile;
	}
	public void setCustomerFile(int customerFile) {
		this.customerFile = customerFile;
	}
	public int getSupplierFile() {
		return supplierFile;
	}
	public void setSupplierFile(int supplierFile) {
		this.supplierFile = supplierFile;
	}
	public int getAgentFile() {
		return agentFile;
	}
	public void setAgentFile(int agentFile) {
		this.agentFile = agentFile;
	}
	public int getCustomerBankFile() {
		return customerBankFile;
	}
	public void setCustomerBankFile(int customerBankFile) {
		this.customerBankFile = customerBankFile;
	}
	
	//REPORTS GETTER AND SETTER
	public int getSalesReports() {
		return salesReports;
	}
	public void setSalesReports(int salesReports) {
		this.salesReports = salesReports;
	}
	public int getSalesReturnReports() {
		return salesReturnReports;
	}
	public void setSalesReturnReports(int salesReturnReports) {
		this.salesReturnReports = salesReturnReports;
	}
	public int getPurchaseReports() {
		return purchaseReports;
	}
	public void setPurchaseReports(int purchaseReports) {
		this.purchaseReports = purchaseReports;
	}
	public int getPurchaseReturnReports() {
		return purchaseReturnReports;
	}
	public void setPurchaseReturnReports(int purchaseReturnReports) {
		this.purchaseReturnReports = purchaseReturnReports;
	}
	public int getItemInOutTransactions() {
		return itemInOutTransactions;
	}
	public void setItemInOutTransactions(int itemInOutTransactions) {
		this.itemInOutTransactions = itemInOutTransactions;
	}
	public int getCustomersList() {
		return customersList;
	}
	public void setCustomersList(int customersList) {
		this.customersList = customersList;
	}
	public int getSuppliersList() {
		return suppliersList;
	}
	public void setSuppliersList(int suppliersList) {
		this.suppliersList = suppliersList;
	}
	public int getAgentList() {
		return agentList;
	}
	public void setAgentList(int agentList) {
		this.agentList = agentList;
	}
	
	
	//PRODUCT LIST GETTER AND SETTER
	public int getPriceListImported() {
		return priceListImported;
	}
	public void setPriceListImported(int priceListImported) {
		this.priceListImported = priceListImported;
	}
	public int getPriceListLocal() {
		return priceListLocal;
	}
	public void setPriceListLocal(int priceListLocal) {
		this.priceListLocal = priceListLocal;
	}
	public int getExternalImported() {
		return externalImported;
	}
	public void setExternalImported(int externalImported) {
		this.externalImported = externalImported;
	}
	public int getExternalLocal() {
		return externalLocal;
	}
	public void setExternalLocal(int externalLocal) {
		this.externalLocal = externalLocal;
	}
	public int getExternalNoPrice() {
		return externalNoPrice;
	}
	public void setExternalNoPrice(int externalNoPrice) {
		this.externalNoPrice = externalNoPrice;
	}
	public int getInternal() {
		return internal;
	}
	public void setInternal(int internal) {
		this.internal = internal;
	}
	public int getListProductsByCategory() {
		return listProductsByCategory;
	}
	public void setListProductsByCategory(int listProductsByCategory) {
		this.listProductsByCategory = listProductsByCategory;
	}
	public int getDamagedInventorySummary() {
		return damagedInventorySummary;
	}
	public void setDamagedInventorySummary(int damagedInventorySummary) {
		this.damagedInventorySummary = damagedInventorySummary;
	}
	public int getQuantityAdjustmentInventory() {
		return quantityAdjustmentInventory;
	}
	public void setQuantityAdjustmentInventory(int quantityAdjustmentInventory) {
		this.quantityAdjustmentInventory = quantityAdjustmentInventory;
	}

	
	//TOOLS GETTER AND SETTER
	public int getViewEditSales() {
		return viewEditSales;
	}
	public void setViewEditSales(int viewEditSales) {
		this.viewEditSales = viewEditSales;
	}
	public int getViewEditSalesReturns() {
		return viewEditSalesReturns;
	}
	public void setViewEditSalesReturns(int viewEditSalesReturns) {
		this.viewEditSalesReturns = viewEditSalesReturns;
	}
	public int getViewEditPurchases() {
		return viewEditPurchases;
	}
	public void setViewEditPurchases(int viewEditPurchases) {
		this.viewEditPurchases = viewEditPurchases;
	}
	public int getViewEditPurchasesReturns() {
		return viewEditPurchasesReturns;
	}
	public void setViewEditPurchasesReturns(int viewEditPurchasesReturns) {
		this.viewEditPurchasesReturns = viewEditPurchasesReturns;
	}
	public int getViewEditCounterReceipts() {
		return viewEditCounterReceipts;
	}
	public void setViewEditCounterReceipts(int viewEditCounterReceipts) {
		this.viewEditCounterReceipts = viewEditCounterReceipts;
	}
	public int getViewEditQuantityStockAdjustments() {
		return viewEditQuantityStockAdjustments;
	}
	public void setViewEditQuantityStockAdjustments(int viewEditQuantityStockAdjustments) {
		this.viewEditQuantityStockAdjustments = viewEditQuantityStockAdjustments;
	}
	public int getViewEditInventoryDamages() {
		return viewEditInventoryDamages;
	}
	public void setViewEditInventoryDamages(int viewEditInventoryDamages) {
		this.viewEditInventoryDamages = viewEditInventoryDamages;
	}
	public int getCustomerTransactions() {
		return customerTransactions;
	}
	public void setCustomerTransactions(int customerTransactions) {
		this.customerTransactions = customerTransactions;
	}
	public int getSupplierTransactions() {
		return supplierTransactions;
	}
	public void setSupplierTransactions(int supplierTransactions) {
		this.supplierTransactions = supplierTransactions;
	}
	public int getAdministratorControl() {
		return administratorControl;
	}
	public void setAdministratorControl(int administratorControl) {
		this.administratorControl = administratorControl;
	}
	public int getChangePassword() {
		return changePassword;
	}
	public void setChangePassword(int changePassword) {
		this.changePassword = changePassword;
	}
	

	
	
	
}
