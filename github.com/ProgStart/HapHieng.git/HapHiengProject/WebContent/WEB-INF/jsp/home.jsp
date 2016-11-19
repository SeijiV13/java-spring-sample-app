
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Movie Cart</title>
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

<body>
	<div id="wrapper">
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<div class="search-form-box">

					<li class="sidebar-brand"><a href="#" style="color: white">HapHieng
							System<span class="fa fa-area-chart fa-2x"></span>
					</a></li> <br>
					<h3 style="color: white;">
						Menu <span class="fa fa-sticky-note"></span>
					</h3>

					<!-- MENU LIST -->
					<div class="dropdown">
						<button class="btn btn-info dropdown-toggle menu-button"
							type="button" data-toggle="dropdown">
							Entries <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">Sales Order Entries</a></li>
							<li><a href="#">Sales Entries</a></li>
							<li><a href="#">Sales Return Entries</a></li>
							<li><a href="#">Inventory Damage Entries (Internal)</a></li>
							<li><a href="#">Generate Sales Counter Receipts</a></li>
							<li><a href="#">Payment to Suppliers Entries</a></li>
						</ul>
					</div>

					<div class="dropdown">
						<button class="btn btn-info dropdown-toggle menu-button"
							type="button" data-toggle="dropdown">
							Files <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">Inventory File</a></li>
							<li><a href="#">Customer File</a></li>
							<li><a href="#">Agent File</a></li>
							<li><a href="#">Inventory Category File</a></li>

						</ul>
					</div>

					<div class="dropdown">
						<button class="btn btn-info dropdown-toggle menu-button"
							type="button" data-toggle="dropdown">
							Reports <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li class="dropdown-header">Sales Return Reports</li>
							<li><a href="#">All Daily Returns</a></li>
							<li><a href="#">Return By Item</a></li>
							<li><a href="#">Return By Customer-Category Item</a></li>
							<li><a href="#">Return By Agent</a></li>
							<li class="divider"></li>
							<li><a href="#">Suppliers List</a></li>
							<li><a href="#">Agent List</a></li>
						</ul>
					</div>

					<div class="dropdown">
						<button class="btn btn-info dropdown-toggle menu-button"
							type="button" data-toggle="dropdown">
							Tools <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">View/Edit Sales</a></li>
							<li><a href="#">View/Edit Sales Returns</a></li>
							<li><a href="#">View/Edit Counter Receipts</a></li>
							<li><a href="#">Supplier Transactions</a></li>
							<li><a href="#">Change Password</a></li>
						</ul>
					</div>

					<div class="dropdown">
						<button class="btn btn-info dropdown-toggle menu-button"
							type="button" data-toggle="dropdown">
							About <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">About</a></li>
						</ul>
					</div>



					<br> <br>

				</div>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
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

						<input value="1" id="menustate" hidden> <br> <br>

					</div>

				</div>
			</div>
			<!-- MAIN FRAME -->
			<div class="container-fluid">
				<!-- TITLE OF PAGE -->
				<h3></h3>
				<br>
				<div class="row"></div>

			</div>
		</div>
		<!-- /#page-content-wrapper -->



	</div>

	<script type="text/javascript">
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>


</body>
</html>