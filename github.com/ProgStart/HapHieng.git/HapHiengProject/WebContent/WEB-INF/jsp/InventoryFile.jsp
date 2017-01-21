
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
				<li class="active"><a data-toggle="tab" href="#cardform">Card
						Form</a></li>
				<li><a data-toggle="tab" href="#browseform">Browse Form</a></li>

			</ul>

			<div class="tab-content">

				<div id="cardform" class="tab-pane fade in active">
					<form>
						<h3>Card Form</h3>
						<hr>
						<br>
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
									<label for="unit">Unit</label> <input placeholder="Unit"type="text"
										class="form-control" id="unit">
								</div>

							</div>

						</div>


						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="itemcode">Item Code</label> <input placeholder="Item Code" type="text"
										class="form-control" id="itemcode">
								</div>
							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="location">Location</label> <input placeholder="Location" type="text"
										class="form-control" id="location">
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
										placeholder="Minimum Quantity" type="text" class="form-control" id="minimumquantity">

								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="description">Description</label> <input type="text"
										placeholder="Description" class="form-control" id="description">
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
										placeholder="Package Quantity Big" type="text" class="form-control" id="packageqtybig">
								</div>

							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="packageqtysmall">PackQty Small</label> <input
										placeholder="Package Quantity Small" type="text" class="form-control" id="packageqtysmall">
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
				<br>
				<div id="browseform" class="tab-pane fade">
					<form>
					    <div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="productlinefilter">Product Line Filter</label>
								<select class="form-control" id="productlinefilter">
								    <option>Select Product Line</option>
								</select>
							
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="categoryfilter">Category Filter</label> 
							    <select class="form-control" id="categoryfilter">
							        <option>Select Category</option>
							    </select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="remarks">Total Inventory Cost</label> 
								<input class="form-control" readonly>
				
							</div>
						</div>
						</div>
						<div class="row">
						    <div class="col-md-12">
						       <div class="pull-right">
						          <button class="btn btn-default">Filter</button>
						       </div>
						    </div>
						</div>
					
						<hr>

					</form>
				</div>

			</div>

		</div>

	</div>

</div>


<!-- /#PAGE CONTENT WRAPPER -->

</html>

<!-- FOR LOGOUT SPRING SECURITY FUNCTION -->
<script type="text/javascript">
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>