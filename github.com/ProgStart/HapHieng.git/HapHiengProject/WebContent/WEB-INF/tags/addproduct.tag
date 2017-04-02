
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="addproduct" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title">Add New Product</h3>
			</div>

			<!-- MODAL FORM -->
			<div class="modal-body">
				<form id="submitaddproduct" class="form-container" method="POST"
					action="/HapHiengProject/InventoryFileInsert?${_csrf.parameterName}=${_csrf.token}"
					enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<div class="checkbox">
									<label><input name="importeditem" type="checkbox">
										<b>Imported Item </b></label>
								</div>
							</div>
						</div>

						<div class="col-md-6">

							<div class="form-group">
								<label for="unit">Unit</label> <input name="unit"
									placeholder="Unit" type="text" class="form-control" required>
							</div>

						</div>

					</div>


					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="itemcode">Item Code</label> <input name="itemcode"
									placeholder="Item Code" type="text" class="form-control"
									required>
							</div>
						</div>

						<div class="col-md-6">

							<div class="form-group">
								<label for="location">Location</label> <input name="location"
									placeholder="Location" type="text" class="form-control">
							</div>

						</div>

					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="categorycode">Category</label> <select
									name="category" class="form-control" required>
									<option value="">Select Category</option>
									<c:forEach var="category"
										items="${applicationScope.categories}">
										<option value="${category}">${category}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="col-md-6">

							<div class="form-group">
								<label for="minimumquantity">Minimum Quantity</label> <input
									name="minimumquantity" placeholder="Minimum Quantity"
									type="text" class="form-control numberfield">

							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="description">Description</label> <input
									name="description" type="text" placeholder="Description"
									class="form-control" required>
							</div>

						</div>

						<div class="col-md-6">

							<div class="form-group">
								<label for="image">Image</label> <input type="file" name="image"
									class="btn btn-default">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="grossprice">Gross Price</label> <input
									name="grossprice" type="text" placeholder="Gross Price"
									class="form-control numberfield-decimal" id="gpinput" required>
							</div>

						</div>

						<div class="col-md-6">


							<div class="form-group">
								<label for="less15">Less 15%</label> <input type="text"
									id="less15input" name="less15" placeholder="Less 15%" class="form-control numberfield-decimal" readonly>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="less35">Less 35%</label> <input type="text"
									id="less35input" name="less35" placeholder="Less 35%" class="form-control numberfield-decimal" readonly>
							</div>

						</div>

						<div class="col-md-6">

							<div class="form-group">
								<label for="total">Total</label> <input type="text" name="total"
									placeholder="Total" id="total" class="form-control numberfield" required>
							</div>

						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="w1">Warehouse 1</label> <input type="text" name="w1"
									placeholder="Warehouse 1" id="w1" class="form-control numberfield">
							</div>

						</div>

						<div class="col-md-6">

							<div class="form-group">
								<label for="w2">Warehouse 2</label> <input type="text" name="w2"
									placeholder="Warehouse 2" id="w2" class="form-control numberfield">
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="packageqtybig">PackQty Big</label> <input
									name="packageqtybig" placeholder="Package Quantity Big"
									type="text" class="form-control numberfield" id="packageqtybig">
							</div>

						</div>

						<div class="col-md-6">

							<div class="form-group">
								<label for="packageqtysmall">PackQty Small</label> <input
									name="packageqtysmall" placeholder="Package Quantity Small"
									type="text" class="form-control numberfield" id="packageqtysmall">
							</div>



						</div>
					</div>
					<div class="row">
						<div class="col-md-6">

							<div class="form-group">
								<label for="productline" required>Product Line</label> <select
									name="productline" class="form-control">
									<option value="">Select Product Line</option>
									<c:forEach var="productLine"
										items="${applicationScope.productLines}">
										<option value="${productLine}">${productLine}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="remarks">Remarks 1</label>
								<textarea name="remarks1" class="form-control" rows="4"></textarea>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="remarks">Remarks 2</label>
								<textarea name="remarks2" class="form-control" rows="4"></textarea>
							</div>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" form="submitaddproduct"
					class="btn btn-primary">Add Product</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

</div>
