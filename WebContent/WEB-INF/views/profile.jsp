<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<title>Profile</title>
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
				<div class="avatar-user" onclick="" data-toggle="tooltip" title="Your profile">
					<img src="<c:url value="/assets/images/avatar.png"/>">
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

					<li><a href="<%=request.getContextPath()%>/payment"> <span
							class="menu-tab-icon"> <i class="fab fa-cc-visa"></i>
						</span> <span>Wedding</span>
					</a></li>
				</ul>
			</div>
		</div>
		<!-- //Navbar -->

		<!-- always call show...Updated-->
		<!-- Page Content -->
		<div
			class="body-content d-flex align-items-center justify-content-center">
			<!-- Profile -->
			<div id="profile" class="profile">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm"></div>
						<div class="col-sm-8">
							<div class="profile-content">
								<div class="profile-title text-center">Formal profile</div>
								<div class="profile-body">
									<div class="profile-info text-center">
										<div class="avatar-profile">
											<img src="<c:url value="/assets/images/avatar.png"/>">
										</div>
										<div class="pt-3">
											<button type="button" class="btn btn-primary"
												onclick="changePassword()">Change password</button>
										</div>
										<div class="py-4"><%=username%></div>
										<c:choose>
											<c:when test="${ userRole == 'ROLE_MANAGER'}">
												<div class="pb-4">Manager</div>
											</c:when>
											<c:otherwise>
												<div class="pb-4">Employee</div>
											</c:otherwise>
										</c:choose>

										<div class="static-user container-fluid">
											<div class="row">
												<div class="col-sm text-center wedding">
													<h5>Wedding</h5>
													<p class="counter">350</p>
												</div>
												<div class="col-sm text-center revenue">
													<h5>Revenue</h5>
													<p class="counter">240</p>
												</div>
												<div class="col-sm text-center invoice">
													<h5>Invoice</h5>
													<p class="counter">350</p>
												</div>
											</div>
										</div>
									</div>
									<div class="profile-password">
										<form id="profile-password" action="<%=request.getContextPath()%>/profile" method="POST">
											
											<p>New password</p>
											<input name="password" type="password"
												onblur="checkMatching()" required>
											<p>Re-type new password</p>
											<input type="password" id="confirmPassword"
												onblur="checkMatching()" class="mb-3" required>
											<div class="alert p-0">*Passwords do not match</div>
											<div class="text-center mb-3">
												<button type="button" class="btn" onclick="changePassword()">Cancel</button>
												<button type="submit" class="btn" id="btnAccept">Accept</button>
											</div>
										</form>
									</div>
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
	<script src="<c:url value="/assets/js/header.js"/>">
		
	</script>
	<script src="<c:url value="/assets/js/profile.js"/>"></script>

	<!-- JS for counter up-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.5/waypoints.min.js"></script>
	<script src="<c:url value="/assets/js/jquery.countup.min.js"/>"></script>
	<script>
		$('.counter').countUp();
	</script>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/assets/bootstrap/jquery.slim.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/popper.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
</body>

</html>