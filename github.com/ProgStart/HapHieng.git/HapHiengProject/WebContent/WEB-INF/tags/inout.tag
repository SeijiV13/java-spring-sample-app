
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="navbar" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags"%>



<!-- MODAL FOR ITEM IN OUT TRANSACTION -->
<div class="modal fade" id="iteminout" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title">Item In-Out Transaction</h3>
			</div>

			<!-- MODAL FORM -->
			<div class="modal-body">

				<div class="row">
					<div class="col-md-4">
						<select id="itemcodeinoutmodal" class="form-control">
							<option>Item Code/Description</option>
							<c:forEach var="product"
								items="${sessionScope.products}">
								<option value="${product.item_code}">${product.item_code}/${product.description}</option>
							</c:forEach>
						</select>

						<h4>Clients</h4>

						<div class="radio">
							<label> <input type="radio" class="IOTradios"
								name="IOTRadios" id="IOTradio1" value="option1"> All
								Suppliers
							</label>
						</div>

						<div class="radio">
							<label> <input type="radio" class="IOTradios"
								name="IOTRadios" id="IOTradio2" value="option2"> All
								Sales Transaction
							</label>
						</div>

						<div class="radio">
							<label> <input type="radio" name="IOTRadios"
								id="IOTradio3" value="option3"> <select
								class="form-control IOTselect" disabled>
									<option>Select Client</option>
							</select>
							</label>
						</div>
					</div>
					<div class="col-md-4">

						<label for="from">Date from</label>
						<div class="input-group input-daterange col-md-10" id="from">
							<input type="text" class="form-control" placeholder="mm/dd/yyyy">
						</div>

						<label for="to">Date To</label>
						<div class="input-group input-daterange col-md-10" id="to">
							<input type="text" class="form-control" placeholder="mm/dd/yyyy">
						</div>

						<div class="form-group txtbox">
							<label class="control-label" for="IOTIn">Total In:</label> <input
								type="text" class="form-control" id="IOTIn" readonly>

						</div>

						<div class="form-group txtbox">
							<label class="control-label" for="IOTOut">Total Out:</label> <input
								type="text" class="form-control" id="IOTOut" readonly>

						</div>

						<div class="form-group txtbox">
							<label class="control-label" for="IOTAdj">Total Adj:</label> <input
								type="text" class="form-control" id="IOTAdj" readonly>
						</div>



					</div>
					<div class="col-md-4">
						<button class="btn btn-default">
							<span class="fa fa-search"></span> Find Reference
						</button>
						<button class="btn btn-default">
							<span class="fa fa-print"></span> Print
						</button>

						<div class="form-group txtbox">
							<label class="control-label" for="inoutadj">In-Out+Adj:</label> <input
								type="text" class="form-control" id="inoutadj" readonly /> <label
								class="control-label" for="stockquantity">StockQty:</label> <input
								type="text" class="form-control" id="stockquantity" readonly />

							<label class="control-label" for="totaldamage">Total
								Damage:</label> <input type="text" class="form-control" id="totaldamage"
								readonly /> <label class="control-label" for="pendingso">Pending
								SO:</label> <input type="text" class="form-control" id="pendingso"
								readonly>
						</div>

					</div>

					<!-- ========================== TABLE =========================== -->

					<div style="padding: 10px" class="tbl_wrap">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="bg_dblue">Date</th>
									<th class="bg_dblue">Client</th>
									<th class="bg_dblue">Reference</th>
									<th class="bg_dblue">Price</th>
									<th class="bg_dblue">Currency</th>
									<th class="bg_dblue">Qty_In</th>
									<th class="bg_dblue">Qty_Out</th>
									<th class="bg_dblue">Qty_Adj</th>
									<th class="bg_dblue">Balance</th>
									<th class="bg_dblue">Agent</th>
								</tr>
							</thead>
							<tbody>

								<tr data-toggle="modal" data-target="#IOTModal">
									<td class="">12/3/2014</td>
									<td class="">Sumpit</td>
									<td class="">169</td>
									<td class="">235</td>
									<td class="">Yuan</td>
									<td class="">1600</td>
									<td class="">10</td>
									<td class=""></td>
									<td class="">2,374</td>
									<td class="">Bong</td>
								</tr>

							</tbody>
						</table>
					</div>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

</div>