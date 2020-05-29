<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Service</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- CSS -->
    <link rel='stylesheet' href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
    <!-- Favicon -->
    <link rel="icon" href="<c:url value="/assets/images/icon.png"/>" type="image/x-icon">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body onload="startTime() && showDate() && showServiceUpdated()">
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Header -->
        <!--Modal sign out-->
        <div class="modal fade" id="signOutModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Sign out</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure?
                    </div>
                    <div class="modal-footer">
                        <a href="<%=request.getContextPath() %>/logout" class="btn btn-danger">Sign out</a>
                        <button type="button" class="btn btn-success btn-sm" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Header content-->
        <div class="header sticky-top">
            <div class="date-time d-flex flex-direction-row align-items-center">
                <div class="calendar">
                    <i class="fa fa-clock-o mr-3"></i>
                    <span id="time" class="mr-5"></span>
                </div>
                <div class="calendar">
                    <div id="date"></div>
                    <div>
                        <div id="year"></div>
                        <div id="day"></div>
                    </div>
                </div>
            </div>

            <div class="function-icon d-flex flex-direction-row align-items-center">
                <div data-toggle="tooltip" title="Settings">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-settings">
                        <circle cx="12" cy="12" r="3"></circle>
                        <path
                            d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z">
                        </path>
                    </svg>
                </div>
                <div data-toggle="modal" data-target="#signOutModal" data-toggle="tooltip" title="Sign out!">
                    <i class="fa fa-sign-out-alt mx-4" aria-hidden="true"></i>
                </div>
                <div class="avatar-user" onclick="">
                    <img src="<c:url value="/assets/images/avatar.jpg"/>" >
                </div>
            </div>

        </div>
        <!-- /Header -->

        <!-- Navbar -->
        <% String userRole = request.getAttribute("userRole").toString(); %>
        <div class="admin-wrapper">
        <div class="nav">
          <div class="logo">
            <img src="<c:url value="/assets/images/logo.png"/>">
          </div> 
          <ul>
          <li>
              <a href="<%= request.getContextPath() %>/dashboard">
                  <span class="menu-tab-icon">
                    <i class="fa fa-chart-bar"></i>
                  </span>
                  <span>Dashboard</span>
              </a>
          </li>
          <li>
          <c:choose>
        	<c:when test = "${ userRole == 'ROLE_MANAGER'}">
        		<a href="<%= request.getContextPath() %>/employee">
                  <span class="menu-tab-icon">
                    <i class="fa fa-users-cog"></i>
                  </span>
                  <span>Employee</span>
              </a>
        	</c:when>
        	<c:otherwise>
        		<a href="<%= request.getContextPath() %>/reservation">
                  <span class="menu-tab-icon">s
                    <i class="fa fa-list"></i>
                  </span>
                  <span>Reservation</span>
              </a>
        	</c:otherwise>
        </c:choose>
          </li>
          <li>
            <a href="<%= request.getContextPath() %>/lobby">
                <span class="menu-tab-icon">
                  <i class="fa fa-door-open"></i>
                </span>
                <span>Lobby</span>
            </a>
            </li>
          <li>
              <a href="<%= request.getContextPath() %>/food">
                  <span class="menu-tab-icon">
                    <i class='fas fa-drumstick-bite'></i>
                  </span>
                  
                  <span>Food</span>
              </a>
          </li>
          <li>
              <a href="<%= request.getContextPath() %>/service" class="active">
                  <span class="menu-tab-icon">
                    <i class="fab fa-readme"></i>
                  </span>
                  <span>Service</span>
              </a>
          </li>
          
          <li>
            <a href="<%= request.getContextPath() %>/payment">
                <span class="menu-tab-icon">
                  <i class="fab fa-cc-visa"></i>
                </span>
                <span>Payment</span>
            </a>
          </li>
          </ul>
        </div>
      </div>
        <!-- //Navbar -->

        <!-- always call show...Updated-->
        <!-- Page Content -->
        <div class="body-content d-flex align-items-center justify-content-center">
            <div class="update">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm"></div>
                        <div class="col-sm-10">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col title">
                                        <a href="<%= request.getContextPath() %>/manager/lobby">LOBBY</a>
                                    </div>
                                    <div class="col title">
                                        <a href="<%= request.getContextPath() %>/manager/sfood">FOOD</a>
                                    </div>
                                    <div class="col title active">
                                        <a href="<%= request.getContextPath() %>/manager/service">SERVICE</a>
                                    </div>
                                </div>
                            </div>
                            <div class="updateForm">
                                <!--Services-->
                                <div class="content p-4">
                                    <!--Modal delete-->
                                    <div class="modal fade" id="deleteServiceModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
                                        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                            <h5 class="modal-title" id="">Delete Service</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            </div>
                                            <div class="modal-body">
                                            Do you want to delete this service?
                                            </div>
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal" onclick="deleteService()">Yes</button>
                                            <button type="button" class="btn btn-success btn-sm" data-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>
                                        </div>
                                    </div>

                                    <!-- Form edit service-->
                                    <form class="formAdd" action="" method="">
                                        <h2 class="text-center">Service Information Update Form</h2>
                                        <div id="" class="container-fluid text-left mb-3">
                                            <div class="row mb-3">
                                                <div class="col-sm-6">
                                                    <lable>Name</lable>
                                                    <input type="text" class="form-control" name="name" required>
                                                </div>
                                                <div class="col-sm">
                                                    <lable>Price</lable>
                                                    <input type="text" name="cost" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required>
                                                </div>
                                            </div>
                                            <div class="text-right">
                                                <button class="btn btn-secondary btn-sm" type="submit"
                                                    onclick="">OK</button>
                                                <button class="btn btn-outline-secondary btn-sm" type="button"
                                                    onclick="closeForm(0)">Cancel</button>
                                            </div>
                                        </div>
                                    </form>

                                    <!-- Form add service-->
                                    <form class="formAdd">
                                        <h2 class="text-center">New Service Information</h2>
                                        <div id="newService" class="container-fluid text-left mb-3">
                                            <div class="row mb-3">
                                                <div class="col-sm-6">
                                                    <lable>Name</lable>
                                                    <input type="text" class="form-control" name="name" required>
                                                </div>
                                                <div class="col-sm">
                                                    <lable>Price</lable>
                                                    <input type="text" name="cost" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required>
                                                </div>
                                            </div>
                                            <div class="text-right">
                                                <button class="btn btn-secondary btn-sm" type="submit"
                                                    onclick="">Add</button>
                                                <button class="btn btn-outline-secondary btn-sm" type="button"
                                                    onclick="closeForm(1)">Cancel</button>
                                            </div>
                                        </div>
                                    </form>

                                    <!-- List service -->
                                    <div class="scroll">
                                        <table id="updateService" class="table table-hover table-sm">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Btn add service -->
                                    <div class="text-right">
                                        <button class="btn btn-secondary btn-sm" type="button"
                                            onclick="showForm(1)">Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm"></div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer text-center"> 2020 UIT &copy; wedding.com </footer>
    </div>


    <!-- Optional JavaScript -->
    <script src="<c:url value="/assets/js/header.js"/>"></script>
	<script src="<c:url value="/assets/js/update.js"/>"></script>
    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>