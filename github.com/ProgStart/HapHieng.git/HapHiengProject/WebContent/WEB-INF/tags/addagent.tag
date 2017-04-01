
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- MODAL FOR ADD SUPPLIER -->
<div class="modal fade" id="addagent" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title">Add Supplier</h3>
			</div>

			<!-- MODAL FORM -->
			<form method="POST" action="/HapHiengProject/AgentFileInsert">
			<div class="modal-body">
				
					<div class="form-container">
						<h3>Personal Details</h3>
						<div class="row">
							<div class="col-md-6">

								<div class="form-group">
									<label for="suppliercode">name</label> <input
										placeholder="Name" type="text" class="form-control"
										name="agentname" required>
								</div>

								<div class="form-group">
									<label for="description">Description</label> <input
										placeholder="Description" type="text" class="form-control"
										name="description" required>
								</div>

							</div>
							<div class="col-md-6">


								<div class="form-group">
									<label for="address">Address</label> <input
										placeholder="Address" type="text" class="form-control"
										name="address">
								</div>

								<div class="form-group">
									<label for="address2">Address 2</label> <input
										placeholder="Address 2" type="text" class="form-control"
										name="address2">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="telephone">Telephone</label> <input
										placeholder="Telephone" type="text" class="form-control"
										name="telephone">
								</div>

								<div class="form-group">
									<label for="cellphone">Cellphone</label> <input placeholder="Cellphone"
										type="text" class="form-control" name="fax">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="email">Email</label> <input placeholder="Email"
										type="text" class="form-control" name="email">
								</div>


							</div>

							<div class="col-md-12">

								<div class="form-group">
									<label for="remarks">Remarks</label>
									<textarea name="remarks" placeholder="Remarks" class="form-control" rows="4"></textarea>
								</div>

							</div>
							
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
	                        <!-- SET REQUESTING URL -->
							<c:set var="req" value="${pageContext.request}" />
                            <c:set var="url">${req.requestURL}</c:set>
                            <input name="requestingurl" type="text" value="${url}" hidden>

						</div>
					</div>

				

			</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-primary">Add Agent</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				
			</div>
			</form>
			
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- END: MODEL SUPPLIER -->