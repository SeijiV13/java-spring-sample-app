
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<c:if test="${insertSuccess == 'true'}">
			<div class="alert alert-success">new product has been created</div>
		</c:if>
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

					<!-- MODAL FOR ADD PRODUCT -->
					<modal:addproduct />

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

										<tr style="cursor: pointer;" data-toggle="modal">
											<td class=""><input id="${product.item_code}|select"
												name="select" type="radio" class="select" /></td>
											<td class="">${row = row + 1}</td>
											<td class=""><button value="${product.item_code}"
													data-target="#iteminout" data-toggle="modal"
													class="btn btn-primary itemcodebutton">${product.item_code}</button></td>
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
											<td id="${product.item_code}-image" class="">
											<c:if test="${product.image == 'NO IMAGE'}">${product.image}</c:if>
											<c:if test="${product.image != 'NO IMAGE'}"><button class="btn btn-default buttonimageview" data-target="#imageview" data-toggle="modal">${product.image}</button></c:if>
											</td>
											<td id="${product.item_code}-location" class="">${product.location}</td>
											<td id="${product.item_code}-remarks1" class="">${product.remarks1}</td>
											<td id="${product.item_code}-remarks2" class="">${product.remarks2}</td>
											<td id="${product.item_code}-minimumquantity" class="" hidden>${product.minimum_quantity}</td>
											<td id="${product.item_code}-importeditem" class="" hidden>${product.importeditem}</td>
											<td id="${product.item_code}-unit" class="" hidden>${product.unit}</td>

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
										<label><input id="importeditem" type="checkbox">
											<b>Imported Item </b></label>
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
										id="itemcode" readonly>
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
									<label for="image">Image</label> <input type="hidden"
										class="form-control" id="image">
										<button  type="button" data-target="#imageview" data-toggle="modal" class="btn btn-default" id="viewimagebutton-card">View Image</button>
								
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

					<h4>Pricing</h4>
					<div class="tbl_wrap">
						<div class="table-responsive">
							<table class="table" id="priceListTable">

								<thead>
									<tr>
										<th class="bg_dblue text-nowrap">Customer Code</th>
										<th class="bg_dblue text-nowrap">Price</th>
									</tr>
								</thead>
								<tbody id="priceListBody">
									<c:forEach var="item" items="${priceList}">
										<tr>
											<td class="col1" hidden>${item.item_code}</td>
											<td>${item.customer_code}</td>
											<td>${item.price}</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
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
					<button type="button" class="btn btn-primary"
						data-target="#iteminout" data-toggle="modal">
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

		</div>

	</div>

</div>

<!-- MODAL FOR ITEM IN OUT -->
<modal:inout />
<!-- MODAL FOR IMAGE VIEW -->
<modal:imageview></modal:imageview>

<!-- /#PAGE CONTENT WRAPPER -->
</html>

<!-- FOR LOGOUT SPRING SECURITY FUNCTION -->
<script type="text/javascript">
function formSubmit() {
	document.getElementById("logoutForm").submit();
}
	$(document)
			.ready(
					function() {

						$(".select")
								.click(
										function() {

											if ($(".select").is(":checked")) {
												let
												productId = $(this).attr("id");

												let
												id = productId.split("|");
												let
												chosenitemcode = $(
														"#" + id[0]
																+ "-itemcode")
														.text();
												$("#itemcodeinoutmodal").val(
														chosenitemcode);

												$("#itemcode")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-itemcode")
																		.text());
												$("#category")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-category")
																		.text());
												$("#description")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-description")
																		.text());
												$("#grossprice")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-gross_price")
																		.text());
												$("#less35")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-less_wc")
																		.text());
												$("#less15")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-less_rc")
																		.text());
												$("#total")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-total")
																		.text());
												$("#w1").val(
														$("#" + id[0] + "-w1")
																.text());
												$("#w2").val(
														$("#" + id[0] + "-w2")
																.text());
												$("#packageqtybig").val(
														$("#" + id[0] + "-qpb")
																.text());
												$("#packageqtysmall").val(
														$("#" + id[0] + "-qps")
																.text());
												$("#image")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-image")
																		.text());
												$("#location")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-location")
																		.text());
												$("#remarks1")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-remarks1")
																		.text());
												$("#remarks2")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-remarks2")
																		.text());
												//hidden rows
												$("#minimumquantity")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-minimumquantity")
																		.text());
												$("#unit")
														.val(
																$(
																		"#"
																				+ id[0]
																				+ "-unit")
																		.text());
												if ($(
														"#"
																+ id[0]
																+ "-importeditem")
														.text() === 'yes') {
													$("#importeditem").prop(
															"checked", true);
												} else {
													$("#importeditem").prop(
															"checked", false);
												}

												//filter price list table

												$
														.each(
																$(
																		"#priceListTable #priceListBody")
																		.find(
																				"tr"),
																function() {

																	if ($(this)
																			.children(
																					".col1")
																			.text() == $(
																			"#"
																					+ id[0]
																					+ "-itemcode")
																			.text()) {
																		$(this)
																				.show();
																	} else {

																		$(this)
																				.hide();
																	}
																});

											}
										});

						//pass value of itemcode in inoutmodal
						$(".itemcodebutton").click(function() {
							$("#itemcodeinoutmodal").val($(this).text());
						})
						
						$("#gpinput").keyup(function(){
							
						    let disc1 = $(this).val() -($(this).val() * .15);
						    let disc2 = $(this).val() -($(this).val() * .35);
							$("#less15input").val(disc1);
							$("#less35input").val(disc2);
						});
						
						$(".buttonimageview").click(function(){
						
							let imagename = $(this).text();
							$("#imagedisplay").attr("src", "/HapHiengProject/resources/images/" + imagename);
						    
						});
						
						$("#viewimagebutton-card").click(function(){
							
							let imagename = $("#image").val();
							$("#imagedisplay").attr("src", "/HapHiengProject/resources/images/" + imagename);
						   
						});
						

					});
</script>