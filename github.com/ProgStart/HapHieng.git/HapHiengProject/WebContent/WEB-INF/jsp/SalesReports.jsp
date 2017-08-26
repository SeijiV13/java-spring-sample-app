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
		<div class="container-fluid SR">
			<!-- TITLE OF PAGE -->
			<h3>Sales Reports</h3>

			<hr>

			<div class="btn-group btn-group-justified" role="group"
				aria-label="...">
				<div class="btn-group">
					<button class="btn btn-default dropdown-toggle" type="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Daily Sales <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
				<li><a href="GetDailySales?startDate=2017-04-22&endDate=2017-04-29">All Daily Sales</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="GetDailySales?filterBy=netincome&startDate=2017-04-22&endDate=2017-04-29">Daily Sales with Net Income Report</a></li>
						<li><a href="GetDailySales?filterBy=customer&startDate=2017-04-22&endDate=2017-04-29">Daily Sales (Grouped by Customer)</a></li>
						<li><a href="GetDailySales?filterBy=items&startDate=2017-04-22&endDate=2017-04-29">Daily Sales (Grouped by Customer with Items)</a></li>

					</ul>
				</div>

				<div class="btn-group">
					<button class="btn btn-default dropdown-toggle" type="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Sales History <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
					<li id="history-by-item-link"><a href="#">History of Sales by Item</a></li>
					<li id="history-by-cci-link"><a href="#">History of Sales by Customer-Category-Item</a></li>
					<li id="history-by-sai-link"><a href="#">History of Sales  by Customer (Sales Analyzer - Item)</a></li>
					<li id="history-by-sac-link"><a href="#">History of Sales by Customer (Sales Analyzer - Category)</a></li>
					<li id="cust-monthly-link"><a href="#">Customer Monthly Sales</a></li>
					<li id="cust-yearly-link"><a href="#">Customer Yearly Sales</a></li>
					<li id="agent-monthly-link"><a href="#">Agent Monthly Sales</a></li>
					</ul>
				</div>
			</div>


			<div class="row">

				<div class="col-md-offset-3 col-md-6 form-container">
					
					<div id="all-daily-sales" class="hide">
						<h4>All Daily Sales</h4>
						<div class="col-md-12">
							<label class="control-label col-md-3" for="date">Date from:</label>
							<div class="col-md-9">
								<div class="input-group dateFrom" data-provide="datepicker">
									<input type="text" class="form-control" >
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<label class="control-label col-md-3" for="date">Date to:</label>
							<div class="col-md-9">
								<div class="input-group dateTo" data-provide="datepicker">
									<input type="text" class="form-control">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<button class="btn btn-primary center-block"> Submit </button>
						</div>
					</div>
					
					<div id="daily-sales-net" class="hide"> 
						<h4>Daily Sales with Net Income Report</h4>
						<div class="col-md-12">
							<label class="control-label col-md-3" for="date">Date from:</label>
							<div class="col-md-9">
								<div class="input-group dateFrom" data-provide="datepicker">
									<input type="text" class="form-control" >
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<label class="control-label col-md-3" for="date">Date to:</label>
							<div class="col-md-9">
								<div class="input-group dateTo" data-provide="datepicker">
									<input type="text" class="form-control">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<button class="btn btn-primary center-block"> Submit </button>
						</div>
					</div>
					
					<div id="daily-sales-cust" class="hide">
						<h4>Daily Sales (Grouped by Customer)</h4>
						<div class="col-md-12">
							<label class="control-label col-md-3" for="date">Date from:</label>
							<div class="col-md-9">
								<div class="input-group dateFrom" data-provide="datepicker">
									<input type="text" class="form-control" >
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<label class="control-label col-md-3" for="date">Date to:</label>
							<div class="col-md-9">
								<div class="input-group dateTo" data-provide="datepicker">
									<input type="text" class="form-control">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<button class="btn btn-primary center-block"> Submit </button>
						</div>
					</div>
					
					<div id="daily-sales-item" class="hide">
						<h4>Daily Sales (Grouped by Customer with Items)</h4>
						<div class="col-md-12">
							<label class="control-label col-md-3" for="date">Date from:</label>
							<div class="col-md-9">
								<div class="input-group dateFrom" data-provide="datepicker">
									<input type="text" class="form-control" >
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<label class="control-label col-md-3" for="date">Date to:</label>
							<div class="col-md-9">
								<div class="input-group dateTo" data-provide="datepicker">
									<input type="text" class="form-control" >
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<button class="btn btn-primary center-block"> Submit </button>
						</div>
					</div>
					
					<!-- ==============  SALES HISTORY ============== -->
					<div id="history-by-item" class="hide">
						<h4>History of Sales by Item</h4>
						
						<div class="col-md-12">
							<label class="control-label col-md-3">Item code: </label>
							<div class="col-md-9">
								<select class="form-control" id="itemCode">
									
								</select>
							</div>
						</div>
						
						<div class="col-md-12">
					<div class="form-group">
						<label class="control-label col-md-3" for="date">Date</label>
						<div class="col-md-9">
							<div class="input-group date" data-provide="datepicker">
								<input type="text" id="date" class="form-control">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
						
						<div class="col-md-12">
							<label class="control-label col-md-3" for="date">Date to:</label>
							<div class="col-md-9">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<button class="btn btn-primary center-block"> Submit </button>
						</div>
					</div>
					
				</div>


			</div>


		</div>
	</div>

</body>

<script>

	
	
	$(document).ready(function(){
		
		$('#all-daily-sales-link').click(function (){
			$('#all-daily-sales').toggleClass('show');
			
			$('#daily-sales-net').addClass('hide');
			$('#daily-sales-net').removeClass('show');
			
			$('#daily-sales-cust').addClass('hide');
			$('#daily-sales-cust').removeClass('show');
			
			$('#daily-sales-item').addClass('hide');
			$('#daily-sales-item').removeClass('show');
			
			// SALES HISTORY
		});
		
		$('#daily-sales-net-link').click(function (){
			$('#daily-sales-net').toggleClass('show');
			
			$('#all-daily-sales').addClass('hide');
			$('#all-daily-sales').removeClass('show');
			
			$('#daily-sales-cust').addClass('hide');
			$('#daily-sales-cust').removeClass('show');
			
			$('#daily-sales-item').addClass('hide');
			$('#daily-sales-item').removeClass('show');
			
			// SALES HISTORY
		});
		
		$('#daily-sales-cust-link').click(function (){
			$('#daily-sales-cust').toggleClass('show');
			
			$('#all-daily-sales').addClass('hide');
			$('#all-daily-sales').removeClass('show');
			
			$('#daily-sales-net').addClass('hide');
			$('#daily-sales-net').removeClass('show');
			
			$('#daily-sales-item').addClass('hide');
			$('#daily-sales-item').removeClass('show');
			
			// SALES HISTORY
		});
		
		$('#daily-sales-item-link').click(function (){
			$('#daily-sales-item').toggleClass('show');
			
			$('#all-daily-sales').addClass('hide');
			$('#all-daily-sales').removeClass('show');
			
			$('#daily-sales-net').addClass('hide');
			$('#daily-sales-net').removeClass('show');
			
			$('#daily-sales-cust').addClass('hide');
			$('#daily-sales-cust').removeClass('show');
			
			// SALES HISTORY
		});
		
		// ========== SALES HISTORY
		$('#daily-sales-item-link').click(function (){
			$('#history-by-item').toggleClass('show');
			
			// DAILY SALES
			$('#all-daily-sales').addClass('hide');
			$('#all-daily-sales').removeClass('show');
			
			$('#daily-sales-net').addClass('hide');
			$('#daily-sales-net').removeClass('show');
			
			$('#daily-sales-cust').addClass('hide');
			$('#daily-sales-cust').removeClass('show');
			
			$('#daily-sales-item').addClass('hide');
			$('#daily-sales-item').removeClass('show');
			
		});
		
		var startDate = new Date($(".dateTo input").val() );
		console.log(startDate);
	});
</script>

</html>
