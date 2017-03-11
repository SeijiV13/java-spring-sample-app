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
	<div class="container-fluid SRE">
		<!-- TITLE OF PAGE -->
		<h3>Sales Return Entries</h3>

		<hr>
		<div class="row head_nav">
			<div class="form-horizontal col-md-6 col-xs-12">
			  <div class="form-group">
			    <label class="control-label col-md-4" for="SRErefno">SR Ref. No.</label>
			    <div class="col-md-8">
			      <input type="text" class="form-control" id="SRErefno">
			    </div>
			  </div>
			  
			  <div class="col-md-3">
				  <button type="button" class="btn btn-default bg_dblue btn-add" data-target="#SREAddCust" data-toggle="modal"> Add Customer </button>
			   </div> 
				
				<div class="col-md-9">
					<select class="form-control" >
						<option>Customer</option>
					</select>
				</div>
			  
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
			  </div>
			
		</div>
		
		<!-- END: ROW OF HEAD NAV -->
		
		<!-- MODAL FOR ADD CUSTOMER -->
					
		<div class="modal fade" id="SREAddCust" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h3 class="modal-title">Add Customer</h3>
		      </div>
		      
		      <!-- MODAL FORM -->
		      <div class="modal-body">
		        <form>
					<div class="form-container">
						<h3>Personal Details</h3>
						<div class="row">
							<div class="col-md-6">

								<div class="form-group">
									<label for="customercode">Customer Code</label> <input
										placeholder="Customer Code" type="text" class="form-control"
										id="customercode">
								</div>

								<div class="form-group">
									<label for="description">Description</label> <input
										placeholder="Description" type="text" class="form-control"
										id="description">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="agent">Agent</label> <select class="form-control">
										<option value="">Select Agent</option>
									</select>
								</div>

								<div class="form-group">
									<label for="address">Address</label> <input
										placeholder="Address" type="text" class="form-control"
										id="address">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="address2">Address 2</label> <input
										placeholder="Address 2" type="text" class="form-control"
										id="address2">
								</div>

								<div class="form-group">
									<label for="telephone">Telephone</label> <input
										placeholder="Telephone" type="text" class="form-control"
										id="telephone">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="residentphone">Resident Phone</label> <input
										placeholder="Resident Phone" type="text" class="form-control"
										id="residentphone">
								</div>

								<div class="form-group">
									<label for="fax">Fax</label> <input placeholder="Fax"
										type="text" class="form-control" id="fax">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="cellphone">Cellphone</label> <input
										placeholder="Cellphone" type="text" class="form-control"
										id="cellphone">
								</div>

								<div class="form-group">
									<label for="terms">Terms</label> <input placeholder="Terms"
										type="text" class="form-control" id="terms">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="tin">Tin #</label> <input placeholder="Tin #"
										type="text" class="form-control" id="tin">
								</div>

								<div class="form-group">
									<label for="contactperson">Contact Person</label> <input
										placeholder="Contact Person" type="text" class="form-control"
										id="contactperson">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="email">Email</label> <input placeholder="Email"
										type="text" class="form-control" id="email">
								</div>

							</div>

						</div>
					</div>
					<div class="form-container">
						<h3>Other Details</h3>
						<div class="row">
							<div class="col-md-6">

								<div class="form-group">
									<label for="creditlimit">Credit Limit</label> <input
										placeholder="Credit Limit" type="text" class="form-control"
										id="creditlimit">
								</div>

								<div class="form-group">
									<label for="initialbalance">Initial Balance</label> <input
										placeholder="Initial Balance" type="text"
										class="form-control" id="initialbalance">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="remaining">Remaining</label> <input
										placeholder="Remaining" type="text" class="form-control"
										id="remaining">
								</div>

								<div class="form-group">
									<label for="remaining">Customer Type</label>
									<div class="radio">
										<label><input type="radio" name="optradio">Wholesale
										</label> <label><input type="radio" name="optradio">Retail
										</label>
									</div>

								</div>


							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="remarks">Remarks</label>
									<textarea placeholder="Remarks" class="form-control" rows="4"></textarea>
								</div>
							</div>

						</div>
					</div>

				</form>
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- END: MODEL CUSTOMER -->
		
		
		<!-- ============ TABLE ============ -->
		 
		<div class="tbl_wrap">
			<table class="table table-hover">
	          <thead>
	            <tr>
	              	<th class=" bg_dblue">Row no.</th>
					<th class=" bg_dblue">Item code</th>
					<th class=" bg_dblue">Good</th>
					<th class=" bg_dblue">Qty</th>
					<th class=" bg_dblue">QtyStock</th>
					<th class=" bg_dblue">S.O</th>
					<th class=" bg_dblue">Description</th>
					<th class=" bg_dblue">W1/W2</th>
					<th class=" bg_dblue">Price</th>
					<th class=" bg_dblue">Agent</th>
					<th class=" bg_dblue">Amount</th>
					
					
	            </tr>
	          </thead>
	          <tbody>
	          	<!--<c:forEach var="product" items="${sessionScope.products}">
	           <tr  data-toggle="modal" data-target="#SREModal">
	           		<td class="">${product.item_code}</td>
	
				</tr>
				</c:forEach>-->
			
				
	          </tbody>
	        </table> 
		</div>
        
        <!-- ============= MODAL =============== -->
        <div class="modal fade" id="SREModal" tabindex="-1" role="dialog" >
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
		        <button type="button" class="btn btn-primary" data-dismiss="modal">
		        	<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
		        	Ok
		       </button>
		       
		       <button type="button" class="btn btn-default" data-dismiss="modal">
		        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		        	Cancel
		       </button>
		      </div>
		    </div>
		  </div>
		</div>
		
        <!-- ============= END OF MODAL ==================== -->
        
		<hr>
		<div class="row form-inline TotalAmt">
				<label for="SREtotalAmt" class="col-md-offset-3 col-md-2 col-xs-6 text-right">Total Amount</label>
				<input type="text" class="form-control col-md-2 col-xs-6" id="SREtotalAmt" disabled>
		</div>
		
		<div class="btn-group btn-group-justified  " role="group" >
		  
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-primary">
		    	<span class="fa fa-file" aria-hidden="true"></span>
		  		Item Transaction
		    </button>
		  </div>
		  
		  <div class="btn-group" role="group">
			  <button type="button" class="btn btn-default">
				<span class="fa fa-file-text" aria-hidden="true"></span>
			  	Post
			  </button>
		  </div>

		  <div class="btn-group" role="group">
			<button type="button" class="btn btn-default" data-target="#SREresume" data-toggle="modal">
				<span class="fa fa-pencil" aria-hidden="true"></span> Resume
			</button>
		</div>		  

		  <div class="btn-group" role="group">
			  <button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
			  	Suspend
			  </button>
		  </div>
	    </div>
		<!-- END: BUTTONS  -->
		
		<!-- MODAL FOR RESUME BUTTON -->
		
		<div class="modal fade" id="SREresume" tabindex="-3" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h3 class="modal-title">Suspended sales</h3>
		      </div>
		      <div class="modal-body">
		        
		        <div class="tbl_wrap">
       		<table class="table table-hover">
	          <thead>
	            <tr>
	            	<th class="bg_dblue"></th>
	            	<th class="bg_dblue">SR no.</th>
	              	<th class="bg_dblue">Customer</th>
					<th class="bg_dblue">Date</th>
	            </tr>
	          </thead>
	          <tbody>
	          	<tr>
	          		<td class="">
		          		<div class="checkbox">
					    <label>
					      <input type="checkbox"> 
					    </label>
					  </div>
	          		</td>
	          		<td class="">124</td>
	          		<td class="">John Smith</td>
	          		<td class="">Jan 20 2017</td>
	          	</tr>
	          	
	          	<tr>
	          		<td class="">
		          		<div class="checkbox">
					    <label>
					      <input type="checkbox"> 
					    </label>
					  </div>
	          		</td>
	          		<td class="">124</td>
	          		<td class="">John Smith</td>
	          		<td class="">Jan 20 2017</td>
	          	</tr>
	          	
	          	<tr>
	          		<td class="">
		          		<div class="checkbox">
					    <label>
					      <input type="checkbox"> 
					    </label>
					  </div>
	          		</td>
	          		<td class="">124</td>
	          		<td class="">John Smith</td>
	          		<td class="">Jan 20 2017</td>
	          	</tr>          		
	          </tbody>
	          
	         </table>
        	</div>
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		        <button type="button" class="btn btn-primary">Resume</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		<!-- END: MODAL FROM RESUME BUTTON -->
		
		
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