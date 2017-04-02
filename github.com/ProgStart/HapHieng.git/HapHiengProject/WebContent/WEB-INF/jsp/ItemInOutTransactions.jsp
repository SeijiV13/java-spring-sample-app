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
	<div class="container-fluid IOT">
		<!-- TITLE OF PAGE -->
		<h3>Item-In Out Transactions</h3>
		
		<hr>
		<div class="row head_nav">
			
			<div class="row"> 
				<div class="col-md-4 form-horizontal">
					<select class="form-control">
					  	<option>Item Code / Description</option>
					  	 <c:forEach var="product" items="${sessionScope.products}">
					  	  <option value="${product.item_code}">${product.item_code}/${product.description}</option>
					  	</c:forEach>		  	
					 </select>
				</div>
				
				<div class="col-md-4 form-horizontal">
					<label for="IOTdate" class="col-md-2">Date from</label>
					<div class="input-group input-daterange col-md-10" id="IOTdate">
					    <input type="text" class="form-control" value="2012-04-05">
					    <span class="input-group-addon">to</span>
					    <input type="text" class="form-control" value="2012-04-19">
					</div>
						
				</div>
				
				<div class="col-md-2 form-horizontal ">
					<button class="btn btn-default center-block">
						<span class="fa fa-search"></span> Find Reference
					</button>
				</div>
				
				<div class="col-md-2 form-horizontal">
					<button class="btn btn-default">
						<span class="fa fa-print"></span> Print
					</button>
				</div>
			</div> <!-- END: FIRST ROW -->
			
			<div class="row"> 
				
				<div class="col-md-4">
					<h4>Clients</h4>
					
					<div class="radio">
					  <label>
					    <input type="radio" class="IOTradios" name="IOTRadios" id="IOTradio1" value="option1">
					     All Suppliers
					  </label>
					</div>
				
					<div class="radio">
					  <label>
					    <input type="radio" class="IOTradios" name="IOTRadios" id="IOTradio2" value="option2" >
					     All Sales Transaction
					  </label>
					</div>
					
					<div class="radio">
					  <label>
					    <input type="radio" name="IOTRadios" id="IOTradio3" value="option3" >
					     <select class="form-control IOTselect" disabled>
						  	<option>Select Client</option>
						 </select>
					  </label>
					</div> 
				</div>	<!-- END: CLIENTS -->
				
				<div class="col-md-4 form-horizontal">
					
					<div class="form-group txtbox">
					    <label class="control-label col-md-3" for="IOTIn">Total In:</label>
					    <div class="col-md-9">
					      <input type="text" class="form-control" id="IOTIn" disabled placeholder="102891">
					    </div>
					 </div>
					 
					 <div class="form-group txtbox">
					    <label class="control-label col-md-3" for="IOTOut">Total Out:</label>
					    <div class="col-md-9">
					      <input type="text" class="form-control" id="IOTOut" disabled placeholder="102891">
					    </div>
					 </div>
					 
					 <div class="form-group txtbox">
					    <label class="control-label col-md-3" for="IOTAdj">Total Adj:</label>
					    <div class="col-md-9">
					      <input type="text" class="form-control" id="IOTAdj" disabled placeholder="102891">
					    </div>
					 </div>
				  	
				</div> <!-- END: TOTALS -->
				
				<div class="col-md-4 form-horizontal InOutAdj">
					
					<div class="form-group txtbox">
					    <label class="control-label col-md-5" for="IOTOut">In-Out+Adj:</label>
					    <div class="col-md-7">
					      <input type="text" class="form-control" id="IOTOut" disabled placeholder="102891">
					    </div>
					 </div>
					 
					 <div class="form-group txtbox">
					    <label class="control-label col-md-5" for="IOTOut">Record Qty:</label>
					    <div class="col-md-7">
					      <input type="text" class="form-control" id="IOTOut" disabled placeholder="102891">
					    </div>
					 </div>
					
				</div>
				
				
			</div> <!-- END: SECOND ROW -->
			
		</div> <!-- END: UPPER PART NAV -->
		
		<!-- ========================== TABLE =========================== -->
			
		<div class="tbl_wrap">
			<table class="table table-hover">
	          <thead>
	            <tr>
	              	<th class="bg_dblue">Date</th>
					<th class="bg_dblue">Client</th>
					<th class="bg_dblue">Reference</th>
					<th class="bg_dblue">Price</th>
					<th class="bg_dblue">Currency</th>
					<th class="bg_dblue">Qty_In</th>
					<th class="bg_dblue">Qty_Out</th>
					<th class="bg_dblue">Qty_Adj</th>
					<th class="bg_dblue">Balance</th>
					<th class="bg_dblue">Agent</th>
	            </tr>
	          </thead>
	          <tbody>
	          <c:forEach var="inOutTransaction" items="${sessionScope.inOutTransactions}">
	           <tr data-toggle="modal" data-target="#IOTModal">
	           		<td class="">${inOutTransaction.date}</td>
					<td class="">${inOutTransaction.client}</td>
					<td class="">${inOutTransaction.reference_no }</td>
					<td class="">${inOutTransaction.price}</td>
					<td class="">${inOutTransaction.currency}</td>
					<td class="">${inOutTransaction.quantity_in}</td>
					<td class="">${inOutTransaction.quantity_out}</td>
					<td class="">${inOutTransaction.quantity_adjustment}</td>
					<td class="">${inOutTransaction.balance}</td>
					<td class="">${inOutTransaction.agent}</td>
				</tr>
				</c:forEach>
				
	          </tbody>
	        </table> 
		</div>
		
		
	</div>
</div>

</body>
</html>