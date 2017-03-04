
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
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					<hr>

					<!--/# TABLE FOR INVENTORY FILE-->

					<div class="tbl_wrap">
						<div class="table-responsive">
							<table class="table table-block">
								<thead>
									<tr>
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

											<td class="">${row = row + 1}</td>
											<td class=""><button value="${product.item_code}"
													data-target="#iteminout" data-toggle="modal"
													class="btn btn-primary">${product.item_code }</button></td>
											<td class="">${product.item_code}</td>
											<td class="">${product.category}</td>
											<td class="">${product.description}</td>
											<td class="">${product.gross_price}</td>
											<td class="">${product.less_rc}</td>
											<td class="">${product.less_wc}</td>
											<td class="">${product.total}</td>
											<td class="">${product.w1}</td>
											<td class="">${product.w2}</td>
											<td class="">${product.quantity_pack_big}</td>
											<td class="">${product.quantity_pack_small}</td>
											<td class="">${product.image}</td>
											<td class="">${product.location}</td>
											<td class="">${product.remarks1}</td>
											<td class="">${product.remarks2}</td>

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
									<label for="categorycode">Category Code</label> <select
										class="form-control" id="categorycode">
										<option>Select Category</option>
										<option>Sand Paper</option>
										<option>Bleeders Screw</option>
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
									<label for="netprice">Net Price</label> <input type="text"
										placeholder="Net Price" class="form-control" id="netprice">
								</div>

							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="quantity">Quantity</label> <input type="text"
										placeholder="Quantity" class="form-control" id="quantity">
								</div>

							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="qtyonpo">Qty on Po</label> <input type="text"
										placeholder="Quantity on PO" class="form-control" id="qtyonpo">
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
									<label for="remarks">Remarks</label>
									<textarea class="form-control" rows="4"></textarea>
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
								<option>Item Code</option>
							</select>
						</div>

						<div class="col-md-4 form-horizontal">
							<label for="IOTdate" class="col-md-2">Date from</label>
							<div class="input-group input-daterange col-md-10" id="IOTdate">
								<input type="text" class="form-control" value="2012-04-05">
								<span class="input-group-addon">to</span> <input type="text"
									class="form-control" value="2012-04-19">
							</div>

						</div>

						<div class="col-md-2 form-horizontal ">
							<button class="btn btn-default center-block">
								<span class="fa fa-search"></span> Find Reference
							</button>
						</div>

						<div class="col-md-2 form-horizontal">
							<button class="btn btn-default">
								<span class="fa fa-print"></span> Print
							</button>
						</div>
					</div>
					<!-- END: FIRST ROW -->

					<div class="row">

						<div class="col-md-4">
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
						<!-- END: CLIENTS -->

						<div class="col-md-4 form-horizontal">

							<div class="form-group txtbox">
								<label class="control-label col-md-3" for="IOTIn">Total
									In:</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="IOTIn" disabled
										placeholder="102891">
								</div>
							</div>

							<div class="form-group txtbox">
								<label class="control-label col-md-3" for="IOTOut">Total
									Out:</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="IOTOut" disabled
										placeholder="102891">
								</div>
							</div>

							<div class="form-group txtbox">
								<label class="control-label col-md-3" for="IOTAdj">Total
									Adj:</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="IOTAdj" disabled
										placeholder="102891">
								</div>
							</div>

						</div>
						<!-- END: TOTALS -->

						<div class="col-md-4 form-horizontal InOutAdj">

							<div class="form-group txtbox">
								<label class="control-label col-md-5" for="IOTOut">In-Out+Adj:</label>
								<div class="col-md-7">
									<input type="text" class="form-control" id="IOTOut" disabled
										placeholder="102891">
								</div>
							</div>

							<div class="form-group txtbox">
								<label class="control-label col-md-5" for="IOTOut">Record
									Qty:</label>
								<div class="col-md-7">
									<input type="text" class="form-control" id="IOTOut" disabled
										placeholder="102891">
								</div>
							</div>

						</div>


					</div>
					<!-- END: SECOND ROW -->

				<!-- END: UPPER PART NAV -->

				<!-- ========================== TABLE =========================== -->

				<div class="tbl_wrap">
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
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- end of modal -->


<!-- /#PAGE CONTENT WRAPPER -->

</html>

<!-- FOR LOGOUT SPRING SECURITY FUNCTION -->
<script type="text/javascript">
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>