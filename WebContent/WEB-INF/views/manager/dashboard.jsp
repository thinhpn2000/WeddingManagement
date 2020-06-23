<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Manager Dashboard</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- CSS -->
<link rel="stylesheet" href="<c:url value="/assets/font-awesome-5.13.0/css/all.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
<!-- Favicon -->
<link rel="icon" href="<c:url value="/assets/images/logo1-dark.png"/>"
	type="image/x-icon">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
</head>

<body onload="startTime() && showDate() && drawChart()">
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
							<button type="button" class="btn btn-danger btn-sm">Sign out</button>
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
					<a href="<%=request.getContextPath() %>/profile">
						<img src="<c:url value="/assets/images/avatar.png"/>">
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
					<li><a href="<%=request.getContextPath()%>/dashboard"
						class="active"> <span class="menu-tab-icon"> <i
								class="fa fa-chart-bar"></i>
						</span> <span>Dashboard</span>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/employee"> <span
							class="menu-tab-icon"> <i class="fa fa-users-cog"></i>
						</span> <span>Employee</span>
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
			<div id="dashboard-manager" class="dashboard-manager container-fluid">
				<div class="row">
					<div class="col-sm">
						<!--filter-->
						<form class="form-group text-center" action="" method="">
							<select class="form-control" id="yearRevenue" name="yearRevenue">
							</select>
							<button class="btn btn-primary mt-2" type="submit"
								onclick="selectYear()">Submit</button>
						</form>
					</div>
					<div class="col-sm-10">
						<!--Chart-->
						<canvas id="dashboard-revenue-chart"></canvas>

						<!-- -->
						<div class="container-fluid">
							<div class="row">
								<div class="col-sm"></div>
								<div class="col-sm-8 d-flex justify-content-center">
									<div class="container-fluid">
										<div class="row">
											<!-- Wedding -->
											<div class="col-lg-4 col-sm">
												<div class="col-content wedding-static">
													<div class="col-title">
														<i class="fa fa-heart icon" aria-hidden="true"></i>
														Wedding
													</div>
													<h4 id="wedding" class="counter"></h4>
												</div>
											</div>
											<!-- Revenue -->
											<div class="col-lg-4 col-sm">
												<div class="col-content revenue-static">
													<div class="col-title">
														<i class="fas fa-cash-register icon" aria-hidden="true"></i>Revenue
													</div>
													<h4 id="revenue" class="counter"></h4>
												</div>
											</div>
											<!--Food-->
											<div class="col-lg-4 col-sm">
												<div class="col-content food-static">
													<div class="col-title">
														<i class="fas fa-bread-slice icon" aria-hidden="true"></i>
														Food
													</div>
													<h4 id="food" class="counter"></h4>
												</div>
											</div>
											<!--Service-->
											<div class="col-lg-4 col-sm">
												<div class="col-content service-static">
													<div class="col-title">
														<i class="fas fa-concierge-bell icon" aria-hidden="true"></i>
														Service
													</div>
													<h4 id="service" class="counter"></h4>
												</div>
											</div>
											<!--Lobby-->
											<div class="col-lg-4 col-sm">
												<div class="col-content lobby-static">
													<div class="col-title">
														<i class="fas fa-door-closed icon" aria-hidden="true"></i>
														Lobby
													</div>
													<h4 id="lobby" class="counter"></h4>
												</div>
											</div>
											<!--Employee-->
											<div class="col-lg-4 col-sm">
												<div class="col-content employee-static">
													<div class="col-title">
														<i class="fa fa-user icon" aria-hidden="true"></i>
														Employee
													</div>
													<h4 id="employee" class="counter">322</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm"></div>
							</div>
						</div>
					</div>
					<div class="col-sm"></div>
				</div>
			</div>
			<!--Modal report-->
			<div class="modal fade" id="revenue-report" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="revenue-title"></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="revenue-body">
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm" style="overflow-y: scroll; height: 300px;">
										<table class="table table-sm">
											<thead>
												<tr>
													<th>STT</th>
													<th>Date</th>
													<th>Number of weddings</th>
													<th>Revenue</th>
													<th>Proportion</th>
												</tr>
											</thead>
											<tbody>
											<tbody>
										</table>

									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger btn-sm"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-success btn-sm"
								data-dismiss="modal">Print</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<footer class="footer text-center"> 2020 UIT &copy;
			wedding.com </footer>
	</div>









	<!-- Optional JavaScript -->
	<script src="<c:url value="/assets/js/header.js"/>"></script>
	<script src="<c:url value="/assets/js/dashboard-manager.js"/>"></script>

	<!-- JS for chart-->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

	<!-- JS for counter up-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.5/waypoints.min.js"></script>
	<script src="<c:url value="/assets/js/jquery.countup.min.js"/>"></script>
	<script>
		renderContent();
		$('.counter').countUp();
	</script>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/assets/bootstrap/jquery.slim.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/popper.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
</body>

</html>