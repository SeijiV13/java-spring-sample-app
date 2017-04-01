
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="navbar" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags"%>

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

<!-- FONT LINKS -->
<link href="http://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet" type="text/css">
</head>

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

	<!-- USERNAME AND DATE DISPLAY -->
	<h5>
		<span class="fa fa-user"></span> User Login: ${username}
	</h5>
	<h5>
		<span class="fa fa-calendar"></span> Date: ${dateToday}
	</h5>

	<!-- MAIN CONTENT -->
	<div class="container-fluid">
		<!-- TITLE OF PAGE -->
		<h3>Agent File</h3>
		<br>
		<c:if test="${hasError == 'true'}">
			<div class="alert alert-warning">Cannot Edit Details, You have
				not selected a Agent</div>
		</c:if>
		<c:if test="${hasError == 'false'}">
			<div class="alert alert-success">Successfully edited Agent</div>
		</c:if>
		<c:if test="${insertSuccess == 'true'}">
			<div class="alert alert-success">new agent has been created</div>
		</c:if>

		<div class="row">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#browsetype">Browse
						Form</a></li>

				<li><a data-toggle="tab" href="#cardtype">Card Form</a></li>

			</ul>
			<div class="tab-content">

				<div id="cardtype" class="tab-pane fade in">
					<h3>Card Form</h3>
					<hr>
					<br>

					<form method="POST" action="/HapHiengProject/AgentFileModify">
						<div class="form-container">
							<h3>Personal Details</h3>
							<div class="row">
								<div class="col-md-6">

									<div class="form-group">
										<label for="suppliercode">Agent Name</label> <input
											placeholder="Agent Name" type="text" class="form-control"
											id="agentname" name="agentname" readonly>
									</div>

									<div class="form-group">
										<label for="description">Description</label> <input
											placeholder="Description" type="text" class="form-control"
											id="description" name="description">
									</div>

								</div>
								<div class="col-md-6">


									<div class="form-group">
										<label for="address">Address</label> <input
											placeholder="Address" type="text" class="form-control"
											id="address" name="address">
									</div>

									<div class="form-group">
										<label for="address2">Address 2</label> <input
											placeholder="Address 2" type="text" class="form-control"
											id="address2" name="address2">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="telephone">Telephone</label> <input
											placeholder="Telephone" type="text" class="form-control"
											id="telephone" name="telephone">
									</div>

									<div class="form-group">
										<label for="fax">Cellphone</label> <input
											placeholder="cellphone" type="text" class="form-control"
											id="cellphone" name="cellphone">
									</div>

								</div>
								<div class="col-md-6">

									<div class="form-group">
										<label for="email">Email</label> <input placeholder="Email"
											type="text" class="form-control" id="email" name="email">
									</div>



								</div>

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />




							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="remarks">Remarks</label>
										<textarea id="remarks" placeholder="Remarks"
											class="form-control" rows="4" name="remarks"></textarea>
									</div>
								</div>

							</div>

							<div class="text-right" style="padding: 5px;">
								<button type="submit" class="btn btn-primary">Edit
									Details</button>
							</div>
						</div>
					</form>

					

				</div>
				<div id="browsetype" class="tab-pane fade in active">
					<h3>Browse Form</h3>
					<hr>
					<br>
					<div class="form-container">
						<form method="POST" action="/HapHiengProject/AgentFileSubmit">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="agentname">Agent Name Filter</label> <input
											type="text" id="agentname" class="form-control"
											placeholder="Agent Name" name="name">
									</div>

								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="agentdescription">Agent Description Filter</label>
										<input type="text" id="agentdescription" class="form-control"
											placeholder="Agent Description" name="description">
									</div>

								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="agentaddress">Address Filter</label> <input
											type="text" id="agentaddress" class="form-control"
											placeholder="Agent Address" name="address">
									</div>

								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="pull-left">
										<button type="button" data-target="#addagent"
											data-toggle="modal" class="btn btn-default">Add
											Agent</button>
									</div>
									<div class="pull-right">
										<button class="btn btn-default">Filter</button>
									</div>
								</div>
							</div>

						</form>
					</div>
					<!-- TABLE FOR AGENT FILE -->
					<div class="row">
						<div class="tbl_wrap">
							<div class="table-responsive">
							
								<table class="table table-block">
									<thead>
										<tr>
										    <th class="bg_dblue text-nowrap">Select</th>
											<th class="bg_dblue text-nowrap">Row No.</th>
											<th class="bg_dblue text-nowrap">Name</th>
											<th class="bg_dblue text-nowrap">Description</th>
											<th class="bg_dblue text-nowrap">Address</th>
											<th class="bg_dblue text-nowrap">Address 2</th>
											<th class="bg_dblue text-nowrap">Telephone</th>
											<th class="bg_dblue text-nowrap">Cellphone</th>
											<th class="bg_dblue text-nowrap">email</th>
											<th class="bg_dblue text-nowrap">remarks</th>


										</tr>
									</thead>
									<tbody>
										<c:set var="row" value="0" />
										<c:forEach var="agent" items="${sessionScope.agents}">
											<tr style="cursor: pointer;" data-toggle="modal"
												data-target="#myModal">
                                                 <td><input type="radio" id="${row + 1}|select" name="select" class="select"></td>
												<td class="">${row = row + 1}</td>
												<td id="${row}-agentname" class="">${agent.name}</td>
												<td id="${row}-description" class="">${agent.description}</td>
												<td id="${row}-address" class="">${agent.address}</td>
												<td id="${row}-address2" class="">${agent.address2}</td>
												<td id="${row}-telephone" class="">${agent.telephone}</td>
												<td id="${row}-cellphone" class="">${agent.cellphone}</td>
												<td id="${row}-email" class="">${agent.email}</td>
												<td id="${row}-remarks" class="">${agent.remarks}</td>

											</tr>

										</c:forEach>


									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>

			</div>

		</div>
		<!-- MODAL FOR ADD AGENT -->
		<modal:addagent />


		<br>
		<div class="text-right">
			<button class="btn btn-default">
				<span class="glyphicon glyphicon-print"></span> Print
			</button>
		</div>
	</div>

</div>


<!-- /#PAGE CONTENT WRAPPER -->

</html>

<!-- FOR LOGOUT SPRING SECURITY FUNCTION -->
<script type="text/javascript">
$(document).ready(function(){
	   $(".select").click(function(){
			  if($(this).is(":checked")){
				 let rownum = $(this).attr('id').split("|");
				$("#agentname").val($("#"+rownum[0]+"-agentname").text());
				$("#description").val($("#"+rownum[0]+"-description").text());
				$("#address").val($("#"+rownum[0]+"-address").text());
				$("#address2").val($("#"+rownum[0]+"-address2").text());
				$("#telephone").val($("#"+rownum[0]+"-telephone").text());
				$("#cellphone").val($("#"+rownum[0]+"-cellphone").text());
				$("#email").val($("#"+rownum[0]+"-email").text());
				$("#remarks").val($("#"+rownum[0]+"-remarks").text());
				

				
			  } 
		   });
})
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>