
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
<title>Project Movie Cart</title>
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

<!-- FONT LINKS -->
<link href="http://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet" type="text/css">
</head>


<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<div class="search-form-box">

					<c:choose>
						<c:when test="${message == 'success'}">
							<p style="color: white;">
								<span class="fa fa-user"></span> Welcome ${user.firstname}!
							</p>
						</c:when>

						<c:when test="${message == 'welcomeback'}">
							<p style="color: white;">
								<span class="fa fa-user"></span> Welcome Back ${user.firstname}!
							</p>
						</c:when>

						<c:when test="${not empty user}">
							<p style="color: white;">
								<span class="fa fa-user"></span> Welcome ${user.firstname}!
							</p>
						</c:when>

						<c:when test="${empty user}">
							<p style="color: white;">
								<span class="fa fa-user"></span> Welcome Guest
							</p>
						</c:when>

					</c:choose>
					<li class="sidebar-brand"><a href="#" style="color: white">Project
							Movie Cart <span class="fa fa-cart-arrow-down fa-2x"></span>
					</a></li> <br>

					<!-- ACTION BUTTONS -->

					<div class="action-buttons">
						<div class="alert alert-danger nomovie-alert">
							<span class="fa fa-exclamation"></span> Select a Movie If you
							want to delete it
						</div>
						<button type="submit" form="removeitemform"
							class="btn btn-info removetocart-button search-button" disabled>
							Remove Selected Item<span class="fa fa-cart-plus"></span>
						</button>
						<br> <br>
						<c:choose>
							<c:when test="${empty shoppingcart}">
								<button type="submit" class="btn btn-info search-button "
									disabled>
									Checkout <span class="fa fa-check-square"></span>
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-info search-button ">
									Checkout <span class="fa fa-check-square"></span>
								</button>
							</c:otherwise>
						</c:choose>
						<br> <br>

					</div>
					
					<br><br>
					<div class="total-price-box">
						<c:choose>
							<c:when test="${empty overallprice}">
					    	<h3>Total price:<br> PHP 0.00</h3>
							</c:when>
							<c:otherwise>
					     	<h3>Total Price:<br> PHP <fmt:formatNumber type="number" maxFractionDigits="2" value="${overallprice}"/></h3>
							</c:otherwise>
						</c:choose>
					  
					
					</div>


				</div>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<a href="#menu-toggle" class="btn btn-info" id="menu-toggle">
							Close Search Bar</a>


						<div class="pull-right">
							<a href="/SpringShoppingCart/" class="btn btn-primary"> <span
								class="fa fa-search"></span> Search Movie
							</a> <a href="/SpringShoppingCart/cartView" class="btn btn-info">
								<span class="fa fa-shopping-cart"></span> View Cart
							</a>

							<c:choose>
								<c:when test="${empty sessionScope.user}">
									<a href="/SpringShoppingCart/userLogin" class="btn btn-primary">
										<span class="fa fa-sign-in"></span> Login
									</a>

									<a href="/SpringShoppingCart/userSignup"
										class="btn btn-primary"> <span class="fa fa-pencil"></span>
										Sign Up
									</a>
								</c:when>
								<c:otherwise>
									<a href="/SpringShoppingCart/userSignout"
										class="btn btn-primary"> <span class="fa fa-sign-out"></span>
										Sign Out
									</a>
								</c:otherwise>
							</c:choose>


						</div>

						<input value="1" id="menustate" hidden> <br> <br>

					</div>

				</div>
			</div>
			<!-- MOVIE ITEMS -->
			<div class="container-fluid">
				<h3>
					Your Items in Cart <span class="fa fa-shopping-cart"></span>
				</h3>
				<br>
				<div class="row">
					<c:if test="${message ==  'removesuccess'}">
						<div class="alert alert-warning">
							<strong>Info!</strong> You have Successfully removed item
							${removedid} from your cart
						</div>
					</c:if>
					<c:choose>
						<c:when test="${empty shoppingcart}">
							<div class="alert alert-info">
								<strong>Hey!</strong> You have no items in your cart shop your
								favorite movies now !
							</div>
						</c:when>
					</c:choose>
					<form method="POST" action="/SpringShoppingCart/removeMovie"
						id="removeitemform">
						<c:forEach var="cart" items="${shoppingcart}">

							<div class="col-md-4">

								<div class="movie-items">
									<div class="card-block">
										<h4>${cart.value.title}</h4>
										<ul>
											<li>ID Number: ${cart.value.id_no}</li>
											<li>Price: PHP <fmt:formatNumber type="number" maxFractionDigits="2" value="${cart.value.unit_price}"/></li>
											<li>Quantity: ${cart.value.quantity}</li>
										</ul>
										<h3>Total Price: PHP <fmt:formatNumber type="number" maxFractionDigits="2" value="${cart.value.total_price}"/></h3>
										<h4>
											<input name="radio-item" type="radio"
												value="${cart.value.id_no}" class="select-radio">
											Select Item
										</h4>
									</div>
								</div>


							</div>
						</c:forEach>
					</form>
				</div>

			</div>
		</div>
		<!-- /#page-content-wrapper -->


<!-- MODAL FOR CHECK OUT -->
		<c:choose>
			<c:when test="${empty user}">
				<div class="modal fade" id="myModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h2 class="modal-title">
									Checking Out <span class="fa fa-check"></span>
								</h2>
							</div>

							<div class="modal-body">
								<div class="alert alert-warning">
									<strong> Oops!!</strong> Checking out requires to be logged in,
									but it seems that you are no yet signed In, click the Sign In
									Button if you already have an existing account otherwise click
									Sign up button to create a new account
								</div>
							</div>
							<div class="modal-footer">
								<a href="/SpringShoppingCart/userLogin"><button
										type="button" class="btn btn-info">
										Login <span class="fa fa-sign-in"></span>
									</button></a> <a href="/SpringShoppingCart/userSignup"><button
										type="button" class="btn btn-primary">
										Sign Up <span class="fa fa-pencil"></span>
									</button></a>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</c:when>
			<c:otherwise>
				<div class="modal fade" id="myModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h2 class="modal-title">
									Checking Out <span class="fa fa-check"></span>
								</h2>
							</div>
									<div class="modal-body">
										<div class="alert alert-warning"><p><span class="fa fa-exclamation"></span> Before checking out please review your items carefully</p></div>
										<h3>
											Your items is Cart <span class="fa fa-shopping-cart"></span>
										</h3>
										
										<table class=" table table-hover">
											<thead>
												<tr>
													<th>Id Number</th>
													<th>Title</th>
													<th>unit price</th>
													<th>quantity</th>
													<th>total price</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="cart" items="${shoppingcart}">
													<tr>
														<td>${cart.value.id_no}</td>
														<td>${cart.value.title}</td>
														<td>PHP <fmt:formatNumber type="number" maxFractionDigits="2" value="${cart.value.unit_price}"/></td>
														<td>${cart.value.quantity}</td>
														<td>PHP <fmt:formatNumber type="number" maxFractionDigits="2" value="${cart.value.total_price}"/></td>
													</tr>
												</c:forEach>
                                                   
											</tbody>
										</table>
										<div class="overallprice-box">
										<h4>Total Items: ${overallquantity}</h4>
										<h4>Total Price: PHP <fmt:formatNumber type="number" maxFractionDigits="2" value="${overallprice}"/></h4>
										</div>

									</div>
									<div class="modal-footer">
									      
												<button data-dismiss="modal" type="button"
													class="btn btn-info">
													Close <span class="fa fa-close"></span>
												</button>
								
												
												<button type="submit" form="checkout-form" class="btn btn-primary">
														Checkout <span class="fa fa-shopping-cart"></span>
												</button>
												
												<form method="POST" id="checkout-form"
													action="/SpringShoppingCart/checkoutMovie">
												</form>
										
									</div>
									
						


						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</c:otherwise>
		</c:choose>


	</div>

</body>
</html>