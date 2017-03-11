
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="navbar" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HapHieng Inventory System</title>
<!--  JQUERY AND JS LINKS -->
<spring:url value="/resources/js/jquery/jquery.min.js" var="JQuery" />
<script src="${JQuery}" type="text/javascript"></script>

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


<!-- DATEPICKER LINKS -->
<spring:url value="/resources/js/bootstrap-datepicker.js" var="DatePJS" />
<script src="${DatePJS}" type="text/javascript"></script>

<spring:url value="/resources/css/boostrap-datepicker.css"
	var="DatePCss" />
<link rel="stylesheet" href="${DatePCss}" />


<!-- CSS LINKS -->
<spring:url value="/resources/css/style.css" var="styles" />
<link rel="stylesheet" href="${styles}" />

<!-- FONT LINKS -->
<link href="http://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet" type="text/css">
</head>

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

	<!-- USERNAME AND DATE DISPLAY -->
	<h5>
		<span class="fa fa-user"></span> User Login: ${username}
	</h5>
	<h5>
		<span class="fa fa-calendar"></span> Date: ${dateToday}
	</h5>

	<!-- MAIN CONTENT -->
	<div class="container-fluid">
		<!-- TITLE OF PAGE -->
		<h3>Inventory File</h3>
		<br>
		<div class="row">

			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#browseform">Browse
						Form</a></li>
				<li><a data-toggle="tab" href="#cardform">Card Form</a></li>


			</ul>

			<div class="tab-content">
				<div id="browseform" class="tab-pane fade in active">
					<h3>Browse Form</h3>
					<hr>
					<br>
					<form class="form-container" method="POST"
						action="/HapHiengProject/InventoryFileSubmit">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label for="productlinefilter">Product Line Filter</label> <select
										class="form-control" id="productlinefilter"
										name="productLineFilter">
										<option value="">Select Product Line</option>
										<c:forEach var="productLine"
											items="${applicationScope.productLines}">
											<option value="${productLine}">${productLine}</option>
										</c:forEach>
									</select>

								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="categoryfilter">Category Filter</label> <select
										class="form-control" id="categoryfilter" name="categoryFilter">
										<option value="">Select Category</option>
										<c:forEach var="category"
											items="${applicationScope.categories}">
											<option value="${category}">${category}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="remarks">Total Inventory Cost</label> <input
										class="form-control" value="${sessionScope.totalCost}"
										readonly>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">

								<div class="pull-right">
									<button type="submit" class="btn btn-default">Filter</button>
								</div>

								<!-- OPENS FORM IN CUSTOMER -->
								<button data-target="#addproduct" data-toggle="modal"
									type="button" class="btn btn-default pull-left">Add
									New Product</button>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					<hr>

					<!--/# TABLE FOR INVENTORY SFILE-->
					<div class="modal fade" id="addproduct" role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h3 class="modal-title">Add New Product</h3>
								</div>

								<!-- MODAL FORM -->
								<div class="modal-body">
									<form id="submitaddcustomer" class="form-container"
										method="POST"
										action="/HapHiengProject/InventoryFileAddCustomer">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<div class="checkbox">
														<label><input name="importeditem" type="checkbox">
															<b>Imported Item </b></label>
													</div>
												</div>
											</div>

											<div class="col-md-6">

												<div class="form-group">
													<label for="unit">Unit</label> <input name="unit"
														placeholder="Unit" type="text" class="form-control"
														id="unit">
												</div>

											</div>

										</div>


										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="itemcode">Item Code</label> <input
														name="itemcode" placeholder="Item Code" type="text" class="form-control"
														id="itemcode">
												</div>
											</div>

											<div class="col-md-6">

												<div class="form-group">
													<label for="location">Location</label> <input
														name="location" placeholder="Location" type="text" class="form-control"
														id="location">
												</div>

											</div>

										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="categorycode">Category</label> <select
														name="category" class="form-control" id="category">
														<option value="">Select Category</option>
														<c:forEach var="category"
															items="${applicationScope.categories}">
															<option value="${category}">${category}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="col-md-6">

												<div class="form-group">
													<label for="minimumquantity">Minimum Quantity</label> <input
														name="minimumquantity" placeholder="Minimum Quantity" type="text"
														class="form-control" id="minimumquantity">

												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="description">Description</label> <input
														name="description" type="text" placeholder="Description" class="form-control"
														id="description">
												</div>

											</div>

											<div class="col-md-6">

												<div class="form-group">
													<label for="image">Image</label> <input type="text"
														name="image" class="form-control" id="image">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="grossprice">Gross Price</label> <input
														name="grossprice" type="text" placeholder="Gross Price" class="form-control"
														id="grossprice">
												</div>

											</div>

											<div class="col-md-6">


												<div class="form-group">
													<label for="less15">Less 15%</label> <input type="text"
														name="less15" placeholder="Less 15%" class="form-control" id="less15">
												</div>

											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="less35">Less 35%</label> <input type="text"
														name="less35" placeholder="Less 35%" class="form-control" id="less35">
												</div>

											</div>

											<div class="col-md-6">

												<div class="form-group">
													<label for="total">Total</label> <input type="text"
														name="total" placeholder="Total%" class="form-control" id="total">
												</div>

											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="w1">Warehouse 1</label> <input type="text"
														name="w1" placeholder="Warehouse 1" class="form-control" id="w1">
												</div>

											</div>

											<div class="col-md-6">

												<div class="form-group">
													<label for="w2">Warehouse 2</label> <input type="text"
														name="w2" placeholder="Warehouse 2" class="form-control" id="w2">
												</div>

											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="packageqtybig">PackQty Big</label> <input
														name="packageqtybig" placeholder="Package Quantity Big" type="text"
														class="form-control" id="packageqtybig">
												</div>

											</div>

											<div class="col-md-6">

												<div class="form-group">
													<label for="packageqtysmall">PackQty Small</label> <input
														name="packageqtysmall" placeholder="Package Quantity Small" type="text"
														class="form-control" id="packageqtysmall">
												</div>

											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="remarks">Remarks 1</label>
													<textarea name="remarks1" id="remarks1" class="form-control" rows="4"></textarea>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="remarks">Remarks 2</label>
													<textarea name="remarks2" id="remarks2" class="form-control" rows="4"></textarea>
												</div>
											</div>
										</div>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</form>
								</div>
								<div class="modal-footer">
									<button type="submit" form="submitaddcustomer"
										class="btn btn-primary">Add Product</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>

					</div>

					<div class="tbl_wrap">
						<div class="table-responsive">
							<table class="table table-block">
								<thead>
									<tr>
										<th class="bg_dblue text-nowrap">Select Item.</th>
										<th class="bg_dblue text-nowrap">Row No.</th>
										<th class="bg_dblue text-nowrap">Item code</th>
										<th class="bg_dblue text-nowrap">Item code</th>
										<th class="bg_dblue text-nowrap">Category</th>
										<th class="bg_dblue text-nowrap">Description</th>
										<th class="bg_dblue text-nowrap">Gross Price</th>
										<th class="bg_dblue text-nowrap">Less 15%</th>
										<th class="bg_dblue text-nowrap">Less 35%</th>
										<th class="bg_dblue text-nowrap">Total</th>
										<th class="bg_dblue text-nowrap">W1</th>
										<th class="bg_dblue text-nowrap">W2</th>
										<th class="bg_dblue text-nowrap">Qty Pack Big</th>
										<th class="bg_dblue text-nowrap">Qty Pack Small</th>
										<th class="bg_dblue text-nowrap">Image</th>
										<th class="bg_dblue text-nowrap">Location</th>
										<th class="bg_dblue text-nowrap">Remarks1</th>
										<th class="bg_dblue text-nowrap">Remarks2</th>
									</tr>
								</thead>
								<tbody>

									<c:set var="row" value="0" />
									<c:forEach var="product" items="${sessionScope.products}">

										<tr style="cursor: pointer;" data-toggle="modal"
											data-target="#myModal">
											<td class=""><input id="${product.item_code}|select"
												name="select" type="radio" class="select" /></td>
											<td class="">${row = row + 1}</td>
											<td class=""><button value="${product.item_code}"
													data-target="#iteminout" data-toggle="modal"
													class="btn btn-primary">${product.item_code }</button></td>
											<td id="${product.item_code}-itemcode" class="">${product.item_code}</td>
											<td id="${product.item_code}-category" class="">${product.category}</td>
											<td id="${product.item_code}-description" class="">${product.description}</td>
											<td id="${product.item_code}-gross_price" class="">${product.gross_price}</td>
											<td id="${product.item_code}-less_rc" class="">${product.less_rc}</td>
											<td id="${product.item_code}-less_wc" class="">${product.less_wc}</td>
											<td id="${product.item_code}-total" class="">${product.total}</td>
											<td id="${product.item_code}-w1" class="">${product.w1}</td>
											<td id="${product.item_code}-w2" class="">${product.w2}</td>
											<td id="${product.item_code}-qpb" class="">${product.quantity_pack_big}</td>
											<td id="${product.item_code}-qps" class="">${product.quantity_pack_small}</td>
											<td id="${product.item_code}-image" class="">${product.image}</td>
											<td id="${product.item_code}-location" class="">${product.location}</td>
											<td id="${product.item_code}-remarks1" class="">${product.remarks1}</td>
											<td id="${product.item_code}-remarks2" class="">${product.remarks2}</td>

										</tr>


									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>

				</div>
				<div id="cardform" class="tab-pane fade">
					<h3>Card Form</h3>
					<hr>
					<br>

					<form class="form-container">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<div class="checkbox">
										<label><input type="checkbox"> <b>Imported
												Item </b></label>
									</div>
								</div>
							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="unit">Unit</label> <input placeholder="Unit"
										type="text" class="form-control" id="unit">
								</div>

							</div>

						</div>


						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="itemcode">Item Code</label> <input
										placeholder="Item Code" type="text" class="form-control"
										id="itemcode">
								</div>
							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="location">Location</label> <input
										placeholder="Location" type="text" class="form-control"
										id="location">
								</div>

							</div>

						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="categorycode">Category</label> <select
										class="form-control" id="category">
										<option value="">Select Category</option>
										<c:forEach var="category"
											items="${applicationScope.categories}">
											<option value="${category}">${category}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="minimumquantity">Minimum Quantity</label> <input
										placeholder="Minimum Quantity" type="text"
										class="form-control" id="minimumquantity">

								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="description">Description</label> <input type="text"
										placeholder="Description" class="form-control"
										id="description">
								</div>

							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="image">Image</label> <input type="text"
										class="form-control" id="image">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="grossprice">Gross Price</label> <input type="text"
										placeholder="Gross Price" class="form-control" id="grossprice">
								</div>

							</div>

							<div class="col-md-6">


								<div class="form-group">
									<label for="less15">Less 15%</label> <input type="text"
										placeholder="Less 15%" class="form-control" id="less15">
								</div>

							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="less35">Less 35%</label> <input type="text"
										placeholder="Less 35%" class="form-control" id="less35">
								</div>

							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="total">Total</label> <input type="text"
										placeholder="Total%" class="form-control" id="total">
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="w1">Warehouse 1</label> <input type="text"
										placeholder="Warehouse 1" class="form-control" id="w1">
								</div>

							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="w2">Warehouse 2</label> <input type="text"
										placeholder="Warehouse 2" class="form-control" id="w2">
								</div>

							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="packageqtybig">PackQty Big</label> <input
										placeholder="Package Quantity Big" type="text"
										class="form-control" id="packageqtybig">
								</div>

							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="packageqtysmall">PackQty Small</label> <input
										placeholder="Package Quantity Small" type="text"
										class="form-control" id="packageqtysmall">
								</div>

							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="remarks">Remarks 1</label>
									<textarea id="remarks1" class="form-control" rows="4"></textarea>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="remarks">Remarks 2</label>
									<textarea id="remarks2" class="form-control" rows="4"></textarea>
								</div>
							</div>
						</div>
					</form>
				</div>

			</div>




			<!--/# PRICING LEGEND -->
			<div class="row center-block legend">
				<div class="col-md-2 text-right col-xs-4 " style="">Pricing
					Legend:</div>
				<div class="col-md-4 col-xs-4">
					<span class="text-center bg_blue" style="padding: 10px;">
						Cost 1.25</span>
				</div>


			</div>
			<br>


			<!-- #/BUTTON TRANSACTIONS -->
			<div class="btn-group btn-group-justified  " role="group"
				aria-label="...">

				<div class="btn-group" role="group">
					<button type="button" class="btn btn-primary">
						<span class="glyphicon glyphicon-file" aria-hidden="true"></span>
						Item Transactions
					</button>
				</div>

				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						Find
					</button>
				</div>

				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-print" aria-hidden="true"></span>
						Print
					</button>
				</div>
			</div>
			<br>
			<h4>Pricing</h4>
			<div class="tbl_wrap">
				<div class="table-responsive">
					<table class="table">

						<thead>
							<tr>
								<th class="bg_dblue text-nowrap">Customer</th>
								<th class="bg_dblue text-nowrap">Price</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Emily Equiza</td>
								<td>9.00</td>

							</tr>
							<tr>
								<td>Jes Rey</td>
								<td>5.00</td>
							</tr>

						</tbody>
					</table>
				</div>

			</div>

		</div>

	</div>

</div>

<!-- MODAL FOR ITEM IN OUT TRANSACTION -->
<div class="modal fade" id="iteminout" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title">Item In-Out Transaction</h3>
			</div>

			<!-- MODAL FORM -->
			<div class="modal-body">

				<div class="row">
					<div class="col-md-4">
						<select class="form-control">
							<option>Item Code/Description</option>
						</select>

						<h4>Clients</h4>

						<div class="radio">
							<label> <input type="radio" class="IOTradios"
								name="IOTRadios" id="IOTradio1" value="option1"> All
								Supplies
							</label>
						</div>

						<div class="radio">
							<label> <input type="radio" class="IOTradios"
								name="IOTRadios" id="IOTradio2" value="option2"> All
								Sales Transaction
							</label>
						</div>

						<div class="radio">
							<label> <input type="radio" name="IOTRadios"
								id="IOTradio3" value="option3"> <select
								class="form-control IOTselect" disabled>
									<option>Select Client</option>
							</select>
							</label>
						</div>
					</div>
					<div class="col-md-4">

						<label for="from">Date from</label>
						<div class="input-group input-daterange col-md-10" id="from">
							<input type="text" class="form-control" placeholder="mm/dd/yyyy">
						</div>

						<label for="to">Date To</label>
						<div class="input-group input-daterange col-md-10" id="to">
							<input type="text" class="form-control" placeholder="mm/dd/yyyy">
						</div>

						<div class="form-group txtbox">
							<label class="control-label" for="IOTIn">Total In:</label> <input
								type="text" class="form-control" id="IOTIn" readonly>

						</div>

						<div class="form-group txtbox">
							<label class="control-label" for="IOTOut">Total Out:</label> <input
								type="text" class="form-control" id="IOTOut" readonly>

						</div>

						<div class="form-group txtbox">
							<label class="control-label" for="IOTAdj">Total Adj:</label> <input
								type="text" class="form-control" id="IOTAdj" readonly>
						</div>



					</div>
					<div class="col-md-4">
						<button class="btn btn-default">
							<span class="fa fa-search"></span> Find Reference
						</button>
						<button class="btn btn-default">
							<span class="fa fa-print"></span> Print
						</button>

						<div class="form-group txtbox">
							<label class="control-label" for="inoutadj">In-Out+Adj:</label> <input
								type="text" class="form-control" id="inoutadj" readonly /> <label
								class="control-label" for="stockquantity">StockQty:</label> <input
								type="text" class="form-control" id="stockquantity" readonly />

							<label class="control-label" for="totaldamage">Total
								Damage:</label> <input type="text" class="form-control" id="totaldamage"
								readonly /> <label class="control-label" for="pendingso">Pending
								SO:</label> <input type="text" class="form-control" id="pendingso"
								readonly>
						</div>

					</div>

					<!-- ========================== TABLE =========================== -->

					<div style="padding: 10px" class="tbl_wrap">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="bg_dblue">Date</th>
									<th class="bg_dblue">Client</th>
									<th class="bg_dblue">Reference</th>
									<th class="bg_dblue">Price</th>
									<th class="bg_dblue">Currency</th>
									<th class="bg_dblue">Qty_In</th>
									<th class="bg_dblue">Qty_Out</th>
									<th class="bg_dblue">Qty_Adj</th>
									<th class="bg_dblue">Balance</th>
									<th class="bg_dblue">Agent</th>
								</tr>
							</thead>
							<tbody>

								<tr data-toggle="modal" data-target="#IOTModal">
									<td class="">12/3/2014</td>
									<td class="">Sumpit</td>
									<td class="">169</td>
									<td class="">235</td>
									<td class="">Yuan</td>
									<td class="">1600</td>
									<td class="">10</td>
									<td class=""></td>
									<td class="">2,374</td>
									<td class="">Bong</td>
								</tr>

							</tbody>
						</table>
					</div>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

</div>


<!-- /#PAGE CONTENT WRAPPER -->
</html>

<!-- FOR LOGOUT SPRING SECURITY FUNCTION -->
<script type="text/javascript">
	$(document).ready(function() {
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
		$(".select").click(function() {
			if ($(".select").is(":checked")) {
				let
				productId = $(this).attr("id");
				let
				id = productId.split("|");
				$("#itemcode").val($("#" + id[0] + "-itemcode").text());
				$("#category").val($("#" + id[0] + "-category").text());
				$("#description").val($("#" + id[0] + "-description").text());
				$("#grossprice").val($("#" + id[0] + "-gross_price").text());
				$("#less35").val($("#" + id[0] + "-less_wc").text());
				$("#less15").val($("#" + id[0] + "-less_rc").text());
				$("#total").val($("#" + id[0] + "-total").text());
				$("#w1").val($("#" + id[0] + "-w1").text());
				$("#w2").val($("#" + id[0] + "-w2").text());
				$("#packageqtybig").val($("#" + id[0] + "-qpb").text());
				$("#packageqtysmall").val($("#" + id[0] + "-qps").text());
				$("#image").val($("#" + id[0] + "-image").text());
				$("#location").val($("#" + id[0] + "-location").text());
				$("#remarks1").val($("#" + id[0] + "-remarks1").text());
				$("#remarks2").val($("#" + id[0] + "-remarks2").text());

			}
		});

	});
</script>