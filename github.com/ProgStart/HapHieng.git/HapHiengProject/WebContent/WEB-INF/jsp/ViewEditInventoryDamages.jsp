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

<link href="<c:url value="/resources/css/style-media.css" />" rel="stylesheet">

<!-- DATEPICKER LINKS -->
<link href="<c:url value="/resources/css/bootstrap-datepicker.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/bootstrap-datepicker.js" />"></script>

<!-- FONT LINKS -->
<link href="http://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet" type="text/css">
</head>
<body>



<!-- ADDED BY SEIJI VILLAFRANCA 2016/11/26 -->
<!-- MAIN NAVBAR TAG -->
<navbar:mainnavbar />  <!-- FOUND IN /WEB-INF/tags/mainnavbar.tag -->


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
	
	<h5><span class="fa fa-user"></span> User Login: ${username}</h5>
    <h5><span class="fa fa-calendar"></span> Date: ${dateToday}</h5>
	
	<!-- MAIN CONTENT -->
	<div class="container-fluid IDE">
		<!-- TITLE OF PAGE -->
		<h3>Inventory Damage Form</h3>
		
		<!-- ============ TABLES ============ -->
		<div class="row">
		
			<div class="col-md-3"> <!-- DATE/REF (COL 1) -->
				<div class="row">
					<div class="tbl_wrap">
						<table class="table table-hover">
							<thead>
					            <tr>
					              	<th class="bg_dblue">Date</th>
									<th class="bg_dblue">Ref.</th>
					            </tr>
					          </thead>
					          
					          <tbody>
					          	<tr>
					          		<td>11/28/2016</td>
					          		<td>20061284</td>
					          	</tr>
					          	
					          	<tr>
					          		<td>11/28/2016</td>
					          		<td>20061284</td>
					          	</tr>
					          	
					          	<tr>
					          		<td>11/28/2016</td>
					          		<td>20061284</td>
					          	</tr>
					          	
					          	<tr>
					          		<td>11/28/2016</td>
					          		<td>20061284</td>
					          	</tr>
					          	
					          </tbody>
						</table>
					</div>
				</div> <!-- END: ROW INSIDE -->
			</div> <!-- END: COL 1 -->
			
			<div class="col-md-8 col-md-offset-1"> <!-- OTHER COLUMNS (COL 2) -->
				<div class="row">
					<div class="tbl_wrap">
						<table class="table table-hover">
				          <thead>
				            <tr>
								<th class=" bg_dblue ">Item Code</th>
								<th class=" bg_dblue ">Category</th>
								<th class=" bg_dblue ">Qty</th>
								<th class=" bg_dblue ">QtyStock</th>
								<th class=" bg_dblue ">Price</th>
								<th class=" bg_dblue ">Amount</th>
								<th class=" bg_dblue ">Remark</th>
				            </tr>
				          </thead>
				          <tbody>
				            <tr>
								<td>200134</td>
								<td>Clutch Fork</td>
								<td>10</td>
								<td>10</td>
								<td>12.00</td>
								<td>120.00</td>
								<td>4th floor</td>
							</tr>
							
							<tr>
								<td>200134</td>
								<td>Clutch Fork</td>
								<td>10</td>
								<td>10</td>
								<td>12.00</td>
								<td>120.00</td>
								<td>4th floor</td>
							</tr>
							
							
				          </tbody>
				        </table>
					</div>
					
				</div> <!-- END: ROW INSIDE -->
			</div> <!-- END: COL 2 -->
			
		</div> <!-- END: TABLES ROW -->
		
		<div class="btn-group btn-group-justified " role="group" aria-label="...">

				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						Find
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">
						<span class="fa fa-trash" aria-hidden="true"></span>
						Delete Batch
					</button>
				</div>
				
			</div>
		
		
	</div> <!-- END: CONTAINER -->



</body>


<!-- FOR LOGOUT SPRING SECURITY FUNCTION -->
<script type="text/javascript">
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>

</html>