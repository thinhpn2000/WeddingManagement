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
<body onload="startTime() && showDate() && showTab(0)">
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
										<div class="bs-wizard-info text-center">Lobby</div>
									</div>

									<div class="col bs-wizard-step disable" style="padding: 0%">
										<div class="text-center bs-wizard-stepnum">Step 2</div>
										<div class="progress">
											<div class="progress-bar"></div>
										</div>
										<a href="#" class="bs-wizard-dot"></a>
										<div class="bs-wizard-info text-center">Your information</div>
									</div>

									<div class="col bs-wizard-step disable" style="padding: 0%">
										<div class="text-center bs-wizard-stepnum">Step 3</div>
										<div class="progress">
											<div class="progress-bar"></div>
										</div>
										<a href="#" class="bs-wizard-dot"></a>
										<div class="bs-wizard-info text-center">Food</div>
									</div>

									<div class="col bs-wizard-step disable" style="padding: 0%">
										<div class="text-center bs-wizard-stepnum">Step 4</div>
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
											<!--Filter-->
											<form class="row" id="filterLobby"
												action="<%=request.getContextPath()%>/reservation/check"
												method="POST">
												<div class="col-sm-1"></div>
												<div class="col-sm">
													<div class="row">
														<div class="col-sm">
															<div class="form-group">
																<label for="weddingDate">Preferred wedding date</label>
																<input placeholder="Date" class="form-control"
																	type="text" onfocus="(this.type='date')"
																	id="weddingDate" name="weddingDate"
																	onblur="validate('weddingDate')" value=${weddingDate }>
															</div>
														</div>
														<div class="col-sm-3">
															<div class="form-group text-center">
																<label style="display: block; margin-bottom: 15px;">Shift</label>


																<c:choose>
																	<c:when test="${ shift == 1}">
																		<div class="form-check-inline">
																			<label class="form-check-label" for="radio1">
																				<input type="radio" class="form-check-input"
																				id="radio1" name="shift" value=1 checked>Evening
																			</label>
																		</div>
																		<div class="form-check-inline">
																			<label class="form-check-label" for="radio2">
																				<input type="radio" class="form-check-input"
																				id="radio2" name="shift" value=2>Night
																			</label>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="form-check-inline">
																			<label class="form-check-label" for="radio1">
																				<input type="radio" class="form-check-input"
																				id="radio1" name="shift" value=1>Evening
																			</label>
																		</div>
																		<div class="form-check-inline">
																			<label class="form-check-label" for="radio2">
																				<input type="radio" class="form-check-input"
																				id="radio2" name="shift" value=2 checked>Night
																			</label>
																		</div>
																	</c:otherwise>
																</c:choose>


															</div>
														</div>
														<div class="col-sm-3 text-center">
															<button id="btnFilter" type="submit"
																class="btn btn-outline-secondary mt-3" onclick="">Filter</button>
														</div>
													</div>
												</div>
												<div class="col-sm-1"></div>
											</form>
											<form id="regEvent" name="regEvent" class=""
												action="<%=request.getContextPath()%>/reservation/add"
												method="POST">
												<input type="hidden" name="weddingDate"
													value=${weddingDate }> <input type="hidden"
													name="deposit"> <input type="hidden" name="shift"
													value=${shift }>
												<!-- lobby -->
												<div class="tab container-fluid">
													<!--List Lobby-->
													<div class="row mt-3">
														<div class="col-sm-1"></div>
														<div class="col-sm"
															style="overflow-y: scroll; max-height: 290px;">
															<table id="tableLobby" class="table table-sm table-hover">
																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Type</th>
																		<th>Maximum table permitted</th>
																		<th>Minimum price per table</th>
																		<th>Action</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach var="lobby" items="${lobbies }">
																		<tr id='S${lobby.lobbyID}'>
																			<td>${lobby.lobbyName}</td>
																			<td>${lobby.lobbyType}</td>
																			<td>${lobby.maxTable}</td>
																			<td>${lobby.minPrice}</td>
																			<td>
																				<div class="radio">
																					<input type="radio" name="lobbyID"
																						value=${lobby.lobbyID }>
																				</div>
																			</td>
																		</tr>
																	</c:forEach>
																</tbody>

															</table>
														</div>
														<div class="col-sm-1"></div>
													</div>
												</div>

												<!-- info bride and grooom -->
												<div class="container-fluid tab">
													<div class="row">
														<div class="col-sm-1"></div>
														<div class="col-sm">
															<div class="row">
																<div class="col-xl col-sm-6">
																	<div class="form-group">
																		<label for="groom">Name of Groom</label> <input
																			id="groom" type="text" class="form-control"
																			placeholder="" onblur="validate('groom')"
																			name="groom">
																	</div>
																</div>
																<div class="col-xl col-sm-6">
																	<div class="form-group">
																		<label for="bride">Name of Bride</label> <input
																			id="bride" type="text" class="form-control"
																			placeholder="" onblur="validate('bride')"
																			name="bride">
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
																			name="phone">
																	</div>
																</div>
																<div class="col-xl-3 col-sm-4">
																	<div class="form-group">
																		<label>Maximum table</label> <input type="text"
																			class="form-control disable" name="maxTable"
																			placeholder="" disabled>
																	</div>

																</div>
																<div class="col-xl-3 col-sm-4">
																	<div class="form-group">
																		<label for="tableQuantity">Number of Tables</label> <input
																			type="number" min=0 id="tableQuantity"
																			name="tableQuantity" class="form-control"
																			placeholder="" onblur="validate('tableQuantity')"
																			onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
																	</div>
																</div>
																<div class="col-xl-2 col-sm-4">
																	<div class="form-group">
																		<label for="reservedTable">Extra tables</label> <input
																			id="reservedTable" type="number" min=0
																			name="reservedTable" class="form-control"
																			placeholder="" onblur="validate('reservedTable')"
																			value=0
																			onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
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
															<div style="overflow-y: scroll; max-height: 300px;">
																<!-- Reserved Food-->
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
																	<tfoot>
																		<tr>
																			<th>Total :</th>
																			<td id="totalFood"></td>
																			<th id="costMin"></th>
																		</tr>
																	</tfoot>
																</table>
															</div>

															<!-- Deposit and menu-->
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
															<h2 style="text-align: center;">Services</h2>
															<div style="overflow-y: scroll; max-height: 350px;">
																<!-- Reserved Services-->
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
																	<tfoot>
																		<tr>
																			<th colspan="2">Total :</th>
																			<td id="totalServices"></td>
																		</tr>
																	</tfoot>
																</table>
															</div>

															<!--Menu-->
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
										<div id="alert-lobby" class="alert alert-danger" role="alert">
											Please choose at least one lobby to continue</div>

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
								<div class="row mb-3">
									<div class="col-sm-6 col-lg-6">
										<strong>Name of Groom:</strong> <span></span>
									</div>
									<div class="col-sm-6 col-lg-6">
										<strong>Name of Bride:</strong> <span></span>
									</div>
									<div class="col-sm-6 col-lg-6" id="payDate">
										<strong>Wedding date:</strong> <span></span>
									</div>
									<div class="col-sm-6 col-lg-6">
										<strong>Number of tables:</strong> <span></span>
									</div>
									<div class="col-sm-6 col-lg-6">
										<strong>Price per table:</strong> <span></span>
									</div>
									<div class="col-sm-6 col-lg-6">
										<strong>Total cost of table:</strong> <span></span>
									</div>
								</div>
								<div>
									<strong>Service: </strong>
								</div>
								<div class="row">
									<div class="col-sm"
										style="overflow-y: scroll; max-height: 100px;">
										<table class="table table-sm">
											<thead>
												<tr>
													<th>No.</th>
													<th>Name</th>
													<th>Price</th>
													<th>Quantity</th>
													<th>Total Price</th>
												</tr>
											</thead>
											<tbody>
											<tbody>
										</table>
									</div>
								</div>
								<div>
									<strong>Food: </strong>
								</div>
								<div class="row">
									<div class="col-sm"
										style="overflow-y: scroll; max-height: 100px;">
										<table class="table table-sm" id="menuInvoice">
											<thead>
												<tr>
													<th>No.</th>
													<th>Name</th>
													<th>Price</th>
												</tr>
											</thead>
											<tbody>
											<tbody>
										</table>
									</div>
								</div>

								<div class="row mt-3">
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
								</div>
								<div
									class="form-group d-flex flex-direction-row align-items-center"
									style="width: 400px">
									<p style="width: 50%">
										<strong>Deposit paid:</strong>
									</p>
									<input type="number" min=0 id="deposit" type="text"
										class="form-control" onblur="validateDeposit()"
										onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger btn-sm"
								data-dismiss="modal">Cancel</button>
							<button type="submit" form="regEvent" id="btnConfirm"
								class="btn btn-success btn-sm" onclick="validateDeposit()">Confirm</button>

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
	<script src="<c:url value="/assets/js/reservation.js"/>"></script>
	<script src="<c:url value="/assets/js/header.js"/>"></script>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/assets/bootstrap/jquery.slim.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/popper.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>