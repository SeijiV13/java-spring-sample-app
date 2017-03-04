
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
		<h3>Customer Bank File</h3>
		<br>
		<div class="row">
			<div class="row ">
				<div class="col-md-3">
					<div class="text-center cust_headers ">
						<h4>Customer</h4>
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-search"></span>
							</span> <input type="text" class="form-control"
								placeholder="Search Customer">
						</div>
					</div>

					<div class="list-group cust_tbl">
						<a href="#" class="list-group-item"> Customer 0 </a> <a href="#"
							class="list-group-item">Customer 1</a> <a href="#"
							class="list-group-item">Customer 2</a> <a href="#"
							class="list-group-item">Customer 3</a> <a href="#"
							class="list-group-item">Customer 4</a> <a href="#"
							class="list-group-item">Customer 5</a> <a href="#"
							class="list-group-item">Customer 6</a> <a href="#"
							class="list-group-item">Customer 7</a> <a href="#"
							class="list-group-item">Customer 8</a>

					</div>
				</div>
				<div class="col-md-9">
					<div class=" row form-container">
						<h3>Customer Bank Information</h3>
						<div class="form-group">
							<label for="accountnumber">Account Number</label> <input
								placeholder="Account Number" type="text" class="form-control"
								id="accountnumber">
						</div>

						<div class="form-group">
							<label for="accountname">Account Name</label> <input
								placeholder="Account Name" type="text" class="form-control"
								id="accountname">
						</div>

						<div class="form-group">
							<label for="bank">Bank</label> <input placeholder="Bank"
								type="text" class="form-control" id="bank">
						</div>
						<div class="form-group">
							<label for="branch">Branch</label> <input placeholder="Branch"
								type="text" class="form-control" id="branch">
						</div>

						<div class="form-group">
							<label for="status">Status</label> <select class="form-control"
								id="status">
								<option>Select Status</option>
							</select>
						</div>

						<div class="form-group">
							<label for="remarks">Remarks</label> <input placeholder="Remarks"
								type="text" class="form-control" id="remarks">
						</div>




					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="pull-right">
						<button class="btn btn-default">
							<span class="glyphicon glyphicon-print"></span> Print
						</button>
					</div>
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