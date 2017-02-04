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
<spring:url value="/resources/js/bootstrap-datepicker.js" var="DatePJS" />
<script src="${DatePJS}" type="text/javascript"></script>

<spring:url value="/resources/css/boostrap-datepicker.css" var="DatePCss" />
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
	<div class="container-fluid PRR">
		<!-- TITLE OF PAGE -->
		<h3>Purchase Return Reports</h3>
		
		<hr>
		
		<div class="row show">
			<div class="col-md-3">
				<button class="btn btn-default center-block sales-report-button" id="PRRad_btn"> Agent & Date Input </button>
			</div>
			
			<div class="col-md-3">
				<button class="btn btn-default center-block sales-report-button" id="PRRccd_btn"> Customer/Category/Date Input </button>
			</div>
			
			<div class="col-md-3">
				<button class="btn btn-default center-block sales-report-button" id="PRRdate_btn"> Date Input </button>
			</div>
			
			<div class="col-md-3">
				<button class="btn btn-default center-block sales-report-button" id="PRRisrh_btn"> Item Sales Return History Input </button>
			</div>
		</div>
		
		<div class="row">
			
			<div class="col-md-offset-3 col-md-6 form-container">
				
				<div id="PRRad" class="hide">
					<select class="form-control">
					  	<option>Agent</option>
					</select>
					
					<div class="input-group input-daterange">
						<span class="input-group-addon">Date</span>
					    <input type="text" class="form-control" value="2012-04-05">
					    <span class="input-group-addon">to</span>
					    <input type="text" class="form-control" value="2012-04-19">
					</div>
					
					<div class="text-right">
					
							<button type="button" class="btn btn-primary" data-dismiss="modal">
					        	<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					        	Ok
					       </button>
						
							<button type="button" class="btn btn-default" data-dismiss="modal">
					        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					        	Cancel
					       </button>
					
						
						 
					</div> <!-- end of btns -->
					
				</div> <!-- end: PRRR AD -->
				
				<div id="PRRccd" class="hide">
					<select class="form-control">
					  	<option>Customer</option>
					</select>
					
					<select class="form-control">
					  	<option>Category</option>
					</select>
					
					<div class="input-group input-daterange">
						<span class="input-group-addon">Date</span>
					    <input type="text" class="form-control" value="2012-04-05">
					    <span class="input-group-addon">to</span>
					    <input type="text" class="form-control" value="2012-04-19">
					</div>
					
					<div class="text-right">
					
							<button type="button" class="btn btn-primary" data-dismiss="modal">
					        	<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					        	Ok
					       </button>
					
							<button type="button" class="btn btn-default" data-dismiss="modal">
					        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					        	Cancel
					       </button>
					
						
						 
					</div> <!-- end of btns -->
					
				</div> <!-- end: PRR CCD -->
				
				<div id="PRRdate" class="hide">
					
					<div class="input-group input-daterange">
						<span class="input-group-addon">Date</span>
					    <input type="text" class="form-control" value="2012-04-05">
					    <span class="input-group-addon">to</span>
					    <input type="text" class="form-control" value="2012-04-19">
					</div>
					
					<div class="text-right">
						
							<button type="button" class="btn btn-primary" data-dismiss="modal">
					        	<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					        	Ok
					       </button>

							<button type="button" class="btn btn-default" data-dismiss="modal">
					        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					        	Cancel
					       </button>
						
						
						 
					</div> <!-- end of btns -->
					
				</div> <!-- end: PRR date -->
				
				<div id="PRRisrh" class="hide">
				
					<select class="form-control">
					  	<option>Item Code</option>
					</select>
					
					<div class="input-group input-daterange">
						<span class="input-group-addon">Date</span>
					    <input type="text" class="form-control" value="2012-04-05">
					    <span class="input-group-addon">to</span>
					    <input type="text" class="form-control" value="2012-04-19">
					</div>
					
					<div class="text-right">
							<button type="button" class="btn btn-primary" data-dismiss="modal">
					        	<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					        	Ok
					       </button>
				
							<button type="button" class="btn btn-default" data-dismiss="modal">
					        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					        	Cancel
					       </button>
			
						
						 
					</div> <!-- end of btns -->
					
				</div> <!-- end: PRR item sales return history -->
				
			</div>
			
			
		</div>
		
		
	</div>
</div>

</body>
</html>