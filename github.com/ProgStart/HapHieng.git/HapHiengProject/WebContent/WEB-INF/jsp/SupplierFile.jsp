
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

<!-- CSS LINKS -->
<spring:url value="/resources/css/style.css" var="styles" />
<link rel="stylesheet" href="${styles}" />

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
		<h3>Supplier File</h3>
		<br>
		<c:if test="${hasError == 'true'}">
			<div class="alert alert-warning">Cannot Edit Details, You have
				not selected a Supplier</div>
		</c:if>
		<c:if test="${hasError == 'false'}">
			<div class="alert alert-success">Successfully edited Supplier</div>
		</c:if>
		<c:if test="${insertSuccess == 'true'}">
			<div class="alert alert-success">new supplier has been created</div>
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

					<form method="POST" action="/HapHiengProject/SupplierFileModify">
						<div class="form-container">
							<h3>Personal Details</h3>
							<div class="row">
								<div class="col-md-6">

									<div class="form-group">
										<label for="suppliercode">Supplier Code</label> <input
											placeholder="Supplier Code" type="text" class="form-control"
											id="suppliercode" name="suppliercode" readonly>
									</div>

									<div class="form-group">
										<label for="description">Description</label> <input
											placeholder="Description" type="text" class="form-control"
											id="description" name="description">
									</div>

								</div>
								<div class="col-md-6">


									<div class="form-group">
										<label for="address">Address</label> <input
											placeholder="Address" type="text" class="form-control"
											id="address" name="address">
									</div>

									<div class="form-group">
										<label for="address2">Address 2</label> <input
											placeholder="Address 2" type="text" class="form-control"
											id="address2" name ="address2">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="telephone">Telephone</label> <input
											placeholder="Telephone" type="text" class="form-control"
											id="telephone" name="telephone">
									</div>

									<div class="form-group">
										<label for="fax">Fax</label> <input placeholder="Fax"
											type="text" class="form-control" id="fax" name="fax">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="email">Email</label> <input placeholder="Email"
											type="text" class="form-control" id="email" name="email">
									</div>

									<div class="form-group">
										<label for="terms">Terms</label> <input placeholder="Terms"
											type="text" class="form-control" id="terms" name="terms">
									</div>


								</div>

								<div class="col-md-6">

									<div class="form-group">
										<label for="initialbalance">Initial Balance</label> <input
											placeholder="Initial Balance" type="text"
											class="form-control" id="initialbalance" name="initialbalance">
									</div>
									
	

								</div>
								<div class="col-md-6">
								<div class="form-group">
										<label for="remaining">Remaining</label> <input
											placeholder="Remaining" type="text"
											class="form-control" id="remaining" name="remaining">
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
						
			<!--/# TABLE FOR CARD TYPE -->
			<h3>Costing</h3>
			<div class="table-responsive">
				<table class="table" id="priceListTable">
					<thead>
						<tr>
							<th class="bg_dblue">Item Code</th>
							<th class="bg_dblue">Cost</th>
							<th class="bg_dblue">New Date</th>
							<th class="bg_dblue">New Cost</th>
						</tr>
		
					</thead>
					<tbody id="priceListBody">
					<c:forEach var="item" items="${supplierPriceList}">
						<tr> 
						    <td class="col1" hidden>${item.supplier_code}</td>
							<td>${item.item_code}</td>
							<td>${item.cost}</td>
							<td>${item.new_date}</td>
							<td>${item.new_cost}</td>

							

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
						action="/HapHiengProject/SupplierFileSubmit">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="searchbysuppliercode">Supplier Code Filter</label>
									<input id="searchbycuscode" class="form-control"
										placeholder="Supplier Code" type="text" name="supplier_code">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="searchbydescription">Description Filter</label> <input
										id="searchbydescription" class="form-control"
										placeholder="Description" type="text" name="description">
								</div>
							</div>

						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<div class="row">
							<div class="col-md-12">
							    <div class="pull-left">
									<button type="button" data-target="#addsupplier" data-toggle="modal" class="btn btn-default">Add Supplier</button>
								</div>
								<div class="pull-right">
									<button type="submit" class="btn btn-default">Filter</button>
								</div>
							</div>
						</div>



					</form>
					<hr>
					<!-- MODAL FOR ADD SUPPLIER -->
					<modal:addsupplier/>

					<!--/# TABLE FOR INVENTORY FILE-->
					<div class="tbl_wrap">
						<div class="table-responsive">
							<table class="table table-block">
								<thead>
									<tr>
 	       								<th class="bg_dblue text-nowrap">Select Supplier</th>
   										<th class="bg_dblue text-nowrap">Row No.</th>
										<th class="bg_dblue text-nowrap">Supplier code</th>
										<th class="bg_dblue text-nowrap">Description</th>

									</tr>
								</thead>
								<tbody>
									<c:set var="row" value="0" />
									<c:forEach var="supplier" items="${sessionScope.suppliers}">
										<tr style="cursor: pointer;" data-toggle="modal">
										    <td><input type="radio" id="${row + 1}|select" name="select" class="select"></td>
											<td class="">${row = row + 1}</td>
											<td id="${row}-suppliercode" class="">${supplier.supplier_code}</td>
											<td id="${row}-description" class="">${supplier.description}</td>
											<td id="${row}-address" class="" hidden>${supplier.address}</td>
											<td id="${row}-address2" class="" hidden>${supplier.address2}</td>
											<td id="${row}-telephone" class="" hidden>${supplier.telephone}</td>
											<td id="${row}-fax" class="" hidden>${supplier.fax}</td>
											<td id="${row}-email" class="" hidden>${supplier.email}</td>
											<td id="${row}-terms" class="" hidden>${supplier.terms}</td>
											<td id="${row}-initialbalance" class="" hidden>${supplier.initial_balance}</td>
											<td id="${row}-remaining" class="" hidden>${supplier.remaining}</td>
										</tr>
									</c:forEach>


								</tbody>
							</table>
						</div>
					</div>

					<hr>
				</div>

			</div>
         
		
			<!-- #/BUTTON TRANSACTIONS -->
			<div class="btn-group btn-group-justified" role="group"
				aria-label="...">


				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						Find Supplier
					</button>
				</div>

				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						Find Item
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
$(document).ready(function(){
	   $(".select").click(function(){
		  if($(this).is(":checked")){
			 let rownum = $(this).attr('id').split("|");
			$("#suppliercode").val($("#"+rownum[0]+"-suppliercode").text());
			$("#description").val($("#"+rownum[0]+"-description").text());
			$("#address").val($("#"+rownum[0]+"-address").text());
			$("#address2").val($("#"+rownum[0]+"-address2").text());
			$("#telephone").val($("#"+rownum[0]+"-telephone").text());
			$("#fax").val($("#"+rownum[0]+"-fax").text());
			$("#terms").val($("#"+rownum[0]+"-terms").text());
			$("#email").val($("#"+rownum[0]+"-email").text());
			$("#initialbalance").val($("#"+rownum[0]+"-initialbalance").text());
			$("#remaining").val($("#"+rownum[0]+"-remaining").text());
			
			$('input:radio[name=optradio]').val([$("#"+rownum[0]+"-customertype").text()]);
			
			   //filter price list table
            
            $.each($("#priceListTable #priceListBody").find("tr"), function () {

                 if($(this).children(".col1").text() == $("#"+ rownum[0]+ "-suppliercode").text()){ 
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