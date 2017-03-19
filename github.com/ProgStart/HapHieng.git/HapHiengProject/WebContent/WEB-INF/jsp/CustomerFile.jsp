
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="navbar" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		<h3>Customer File</h3>
		<br>
		<c:if test="${hasError == 'true'}">
			<div class="alert alert-warning">Cannot Edit Deatils, You have
				not selected a Customer</div>
		</c:if>
		<c:if test="${hasError == 'false'}">
			<div class="alert alert-success">Successfully edited customer</div>
		</c:if>
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#browsetype">Browse
						Form</a></li>

				<li><a data-toggle="tab" href="#cardtype">Card Form</a></li>

			</ul>
			<div class="tab-content">

				<div id="cardtype" class="tab-pane fade in">

					<h3>Card Form</h3>
					<hr>
					<br>

					<form method="POST" action="/HapHiengProject/CustomerFileModify">
						<div class="form-container">
							<h3>Personal Details</h3>
							<div class="row">
								<div class="col-md-6">

									<div class="form-group">
										<label for="customercode">Customer Code</label> <input
											placeholder="Customer Code" type="text" class="form-control"
											id="customercode" name="customercode" readonly>
									</div>

									<div class="form-group">
										<label for="description">Description</label> <input
											placeholder="Description" type="text" class="form-control"
											id="description" name="description">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="agent">Agent</label> <select name="agent"
											id="agent" class="form-control">
											<option value="">Select Agent</option>
											<c:forEach var="agent" items="${applicationScope.agents}">
												<option value="${agent.name}">${agent.name}</option>
											</c:forEach>
										</select>
									</div>

									<div class="form-group">
										<label for="address">Address</label> <input name="address"
											placeholder="Address" type="text" class="form-control"
											id="address">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="address2">Address 2</label> <input name="address2"
											placeholder="Address 2" type="text" class="form-control"
											id="address2">
									</div>

									<div class="form-group">
										<label for="telephone">Telephone</label> <input
											name="telephone" placeholder="Telephone" type="text"
											class="form-control" id="telephone">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="residentphone">Resident Phone</label> <input
											name="residentphone" placeholder="Resident Phone" type="text"
											class="form-control" id="residentphone">
									</div>

									<div class="form-group">
										<label for="fax">Fax</label> <input placeholder="Fax"
											name="fax" type="text" class="form-control" id="fax">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="cellphone">Cellphone</label> <input
											name="cellphone" placeholder="Cellphone" type="text"
											class="form-control" id="cellphone">
									</div>

									<div class="form-group">
										<label for="terms">Terms</label> <input placeholder="Terms"
											name="terms" type="text" class="form-control" id="terms">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="tin">Tin #</label> <input placeholder="Tin #"
											name="tin" type="text" class="form-control" id="tin">
									</div>

									<div class="form-group">
										<label for="contactperson">Contact Person</label> <input
											placeholder="Contact Person" type="text" class="form-control"
											name="contactperson" id="contactperson">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="email">Email</label> <input placeholder="Email"
											name="email" type="text" class="form-control" id="email">
									</div>

								</div>

							</div>
						</div>
						<div class="form-container">
							<h3>Other Details</h3>
							<div class="row">
								<div class="col-md-6">

									<div class="form-group">
										<label for="creditlimit">Credit Limit</label> <input
											placeholder="Credit Limit" type="text" class="form-control"
											name="creditlimit" id="creditlimit">
									</div>

									<div class="form-group">
										<label for="initialbalance">Initial Balance</label> <input
											placeholder="Initial Balance" type="text"
											name="initialbalance" class="form-control"
											id="initialbalance">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="remaining">Remaining</label> <input
											placeholder="Remaining" type="text" class="form-control"
											name="remaining" id="remaining">
									</div>

									<div class="form-group">
										<label for="remaining">Customer Type</label>
										<div class="radio">
											<label><input value="wc" type="radio" name="optradio">Wholesale
											</label> <label><input value="rc" type="radio"
												name="optradio">Retail </label>
										</div>

									</div>


								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="remarks">Remarks</label>
										<textarea id="remarks" placeholder="Remarks"
											class="form-control" rows="4"></textarea>
									</div>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="text-right" style="padding: 5px;">
									<button type="submit" class="btn btn-primary">Edit
										Details</button>
								</div>
							</div>
						</div>

					</form>
					<div class="table-responsive">
						<table class="table">
						</table>
					</div>

					<!--/# TABLE FOR CARD TYPE -->
					<div class="table-responsive">
						<table class="table" id="priceListTable">
							<thead>
								<tr>
									<th class="bg_dblue">Item Code</th>
									<th class="bg_dblue">Price</th>
								</tr>
							</thead>
							<tbody id="priceListBody">
							    <c:forEach var="item" items="${priceList}">
								<tr> 
								    <td class="col1" hidden>${item.customer_code}</td>  
									<td>${item.item_code}</td>
									<td>${item.price}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
				<div id="browsetype" class="tab-pane fade in active">
					<h3>Browse Form</h3>
					<hr>
					<br>
					<form class="form-container" method="POST"
						action="/HapHiengProject/CustomerFileSubmit">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label for="searchbycuscode">Customer Code Filter</label> <input
										id="searchbycuscode" class="form-control"
										placeholder="Customer Code" type="text" name="customer_code">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="searchbydescription">Description Filter</label> <input
										id="searchbydescription" class="form-control"
										placeholder="Description" type="text" name="description">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="agentfilter">Agent Filter</label> <input
										id="agentfilter" class="form-control" placeholder="Agent"
										type="text" name="agent">
								</div>
							</div>

						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<div class="row">
							<div class="col-md-12">
								<div class="pull-left">
									<button data-target="#addcustomer" data-toggle="modal"
										type="button" class="btn btn-default">Add Customer</button>
								</div>
								<div class="pull-right">
									<button type="submit" class="btn btn-default">Filter</button>
								</div>
							</div>
						</div>

						<!-- MODAL FOR ADD CUSTOMER -->
						<modal:addcustomer />

					</form>
					<hr>

					<!--/# TABLE FOR INVENTORY FILE-->
					<div class="tbl_wrap">
						<div class="table-responsive">
							<table class="table table-block">
								<thead>
									<tr>
										<th class="bg_dblue text-nowrap">Select Customer</th>
										<th class="bg_dblue text-nowrap">Row No.</th>
										<th class="bg_dblue text-nowrap">Customer code</th>
										<th class="bg_dblue text-nowrap">Description</th>
										<th class="bg_dblue text-nowrap">Agent</th>
										<th class="bg_dblue text-nowrap">Address</th>
										<th class="bg_dblue text-nowrap">Address 2</th>
										<th class="bg_dblue text-nowrap">Telephone</th>
										<th class="bg_dblue text-nowrap">Resident Phone</th>
										<th class="bg_dblue text-nowrap">Fax</th>
										<th class="bg_dblue text-nowrap">Cellphone</th>
										<th class="bg_dblue text-nowrap">Terms</th>
										<th class="bg_dblue text-nowrap">Tin #</th>
										<th class="bg_dblue text-nowrap">Contact Person</th>
										<th class="bg_dblue text-nowrap">Email</th>
										<th class="bg_dblue text-nowrap">Credit Limit</th>
										<th class="bg_dblue text-nowrap">Initial Balance</th>
										<th class="bg_dblue text-nowrap">Remaining</th>
										<th class="bg_dblue text-nowrap">Remarks</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="row" value="0" />
									<c:forEach var="customer" items="${sessionScope.customers}">

										<tr style="cursor: pointer;" data-toggle="modal">

											<td><input type="radio" id="${row + 1}|select"
												name="select" class="select"></td>
											<td class="">${row = row + 1}</td>
											<td id="${row}-customercode" class="">${customer.customer_code}</td>
											<td id="${row}-description" class="">${customer.description}</td>
											<td id="${row}-agent" class="">${customer.agent}</td>
											<td id="${row}-address" class="">${customer.address}</td>
											<td id="${row}-address2" class="">${customer.address2}</td>
											<td id="${row}-telephone" class="">${customer.telephone}</td>
											<td id="${row}-residentphone" class="">${customer.resident_phone}</td>
											<td id="${row}-fax" class="">${customer.fax}</td>
											<td id="${row}-cellphone" class="">${customer.cellphone}</td>
											<td id="${row}-terms" class="">${customer.terms}</td>
											<td id="${row}-tinnumber" class="">${customer.tin_number}</td>
											<td id="${row}-contactperson" class="">${customer.contact_person}</td>
											<td id="${row}-email" class="">${customer.email}</td>
											<td id="${row}-creditlimit" class="">${customer.credit_limit}</td>
											<td id="${row}-initialbalance" class="">${customer.initial_balance}</td>
											<td id="${row}-remaining" class="">${customer.remaining}</td>
											<td id="${row}-remarks" class="">${customer.remarks}</td>
											<td id="${row}-customertype" class="" hidden>${customer.customer_type}</td>
										</tr>
									</c:forEach>


								</tbody>
							</table>
						</div>
					</div>

					<hr>
				</div>

			</div>

			<br>
			<!-- #/BUTTON TRANSACTIONS -->
			<div class="btn-group btn-group-justified" role="group"
				aria-label="...">


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


		</div>

	</div>

</div>


<!-- /#PAGE CONTENT WRAPPER -->

</html>

<!-- FOR LOGOUT SPRING SECURITY FUNCTION -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".select").click(function() {
								if ($(this).is(":checked")) {
						let rownum = $(this).attr('id').split("|");
						$("#customercode").val($("#"+ rownum[0]+ "-customercode").text());
						$("#agent").val($("#"+ rownum[0]+ "-agent").text());
						$("#description").val($("#"+ rownum[0]+ "-description").text());
						$("#address").val($("#"+ rownum[0]+ "-customercode").text());
						$("#address2").val($("#"+ rownum[0]+ "-address2").text());
						$("#location").val($("#"+ rownum[0]+ "-location").text());
						$("#residentphone").val($("#" + rownum[0]+ "-residentphone").text());
						$("#telephone").val($("#"+ rownum[0]+ "-telephone").text());
						$("#fax").val($("#"+ rownum[0]+ "-fax").text());
						$("#cellphone").val($("#"+ rownum[0]+ "-cellphone").text());
						$("#terms").val($("#"+ rownum[0]+ "-terms").text());
					    $("#tin").val($("#"+ rownum[0]+ "-tinnumber").text());
						$("#contactperson").val($("#"+ rownum[0]+ "-contactperson").text());
					    $("#email").val($("#"+ rownum[0]+ "-email").text());
						$("#creditlimit").val($("#"+ rownum[0]+ "-creditlimit").text());
						$("#initialbalance").val($("#"+ rownum[0]+ "-initialbalance").text());
						$("#remaining").val($("#"+ rownum[0]+ "-remaining").text());
						$("#remarks").val($("#"+ rownum[0]+ "-remarks").text());
                        $('input:radio[name=optradio]').val([ $("#"+ rownum[0]+ "-customertype").text() ]);
                          
                        //filter price list table
                      
                          $.each($("#priceListTable #priceListBody").find("tr"), function () {
          
                               if($(this).children(".col1").text() == $("#"+ rownum[0]+ "-customercode").text()){ 
                            	   $(this).show();
                               }else{
                            	  
                            	   $(this).hide();
                               }
                          });
									}
					
										});
						function formSubmit() {
							document.getElementById("logoutForm").submit();
						}
					});
</script>