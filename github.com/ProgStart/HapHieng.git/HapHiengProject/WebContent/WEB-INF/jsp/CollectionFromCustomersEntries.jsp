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
	<div class="container-fluid CFC">
		<!-- TITLE OF PAGE -->
		<h3>Collection from Customers Entries</h3>
		
		<hr>
		<div class="row head_nav">
			<div class="col-md-3">
				<label for="CFCprno">PR no.</label>
				<input type="text" class="form-control" id="CFCprno">
			</div>
			
			
			<div class="col-md-3">
				<label class="control-label" for="date">Payment Date</label>
		        <div class="input-group date" data-provide="datepicker">
				    <input type="text" class="form-control">
				    <div class="input-group-addon">
				        <span class="glyphicon glyphicon-calendar"></span>
				    </div>
				</div>
			</div>
			
			<div class="col-md-1 btn_am">
				<button class="btn btn-primary">
					<span class="fa fa-check"></span>
					Post
				</button>
			</div>
		
		</div>
	
		<!-- ============ TABLE ============ -->
		<div class="row">
			<h4>Checks</h4>
			
			<div class="tbl_wrap">
				<table class="table tables table-hover">
		          <thead>
		            <tr>
		              	<th class="bg_dblue">Check date</th>
						<th class="bg_dblue">Type</th>
						<th class="bg_dblue">AcctNo</th>
						<th class="bg_dblue">Bank</th>
						<th class="bg_dblue">Branch</th>
						<th class="bg_dblue">Check no.</th>
						<th class="bg_dblue">Amount</th>
						<th class="bg_dblue">Days</th>
		            </tr>
		          </thead>
		          <tbody>
		          	
		           <tr data-toggle="modal" data-target="#CFCModal">
		           		<td class="">1/1/2016</td>
						<td class="">Sample</td>
						<td class="">34675348</td>
						<td class="">Metrobank</td>
						<td class="">Manila</td>
						<td class="">183000124</td>
						<td class="">Php. 20, 000</td>
						<td class="">10</td>		
				   </tr>
				   
				   <tr data-toggle="modal" data-target="#CFCModal">
		           		<td class="">1/1/2016</td>
						<td class="">Sample</td>
						<td class="">34675348</td>
						<td class="">Metrobank</td>
						<td class="">Manila</td>
						<td class="">183000124</td>
						<td class="">Php. 20, 000</td>
						<td class="">10</td>	
				   </tr>
				   
				   <tr data-toggle="modal" data-target="#CFCModal">
		           		<td class="">1/1/2016</td>
						<td class="">Sample</td>
						<td class="">34675348</td>
						<td class="">Metrobank</td>
						<td class="">Manila</td>
						<td class="">183000124</td>
						<td class="">Php. 20, 000</td>
						<td class="">10</td>		
				   </tr>
				   
				   <tr data-toggle="modal" data-target="#CFCModal">
		           		<td class="">1/1/2016</td>
						<td class="">Sample</td>
						<td class="">34675348</td>
						<td class="">Metrobank</td>
						<td class="">Manila</td>
						<td class="">183000124</td>
						<td class="">Php. 20, 000</td>
						<td class="">10</td>		
				   </tr>
				   
				   <tr data-toggle="modal" data-target="#CFCModal">
		           		<td class="">1/1/2016</td>
						<td class="">Sample</td>
						<td class="">34675348</td>
						<td class="">Metrobank</td>
						<td class="">Manila</td>
						<td class="">183000124</td>
						<td class="">Php. 20, 000</td>
						<td class="">10</td>		
				   </tr>
					
					
		          </tbody>
		        </table>
			</div>
		</div> <!-- END: row - checks table -->
		
		<div class="row">
			
			<div class="col-md-4">
				<h4>Discounts</h4>
				
				<div class="tbl_wrap">
					<table class="table tables table-hover">
			          <thead>
			            <tr>
							<th class="bg_dblue">Description</th>
							<th class="bg_dblue">Amount</th>
			            </tr>
			          </thead>
			          <tbody>
			          	
			           <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">Sample</td>
							<td class="">Php. 20, 000</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">Sample</td>
							<td class="">Php. 20, 000</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">Sample</td>
							<td class="">Php. 20, 000</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">Sample</td>
							<td class="">Php. 20, 000</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">Sample</td>
							<td class="">Php. 20, 000</td>		
					   </tr>
					   
			          </tbody>
			        </table>
				</div>
				
			</div> <!-- END: row - discounts table -->
			
			<div class="col-md-8">
				<h4>Returns</h4>
				
				<div class="tbl_wrap">
					<table class="table table-hover">
			          <thead>
			            <tr>
							<th class="bg_dblue">Ref no.</th>
							<th class="bg_dblue">Date</th>
							<th class="bg_dblue">Amount</th>
							<th class="bg_dblue">Balance</th>
							<th class="bg_dblue">Apply Amount</th>
			            </tr>
			          </thead>
			          <tbody>
			          	
			           <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">000012831</td>
			           		<td class="">1/1/2015</td>
							<td class="">Php. 20, 000</td>
							<td class="">Php. 120, 000</td>
							<td class="">Sample</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">000012831</td>
			           		<td class="">1/1/2015</td>
							<td class="">Php. 20, 000</td>
							<td class="">Php. 120, 000</td>
							<td class="">Sample</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">000012831</td>
			           		<td class="">1/1/2015</td>
							<td class="">Php. 20, 000</td>
							<td class="">Php. 120, 000</td>
							<td class="">Sample</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">000012831</td>
			           		<td class="">1/1/2015</td>
							<td class="">Php. 20, 000</td>
							<td class="">Php. 120, 000</td>
							<td class="">Sample</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">000012831</td>
			           		<td class="">1/1/2015</td>
							<td class="">Php. 20, 000</td>
							<td class="">Php. 120, 000</td>
							<td class="">Sample</td>		
					   </tr>
					   
			          </tbody>
			        </table>
				</div>
				
			</div>
			
		</div> <!-- END: 2nd row table -->
		
		<div class="row">
			<h4>Transactions</h4>
			
			<div class="tbl_wrap">
					<table class="table tables table-hover">
			          <thead>
			            <tr>
			            	<th class="bg_dblue">Type</th>
							<th class="bg_dblue">Ref no.</th>
							<th class="bg_dblue">Date</th>
							<th class="bg_dblue">Terms</th>
							<th class="bg_dblue">Amount</th>
							<th class="bg_dblue">Balance</th>
							<th class="bg_dblue">Apply Amount</th>
			            </tr>
			          </thead>
			          <tbody>
			          	
			           <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">C</td>
			           		<td class="">000012831</td>
			           		<td class="">1/1/2015</td>
			           		<td class="">0</td>
							<td class="">Php. 20, 000</td>
							<td class="">Php. 120, 000</td>
							<td class="">Sample</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">C</td>
			           		<td class="">000012831</td>
			           		<td class="">1/1/2015</td>
			           		<td class="">0</td>
							<td class="">Php. 20, 000</td>
							<td class="">Php. 120, 000</td>
							<td class="">Sample</td>	
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">C</td>
			           		<td class="">000012831</td>
			           		<td class="">1/1/2015</td>
			           		<td class="">0</td>
							<td class="">Php. 20, 000</td>
							<td class="">Php. 120, 000</td>
							<td class="">Sample</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">C</td>
			           		<td class="">000012831</td>
			           		<td class="">1/1/2015</td>
			           		<td class="">0</td>
							<td class="">Php. 20, 000</td>
							<td class="">Php. 120, 000</td>
							<td class="">Sample</td>		
					   </tr>
					   
					   <tr data-toggle="modal" data-target="#CFCModal">
			           		<td class="">C</td>
			           		<td class="">000012831</td>
			           		<td class="">1/1/2015</td>
			           		<td class="">0</td>
							<td class="">Php. 20, 000</td>
							<td class="">Php. 120, 000</td>
							<td class="">Sample</td>		
					   </tr>
					   
			          </tbody>
			        </table>
				</div>
			
		</div> <!-- END: Transactions - 3rd row table -->
		
		<div class="row">
			
			<div class="col-md-4 form-horizontal">
				<div class="form-group">
				    <label class="control-label col-md-5" for="CFCcheckpay">Checks Payment</label>
				    <div class="col-md-7">
				      <input type="text" class="form-control" id="CFCcheckpay" disabled placeholder="0.00">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="control-label col-md-5" for="CFCcashpay">Cash Payment</label>
				    <div class="col-md-7">
				      <input type="text" class="form-control" id="CFCcashpay" placeholder="0.00">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="control-label col-md-5" for="CFCdisc">Discounts</label>
				    <div class="col-md-7">
				      <input type="text" class="form-control" id="CFCdisc" disabled placeholder="0.00">
				    </div>
				  </div>
				  
				  <hr>
				  <div class="form-group">
				    <label class="control-label col-md-5" for="CFCcollect">Collection Total</label>
				    <div class="col-md-7">
				      <input type="text" class="form-control" id="CFCcollect" disabled placeholder="0.00">
				    </div>
				  </div>
			</div>
			
			<div class="col-md-4 form-horizontal">
				<div class="form-group">
				    <label class="control-label col-md-5" for="CFCtotalAr">Total AR</label>
				    <div class="col-md-7">
				      <input type="text" class="form-control" id="CFCtotalAr"  placeholder="0.00">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="control-label col-md-5" for="CFCtotalret">Total Returns</label>
				    <div class="col-md-7">
				      <input type="text" class="form-control" id="CFCtotalret" placeholder="0.00">
				    </div>
				  </div>
				  
				  <hr>
				  <div class="form-group">
				    <label class="control-label col-md-5" for="CFCnetAr">Net AR</label>
				    <div class="col-md-7">
				      <input type="text" class="form-control" id="CFCnetAr" disabled placeholder="0.00">
				    </div>
				  </div>
			</div>
			
			<div class="col-md-4 text-center">
				<label for="CFCbal"><h4><b>Balance</b></h4></label>
				<input type="text" class="form-control" id="CFCbal" placeholder="0.00">
			</div>
			
		</div> <!-- END: last row -->
		
			
	</div> <!-- END: CFC -->
		
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