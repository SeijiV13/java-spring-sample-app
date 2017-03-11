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
</head>
<body>



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

		<h5>
			<span class="fa fa-user"></span> User Login: ${username}
		</h5>
		<h5>
			<span class="fa fa-calendar"></span> Date: ${dateToday}
		</h5>

		<!-- MAIN CONTENT -->
		<div class="container-fluid GSR">
			<!-- TITLE OF PAGE -->
			<h3>Generate Sales Counter Receipts</h3>

			<hr>
			<div class="row head_nav">
				<div class="col-md-3 col-xs-12">
					<label for="crno">Counter Receipt No.</label> <input type="text"
						class="form-control" id="GSRcrno">
				</div>

				<div class="col-md-3 col-xs-12">
					<label class="control-label" for="date">Counter Date</label>
					<div class="input-group date" data-provide="datepicker">
						<input type="text" class="form-control">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-xs-12">
					<div class="input-group input-daterange">
						<input type="text" class="form-control" value="2012-04-05">
						<span class="input-group-addon">to</span> <input type="text"
							class="form-control" value="2012-04-19">
					</div>
				</div>

				<div class="col-md-3 col-xs-12">
					<button class="btn btn-default btn_am">
						<span class="glyphicon glyphicon-ok"></span> Auto-Mask
					</button>
				</div>
			</div>

			<!-- ============ TABLE ============ -->
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
					<div class="tbl_wrap">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="bg_dblue ">Date</th>
									<th class="bg_dblue ">Ref</th>
									<th class="bg_dblue ">Terms</th>
									<th class="bg_dblue ">Agent</th>
									<th class="bg_dblue ">Amount</th>
									<th class="bg_dblue ">Balance</th>
									<th class="bg_dblue ">Mask</th>
								</tr>
							</thead>
							<tbody>
								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>

								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>

								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>

								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>

								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>

								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>

								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>

								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>

								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>

								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>

								<tr data-toggle="modal" data-target="#GSRModal">
									<td class="">12/02/16</td>
									<td class="">22345</td>
									<td class="">Dummy data</td>
									<td class="">John Smith</td>
									<td class="">Php. 240</td>
									<td class="">Php. 50</td>
									<td class="">Sample</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="row">
				<button type="button"
					class="col-md-offset-2 col-md-4 col-xs-5 btn btn-primary">Generate
					Counter</button>

				<div class="col-md-5  form-inline TotalAmt">
					<label for="GSRtotalAmt" class="col-md-4 col-xs-3 text-right">Total
						Amount</label> <input type="text" class="form-control col-md-4 col-xs-6"
						id="GSRtotalAmt" disabled>
				</div>

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