<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- MODAL FOR ADD CUSTOMER -->

<div class="modal fade" id="addcustomer" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title">Add Customer</h3>
			</div>

			<!-- MODAL FORM -->
				<form id="insertform" method="POST"
					action="/HapHiengProject/CustomerFileInsert">
			<div class="modal-body">
			
					<div class="form-container">
						<h3>Personal Details</h3>
						<div class="row">
							<div class="col-md-6">

								<div class="form-group">
									<label for="customercode">Customer Code</label> <input
										placeholder="Customer Code" type="text" class="form-control"
										name="customercode" required>
								</div>

								<div class="form-group">
									<label for="description">Description</label> <input
										placeholder="Description" type="text" class="form-control"
										name="description" required>
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="agent">Agent</label> <select name="agent"
										class="form-control">
										<option value="">Select Agent</option>
										<c:forEach var="agent" items="${applicationScope.agents}">
											<option value="${agent.name}">${agent.name}</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group">
									<label for="address">Address</label> <input name="address"
										placeholder="Address" type="text" class="form-control">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="address2">Address 2</label> <input name="address2"
										placeholder="Address 2" type="text" class="form-control">
								</div>

								<div class="form-group">
									<label for="telephone">Telephone</label> <input
										name="telephone" placeholder="Telephone" type="text"
										class="form-control">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="residentphone">Resident Phone</label> <input
										name="residentphone" placeholder="Resident Phone" type="text"
										class="form-control">
								</div>

								<div class="form-group">
									<label for="fax">Fax</label> <input placeholder="Fax"
										name="fax" type="text" class="form-control">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="cellphone">Cellphone</label> <input
										name="cellphone" placeholder="Cellphone" type="text"
										class="form-control">
								</div>

								<div class="form-group">
									<label for="terms">Terms</label> <input placeholder="Terms"
										name="terms" type="text" class="form-control">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="tin">Tin #</label> <input placeholder="Tin #"
										type="text" class="form-control" name="tin">
								</div>

								<div class="form-group">
									<label for="contactperson">Contact Person</label> <input
										placeholder="Contact Person" type="text" class="form-control"
										name="contactperson">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="email">Email</label> <input placeholder="Email"
										type="text" class="form-control" name="email">
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
										name="creditlimit">
								</div>

								<div class="form-group">
									<label for="initialbalance">Initial Balance</label> <input
										placeholder="Initial Balance" type="text" class="form-control"
										name="initialbalance">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="remaining">Remaining</label> <input
										placeholder="Remaining" type="text" class="form-control"
										name="remaining">
								</div>

								<div class="form-group">
									<label for="remaining">Customer Type</label>
									<div class="radio">
										<label><input type="radio" name="optradio" value="wc">Wholesale
										</label> <label><input type="radio" name="optradio" value="rc">Retail
										</label>
									</div>

								</div>


							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="remarks">Remarks</label>
									<textarea name="remarks" placeholder="Remarks"
										class="form-control" rows="4"></textarea>
								</div>
							</div>
							<!-- SET REQUESTING URL -->
							<c:set var="req" value="${pageContext.request}" />
                            <c:set var="url">${req.requestURL}</c:set>
                            <input name="requestingurl" type="text" value="${url}" hidden>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				

			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Add customer</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

			</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- end of modal -->