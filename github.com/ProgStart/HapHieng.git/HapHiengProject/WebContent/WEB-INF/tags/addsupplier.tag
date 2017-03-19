
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- MODAL FOR ADD SUPPLIER -->
<div class="modal fade" id="addsupplier" role="dialog">
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
			<div class="modal-body">
				<form>
					<div class="form-container">
						<h3>Personal Details</h3>
						<div class="row">
							<div class="col-md-6">

								<div class="form-group">
									<label for="suppliercode">Supplier Code</label> <input
										placeholder="Supplier Code" type="text" class="form-control"
										name="suppliercode">
								</div>

								<div class="form-group">
									<label for="description">Description</label> <input
										placeholder="Description" type="text" class="form-control"
										name="description">
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
									<label for="fax">Fax</label> <input placeholder="Fax"
										type="text" class="form-control" name="fax">
								</div>

							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="email">Email</label> <input placeholder="Email"
										type="text" class="form-control" name="email">
								</div>

								<div class="form-group">
									<label for="terms">Terms</label> <input placeholder="Terms"
										type="text" class="form-control" name="terms">
								</div>


							</div>

							<div class="col-md-6">

								<div class="form-group">
									<label for="initialbalance">Initial Balance</label> <input
										placeholder="Initial Balance" type="text" class="form-control"
										name="initialbalance">
								</div>

							</div>

						</div>
					</div>

				</form>

			</div>
			<div class="modal-footer">
			    <button type="submit" class="btn btn-primary">Add Supplier</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- END: MODEL SUPPLIER -->