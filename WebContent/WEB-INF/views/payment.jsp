<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>List wedding</title>
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

<body onload="startTime() && showDate()">
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
		<%
			String userRole = request.getAttribute("userRole").toString();
		%>
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
					<li><c:choose>
							<c:when test="${ userRole == 'ROLE_MANAGER'}">
								<a href="<%=request.getContextPath()%>/employee"> <span
									class="menu-tab-icon"> <i class="fa fa-users-cog"></i>
								</span> <span>Employee</span>
								</a>
							</c:when>
							<c:otherwise>
								<a href="<%=request.getContextPath()%>/reservation"> <span
									class="menu-tab-icon"> <i class="fa fa-list"></i>
								</span> <span>Reservation</span>
								</a>
							</c:otherwise>
						</c:choose></li>
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

					<li><a href="<%=request.getContextPath()%>/payment"
						class="active"> <span class="menu-tab-icon"> <i
								class="fab fa-cc-visa"></i>
						</span> <span>Wedding</span>
					</a></li>
				</ul>
			</div>
		</div>
		<!-- //Navbar -->

		<!-- Page Content -->
		<div
			class="body-content d-flex align-items-center justify-content-center">
			<!-- List wedding-->
			<div id="listWedding" class="listWedding">
				<div class="container-fluid mt-3">
					<div class="row">
						<div class="col-sm"></div>
						<div class="col-sm-10">

							<div
								class="title-list-wedding d-flex align-items-center justify-content-center">
								<h2>Wedding List</h2>
							</div>

							<!--List Event-->
							<div class="scroll">
								<table id="listWedding" class="table table-hover table-sm">
									<thead>
										<tr>
											<th>No.</th>
											<th>Name of Bride</th>
											<th>Name of Groom</th>
											<th>Lobby</th>
											<th>Wedding Date</th>
											<th>Shift</th>
											<th>Number of Tables</th>
											<th>Payment Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="wedding" items="${weddings }"
											varStatus="status">
											<tr>

												<td>${status.count }</td>
												<td>${wedding.bride }</td>
												<td>${wedding.groom }</td>
												<td>${wedding.lobbyName }</td>
												<td>${wedding.weddingDate }</td>
												<td>${wedding.shiftTypeName }</td>
												<td>${wedding.tableQuantity + wedding.reservedTable }</td>
												<c:choose>
													<c:when test="${ wedding.weddingStatus == 0}">
														<td>Not Yet</td>
													</c:when>
													<c:otherwise>
														<td>Paid</td>
													</c:otherwise>
												</c:choose>
												<td><button type="submit"
														class="btn btn-success btn-sm" form="getWedding"
														onclick="getIdWedding('${wedding.weddingID}')"
														name="action" value="view">View</button> <c:choose>
														<c:when test="${ userRole != 'ROLE_MANAGER'}">
															<button type="submit" class="btn btn-warning btn-sm"
																form="getWedding"
																onclick="getIdWedding('${wedding.weddingID}')"
																name="action" value="edit">Edit</button>
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
													<button type="button" class="btn btn-danger btn-sm"
														data-toggle="modal" data-target="#deleteWeddingModal"
														onclick="deleteWedding('${wedding.weddingID}')">
														Delete</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>

						<div class="col-sm">
							<form id="getWedding"
								action="<%=request.getContextPath()%>/payment" method="POST">
								<input type="hidden" name="weddingID">
							</form>
						</div>
					</div>
				</div>
			</div>


			<!--Delete Payment-->
			<div class="modal fade" id="deleteWeddingModal" tabindex="-1"
				role="dialog" aria-labelledby="" aria-hidden="true">
				<div class="modal-dialog modal-sm modal-dialog-centered"
					role="document">
					<form id="deleteWedding" class="modal-content"
						action="<%=request.getContextPath()%>/payment/delete" method="GET">
						<div class="modal-header">
							<h5 class="modal-title" id="">Delete Wedding</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							Do you want to delete this wedding? <input type="hidden"
								name="weddingID">
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-danger btn-sm">Yes</button>
							<button type="button" class="btn btn-success btn-sm"
								data-dismiss="modal">Cancel</button>
						</div>
					</form>
				</div>
			</div>

		</div>
		<footer class="footer text-center"> 2020 UIT &copy;
			wedding.com </footer>
	</div>


	<!-- Optional JavaScript -->
	<script src="<c:url value="/assets/js/listWedding.js"/>"></script>
	<script src="<c:url value="/assets/js/header.js"/>"></script>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/assets/bootstrap/jquery.slim.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/popper.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
</body>

</html>