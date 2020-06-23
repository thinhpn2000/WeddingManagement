<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Employee</title>
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
					<li><a href="<%=request.getContextPath()%>/employee"
						class="active"> <span class="menu-tab-icon"> <i
								class="fa fa-users-cog"></i>
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
			<div id="employee" class="employee">
				<div class="container-fluid mt-3">
					<div class="row">
						<div class="col-sm"></div>
						<div class="col-sm-11">
							<!--Modal delete-->
							<div class="modal fade" id="deleteEmployeeModal" tabindex="-1"
								role="dialog" aria-labelledby="" aria-hidden="true">
								<div class="modal-dialog modal-sm modal-dialog-centered"
									role="document">
									<form class="modal-content"
										action="<%=request.getContextPath()%>/employee/delete"
										method="GET">
										<div class="modal-header">
											<h5 class="modal-title" id="">Delete employee</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											Do you want to delete this employee? <input type="hidden"
												name="userID">
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-danger btn-sm">Yes</button>
											<button type="button" class="btn btn-success btn-sm"
												data-dismiss="modal">Cancel</button>
										</div>
									</form>
								</div>
							</div>

							<!--Modal reset password-->
							<div class="modal fade" id="resetPasswordModal" tabindex="-1"
								role="dialog" aria-labelledby="" aria-hidden="true">
								<div class="modal-dialog modal-sm modal-dialog-centered"
									role="document">
									<form class="modal-content"
										action="<%=request.getContextPath()%>/employee/reset"
										method="GET">
										<div class="modal-header">
											<h5 class="modal-title">Reset Password</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											Do you want to reset password for this employee? <input
												type="hidden" name="userID">
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-danger btn-sm">Yes</button>
											<button type="button" class="btn btn-success btn-sm"
												data-dismiss="modal">Cancel</button>
										</div>
									</form>
								</div>
							</div>

							<!--Add Employee-->
							<div
								class="title-employee d-flex align-items-center justify-content-center disable">
								<h2>New Employee Infomation</h2>
							</div>

							<form class="formAdd container-fluid border mb-3"
								action="<%=request.getContextPath()%>/employee/add"
								method="POST">
								<div id="newEmployee" class="text-left">
									<div class="row mb-3">
										<div class="col-lg-4 col-md-6">
											<label>Fullname</label> <input type="text"
												class="form-control" name="fullname" required>
										</div>
										<div class="col-lg-4 col-md-3">
											<label>D.O.B</label> <input type="date" class="form-control"
												name="DOB" required onblur="checkDate()">
										</div>
										<div class="col-lg-2 col-md-3">
											<label>Gender</label> <select class="form-control pt-0 pb-0"
												name="gender" required>
												<option value="female">Female</option>
												<option value="male">Male</option>
												<option value="other">Other</option>
											</select>
										</div>
										<div class="col-lg-2 col-md-4">
											<label>Role</label> <input type="text" class="form-control"
												value="Employee" disabled>
										</div>
										<div class="col-lg-5 col-md-6">
											<label>Username (Your email)</label> <input type="text"
												class="form-control" name="username" required
												onblur="checkEmail(this,'alert-add')">
										</div>

										<div class="col-lg-3 col-md-4">
											<label>Salary</label> <input type="text" class="form-control"
												name="salary"
												onkeypress='return event.charCode >= 48 && event.charCode <= 57'
												required>
										</div>
										<div class="col-lg-4 col-md-4">
											<label>Joining date</label> <input type="date"
												class="form-control" name="joiningDate" required
												onblur="checkDate()">
										</div>
									</div>
									<div class="d-flex justify-content-end">
										<div id="alert-add" class="alert alert-danger mb-0 mr-4"
											style="display: none"></div>
										<div id="alert-date" class="alert alert-danger mb-0 mr-4"
											style="display: none"></div>
										<div>
											<button id="btnAddEmployee" class="btn btn-secondary mb-3"
												type="submit" onclick="">Add</button>
											<button class="btn btn-outline-secondary mb-3" type="button"
												onclick="closeForm(0)">Cancel</button>
										</div>
									</div>
								</div>
							</form>

							<!--Edit Employee-->
							<div
								class="title-employee d-flex align-items-center justify-content-center disable">
								<h2>Employee Information Update Form</h2>
							</div>

							<form class="formAdd container-fluid border mb-3"
								action="<%=request.getContextPath()%>/employee/update"
								method="POST">
								<div class="text-left">
									<div class="row mb-3">
										<input type="hidden" class="form-control" name="userID">
										<div class="col-lg-4 col-md-6">
											<label>Fullname</label> <input type="text"
												class="form-control" name="fullname" required>
										</div>
										<div class="col-lg-4 col-md-3">
											<label>D.O.B</label> <input type="date" class="form-control"
												disabled>
										</div>
										<div class="col-lg-4 col-md-3">
											<label>Gender</label> <input type="text" class="form-control"
												disabled>
										</div>
										<div class="col-lg-6 col-md-6">
											<label>Username (Your email)</label> <input type="text"
												class="form-control" name="username" required
												onblur="checkEmail(this,'alert-update')">
										</div>

										<div class="col-lg col-md-4">
											<label>Salary</label> <input type="text" class="form-control"
												name="salary"
												onkeypress='return event.charCode >= 48 && event.charCode <= 57'
												required>
										</div>
										<div class="col-lg col-md-4">
											<label>Joining date</label> <input type="date"
												class="form-control" disabled>
										</div>
										<div class="col-lg col-md-4">
											<label>Role</label>
											<p class="form-control" disabled>Employee</p>

										</div>
									</div>

									<div class="d-flex justify-content-end">
										<div id="alert-update" class="alert alert-danger mb-0 mr-4"
											style="display: none"></div>
										<div>
											<button id="btnUpdateEmployee" class="btn btn-secondary mb-3"
												type="submit" onclick="">OK</button>
											<button class="btn btn-outline-secondary mb-3" type="button"
												onclick="closeForm(1)">Cancel</button>
										</div>
									</div>
								</div>
							</form>


							<div
								class="title-employee d-flex align-items-center justify-content-center">
								<h2>Employee List</h2>
							</div>

							<!--List Employee-->
							<div class="scroll">
								<table id="listEmployee" class="table table-hover table-sm">
									<thead>
										<tr>
											<th>No.</th>
											<th>Full name</th>
											<th>User name</th>
											<th>Gender</th>
											<th>D.O.B</th>
											<th>Salary</th>
											<th>Joining date</th>
											<th>Role</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="employee" items="${employees }"
											varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td>${employee.fullname }</td>
												<td>${employee.username }</td>
												<td>${employee.gender }</td>
												<td>${employee.DOB }</td>
												<td>${employee.salary }</td>
												<td>${employee.joiningDate }</td>
												<td>Employee</td>
												<td>
													<button type="button" class="btn btn-danger btn-sm"
														data-toggle="modal" data-target="#deleteEmployeeModal"
														onclick="deleteEmployee('${employee.userID}')">Delete</button>
													<button type="button" class="btn btn-warning btn-sm"
														onclick="showForm(1) && edit(['${employee.userID}','${employee.fullname}','${employee.DOB }','${employee.gender}', '${employee.username }', '${employee.salary }','${employee.joiningDate }'])">Edit</button>
													<button type="button" data-toggle="modal"
														data-target="#resetPasswordModal"
														class="btn btn-primary btn-sm ml-1"
														onclick="resetPassword('${employee.userID}')">Reset
														password</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<!--button add-->
							<div class="text-right mt-2">
								<button class="btn btn-secondary" type="button"
									onclick="showForm(0)">Add</button>
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
	<script src="<c:url value="/assets/js/employee.js"/>"></script>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/assets/bootstrap/jquery.slim.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/popper.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>