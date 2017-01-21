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
	<div class="container-fluid SE">
		<!-- TITLE OF PAGE -->
		<h3>Sales Entries</h3>

		<hr>
		<div class="row">
			<div class="form-horizontal col-md-6 col-xs-12">
			  <div class="form-group">
			    <label class="control-label col-md-4" for="drno">DR Ref. No.</label>
			    <div class="col-md-8">
			      <input type="text" class="form-control" id="drno">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="control-label col-md-4" for="sono">SO No.</label>
			    <div class="col-md-8">
			      <input type="text" class="form-control" id="sono">
			    </div>
			  </div>
			  
			  <select class="form-control">
			  	<option>Customer</option>
			  </select>
			  
			</div>			
	  		
	  		
	  		<div class="form-horizontal col-md-6 col-xs-12 col_2">
			  <div class="form-group">
			    <label class="control-label col-md-2" for="date">Date</label>
				    <div class="col-md-10">
				      <div class="input-group date" data-provide="datepicker">
					    <input type="text" class="form-control">
					    <div class="input-group-addon">
					        <span class="glyphicon glyphicon-calendar"></span>
					    </div>
					  </div>
				    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="control-label col-md-2" for="terms">Terms</label>
				    <div class="col-md-10 input-group">
				      <input type="text" class="form-control" id="terms">
				      <div class="input-group-addon">day(s)</div>
				    </div>
			  </div>
			  
			  <select class="form-control">
			  	<option>Sales Agent</option>
			  </select>
			
			
			
		</div>
		
		<!-- ============ TABLE ============ -->
		 
		<table class="table table-fixed table-block tables">
          <thead>
            <tr>
              	<th class="col-xs-1 bg_dblue ">Row No.</th>
				<th class="col-xs-2 bg_dblue ">Item code</th>
				<th class="col-xs-1 bg_dblue ">Quantity</th>
				<th class="col-xs-2 bg_dblue ">Qty Stock</th>
				<th class="col-xs-2 bg_dblue ">Description</th>
				<th class="col-xs-2 bg_dblue ">Price</th>
				<th class="col-xs-2 bg_dblue ">Amount</th>
            </tr>
          </thead>
          <tbody>
          	
           <tr style="cursor: pointer;" data-toggle="modal" data-target="#myModal">
            	<div class="hoverme">
            		<td class="col-xs-1">1 </td>
					<td class="col-xs-2">22345</td>
					<td class="col-xs-1">54</td>
					<td class="col-xs-2">240</td>
					<td class="col-xs-2">Dummy data</td>
					<td class="col-xs-2">Php. 4,000</td>
					<td class="col-xs-2">Php. 6,300</td>
            	</div>
				
				
			</tr>
			
			<tr style="cursor: pointer;" data-toggle="modal" data-target="#myModal">
				<td class="col-xs-1">2</td>
				<td class="col-xs-2">22345</td>
				<td class="col-xs-1">54</td>
				<td class="col-xs-2">240</td>
				<td class="col-xs-2">Dummy data</td>
				<td class="col-xs-2">Php. 4,000</td>
				<td class="col-xs-2">Php. 6,300</td>
			</tr>
			
			<tr style="cursor: pointer;" data-toggle="modal" data-target="#myModal">
				<td class="col-xs-1">3</td>
				<td class="col-xs-2">22345</td>
				<td class="col-xs-1">54</td>
				<td class="col-xs-2">240</td>
				<td class="col-xs-2">Dummy data</td>
				<td class="col-xs-2">Php. 4,000</td>
				<td class="col-xs-2">Php. 6,300</td>
			</tr>
			
			<tr style="cursor: pointer;" data-toggle="modal" data-target="#myModal">
				<td class="col-xs-1">4</td>
				<td class="col-xs-2">22345</td>
				<td class="col-xs-1">54</td>
				<td class="col-xs-2">240</td>
				<td class="col-xs-2">Dummy data</td>
				<td class="col-xs-2">Php. 4,000</td>
				<td class="col-xs-2">Php. 6,300</td>
			</tr>
			
			<tr style="cursor: pointer;" data-toggle="modal" data-target="#myModal">
				<td class="col-xs-1">5</td>
				<td class="col-xs-2">22345</td>
				<td class="col-xs-1">54</td>
				<td class="col-xs-2">240</td>
				<td class="col-xs-2">Dummy data</td>
				<td class="col-xs-2">Php. 4,000</td>
				<td class="col-xs-2">Php. 6,300</td>
			</tr>
			
			<tr style="cursor: pointer;" data-toggle="modal" data-target="#myModal">
				<td class="col-xs-1">6</td>
				<td class="col-xs-2">22345</td>
				<td class="col-xs-1">54</td>
				<td class="col-xs-2">240</td>
				<td class="col-xs-2">Dummy data</td>
				<td class="col-xs-2">Php. 4,000</td>
				<td class="col-xs-2">Php. 6,300</td>
			</tr>
			
			<tr style="cursor: pointer;" data-toggle="modal" data-target="#myModal">
				<td class="col-xs-1">7</td>
				<td class="col-xs-2">22345</td>
				<td class="col-xs-1">54</td>
				<td class="col-xs-2">240</td>
				<td class="col-xs-2">Dummy data</td>
				<td class="col-xs-2">Php. 4,000</td>
				<td class="col-xs-2">Php. 6,300</td>
			</tr>
			
          </tbody>
        </table> 
        
        <!-- ============= MODAL =============== -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" >
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h3 class="modal-title">Select an item</h3>
		      </div>
		      
		      <div class="modal-body">
		        <!-- ============= MODAL TABLE =============== -->
		        	
		        	<table class="table tables table-hover">
			          <thead>
			            <tr>
			            	<th class="col-xs-1 bg_dblue ">Tx</th>
			              	<th class="col-xs-2 bg_dblue ">SearchString</th>
							<th class="col-xs-2 bg_dblue ">Item code</th>
							<th class="col-xs-2 bg_dblue ">Category</th>
							<th class="col-xs-2 bg_dblue ">Description</th>
							<th class="col-xs-1 bg_dblue ">Qty</th>
							<th class="col-xs-2 bg_dblue ">Price</th>
			            </tr>
			          </thead>
			          <tbody>
			          	<tr>
			          		<td class="col-xs-1"></td>
			          		<td class="col-xs-2">New Product Line</td>
			          		<td class="col-xs-2">BS-006</td>
			          		<td class="col-xs-2">Bleeder Screw</td>
			          		<td class="col-xs-2">Bleeder Screw = Toyota (7 x 3.5) NC</td>
			          		<td class="col-xs-1">0</td>
			          		<td class="col-xs-2">4.08</td>
			          	</tr>
			          	
			          	<tr>
			          		<td class="col-xs-1"></td>
			          		<td class="col-xs-2">New Product Line</td>
			          		<td class="col-xs-2">BS-006</td>
			          		<td class="col-xs-2">Bleeder Screw</td>
			          		<td class="col-xs-2">Bleeder Screw = Toyota (7 x 3.5) NC</td>
			          		<td class="col-xs-1">0</td>
			          		<td class="col-xs-2">4.08</td>
			          	</tr>
			          	
			          	<tr>
			          	    <td class="col-xs-1"></td>
			          		<td class="col-xs-2">New Product Line</td>
			          		<td class="col-xs-2">BS-006</td>
			          		<td class="col-xs-2">Bleeder Screw</td>
			          		<td class="col-xs-2">Bleeder Screw = Toyota (7 x 3.5) NC</td>
			          		<td class="col-xs-1">0</td>
			          		<td class="col-xs-2">4.08</td>
			          	</tr>
			          	
			          	<tr>
			          		<td class="col-xs-1"></td>
			          		<td class="col-xs-2">New Product Line</td>
			          		<td class="col-xs-2">BS-006</td>
			          		<td class="col-xs-2">Bleeder Screw</td>
			          		<td class="col-xs-2">Bleeder Screw = Toyota (7 x 3.5) NC</td>
			          		<td class="col-xs-1">0</td>
			          		<td class="col-xs-2">4.08</td>
			          	</tr>
			          	
			          	<tr>
			          		<td class="col-xs-1"></td>
			          		<td class="col-xs-2">New Product Line</td>
			          		<td class="col-xs-2">BS-006</td>
			          		<td class="col-xs-2">Bleeder Screw</td>
			          		<td class="col-xs-2">Bleeder Screw = Toyota (7 x 3.5) NC</td>
			          		<td class="col-xs-1">0</td>
			          		<td class="col-xs-2">4.08</td>
			          	</tr>
			          	
			          	<tr>
			          		<td class="col-xs-1"></td>
			          		<td class="col-xs-2">New Product Line</td>
			          		<td class="col-xs-2">BS-006</td>
			          		<td class="col-xs-2">Bleeder Screw</td>
			          		<td class="col-xs-2">Bleeder Screw = Toyota (7 x 3.5) NC</td>
			          		<td class="col-xs-1">0</td>
			          		<td class="col-xs-2">4.08</td>
			          	</tr>			          		
			          </tbody>
			          
			         </table>
		        	
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
        
        
		
		
		<hr>
		<div class="row center-block legend">
			<div class="col-md-2 text-right col-xs-4 "> Pricing Legend:</div>
			<div class="col-md-2 col-xs-4"> 
				<span class="text-center bg_red "> Price Change </span>
			</div>
			<div class="col-md-2 col-xs-4">
				<span class="text-center bg_blue "> New Transaction </span>
			</div>
			
		</div>
		
		<hr>
		
		<div class="row form-inline TotalAmt">
				<label for="totalAmt" class="col-md-offset-3 col-md-2 col-xs-6 text-right">Total Amount</label>
				<input type="text" class="form-control col-md-2 col-xs-6" id="totalAmt" disabled>
		</div>
		
		<div class="btn-group btn-group-justified  " role="group" aria-label="...">
		  
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-primary">
		    	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		  		New Transaction
		    </button>
		  </div>

		  <div class="btn-group" role="group">
			  <button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>
			  	Resume
			  </button>
		  </div>		  

		  <div class="btn-group" role="group">
			  <button type="button" class="btn btn-danger">
				<span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>
			  	Suspend
			  </button>
		  </div>
	</div>
	
	<hr>
	
	<div class="btn-group btn-group-justified " role="group" aria-label="...">
		  
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-default">
		    	<span class="glyphicon glyphicon-print" aria-hidden="true"></span>
		  		OLD HH DR
		    </button>
		  </div>

		  <div class="btn-group" role="group">
			  <button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-print" aria-hidden="true"></span>
		  		NEW HH DR
			  </button>
		  </div>		  

		  <div class="btn-group" role="group">
			  <button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-print" aria-hidden="true"></span>
		  		Shown DR
			  </button>
		  </div>
		  
		  <div class="btn-group" role="group">
			  <button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-print" aria-hidden="true"></span>
		  		Print Plain DR
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