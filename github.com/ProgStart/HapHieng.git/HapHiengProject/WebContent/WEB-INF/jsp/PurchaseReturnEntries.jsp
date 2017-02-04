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

<link href="<c:url value="/resources/css/style-media.css" />"
	rel="stylesheet">

<!-- DATEPICKER LINKS -->
<spring:url value="/resources/js/bootstrap-datepicker.js" var="DatePJS" />
<script src="${DatePJS}" type="text/javascript"></script>

<spring:url value="/resources/css/boostrap-datepicker.css"
	var="DatePCss" />
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

		<h5>
			<span class="fa fa-user"></span> User Login: ${username}
		</h5>
		<h5>
			<span class="fa fa-calendar"></span> Date: ${dateToday}
		</h5>

		<!-- MAIN CONTENT -->
		<div class="container-fluid PRE">

			<!-- TITLE OF PAGE -->
			<h3>Purchase Return Entries</h3>

			<!-- UPPER PART -->
			<hr>
			<div class="row head_nav">

				<div class="form-horizontal col-md-6 col-xs-12">
					<select class="form-control">
						<option>Supplier</option>
					</select>

					<div class="form-group txtbox">
						<label class="control-label col-md-2" for="PREref">Reference</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="PREref">
						</div>
					</div>

					<select class="form-control">
						<option>Currency</option>
						<option>Yuan</option>
						<option>Philippine Peso</option>
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


					<div class="form-group txtbox">
						<label class="control-label col-md-3" for="PREcurr">Currency
							Rate</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="PREcurr" disabled>
						</div>
					</div>



				</div>

			</div>
			<!-- ============== TABLE =============== -->

			<div class="row">

				<div class="tbl_wrap">
					<table class="table tables table-hover">
						<thead>
							<tr>
								<th class="bg_dblue">Row no.</th>
								<th class="bg_dblue">Item code</th>
								<th class="bg_dblue">Good</th>
								<th class="bg_dblue">Qty</th>
								<th class="bg_dblue">QtyStock</th>
								<th class="bg_dblue">Description</th>
								<th class="bg_dblue">Price</th>
								<th class="bg_dblue">Local Price</th>
								<th class="bg_dblue">Amount</th>
							</tr>
						</thead>
						<tbody>

							<tr data-toggle="modal" data-target="#PREModal">
								<td class="">1</td>
								<td class="">6281</td>
								<td class="">Good</td>
								<td class="">2</td>
								<td class="">291</td>
								<td class="">Bleeder Screw</td>
								<td class="">25</td>
								<td class="">25</td>
								<td class="">50</td>
							</tr>

							<tr data-toggle="modal" data-target="#PREModal">
								<td class="">1</td>
								<td class="">6281</td>
								<td class="">Good</td>
								<td class="">2</td>
								<td class="">291</td>
								<td class="">Bleeder Screw</td>
								<td class="">25</td>
								<td class="">25</td>
								<td class="">50</td>
							</tr>

							<tr data-toggle="modal" data-target="#PREModal">
								<td class="">1</td>
								<td class="">6281</td>
								<td class="">Good</td>
								<td class="">2</td>
								<td class="">291</td>
								<td class="">Bleeder Screw</td>
								<td class="">25</td>
								<td class="">25</td>
								<td class="">50</td>
							</tr>

							<tr data-toggle="modal" data-target="#PREModal">
								<td class="">1</td>
								<td class="">6281</td>
								<td class="">Good</td>
								<td class="">2</td>
								<td class="">291</td>
								<td class="">Bleeder Screw</td>
								<td class="">25</td>
								<td class="">25</td>
								<td class="">50</td>
							</tr>

							<tr data-toggle="modal" data-target="#PREModal">
								<td class="">1</td>
								<td class="">6281</td>
								<td class="">Good</td>
								<td class="">2</td>
								<td class="">291</td>
								<td class="">Bleeder Screw</td>
								<td class="">25</td>
								<td class="">25</td>
								<td class="">50</td>
							</tr>
							<tr data-toggle="modal" data-target="#PREModal">
								<td class="">1</td>
								<td class="">6281</td>
								<td class="">Good</td>
								<td class="">2</td>
								<td class="">291</td>
								<td class="">Bleeder Screw</td>
								<td class="">25</td>
								<td class="">25</td>
								<td class="">50</td>
							</tr>
							<tr data-toggle="modal" data-target="#PREModal">
								<td class="">1</td>
								<td class="">6281</td>
								<td class="">Good</td>
								<td class="">2</td>
								<td class="">291</td>
								<td class="">Bleeder Screw</td>
								<td class="">25</td>
								<td class="">25</td>
								<td class="">50</td>
							</tr>


						</tbody>
					</table>
				</div>

				<!-- ============= MODAL =============== -->
				<div class="modal fade" id="PREModal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h3 class="modal-title">Select an item</h3>
							</div>

							<div class="modal-body">
								<!-- ============= MODAL TABLE =============== -->
								<div class="tbl_wrap">
									<table class="table tables table-hover">
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
									<div class="col-md-1 text-right">Pricing Legend:</div>
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
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
									Ok
								</button>

								<button type="button" class="btn btn-default"
									data-dismiss="modal">
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
					<label for="PREtotalAmt"
						class="col-md-offset-2 col-md-2 col-xs-6 text-right">Total
						Amount</label> <input type="text" class="form-control col-md-2 col-xs-6"
						id="PREtotalAmt" disabled placeholder="Php. 0.00"> <input
						type="text" class="form-control col-md-offset-1 col-md-2 col-xs-6"
						id="PREtotalAmt" disabled placeholder="Yuan 0.00">
				</div>

				<div class="btn-group btn-group-justified" role="group">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-primary">
							<span class="fa fa-file" aria-hidden="true"></span> Item
							Transaction
						</button>
					</div>

					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">
							<span class="fa fa-file-text" aria-hidden="true"></span> Post
						</button>
					</div>

					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">
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