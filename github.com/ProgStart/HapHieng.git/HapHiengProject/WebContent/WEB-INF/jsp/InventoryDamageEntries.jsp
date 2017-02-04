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
		<h3>Inventory Damage Entries</h3>
		
		<!-- ====== UPPER PART ====== -->
		<hr>
		<div class="row head_nav">
			<div class="col-md-5 col-md-offset-1 form-inline col-xs-12">
				<label for="refno">Reference No.</label>
				<input type="text" class="form-control" id="IDErefno">
			</div>
			
			<div class="col-md-5 col-md-offset-1 form-inline col-xs-12">
				<label class="control-label" for="date">Date</label>
		        <div class="input-group date" data-provide="datepicker">
				    <input type="text" class="form-control">
				    <div class="input-group-addon">
				        <span class="glyphicon glyphicon-calendar"></span>
				    </div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<!-- ============ TABLE ============ -->
			<div class="tbl_wrap">
				<table class="table table-hover">
		          <thead>
		            <tr>
		              	<th class=" bg_dblue ">Row No.</th>
						<th class=" bg_dblue ">Item Code</th>
						<th class=" bg_dblue ">Quantity</th>
						<th class=" bg_dblue ">Category</th>
						<th class=" bg_dblue ">Qty Stock</th>
						<th class=" bg_dblue ">Unit Cost</th>
						<th class=" bg_dblue ">Amount</th>
						<th class=" bg_dblue ">Remark</th>
		            </tr>
		          </thead>
		          <tbody>
		            <tr  data-toggle="modal" data-target="#IDEModal">
						<td class="">1</td>
						<td class="">22345</td>
						<td class="">20</td>
						<td class="">Tools</td>
						<td class="">240</td>
						<td class="">Php. 50</td>
						<td class="">Php. 1,000</td>
						<td class="">Sample</td>
					</tr>
					
					<tr  data-toggle="modal" data-target="#IDEModal">
						<td class="">2</td>
						<td class="">22345</td>
						<td class="">20</td>
						<td class="">Tools</td>
						<td class="">240</td>
						<td class="">Php. 50</td>
						<td class="">Php. 1,000</td>
						<td class="">Sample</td>
					</tr>
					
					<tr  data-toggle="modal" data-target="#IDEModal">
						<td class="">3</td>
						<td class="">22345</td>
						<td class="">20</td>
						<td class="">Tools</td>
						<td class="">240</td>
						<td class="">Php. 50</td>
						<td class="">Php. 1,000</td>
						<td class="">Sample</td>
					</tr>
					
					<tr  data-toggle="modal" data-target="#IDEModal">
						<td class="">4</td>
						<td class="">22345</td>
						<td class="">20</td>
						<td class="">Tools</td>
						<td class="">240</td>
						<td class="">Php. 50</td>
						<td class="">Php. 1,000</td>
						<td class="">Sample</td>
					</tr>
					
					<tr  data-toggle="modal" data-target="#IDEModal">
						<td class="">5</td>
						<td class="">22345</td>
						<td class="">20</td>
						<td class="">Tools</td>
						<td class="">240</td>
						<td class="">Php. 50</td>
						<td class="">Php. 1,000</td>
						<td class="">Sample</td>
					</tr>
					
					<tr  data-toggle="modal" data-target="#IDEModal">
						<td class="">6</td>
						<td class="">22345</td>
						<td class="">20</td>
						<td class="">Tools</td>
						<td class="">240</td>
						<td class="">Php. 50</td>
						<td class="">Php. 1,000</td>
						<td class="">Sample</td>
					</tr>
		          </tbody>
		        </table>
			</div>
			
			<!-- ============= MODAL =============== -->
	        <div class="modal fade" id="IDEModal" tabindex="-1" role="dialog" >
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h3 class="modal-title">Select an item</h3>
			      </div>
			      
			      <div class="modal-body">
			        <!-- ============= MODAL TABLE =============== -->
			        <div class="tbl_wrap">
		        		<table class="table  table-hover">
				          <thead>
				            <tr>
				            	<th class="bg_dblue">Tx</th>
				              	<th class="bg_dblue">SearchString</th>
								<th class="bg_dblue">Item code</th>
								<th class="bg_dblue">Category</th>
								<th class="bg_dblue">Description</th>
								<th class="bg_dblue">Qty</th>
								<th class="bg_dblue">Price</th>
				            </tr>
				          </thead>
				          <tbody>
				          	<tr>
				          		<td class=""></td>
				          		<td class="">New Product Line</td>
				          		<td class="">BS-006</td>
				          		<td class="">Bleeder Screw</td>
				          		<td class="">Bleeder Screw = Toyota (7 x 3.5) NC</td>
				          		<td class="">0</td>
				          		<td class="">4.08</td>
				          	</tr>
				          	
				          	<tr>
				          		<td class=""></td>
				          		<td class="">New Product Line</td>
				          		<td class="">BS-006</td>
				          		<td class="">Bleeder Screw</td>
				          		<td class="">Bleeder Screw = Toyota (7 x 3.5) NC</td>
				          		<td class="">0</td>
				          		<td class="">4.08</td>
				          	</tr>
				          	
				          	<tr>
				          		<td class=""></td>
				          		<td class="">New Product Line</td>
				          		<td class="">BS-006</td>
				          		<td class="">Bleeder Screw</td>
				          		<td class="">Bleeder Screw = Toyota (7 x 3.5) NC</td>
				          		<td class="">0</td>
				          		<td class="">4.08</td>
				          	</tr>
				          	
				          	<tr>
				          		<td class=""></td>
				          		<td class="">New Product Line</td>
				          		<td class="">BS-006</td>
				          		<td class="">Bleeder Screw</td>
				          		<td class="">Bleeder Screw = Toyota (7 x 3.5) NC</td>
				          		<td class="">0</td>
				          		<td class="">4.08</td>
				          	</tr>
				          	
				          	<tr>
				          		<td class=""></td>
				          		<td class="">New Product Line</td>
				          		<td class="">BS-006</td>
				          		<td class="">Bleeder Screw</td>
				          		<td class="">Bleeder Screw = Toyota (7 x 3.5) NC</td>
				          		<td class="">0</td>
				          		<td class="">4.08</td>
				          	</tr>
				          	
				          				          		
				          </tbody>
				          
				         </table>
		        	</div>
			        	
		        	<hr>
					<div class="row center-block legend">
						<div class="col-md-1 text-right"> Pricing Legend:</div>
						<div class="col-md-2"> 
							<span class="text-center bg_black "> Ordinary </span>
						</div>
						<div class="col-md-2 ">
							<span class="text-center bg_blue "> Special </span>
						</div>
						<div class="col-md-2">
							<span class="text-center bg_yellow "> No Stock </span>
						</div>
						
						<div class="col-md-1">
							<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
			  				Item Tx
						</div>
						
						<div class="col-md-2">
							<span class="text-center bg_red "> Cost 125 </span>
						</div>
						
						<div class="col-md-2">
							<span class="text-center bg_green "> Net Price </span>
						</div>
						
					</div>
			        
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-success" data-dismiss="modal">
			        	<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
			        	Ok
			       </button>
			       
			       <button type="button" class="btn btn-danger" data-dismiss="modal">
			        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
			        	Cancel
			       </button>
			      </div>
			    </div>
			  </div>
			</div>
			
	        <!-- ============= END OF MODAL ==================== -->	
		        
		
			<div class="row form-inline TotalAmt">
					<label for="IDEtotalAmt" class="col-md-offset-3 col-md-2 col-xs-6 text-right">Total Amount</label>
					<input type="text" class="form-control col-md-2 col-xs-6" id="IDEtotalAmt" disabled>
			</div>
		
			<div class="btn-group btn-group-justified" role="group">
			  <div class="btn-group" role="group">
			    <button type="button" class="btn btn-primary">
			    	<span class="fa fa-file" aria-hidden="true"></span>
			  		Item Transaction
			    </button>
			  </div>
			  
			  <div class="btn-group" role="group">
				  <button type="button" class="btn btn-default">
					<span class="fa fa-search" aria-hidden="true"></span>
				  	Find Item
				  </button>
			  </div>
			  
			  <div class="btn-group" role="group">
				  <button type="button" class="btn btn-default">
					<span class="fa fa-file-text" aria-hidden="true"></span>
				  	Post
				  </button>
			  </div>
	
			  <div class="btn-group" role="group">
				  <button type="button" class="btn btn-default">
					<span class="fa fa-pencil" aria-hidden="true"></span>
				  	Resume
				  </button>
			  </div>		  
	
			  <div class="btn-group" role="group">
				  <button type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
				  	Suspend
				  </button>
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