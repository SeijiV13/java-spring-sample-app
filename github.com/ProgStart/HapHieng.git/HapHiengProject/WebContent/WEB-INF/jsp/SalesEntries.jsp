<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="navbar" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HapHieng Inventory System</title>
<!--  JQUERY AND JS LINKS -->
<spring:url value="/resources/js/jquery/jquery.min.js" var="JQuery" />
<script src="${JQuery}" type="text/javascript"></script>

<spring:url value="/resources/js/jquery/jquery.tabletojson.min.js" var="JQueryTable" />
<script src="${JQueryTable}" type="text/javascript"></script>

<spring:url value="/resources/js/script.js" var="JScript" />
<script src="${JScript}" type="text/javascript"></script>

<!-- BOOTSTRAP LINKS -->
<spring:url value="/resources/bootstrap/js/bootstrap.min.js"
	var="BootstrapJS" />
<script src="${BootstrapJS}" type="text/javascript"></script>

<spring:url value="/resources/bootstrap/css/bootstrap.min.css"
	var="BootstrapCSS" />
<link rel="stylesheet" href="${BootstrapCSS}" />

<!-- FONT-AWESOME LINKS -->
<spring:url value="/resources/font-awesome/css/font-awesome.min.css"
	var="FontAwesome" />
<link rel="stylesheet" href="${FontAwesome}" />

<!-- SIDEBAR CSS -->
<spring:url value="/resources/css/simple-sidebar.css" var="SideBar" />
<link rel="stylesheet" href="${SideBar}" />

<!-- CSS LINKS -->
<spring:url value="/resources/css/style.css" var="styles" />
<link rel="stylesheet" href="${styles}" />

<link href="<c:url value="/resources/css/style-media.css" />"
	rel="stylesheet">

<!-- DATEPICKER LINKS -->
<spring:url value="/resources/js/bootstrap-datepicker.js" var="DatePJS" />
<script src="${DatePJS}" type="text/javascript"></script>

<spring:url value="/resources/css/boostrap-datepicker.css"
	var="DatePCss" />
<link rel="stylesheet" href="${DatePCss}" />

<!-- FONT LINKS -->
<link href="http://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet" type="text/css">
	
<style>
.double-input .form-control {
    width: 80%;
    border-right-width: 1px;
}
.double-input .form-control:focus {
    border-right-width: 1px;
}
.first-input{
  width: 25px !important;
  border-right:none !important;
  padding-right: 1px !important;
  text-align: right;
  text-transform:uppercase;
}
.second-input{
  border-left:none !important;
  padding-left:0px !important;
  text-align: left;
  background-color: #FFFFFF !important;
}
.inlinetext{
	border: 0;
	padding: 18px 0px;
	margin: -8px -8px;
	width: 40px;
}
</style>
</head>
<body>

	<!-- CIRI -->

	<!-- ADDED BY SEIJI VILLAFRANCA 2016/11/26 -->
	<!-- MAIN NAVBAR TAG -->
	<navbar:mainnavbar />
	<!-- FOUND IN /WEB-INF/tags/mainnavbar.tag -->


	<!-- PAGE CONTENT -->
	<div id="page-content-wrapper">
		<!-- CLOSE MENU BAR AND SIGNOUT BUTTON -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<a href="#menu-toggle" class="btn btn-primary" id="menu-toggle">
						Close Menu Bar</a>


					<div class="pull-right">
						<a href="javascript:formSubmit()" class="btn btn-primary"> <span
							class="fa fa-sign-out"></span> Sign Out
						</a>

						<c:url value="/logout" var="logoutUrl" />
						<form action="${logoutUrl}" method="post" id="logoutForm">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
					</div>

					<!-- MENU COUNTER ADDED BY SEIJI VILLAFRANCA 2016/11/19 -->
					<input value="1" id="menustate" hidden> <br> <br>

				</div>

			</div>
		</div>

		<!-- MAIN CONTENT -->
		<div class="container-fluid SE">
			<!-- TITLE OF PAGE -->
			<h3>Sales Entries</h3>

			<hr>
			<div class="row">
				<modal:addcustomer />
				<modal:addagent />
				<form>

					<div class="form-horizontal col-md-12">
						<div class="col-md-4">
							<label class="control-label col-md-4" for="drno">DR Ref.
								No.</label>
							<div class="col-md-8 input-group double-input">
								<input type="text" class="form-control first-input" maxlength="1" size="1" id="drnochar" required>
								<input type="text" class="form-control second-input" id="drno" readOnly>
							</div>
						</div>
						
						<div class="col-md-4">
							<label class="control-label col-md-2" for="date">Date</label>
							<div class="col-md-10">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control" id="date" value="${dateToday}">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<label class="control-label col-md-3">WC/RC: </label>
							<div class="col-md-9">
								<select class="form-control" id="wcrc">
									<option value="" selected></option>
									<option value="WC">WC</option>
									<option value="RC">RC</option>
								</select>
							</div>
						</div>
					</div>
					
					<div class="form-horizontal col-md-12">
						<div class="col-md-4">
							<div class="col-md-5">
								<button class="btn btn-default bg_dblue btn-add" data-target="#addcustomer" data-toggle="modal" type="button"> Add Customer </button>
							</div>
							
							<div class="col-md-7">
								<select class="form-control" id="customer">
							  	<option value="Customer" selected="selected">None</option>
									<c:forEach var="customers" items="${sessionScope.customers}">
										<option value="${customers.customer_code}">${customers.description}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="col-md-3">
							<label class="control-label col-md-4" for="terms">Terms</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" id="termsDetails">
								<div class="input-group-addon">day(s)</div>
							</div>
						</div>
						
						
						<div class="col-md-2">
							<button type="button" class="center-block btn btn-primary" data-toggle="modal" data-target="#addEntry">Add Entry</button>
						</div>
					</div>
					
				</form>
				
				<!-- ============ TABLE ============ -->

				<div class="tbl_wrap">
					<table class="table table-hover" id="entries">
			          <thead>
			            <tr>
			              	<th class=" bg_dblue">Row no.</th>
							<th class=" bg_dblue">Item code</th>
							<th class=" bg_dblue">Description</th>
							<th class=" bg_dblue">Qty</th>
							<th class=" bg_dblue">QtyStock</th>
							<th class=" bg_dblue">Pending Qty</th>
							<th class=" bg_dblue">Agent</th>
							<th class=" bg_dblue">Price</th>
							<th class=" bg_dblue">Amount</th>
							<th class=" bg_dblue">Remove</th>
			            </tr>
			          </thead>
			          <tbody class="list" id="tbentries">
						
			          </tbody>
			        </table> 
				</div>
				 

				<!-- ============= MODAL =============== -->
				<div id="addEntry" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">Add Entry</h4>
				      </div>
				    <div class="modal-body">
						<div class="form-group">
						<button class="btn btn-default bg_dblue btn-add" data-target="#addagent" data-toggle="modal" type="button"> Add Agent </button>
							  <label for="salesagent">Sales Agent:</label>
							  <select class="form-control" id="salesagent">
							  	<option value="0" selected="selected">None</option>
								<c:forEach var="agents" items="${sessionScope.agents}">
									<option value="${agents.name}">${agents.description}</option>
								</c:forEach>
							  </select>
					
					<div class="form-group">
                            <div class="icon-addon addon-md">
                                <input type="text" class="form-control" id="entrySearch" onkeyup="searchItem()" placeholder="Search for items..">
                                <label for="entrySearch" class="glyphicon glyphicon-search" rel="tooltip"></label>
                            </div>
                        </div>
                        		  
						<div class="tbl_wrap">
					        	<table class="table table-hover" id="itemTable">
							          <thead>
							            <tr>
							            	<th class="bg_dblue"></th>
											<th class="bg_dblue">Item code</th>
											<th class="bg_dblue">Description</th>
											<th class="bg_dblue">Available Qty</th>
											<th class="bg_dblue">Pending Qty</th>
											<th class="bg_dblue">Original Price</th>
							            </tr>
							          </thead>
							          <tbody>
							          		
									<c:forEach var="product" items="${sessionScope.products}">

										<tr>
											<td><input type="radio" name="itementry" value="${product.item_code}"></td>
											<td id="${product.item_code}-itemcode" class="">${product.item_code}</td>
											<td id="${product.item_code}-description" class="">${product.description}</td>
											<td id="${product.item_code}-qpb" class="">${product.quantity_pack_big}</td>
											<td id="${product.item_code}-qps" class="">${product.quantity_pack_small}</td>
											<td id="${product.item_code}-gross_price" class="">${product.gross_price}</td>
										</tr>
										 
									</c:forEach>
							          </tbody>
							          </table>
							          </div>
							          
							<div class="form-group" style="display:none;">
							  
							<div class="col-sm-10">
							  <p class="form-control-static">Item ID: <span id="itemCode">00</span></p>
							</div>		
							<p class="form-control-static"></p>
							<div class="panel panel-default">
							  <div class="panel-heading">Description</div>
							  <div id="description" class="panel-body">
								Description test
							  </div>
							</div>

							<label for="btn-stockquan">Available Stock:</label>
							  <input id="stockQuantity" class="form-control" type="number" placeholder="0" value="0" disabled>
							<p class="form-control-static">Amount: P<span id="itemAmount2">0.00</span>
							<span id="itemAmountRecent">0.00</span><span id="itemAmountOriginal">0.00</span></p>
							</div>
							
							<div id="itemmenu" class="form-group">
							<label for="btn-quan">Last/Overwrite Price:</label>
							  <input id="itemAmount" class="form-control" type="number">
							
							<label for="btn-quan">Enter Quantity:</label>
							  <input id="orderQuantity" class="form-control" type="number" placeholder="0" min="1" max="0" size="1" height="1" width="2">
							</div>
						</div>
						</div>
						
				      <div class="modal-footer">
				        <button id="addItem" type="button" data-dismiss="modal" name="" class="addToList btn btn-default">Add</button>
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>


				<!-- #PRICING LEGEND -->
				<hr>
				<div class="row center-block legend">
					<div class="col-md-2 text-right col-xs-4 ">Pricing Legend:</div>
					<div class="col-md-4 col-xs-4">
						<span class="text-center bg_red"> Price Change </span>
					</div>
					<div class="col-md-4 col-xs-4">
						<span class="text-center bg_blue"> New Transaction </span>
					</div>

				</div>
		
				<!-- TOTAL AMOUNT -->
				<hr>
			
				<div class="row form-inline TotalAmt">
					<label for="totalAmt"
						class="col-md-offset-3 col-md-2 col-xs-6 text-right">Total
						Amount</label> <input type="text" class="form-control col-md-2 col-xs-6"
						id="totalAmt" readonly>
						<div id="test"></div>
				</div>

				<div class="btn-group btn-group-justified  " role="group">

					<div class="btn-group" role="group">
						<button type="button" class="btn btn-primary">
							<span class="fa fa-file" aria-hidden="true"></span> Item
							Transaction
						</button>
					</div>

					<div class="btn-group" role="group">
						<button id="post-btn" type="button" class="btn btn-default">
							<span class="fa fa-file-text" aria-hidden="true"></span> Post
						</button>
					</div>

					<div class="btn-group" role="group">
						<button id="resumeSales" type="button" class="btn btn-default" data-target="#SEresume" data-toggle="modal">
							<span class="fa fa-pencil" aria-hidden="true"></span> Resume
						</button>
					</div>

					<div class="btn-group" role="group">
						<button id="suspendSales" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
							Suspend
						</button>
					</div>
				</div>

				<!-- MODAL FOR RESUME BUTTON -->
				
				<div class="modal fade" id="SEresume" tabindex="-3" role="dialog">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h3 class="modal-title">Suspended sales</h3>
				      </div>
				      <div class="modal-body">
				        
				        <div class="tbl_wrap">
	        		<table class="table table-hover" id="resumeTable">
			          <thead>
			            <tr>
			            	<th class="bg_dblue"></th>
			            	<th class="bg_dblue">DR Ref no.</th>
			              	<th class="bg_dblue">Customer</th>
							<th class="bg_dblue">Date</th>
			            </tr>
			          </thead>
			          <tbody>
									<c:forEach var="suspendproduct" items="${sessionScope.suspendProducts}">

										<tr>
											<td><input type="radio" name="transentry" value="${suspendproduct.reference_no}"></td>
											<td id="${suspendproduct.reference_no}-refno" class="">${suspendproduct.reference_no}</td>
											<td id="${suspendproduct.customer_code}-cust" class="">${suspendproduct.customer_code}</td>
											<td id="${suspendproduct.date}-date" class="">${suspendproduct.date}</td>
										</tr>
										 
									</c:forEach>			          
			          </tbody>
			          
			         </table>
		        	</div>
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				        <button id="resumeBtn" type="button" class="btn btn-primary" data-dismiss="modal">Resume</button>
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
				
				
				<!-- BUTTONS -->
				<hr>
				<div class="btn-group btn-group-justified " role="group">
					
					<div class="btn-group" role="group">
						<button id="standardReceipt" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-print" aria-hidden="true"></span>
							STANDARD
						</button>
					</div>

					<div class="btn-group" role="group">
						<button id="HhhPlainReceipt" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-print" aria-hidden="true"></span>
							HHH PLAIN
						</button>
					</div>

					<div class="btn-group" role="group">
						<button id="HhPlainReceipt" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-print" aria-hidden="true"></span>
							HAP HIENG PLAIN
						</button>
					</div>
					
					<div class="btn-group" role="group">
						<button id="CkcjPlainReceipt" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-print" aria-hidden="true"></span>
							CKCJ PLAIN
						</button>
					</div>

				</div>


			</div>

		</div>
</body>

<!-- FOR LOGOUT SPRING SECURITY FUNCTION -->
<script type="text/javascript">
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>
</html>