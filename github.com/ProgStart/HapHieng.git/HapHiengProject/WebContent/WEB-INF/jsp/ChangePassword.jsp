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
	
	<!-- MAIN CONTENT -->
	<div class="container-fluid">
		<!-- TITLE OF PAGE -->
		<h3>Change Password</h3>
		<br>
		<form method="POST" id="changePasswordForm" action="/HapHiengProject/ChangePasswordSubmit">
			<div class="changepasswordbox">
			<c:choose>
			  <c:when test="${errorMessage == 'samePassword'}">
			     <div class="alert alert-danger">
			       <strong>Error Changing Password!</strong>
			       Old and New Password are the same
			     </div>
			  </c:when>
			  <c:when test="${errorMessage == 'oldPasswordIncorrect'}">
				<div class="alert alert-danger">
			       <strong>Error Changing Password!</strong>
			       Your Old Password is Incorrect
			     </div>
			  </c:when>
			</c:choose>
				<div class="form-group">
					<label for="oldpassword">Old Password <span style="color:red;">*</span></label>
					<input type="password" class="form-control" id="oldpassword" name="oldpassword" placeholder="Old Password" required>
				</div>
		
				<div class="form-group">
					<label for="oldpassword">New Password <span style="color:red;">*</span></label>
					<input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="New Password" required>
				</div>
				<!-- ACTION BUTTONS -->
				
					<button type="button" class="btn btn-default" id="clear-button">Clear</button>
					<button type="button" data-toggle="modal" data-target="#ConfirmationModal" class="btn btn-primary">Change Password</button>
			 <!-- CSRF PROTECTION -->
			 <input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
			</div>
		</form>
		

	</div>

</div>

<!-- ADDED BY SEIJI VILLAFRANCA 2016/11/26 -->
<!-- CONFIRMATION FOR MODAL -->
<div id="ConfirmationModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- MODAL CONTENT-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Changing Password</h4>
      </div>
      <div class="modal-body">
        <h4>Are you sure you want to change your password?</h4>
        <p><strong>Warning!</strong> Changing your password will take effect immediately after your next login</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" form="changePasswordForm" class="btn btn-primary" >Yes</button>
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

$(document).ready(function(){
	$("#clear-button").click(function(){
		$("#oldpassword").val("");
		$("#newpassword").val("");
		});
});

</script>
</html>