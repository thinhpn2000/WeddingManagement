<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Reservation</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- CSS -->
<link rel="stylesheet"
	href="<c:url value="/assets/font-awesome-5.13.0/css/all.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
<!-- Favicon -->
<link rel="icon" href="<c:url value="/assets/images/logo1-dark.png"/>"
	type="image/x-icon">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
</head>
<body
	onload="startTime() && showDate() && showTab(0) && bindTotal(${wedding.tablePrice},${wedding.totalServicePrice})">
	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>
	<div id="wrapper">
		<!-- Header -->
		<!--Modal sign out-->
		<div class="modal fade" id="signOutModal" tabindex="-1" role="dialog"
			aria-labelledby="" aria-hidden="true">
			<div class="modal-dialog modal-sm modal-dialog-centered"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Sign out</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Are you sure?</div>
					<div class="modal-footer">
						<a href="<%=request.getContextPath()%>/logout">
							<button type="button" class="btn btn-danger btn-sm">Sign
								out</button>
						</a>
						<button type="button" class="btn btn-success btn-sm"
							data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Header content-->
		<%
			String username = request.getAttribute("username").toString();
		%>
		<div class="header sticky-top">
			<div class="date-time d-flex flex-direction-row align-items-center">
				<div class="calendar">
					<i class="fas fa-clock mr-3"></i> <span id="time" class="mr-5"></span>
				</div>
				<div class="calendar">
					<div id="date"></div>
					<div>
						<div id="year"></div>
						<div id="day"></div>
					</div>
				</div>
			</div>

			<div
				class="function-icon d-flex flex-direction-row align-items-center">
				<div>
					Hi! <span id="username"><%=username%></span>
				</div>
				<div data-toggle="modal" data-target="#signOutModal"
					data-toggle="tooltip" title="Sign out!">
					<i class="fa fa-sign-out-alt mx-4" aria-hidden="true"></i>
				</div>
				<div class="avatar-user" data-toggle="tooltip" title="Your profile">
					<a href="<%=request.getContextPath()%>/profile"> <img
						src="<c:url value="/assets/images/avatar.png"/>">
					</a>
				</div>
			</div>

		</div>
		<!-- /Header -->

		<!-- Navbar -->
		<div class="admin-wrapper">
			<div class="nav">
				<div class="logo">
					<img src="<c:url value="/assets/images/logo.png"/>">
				</div>
				<ul>
					<li><a href="<%=request.getContextPath()%>/dashboard"> <span
							class="menu-tab-icon"> <i class="fa fa-chart-bar"></i>
						</span> <span>Dashboard</span>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/reservation"
						class="active"> <span class="menu-tab-icon"> <i
								class="fa fa-list"></i>
						</span> <span>Reservation</span>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/lobby"> <span
							class="menu-tab-icon"> <i class="fa fa-door-open"></i>
						</span> <span>Lobby</span>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/food"> <span
							class="menu-tab-icon"> <i class='fas fa-drumstick-bite'></i>
						</span> <span>Food</span>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/service"> <span
							class="menu-tab-icon"> <i class="fab fa-readme"></i>
						</span> <span>Service</span>
					</a></li>

					<li><a href="<%=request.getContextPath()%>/payment"> <span
							class="menu-tab-icon"> <i class="fab fa-cc-visa"></i>
						</span> <span>Wedding</span>
					</a></li>
				</ul>
			</div>
		</div>
		<!-- //Navbar -->

		<!-- Page Content -->
		<div
			class="body-content d-flex align-items-center justify-content-center">
			<!-- Event reservation-->
			<div id="event" class="event active">
				<div class="container-fluid">
					<div class="row">
						<div
							class="col-sm d-flex align-items-center justify-content-center btn-step">
							<button id="btnPrev"
								class="btn btn-secondary btn-sm d-flex align-items-center justify-content-center"
								type="button" onclick="moveTab(-1)" disabled>
								<i class="fa fa-angle-left"></i>
							</button>
						</div>
						<div class="col-sm-10">
							<!-- Step -->
							<div class="container-fluid">
								<div class="row bs-wizard">
									<div class="col bs-wizard-step active" style="padding: 0%">
										<div class="text-center bs-wizard-stepnum">Step 1</div>
										<div class="progress">
											<div class="progress-bar"></div>
										</div>
										<a href="#" class="bs-wizard-dot"></a>
										<div class="bs-wizard-info text-center">Your Information</div>
									</div>

									<div class="col bs-wizard-step disable" style="padding: 0%">
										<div class="text-center bs-wizard-stepnum">Step 2</div>
										<div class="progress">
											<div class="progress-bar"></div>
										</div>
										<a href="#" class="bs-wizard-dot"></a>
										<div class="bs-wizard-info text-center">Food</div>
									</div>

									<div class="col bs-wizard-step disable" style="padding: 0%">
										<div class="text-center bs-wizard-stepnum">Step 3</div>
										<div class="progress">
											<div class="progress-bar"></div>
										</div>
										<a href="#" class="bs-wizard-dot"></a>
										<div class="bs-wizard-info text-center">Services</div>
									</div>
								</div>
							</div>
							<!--Form register-->
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm">
										<div class="regEvent py-3">
											<form id="regEvent" name="regEvent" class=""
												action="<%=request.getContextPath()%>/payment/update"
												method="POST">
												<input type="hidden" name="weddingID"
													value=${wedding.weddingID }> <input type="hidden"
													name="deposit"
													value="${wedding.deposit }">
												<!-- info bride and grooom -->
												<div class="container-fluid tab">
													<div class="row">
														<div class="col-sm-1"></div>
														<div class="col-sm">

															<div class="row">
																<div class="col-xl col-sm-6">
																	<div class="form-group">
																		<label>Wedding Date</label> <input type="text"
																			class="form-control disable" placeholder="" disabled
																			value="${wedding.weddingDate }">
																	</div>
																</div>
																<div class="col-xl col-sm-3">
																	<div class="form-group">
																		<label>Shift</label> <input type="text"
																			value="${wedding.shiftTypeName }"
																			class="form-control disable" disabled>
																	</div>
																</div>
																<div class="col-xl col-sm-3">
																	<div class="form-group">
																		<label>Lobby Name</label> <input type="text"
																			value="${wedding.lobbyName }"
																			class="form-control disable" disabled>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-xl col-sm-6">
																	<div class="form-group">
																		<label>Name of Groom</label> <input type="text"
																			value="${wedding.groom }"
																			class="form-control disable" disabled>
																	</div>
																</div>
																<div class="col-xl col-sm-6">
																	<div class="form-group">
																		<label>Name of Bride</label> <input type="text"
																			value="${wedding.bride }"
																			class="form-control disable" placeholder="" disabled>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-xl-4 col-sm-4">
																	<div class="form-group">
																		<label for="phone">Phone number</label> <input
																			id="phone" type="text" class="form-control"
																			placeholder="" onblur="validate('phone')"
																			onkeypress='return event.charCode >= 48 && event.charCode <= 57'
																			name="phone" value="${wedding.phone }">
																	</div>
																</div>
																<div class="col-xl-3 col-sm-4">
																	<div class="form-group">
																		<label>Maximum table</label> <input type="text"
																			class="form-control disable" placeholder=""
																			id="maxTable" value=${wedding.maxTable } disabled>
																	</div>
																</div>
																<div class="col-xl-3 col-sm-4">
																	<div class="form-group">
																		<label for="tableQuantity">Number of Tables</label> <input
																			type="number" min=0 id="tableQuantity"
																			name="tableQuantity" class="form-control"
																			placeholder="" onblur="validate('tableQuantity')"
																			onkeypress='return event.charCode >= 48 && event.charCode <= 57'
																			value=${wedding.tableQuantity }>
																	</div>
																</div>
																<div class="col-xl-2 col-sm-4">
																	<div class="form-group">
																		<label for="reservedTable">Extra tables</label> <input
																			id="reservedTable" type="number" min=0
																			name="reservedTable" class="form-control"
																			placeholder="" onblur="validate('reservedTable')"
																			value=${wedding.reservedTable }
																			onkeypress='return event.charCode >= 48 && event.charCode <= 57'
																			value=10>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-sm-1"></div>
													</div>
												</div>

												<!-- Food -->
												<div class="tab container-fluid">
													<div class="row">
														<div class="col-sm-1"></div>
														<div class="col-sm">
															<h2 style="text-align: center;">Reserved Food</h2>
															<div style="overflow-y: scroll; max-height: 140px;">
																<!-- Reserved Food-->
																<table id="reservedFood"
																	class="table table-hover table-sm">
																	<thead>
																		<tr>
																			<th>Name</th>
																			<th>Price</th>
																			<th>Action</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach var="food" items="${wedding.listFood }">
																			<tr>
																				<td>${food.foodName}</td>
																				<td>${food.foodPrice}</td>
																				<td><input name="food" value='${food.foodID}'
																					type="checkbox" id='MA${food.foodID}'
																					onclick="recalculateFood(this,${food.foodPrice})"
																					checked></td>
																			</tr>
																		</c:forEach>
																	<tbody>
																</table>

															</div>
															<h2 style="text-align: center;">New Food</h2>
															<div style="overflow-y: scroll; max-height: 140px;">
																<!-- New Food-->
																<table id="food" class="table table-hover table-sm">
																	<thead>
																		<tr>
																			<th>Name</th>
																			<th>Price</th>
																			<th>Action</th>
																		</tr>
																	</thead>
																	<tbody>
																	<tbody>
																</table>

															</div>
															<!-- Deposit and menu-->
															<div
																class="d-flex flex-direction-row align-items-center justify-content-around">
																<p>
																	<strong> Total: <i id="totalFood">${wedding.tablePrice }</i></strong>
																</p>
																<p>
																	<strong> Minimum price per table: <i
																		id="costMin">${wedding.minPrice}</i></strong>
																</p>
															</div>
															<div
																class="d-flex flex-direction-row align-items-center justify-content-between">

																<button type="button" class="btn btn-secondary"
																	data-toggle="modal" data-target="#menuModal" onclick="">Menu</button>
																<div id="alert-food" class="alert alert-danger mb-0">
																	Please add more food to continue</div>
															</div>


														</div>
														<div class="col-sm-1"></div>
													</div>

												</div>

												<!-- Service -->
												<div class="tab container-fluid">
													<div class="row">
														<div class="col-sm-1"></div>
														<div class="col-sm">
															<h2 style="text-align: center;">Reserved Services</h2>
															<div style="overflow-y: scroll; max-height: 140px;">
																<!-- Reserved Services-->
																<table class="table table-sm table-hover">
																	<thead>
																		<tr>
																			<th>Name</th>
																			<th>Quantity</th>
																			<th>Price</th>
																			<th>Action</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach var="service"
																			items="${wedding.listServicePrice }">
																			<tr>
																				<td>${service.serviceName}</td>
																				<td><input id='DV${service.serviceID}quantity'
																					type="text" min=1 name="quantityOld"
																					value=${service.serviceQuantity
																					}
																					onclick="getQuantity(this)"
																					onkeypress='return event.charCode >= 49 && event.charCode <= 57'
																					onblur="recalculateServiceQuantity(this,${service.service1Price})"></td>
																				<td>${service.service1Price}</td>
																				<td><input type="checkbox" name="serviceOld"
																					value=${service.serviceID
																					}
																					id='DV${service.serviceID}'
																					onclick="recalculateService(this,${service.service1Price})"
																					checked></td>
																			</tr>
																		</c:forEach>
																	<tbody>
																</table>
															</div>
															<h2 style="text-align: center;">New Services</h2>
															<div style="overflow-y: scroll; max-height: 140px;">
																<!-- New Service-->
																<table id="services" class="table table-sm table-hover">
																	<thead>
																		<tr>
																			<th>Name</th>
																			<th>Quantity</th>
																			<th>Price</th>
																			<th>Action</th>
																		</tr>
																	</thead>
																	<tbody>
																	<tbody>
																</table>
															</div>
															<!--Menu-->

															<p class="text-right">
																<strong> Total: <i id="totalServices">${wedding.totalServicePrice}</i></strong>
															</p>

															<div class="text-left">
																<button type="button" class="btn btn-secondary"
																	data-toggle="modal" data-target="#servicesModal"
																	onclick="">Menu</button>
															</div>

														</div>
														<div class="col-sm-1"></div>
													</div>
												</div>

											</form>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div
							class="col-sm d-flex align-items-center justify-content-center btn-step">
							<button id="btnNext"
								class="btn btn-secondary btn-sm d-flex align-items-center justify-content-center"
								onclick="confirm() && moveTab(1)">
								<i class="fa fa-angle-right"></i>
							</button>
						</div>
					</div>
				</div>
			</div>

			<!-- invoice -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Your invoice</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="modalInvoice">
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-6 col-lg-4">
										<strong>Name of Groom:</strong> <span>${wedding.groom }</span>
									</div>
									<div class="col-sm-6 col-lg-4">
										<strong>Name of Bride:</strong> <span>${wedding.bride }</span>
									</div>
									<div class="col-sm-6 col-lg-4" id="payDate">
										<strong>Wedding date:</strong> <span>${wedding.weddingDate }</span>
									</div>
									<div class="col-sm-6 col-lg-4">
										<strong>Number of tables:</strong> <span></span>
									</div>
									<div class="col-sm-6 col-lg-4">
										<strong>Price per table:</strong> <span></span>
									</div>
									<div class="col-sm-6 col-lg-4">
										<strong>Total cost of table:</strong> <span></span>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<strong>Total service cost: </strong> <span></span>
									</div>
									<div class="col">
										<strong>Total wedding cost: </strong> <span></span>
									</div>

								</div>
								<div class="row">
									<div class="col">
										<strong>Balance: </strong> <span id="balance"></span>
									</div>
									<div class="col">
										<strong>Payment date: </strong> <span id="payment-date"></span>
									</div>
									<div class="col">
										<strong>Deposit paid: </strong> <span id='deposit'>${wedding.deposit}</span>
									</div>
								</div>




							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger btn-sm"
								data-dismiss="modal">Cancel</button>
							<button type="submit" form="regEvent" id="btnConfirm"
								class="btn btn-success btn-sm" onclick="">Confirm</button>

						</div>
					</div>
				</div>
			</div>

			<!-- menu -->
			<div class="modal fade" id="menuModal" tabindex="-1" role="dialog"
				aria-labelledby="menuModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Our menu</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="modalMenu">
							<div style="overflow-y: scroll; height: 500px;">
								<table id="menu" class="table table-sm table-hover">
									<thead>
										<tr>
											<th>Name</th>
											<th>Note</th>
											<th>Price</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="food" items="${foods }">
											<tr>
												<td>${food.foodName}</td>
												<td>${food.foodNote}</td>
												<td>${food.foodPrice}</td>
												<td><input type="checkbox" id='MA${food.foodID}menu'
													onclick="updateReservedFood(this,'${food.foodID}','${food.foodName}','${food.foodPrice}')"></td>
											</tr>
										</c:forEach>
									<tbody>
								</table>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success btn-sm"
								data-dismiss="modal">OK</button>
						</div>
					</div>
				</div>
			</div>

			<!-- service -->
			<div class="modal fade" id="servicesModal" tabindex="-1"
				role="dialog" aria-labelledby="servicesModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Our services</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="modalServices">
							<!-- Services -->
							<div style="overflow-y: scroll; height: 500px;">
								<table id="servicesMenu" class="table table-sm table-hover">
									<thead>
										<tr>
											<th>Name</th>
											<th>Price</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="service" items="${services }">
											<tr>
												<td>${service.serviceName}</td>
												<td>${service.servicePrice}</td>
												<td><input type="checkbox"
													id='DV${service.serviceID}menu'
													onclick="updateReservedService(this,'${service.serviceID}','${service.serviceName}','${service.servicePrice}')"></td>
											</tr>
										</c:forEach>
									<tbody>
								</table>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success btn-sm"
								data-dismiss="modal">OK</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer text-center"> 2020 UIT &copy;
			wedding.com </footer>
	</div>


	<!-- Optional JavaScript -->
	<script src="<c:url value="/assets/js/updatewedding.js"/>"></script>
	<script src="<c:url value="/assets/js/header.js"/>"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/assets/bootstrap/jquery.slim.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/popper.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>