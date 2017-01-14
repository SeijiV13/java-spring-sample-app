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
	
	<!-- USERNAME AND DATE DISPLAY -->
	<h5><span class="fa fa-user"></span> User Login: ${username}</h5>
	<h5><span class="fa fa-calendar"></span> Date: ${dateToday}</h5>
	
	<!-- MAIN CONTENT -->
	<div class="container-fluid">
		<!-- TITLE OF PAGE -->
		<h3>Administrator Control</h3>
		<br>
		<div class="row">
		<table class="table table-hover">
			<thead>
			  <th>Username</th>
			  <th>Entries</th>
			  <th>File</th>
			  <th>Reports</th>
			  <th>Tools</th>
			  
			</thead>
			<tbody>
			<c:forEach var="user" items="${usersList}">
			  <tr>
			  <td>${user}</td>
			  <td><button value="${user}"  data-toggle="modal" data-target="#entries-modal" class="btn btn-info modify-button">Modify Access</button></td>
			  <td><button value="${user}" data-toggle="modal" data-target="#files-modal" class="btn btn-info modify-button">Modify Access</button></td>
			  <td><button value="${user}" data-toggle="modal" data-target="#reports-modal" class="btn btn-info modify-button">Modify Access</button></td>
			  <td><button value="${user}" data-toggle="modal" data-target="#tools-modal" class="btn btn-info modify-button">Modify Access</button></td>
			  </tr>
			</c:forEach>
			  
			</tbody>
		
		</table>
		</div>

	</div>

</div>




<!-- MODAL FOR ENTRIES MODIFY ACCESS (ADDED BY SAV 2017/1/7) -->
<div id="entries-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
     <form method="POST" id="administratorControlEntriesForm" action="/HapHiengProject/AdministratorControlSubmit"> 
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> </h4>
      </div>
      <div class="modal-body">
      <!-- HIDDEN FIELDS FOR USER AND TAB IDENTIFICATION -->
      <input name="user-field" type="hidden" class="hidden-user-field">
      <input name="trans-field" type="hidden" class="hidden-trans-field" value="entries">
       <h4>Edit Entries Access</h4>
       <table class="table table-hover table-responsive">
         <thead>
           <th>Transactions</th>
           <th>Grant/Remove Access</th>
         </thead>
         <tbody>
           <c:forEach var="entriesFunction" items="${entriesFunctions}">
           <tr>
           <td>${entriesFunction.value}</td>
           <td><center><input name="${entriesFunction.key}" id="${entriesFunction.key}" type="checkbox" class="checkbox"></center></td>
           </tr>
           </c:forEach>
          </tbody>
          
         
       </table>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
     <!-- CSRF PROTECTION -->
	<input type="hidden" name="${_csrf.parameterName}"
	value="${_csrf.token}" />
    </form>
  </div>
</div>


<!-- MODAL FOR FILES MODIFY ACCESS (ADDED BY SAV 2017/1/7) -->
<div id="files-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
     <form method="POST" id="administratorControlFilesForm" action="/HapHiengProject/AdministratorControlSubmit"> 
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> </h4>
      </div>
      <div class="modal-body">
      <!-- HIDDEN FIELDS FOR USER AND TAB IDENTIFICATION -->
      <input name="user-field" type="hidden" class="hidden-user-field">
      <input name="trans-field" type="hidden" class="hidden-trans-field" value="files">
       <h4>Edit Files Access</h4>
       <table class="table table-hover table-responsive">
         <thead>
           <th>Transactions</th>
           <th>Grant/Remove Access</th>
         </thead>
         <tbody>
           <c:forEach var="filesFunction" items="${filesFunctions}">
           <tr>
           <td>${filesFunction.value}</td>
           <td><center><input name="${filesFunction.key}" id="${filesFunction.key}" type="checkbox" class="checkbox"></center></td>
           </tr>
           </c:forEach>
          </tbody>
          
         
       </table>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
     <!-- CSRF PROTECTION -->
	<input type="hidden" name="${_csrf.parameterName}"
	value="${_csrf.token}" />
    </form>
  </div>
</div>



<!-- MODAL FOR REPORTS MODIFY ACCESS (ADDED BY SAV 2017/1/8) -->
<div id="reports-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
     <form method="POST" id="administratorControlReportsForm" action="/HapHiengProject/AdministratorControlSubmit"> 
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> </h4>
      </div>
      <div class="modal-body">
      <!-- HIDDEN FIELDS FOR USER AND TAB IDENTIFICATION -->
      <input name="user-field" type="hidden" class="hidden-user-field">
      <input name="trans-field" type="hidden" class="hidden-trans-field" value="reports">
       <h4>Edit Reports Access</h4>
       <table class="table table-hover table-responsive">
         <thead>
           <th>Transactions</th>
           <th>Grant/Remove Access</th>
         </thead>
         <tbody>
           <c:forEach var="reportsFunction" items="${reportsFunctions}">
           <tr>
           <td>${reportsFunction.value}</td>
           <c:if test="${reportsFunction.value == 'Product List'}">
               <td><center><button data-toggle="collapse" data-target="#product-list-menu-modal" type="button" class="btn btn-default">Extend <span class="caret"></span></button></center>
               	    <div id="product-list-menu-modal" class="collapse">
               	     <c:forEach var="productlistFunction" items="${productlistFunctions}">
					   <div class="row">
					       <div class="col-md-10">
					           <p>${productlistFunction.value}</p>
					       </div>
					       <div class="col-md-2">
					           <input id="${productlistFunction.key}" name="${productlistFunction.key}" type="checkbox">
					       </div>
					   </div>
					  </c:forEach>
						
					</div>
               </td>
                
           </c:if>
           <c:if test="${reportsFunction.value != 'Product List'}">
               <td><center><input name="${reportsFunction.key}" id="${reportsFunction.key}" type="checkbox" class="checkbox"></center></td>
           </c:if>
           </tr>
           </c:forEach>
          </tbody>
          
         
       </table>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
     <!-- CSRF PROTECTION -->
	<input type="hidden" name="${_csrf.parameterName}"
	value="${_csrf.token}" />
    </form>
  </div>
</div>


<!-- MODAL FOR TOOLS MODIFY ACCESS (ADDED BY SAV 2017/1/7) -->
<div id="tools-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <form method="POST" id="administratorControlToolsForm" action="/HapHiengProject/AdministratorControlSubmit"> 
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> </h4>
      </div>
      <div class="modal-body">
      <!-- HIDDEN FIELDS FOR USER AND TAB IDENTIFICATION -->
      <input name="user-field" type="hidden" class="hidden-user-field">
      <input name="trans-field" type="hidden" class="hidden-trans-field" value="tools">
       <h4>Edit Tools Access</h4>
       <table class="table table-hover table-responsive">
         <thead>
           <th>Transactions</th>
           <th>Grant/Remove Access</th>
         </thead>
         <tbody>
           <c:forEach var="toolsFunction" items="${toolsFunctions}">
           <tr>
           <td>${toolsFunction.value}</td>
           <td><center><input name="${toolsFunction.key}" id="${toolsFunction.key}" type="checkbox" class="checkbox"></center></td>
           </tr>
           </c:forEach>
          </tbody>
          

       </table>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
     <!-- CSRF PROTECTION -->
	<input type="hidden" name="${_csrf.parameterName}"
	value="${_csrf.token}" />
    </form>
  </div>
</div>




</body>


<!-- FOR LOGOUT SPRING SECURITY FUNCTION -->
<script type="text/javascript">
  
    $(document).ready(function(){
    	  var user;
    	$(".modify-button").click(function(){
    		user = $(this).val();
    		$(".hidden-user-field").val(user);
    		$(".modal-title").text("Modifying User " + user);
           
    	});
    });
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>
</html>