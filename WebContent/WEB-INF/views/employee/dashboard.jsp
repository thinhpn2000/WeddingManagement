<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Dashboard</title>
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
					<li><a href="<%=request.getContextPath()%>/reservation">
							<span class="menu-tab-icon"> <i class="fa fa-list"></i>
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
						</span> <span>Payment</span>
					</a></li>
				</ul>
			</div>
		</div>
		<!-- //Navbar -->

		<!-- Page Content -->
		<div
			class="body-content d-flex align-items-center justify-content-center">
			<div id="dashboard" class="dashboard-employee">
				<div class="container-fluid">
					<div class="row mt-4">
						<div class="col-sm"></div>
						<div class="col-sm-10">
							<div class="row mb-3">
								<!--Reservation-->
								<div class="col-lg-4 col-sm-6 col-6 mb-3">
									<a href="<%=request.getContextPath()%>/reservation">
										<div class="item text-center">
											<div class="icon">
												<img src="<c:url value ="/assets/images/icon4.png"/>" alt="">
											</div>
											<div class="content font-sm">Reservation</div>
										</div>
									</a>
								</div>
								<!-- Lobbies -->
								<div class="col-lg-4 col-sm-6 col-6 mb-3">
									<a href="<%=request.getContextPath()%>/lobby">
										<div class="item text-center">
											<div class="icon">
												<img src="<c:url value ="/assets/images/icon9.png"/>" alt="">
											</div>
											<div class="content font-sm">Lobbies</div>
										</div>
									</a>
								</div>
								<!-- Menu -->
								<div class="col-lg-4 col-sm-6 col-6 mb-3">
									<a href="<%=request.getContextPath()%>/food">
										<div class="item text-center">
											<div class="icon">
												<img src="<c:url value ="/assets/images/icon10.png"/>"
													alt="">
											</div>
											<div class="content font-sm">Menu</div>
										</div>
									</a>
								</div>

								<!-- Services -->
								<div class="col-lg-4 col-sm-6 col-6 mb-3">
									<a href="<%=request.getContextPath()%>/service">
										<div class="item text-center">
											<div class="icon">
												<img src="<c:url value ="/assets/images/icon8.png"/>" alt="">
											</div>
											<div class="content font-sm">Services</div>
										</div>
									</a>
								</div>
								<!-- Payment -->
								<div class="col-lg-4 col-sm-6 col-6 mb-3">
									<a href="<%=request.getContextPath()%>/payment">
										<div class="item text-center">
											<div class="icon">
												<img src="<c:url value ="/assets/images/icon11.png"/>"
													alt="">
											</div>
											<div class="content font-sm">Payment</div>
										</div>
									</a>
								</div>
								<!-- Logout -->
								<div class="col-lg-4 col-sm-6 col-6 mb-3">
									<a href="#" data-toggle="modal" data-target="#signOutModal"
										data-toggle="tooltip">
										<div class="item text-center">
											<div class="icon">
												<img src="<c:url value ="/assets/images/iconlogout.jpg"/>"
													alt="">
											</div>
											<div class="content font-sm">Sign out</div>
										</div>
									</a>
								</div>
							</div>
						</div>
						<div class="col-sm"></div>
					</div>
				</div>
			</div>


		</div>






		<footer class="footer text-center"> 2020 UIT &copy;
			wedding.com </footer>
	</div>


	<!-- Optional JavaScript -->
	<script src=""></script>
	<script src="<c:url value="/assets/js/header.js"/>"></script>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/assets/bootstrap/jquery.slim.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/popper.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>