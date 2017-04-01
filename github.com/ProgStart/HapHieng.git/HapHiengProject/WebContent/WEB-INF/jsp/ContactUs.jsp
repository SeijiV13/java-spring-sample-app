
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
		<h3>Contact Us</h3>
		<hr>
		<br>
		<div class="row">
			<div class="info-box text-center">
				<h5>For problems encountered, you can directly contact us here,
					issues regarding the program will be directly emailed to the
					developers</h5>
			</div>
			<br>
			<form class="form-container" method="POST" action="/HapHiengProject/ContactUs">
				<label for="problems">Problems Encountered <sup
					class="fa fa-asterisk"></sup></label>
				<textarea name="issues" rows="5" class="form-control" id="problems"
					placeholder="Enter issues here" required></textarea>
				<br>
				<div class="text-right">
					<button type="button" class="btn btn-default clear-button">Clear</button>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
				<!-- CSRF TOKEN -->
				<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
			</form>

			<div class="form-container">
				<h4>Contact Information</h4>
				<div class="row">
					<div class="col-md-3">
						<p>
							<b>Seiji Villafranca</b>
						</p>
						<p>Project Head</p>
						<hr>
						<p>Email: villafrancasra@gmail.com</p>
						<p>Phone Number: 09052895020</p>
					</div>
					<div class="col-md-3">
						<p>
							<b>Christian Cirineo</b>
						</p>
						<p>Back End Developer</p>
						<hr>
						<p>Email: xtian.cirineo@gmail.com</p>
						<p>Phone Number: 09155956827</p>
					</div>
					<div class="col-md-3">
						<p>
							<b>Erika Papa</b>
						</p>
						<p>Front End Developer</p>
						<hr>
						<p>Email: villafrancasra@gmail.com</p>
						<p>Phone Number: 090528295426</p>
					</div>
					<div class="col-md-3">
						<p>
							<b>Harley Tan</b>
						</p>
						<p>Database Programmer</p>
						<hr>
						<p>Email: harleytan09@gmail.com</p>
						<p>Phone Number: 09173845850</p>
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
	$(document).ready(function() {
		$(".clear-button").click(function(){
			$("#problems").val("");
		})
	})
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>