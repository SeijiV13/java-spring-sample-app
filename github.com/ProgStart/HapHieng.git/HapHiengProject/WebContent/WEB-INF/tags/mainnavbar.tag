<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- MAIN NAVBAR TAG -->
<body>
	<div id="wrapper">
		<!-- SIDEBAR WRAPPER -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<div class="search-form-box">
         
					<li class="sidebar-brand"><a href="#" style="color: white">HapHieng
							Inventory System
					</a></li> <br>
					<h3 style="color: white;">
						Menu <span class="fa fa-sticky-note"></span>
					</h3>

					<!-- MENU LIST -->
						
					<c:if test="${entriesIsVisible > 0}">	
						<button data-toggle="collapse" data-target="#entries-menu"
						class="btn btn-primary dropdown-toggle menu-button" type="button"
						data-toggle="dropdown">
						Entries <span class="caret"></span>
					</button>
					<!-- ENTRIES SUBMENU -->
					<div id="entries-menu" class="collapse">
					     <c:if test="${salesEntries == 1}">
						<a href="SalesEntries.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Sales  Entries<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${salesReturnEntries == 1}">
						<a href="SalesReturnEntries.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Sales Return  Entries<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${purchaseEntries == 1}">
						<a href="PurchaseEntries.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Purchase  Entries<span></span>
						</button></a>
						</c:if>

						<c:if test="${purchaseReturnEntries == 1}">
						<a href="PurchaseReturnEntries.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Purchase Return  Entries<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${inventoryQuantityAdjustmentEntries == 1}">
						<a href="InventoryQuantityAdjustmentEntries.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Inventory Quantity Adjustment  Entries<span></span>
						</button></a>
						</c:if>
						
							
						<c:if test="${inventoryDamageEntries == 1}">
						<a href="InventoryDamageEntries.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Inventory Damage Entries<span></span>
						</button></a>
						</c:if>
						
						
						<c:if test="${generateSalesCounterReceipts == 1}">
						<a href="GenerateSalesCounterReceipts.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Generate Sales Counter Receipts<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${collectionFromCustomersEntries == 1}">
						<a href="CollectionFromCustomersEntries.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Collection From Customers Entries<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${paymentToSuppliersEntries == 1}">
						<a href="PaymentToSuppliersEntries.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Payment to Suppliers Entries<span></span>
						</button></a>
						</c:if>
						
					</div>
					</c:if>
					
					<!-- FILE MENU -->
					<c:if test="${filesIsVisible > 0 }">
					<button data-toggle="collapse" data-target="#files-menu"
						class="btn btn-primary dropdown-toggle menu-button" type="button"
						data-toggle="dropdown">
						File <span class="caret"></span>
					</button>
					<!-- FILE SUBMENU -->
					<div id="files-menu" class="collapse">
						<c:if test="${inventoryFile == 1}">
						<a href="InventoryFile.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Inventory File<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${customerFile == 1}">
						<a href="CustomerFile.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Customer File<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${supplierFile == 1}">
						<a href="SupplierFile.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Supplier File<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${agentFile == 1}">
						<a href="AgentFile.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Agent File<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${customerBankFile == 1}">
						<a href="CustomerBankFile.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Customer Bank File<span></span>
						</button></a>
						</c:if>
						
					</div>
					</c:if>
					
					<!-- REPORT MENU -->
					<c:if test="${reportsIsVisible > 0}">
                    	<button data-toggle="collapse" data-target="#reports-menu"
						class="btn btn-primary dropdown-toggle menu-button" type="button"
						data-toggle="dropdown">
						Reports<span class="caret"></span>
					</button>
					<!-- REPORT SUBMENU -->
					<div id="reports-menu" class="collapse">
						
						<c:if test="${salesReports == 1 }">
						<a href="SalesReports.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Sales Reports<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${salesReturnReports == 1}">
						<a href="SalesReturnReports.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Sales Return Reports<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${purchaseReports == 1}">
						<a href="PurchaseReports.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Purchase Reports<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${purchaseReturnReports == 1}">
						<a href="PurchaseReturnReports.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Purchase Return Reports<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${itemInOutTransactions == 1}">
						<a href="ItemInOutTransactions.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Item-In Out Transactions<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${productListIsVisible > 0 }">
						<button data-toggle="collapse" data-target="#product-list-menu"
						class="btn btn-info dropdown-toggle menu-button" type="button"
						data-toggle="dropdown">
						Product List <span class="caret"></span></button>
						
						<div id="product-list-menu" class="collapse">
						     <c:if test ="${priceListImported == 1}">
						    <a href="PriceListImported.htm"><button class="btn btn-info dropdown-toggle menu-button">
							   Price List (Imported)<span></span>
						     </button></a>
						     </c:if>
						     
						     <c:if test ="${priceListLocal == 1}">
						     <a href="PriceListLocal.htm"><button class="btn btn-info dropdown-toggle menu-button">
							   Price List (Local)<span></span>
						     </button></a>
						     </c:if>
						     
						     <c:if test ="${externalImported == 1}">
						     <a href="ExternalListAllProductsImported.htm"><button class="btn btn-info dropdown-toggle menu-button">
							   External - List All Products (Imported)<span></span>
						     </button></a>
						     </c:if>
						     
						     <c:if test ="${externalLocal == 1}">
						     <a href=" ExternalListAllProductsLocal.htm"><button class="btn btn-info dropdown-toggle menu-button">
							   External - List All Products (Local) <span></span>
						     </button></a>
						     </c:if>
						     
						     <c:if test ="${externalNoPrice == 1}">
						     <a href="ExternalListAllProductsNoPrice.htm"><button class="btn btn-info dropdown-toggle menu-button">
							   External - List All Products (No Price) <span></span>
						     </button></a>
						     </c:if>
						     
						     <c:if test ="${internal == 1}">
						     <a href=" InternalListAllProducts.htm"><button class="btn btn-info dropdown-toggle menu-button">
							   Internal - List All Products<span></span>
						     </button></a>
						     </c:if>
						     
						     <c:if test ="${listProductsByCategory == 1}"> 
						     <a href="ListProductsByCategory.htm"><button class="btn btn-info dropdown-toggle menu-button">
							   List Products by Category<span></span>
						     </button></a>
						     </c:if>
						     
						     <c:if test ="${damagedInventorySummary == 1}">
						     <a href="DamagedInventorySummary.htm"><button class="btn btn-info dropdown-toggle menu-button">
							   Damaged Inventory Summary <span></span>
						     </button></a>
						     </c:if>
						     
						     <c:if test ="${quantityAdjustmentInventory == 1}">
						     <a href="QuantityAdjustmentInventory.htm"><button class="btn btn-info dropdown-toggle menu-button">
							   Quantity Adjustment Inventory <span></span>
						     </button></a>
						     </c:if>
						</div>
						</c:if>
						
						<c:if test="${customersList == 1}">
						<a href="CustomersList.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Customers List<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${suppliersList == 1}">
						<a href="SuppliersList.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Suppliers List<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${agentList == 1}">
						<a href="AgentList.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Agent List<span></span>
						</button></a>
						</c:if>
				
					</div>
					</c:if>
					
					
					<!-- TOOLS MENU -->
					<c:if test="${toolsIsVisible > 0}">
					<button data-toggle="collapse" data-target="#tools-menu"
						class="btn btn-primary dropdown-toggle menu-button" type="button"
						data-toggle="dropdown">
						Tools <span class="caret"></span>
					</button>
					<!-- TOOLS SUBMENU -->
					<div id="tools-menu" class="collapse">
						 <c:if test="${viewEditSales == 1}">
						<a href="ViewEditSales.htm"><button class="btn btn-info dropdown-toggle menu-button">
							View/Edit Sales<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${viewEditSalesReturns  == 1}">
						<a href="ViewEditSalesReturns.htm"><button class="btn btn-info dropdown-toggle menu-button">
							View/Edit Sales Returns<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${viewEditPurchases == 1}">
						<a href="ViewEditPurchases.htm"><button class="btn btn-info dropdown-toggle menu-button">
							View/Edit Sales Purchases<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${viewEditPurchasesReturns == 1}">
						<a href="ViewEditPurchasesReturns.htm"><button class="btn btn-info dropdown-toggle menu-button">
							View/Edit Sales Purchases Returns<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${viewEditCounterReceipts == 1}">
						<a href="ViewEditCounterReceipts.htm"><button class="btn btn-info dropdown-toggle menu-button">
							View/Edit Counter Receipts<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${viewEditQuantityStockAdjustments  == 1}">
						<a href="ViewEditQuantityStockAdjustments.htm"><button class="btn btn-info dropdown-toggle menu-button">
							View/Edit Quantity Stock Adjustments<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${viewEditInventoryDamages  == 1}">
						<a href="ViewEditInventoryDamages.htm"><button class="btn btn-info dropdown-toggle menu-button">
							View/Edit Inventory Damages<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${customerTransactions  == 1}">
						<a href="CustomerTransactions.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Customer Transactions<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${supplierTransactions  == 1}">
						<a href="SupplierTransactions.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Supplier Transactions<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${administratorControl  == 1}">
						<a href="AdministratorControl.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Administrator Control<span></span>
						</button></a>
						</c:if>
						
						<c:if test="${changePassword  == 1}">
						<a href="ChangePassword.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Change Password<span></span>
						</button></a>
						</c:if>
					
					</div>
					</c:if>
					
					<!-- HELP MENU -->
					<button data-toggle="collapse" data-target="#help-menu"
						class="btn btn-primary dropdown-toggle menu-button" type="button"
						data-toggle="dropdown">
						Help <span class="caret"></span>
					</button>
					<!-- HELP SUBMENU -->
					<div id="help-menu" class="collapse">
						
						<a href="About.htm"><button class="btn btn-info dropdown-toggle menu-button">
							About<span></span>
						</button></a>
						<a href="ContactUs.htm"><button class="btn btn-info dropdown-toggle menu-button">
							Contact Us<span></span>
						</button></a>
					
					</div>
			
			
				

				
			



					<br> <br>

				</div>
			</ul>
		</div>
		<!-- /#SIDEBAR WRAPPER -->
