
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
		<h3>Agent File</h3>
		<br>

		<div class="row">
			<div class="form-container">
				<form>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="agentname">Agent Name Filter</label> <input
									type="text" id="agentname" class="form-control"
									placeholder="Agent Name">
							</div>

						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="agentdescription">Agent Description Filter</label> <input
									type="text" id="agentdescription" class="form-control"
									placeholder="Agent Description">
							</div>

						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="agentaddress">Address Filter</label> <input
									type="text" id="agentaddress" class="form-control"
									placeholder="Agent Address">
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

				</form>
			</div>
		</div>

		<!-- TABLE FOR AGENT FILE -->
		<div class="row">
			<div class="tbl_wrap">
				<div class="table-responsive">
					<table class="table table-block">
						<thead>
							<tr>
								<th class="bg_dblue text-nowrap">Name</th>
								<th class="bg_dblue text-nowrap">Description</th>
								<th class="bg_dblue text-nowrap">Address</th>
								<th class="bg_dblue text-nowrap">Address 2</th>
								<th class="bg_dblue text-nowrap">Phone</th>
								<th class="bg_dblue text-nowrap">Cellhone</th>

							</tr>
						</thead>
						<tbody>

							<tr style="cursor: pointer;" data-toggle="modal"
								data-target="#myModal">

								<td class="">1</td>
								<td class="">1000 Sand Paper</td>
								<td class="">1000 Sand Paper</td>
								<td class="">Dummy Data</td>
								<td class="">Dummy data</td>
								<td class="">Dummy data</td>

							</tr>
							<tr style="cursor: pointer;" data-toggle="modal"
								data-target="#myModal">

								<td class="">1</td>
								<td class="">1000 Sand Paper</td>
								<td class="">1000 Sand Paper</td>
								<td class="">Dummy Data</td>
								<td class="">Dummy data</td>
								<td class="">Dummy data</td>

							</tr>
							<tr style="cursor: pointer;" data-toggle="modal"
								data-target="#myModal">

								<td class="">1</td>
								<td class="">1000 Sand Paper</td>
								<td class="">1000 Sand Paper</td>
								<td class="">Dummy Data</td>
								<td class="">Dummy data</td>
								<td class="">Dummy data</td>

							</tr>

							<tr style="cursor: pointer;" data-toggle="modal"
								data-target="#myModal">

								<td class="">1</td>
								<td class="">1000 Sand Paper</td>
								<td class="">1000 Sand Paper</td>
								<td class="">Dummy Data</td>
								<td class="">Dummy data</td>
								<td class="">Dummy data</td>

							</tr>

							<tr style="cursor: pointer;" data-toggle="modal"
								data-target="#myModal">

								<td class="">1</td>
								<td class="">1000 Sand Paper</td>
								<td class="">1000 Sand Paper</td>
								<td class="">Dummy Data</td>
								<td class="">Dummy data</td>
								<td class="">Dummy data</td>

							</tr>




						</tbody>
					</table>
				</div>
			</div>
		</div>
		<br>
		<div class="text-right">
			<button class="btn btn-default">
				<span class="glyphicon glyphicon-print"></span> Print
			</button>
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