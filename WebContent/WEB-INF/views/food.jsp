<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.wedding.models.Food" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Food</title>
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
						<a href="<%=request.getContextPath()%>/logout"
							class="btn btn-danger">Sign out</a>
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
				<div class="avatar-user" onclick="">
					<img src="<c:url value="/assets/images/avatar.jpg"/>">
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
					<li><a href="<%=request.getContextPath()%>/food"
						class="active"> <span class="menu-tab-icon"> <i
								class='fas fa-drumstick-bite'></i>
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

		<!-- always call show...Updated-->
		<!-- Page Content -->
		<div
			class="body-content d-flex align-items-center justify-content-center">
			<div class="update">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm"></div>
						<div class="col-sm-10">
							<div class="container-fluid">
								<div class="row">
									<div class="col title">
										<a href="<%=request.getContextPath()%>/lobby">LOBBY</a>
									</div>
									<div class="col title active">
										<a href="<%=request.getContextPath()%>/food">FOOD</a>
									</div>
									<div class="col title">
										<a href="<%=request.getContextPath()%>/service">SERVICE</a>
									</div>
								</div>
							</div>
							<div class="updateForm">
								<!-- Food -->
								<div class="content p-4">
									<!--Modal delete-->
									<div class="modal fade" id="deleteFoodModal" tabindex="-1"
										role="dialog" aria-labelledby="" aria-hidden="true">
										<div class="modal-dialog modal-sm modal-dialog-centered"
											role="document">
											<form class="modal-content" action="<%=request.getContextPath() %>/food/delete" method="GET">
												<div class="modal-header">
													<h5 class="modal-title" id="">Delete Food</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
												Do you want to delete this food?
												<input type="hidden" name="foodID">
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-danger btn-sm"
														 onclick="">Yes</button>
													<button type="button" class="btn btn-success btn-sm"
														data-dismiss="modal">Cancel</button>
												</div>
											</form>
										</div>
									</div>

									<!-- Form edit food-->
									<form class="formAdd" action="<%=request.getContextPath() %>/food/update" method="POST">
										<h2 class="text-center">Food Information Update Form</h2>
										<div id="" class="container-fluid text-left mb-3">
											<div class="row mb-3">
												<input type="hidden" name="foodID">
												<div class="col-sm-6">
													<lable>Name</lable>
													<input type="text" class="form-control" name="foodName"
														required>
												</div>
												<div class="col-sm">
													<lable>Note</lable>
													<input type="text" class="form-control" name="foodNote"
														required>
												</div>
												<div class="col-sm">
													<lable>Price</lable>
													<input type="text" class="form-control"
														onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														name="foodPrice" required>
												</div>
											</div>
											<div class="text-right">
												<button class="btn btn-secondary btn-sm" type="submit"
													onclick="">OK</button>
												<button class="btn btn-outline-secondary btn-sm"
													type="button" onclick="closeForm(0)">Cancel</button>
											</div>
										</div>
									</form>

									<!-- Form add food-->
									<form class="formAdd" action="<%= request.getContextPath() %>/food/add" method="POST">
										<h2 class="text-center">New Food Information</h2>
										<div id="newFood" class="container-fluid text-left mb-3">
											<div class="row mb-3">
												<div class="col-sm-6">
													<lable>Name</lable>
													<input type="text" class="form-control" name="foodName"
														required>
												</div>
												<div class="col-sm">
													<lable>Note</lable>
													<input type="text" class="form-control" name="foodNote"
														required>
												</div>
												<div class="col-sm">
													<lable>Price</lable>
													<input type="text" class="form-control" name="foodPrice"
														onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														required>
												</div>
											</div>
											<div class="text-right">
												<button class="btn btn-secondary btn-sm" type="submit"
													onclick="">Add</button>
												<button class="btn btn-outline-secondary btn-sm"
													type="button" onclick="closeForm(1)">Cancel</button>
											</div>
										</div>
									</form>

									<!-- List food -->
									<div class="scroll">
										<table id="updateFood" class="table table-hover table-sm">
											<thead>
												<tr>
													<th>Name</th>
													<th>Note</th>
													<th>Price</th>
													<c:choose>
														<c:when test = "${userRole == 'ROLE_MANAGER' }">
															<th>Action</th>
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
												</tr>
											</thead>
											<tbody>
												<c:forEach var = "food" items="${foods }">
													<tr>
														<td>${food.foodName}</td>
														<td>${food.foodNote}</td>
														<td>${food.foodPrice}</td>
														<c:choose>
															<c:when test = "${userRole == 'ROLE_MANAGER' }">
																<td>
																	<button type="button" class="btn btn-danger btn-sm" onclick="getIdFood('${food.foodID}')" data-toggle="modal" data-target="#deleteFoodModal">Delete</button> 
																	<button type="button" class="btn btn-warning btn-sm" onclick="showForm(0) && edit(['${food.foodID}','${food.foodName}','${food.foodNote }','${food.foodPrice}'])">Edit</button>
																</td>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

									<!-- Btn Add food-->
									<div class="text-right">
										<c:choose>
											<c:when test="${ userRole == 'ROLE_MANAGER'}">
												<button class="btn btn-secondary btn-sm mt-2" type="button"
													onclick="showForm(1)">Add</button>
											</c:when>

											<c:otherwise>
											</c:otherwise>
										</c:choose>
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
	<script src="<c:url value="/assets/js/header.js"/>"></script>
	<script src="<c:url value="/assets/js/update.js"/>"></script>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/assets/bootstrap/jquery.slim.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/popper.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
</body>

</html>