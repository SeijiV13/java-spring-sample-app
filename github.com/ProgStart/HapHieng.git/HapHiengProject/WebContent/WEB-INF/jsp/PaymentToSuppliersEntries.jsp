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
	
	<!-- MAIN CONTENT -->
	<div class="container-fluid PTS">
		<!-- TITLE OF PAGE -->
		<h3>Payment To Suppliers</h3>
		<hr>
		
		<div class="form-group">
           <div class="icon-addon addon-md">
               <input type="text" placeholder="Explore" class="form-control" id="PTSEmail">
               <label for="email" class="fa fa-search"></label>
           </div>
       </div>
		
		<div class="row">
			
			<!-- ============ TABLE ============ -->		
			<div class="tbl_wrap">
				<table class="table table-hover">
		            <tr>
		              	<th class=" bg_dblue ">Supplier</th>
						<th class=" bg_dblue ">Currency</th>
						<th class=" bg_dblue ">Amount</th>
		            </tr>
		          </thead>
		          <tbody>
		            <tr data-toggle="modal" data-target="#PTSModal">
						<td class="">ABC</td>
						<td class="">Php</td>
						<td class="">60,300</td>
					</tr>
					
					<tr data-toggle="modal" data-target="#PTSModal">
						<td class="">SAMPLE</td>
						<td class="">Yuan</td>
						<td class="">61,300</td>
					</tr>
					
					<tr data-toggle="modal" data-target="#PTSModal">
						<td class="">ABC</td>
						<td class="">Php</td>
						<td class="">60,300</td>
					</tr>
					
					<tr data-toggle="modal" data-target="#PTSModal">
						<td class="">SAMPLE</td>
						<td class="">Yuan</td>
						<td class="">61,300</td>
					</tr>
					
					<tr data-toggle="modal" data-target="#PTSModal">
						<td class="">ABC</td>
						<td class="">Php</td>
						<td class="">60,300</td>
					</tr>
					
					<tr data-toggle="modal" data-target="#PTSModal">
						<td class="">SAMPLE</td>
						<td class="">Php</td>
						<td class="">61,300</td>
					</tr>
					
					<tr data-toggle="modal" data-target="#PTSModal">
						<td class="">ABC</td>
						<td class="">Php</td>
						<td class="">60,300</td>
					</tr>
					
					<tr data-toggle="modal" data-target="#PTSModal">
						<td class="">SAMPLE</td>
						<td class="">Yuan</td>
						<td class="">61,300</td>
					</tr>
		          </tbody>
		        </table>
		     </div>
		</div> <!-- ======= END: TABLE ======= -->
		
		<!-- ============= MODAL =============== -->
        <div class="modal fade" id="PTSModal" tabindex="-1" role="dialog" >
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h3 class="modal-title">Select an item</h3>
		      </div>
		      
		      <div class="modal-body">
		        <!-- ============= MODAL TABLE =============== -->
	        	<div class="tbl_wrap">
	        		<table class="table table-hover">
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