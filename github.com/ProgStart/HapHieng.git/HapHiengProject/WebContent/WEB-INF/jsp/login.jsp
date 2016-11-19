<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HapHieng Inventory System</title>
</head>

<!--  JQUERY AND JS LINKS -->
<spring:url value="/resources/js/jquery/jquery.min.js" var="JQuery" />
<script src="${JQuery}" type="text/javascript"></script>

<spring:url value="/resources/js/index.js" var="loginjs" />
<script src="${loginjs}" type="text/javascript"></script>

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

<!-- LOGIN CSS -->
<spring:url value="/resources/css/login-style.css" var="Login" />
<link rel="stylesheet" href="${Login}" />

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



<!-- MAIN LOGIN FORM -->
<div class="pen-title">


<!-- ERROR & LOGOUT ALERTS -->

 	<c:choose>
 	 <c:when test = "${message == 'logout'}">
		<div class="alert alert-success">
			<strong>Success</strong>
				You have Successfully logout!
		</div>
	</c:when>
	</c:choose>


<!--#/ ERROR & LOGOUT  ALERTS -->

  <h1>HapHieng</h1><span>Inventory System</span>
</div>
<div class="module form-module">
  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
  </div>
  <div class="form">
    <h2>Login to your account</h2>
    <form name='loginForm'
		  action="<c:url value='/j_spring_security_check' />" method='POST'>
      <input type="text" name="username" placeholder="Username" required/>
      <input type="password"  name="password" placeholder="Password" required/>
     
      <button name="submit" type="submit">Login</button>
    <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
    </form>
  </div>

</div>
<!-- ONLINE LIBRARY -->
 <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://codepen.io/andytran/pen/vLmRVp.js'></script>


</body>
</html>