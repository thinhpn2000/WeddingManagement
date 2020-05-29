<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Reservation</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
<!-- Favicon -->
<link rel="icon" href="<c:url value="/assets/images/logo1-dark.png"/>" type="image/x-icon"> 
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body onload="startTime() && showDate() && showTab(0)">
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
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
          </div>
          <div data-toggle="modal" data-target="#signOutModal"  data-toggle="tooltip" title="Sign out!">
            <i class="fa fa-sign-out-alt mx-4" aria-hidden="true"></i>
          </div>
          <div class="avatar-user" onclick="">
            <img src="<c:url value="/assets/images/avatar.jpg"/>">
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
          <li>
              <a href="<%= request.getContextPath() %>/dashboard">
                  <span class="menu-tab-icon">
                    <i class="fa fa-chart-bar"></i>
                  </span>
                  <span>Dashboard</span>
              </a>
          </li>
          <li>
              <a href="<%= request.getContextPath() %>/reservation" class="active">
                  <span class="menu-tab-icon">
                    <i class="fa fa-list"></i>
                  </span>
                  <span>Reservation</span>
              </a>
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
              <a href="<%= request.getContextPath() %>/service">
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

      <!-- Page Content -->
      <div class="body-content d-flex align-items-center justify-content-center">
        <!-- Event reservation-->
        <div id ="event" class="event active">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm d-flex align-items-center justify-content-center btn-step">
                  <button id="btnPrev" class="btn btn-secondary btn-sm d-flex align-items-center justify-content-center" type="button" onclick="moveTab(-1)" disabled>
                    <i class="fa fa-angle-left"></i>
                  </button>
                </div>
                <div class="col-sm-10">
                  <!-- Step -->
                  <div class="container-fluid">
                    <div class="row bs-wizard">
                      <div class="col bs-wizard-step active" style="padding:0%">
                        <div class="text-center bs-wizard-stepnum">Step 1</div>
                        <div class="progress"><div class="progress-bar"></div></div>
                        <a href="#" class="bs-wizard-dot"></a>
                        <div class="bs-wizard-info text-center">Lobby</div>
                      </div>
                      
                      <div class="col bs-wizard-step disable" style="padding:0%">
                        <div class="text-center bs-wizard-stepnum">Step 2</div>
                        <div class="progress"><div class="progress-bar"></div></div>
                        <a href="#" class="bs-wizard-dot"></a>
                        <div class="bs-wizard-info text-center">Your information</div>
                      </div>
                      
                      <div class="col bs-wizard-step disable" style="padding:0%">
                        <div class="text-center bs-wizard-stepnum">Step 3</div>
                        <div class="progress"><div class="progress-bar"></div></div>
                        <a href="#" class="bs-wizard-dot"></a>
                        <div class="bs-wizard-info text-center">Food</div>
                      </div>
                      
                      <div class="col bs-wizard-step disable" style="padding:0%">
                        <div class="text-center bs-wizard-stepnum">Step 4</div>
                        <div class="progress"><div class="progress-bar"></div></div>
                        <a href="#" class="bs-wizard-dot"></a>
                        <div class="bs-wizard-info text-center">Services</div>
                      </div>
                    </div>
                  </div>
                  <!--Form register-->
                  <div class="container-fluid">
                    <div class="row">
                      <div class="col-sm">
                        
                        <form id="regEvent" name="regEvent" class="regEvent py-3" action="" method="">
                          <!-- lobby -->
                          <div class="tab container-fluid">
                            <!--Filter-->
                            <div class="row">
                              <div class="col-sm-1"></div>
                              <div class="col-sm">
                                <div class="row">
                                  <div class="col-sm">
                                    <div class="form-group">
                                      <label for="dateWedding">Preferred wedding date</label>
                                      <input placeholder="Date" class="form-control" type="text" onfocus="(this.type='date')" id="dateWedding" name="dateWedding" onblur="validate('dateWedding')" >
                                    </div>
                                  </div>
                                  <div class="col-sm-3">
                                    <div class="form-group text-center">
                                      <lable style="display: block; margin-bottom: 15px;">Shift</lable>
                                      <div class="form-check-inline">
                                        <label class="form-check-label" for="radio1">
                                          <input type="radio" class="form-check-input" id="radio1" name="shift" value="Trưa" checked>Evening
                                        </label>
                                      </div>
                                      <div class="form-check-inline">
                                        <label class="form-check-label" for="radio2">
                                          <input type="radio" class="form-check-input" id="radio2" name="shift" value="Tối">Night
                                        </label>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col-sm-3 text-center">
                                    <button id="btnFilter" type="button" class="btn btn-outline-secondary mt-3" onclick="filter()">Filter</button>
                                  </div>
                                </div>
                              </div>
                              <div class="col-sm-1"></div>
                            </div>

                            <!--List Lobby-->
                            <div class="row mt-3">
                              <div class="col-sm-1"></div>
                              <div class="col-sm" style="overflow-y: scroll; max-height: 290px;">
                                <table id="tableLobby" class="table table-sm table-hover">
                                  <thead>
                                    <tr>
                                      <th>Name</th>
                                      <th>Type</th>
                                      <th>Maximum table permitted</th>
                                      <th>Minimum price per table</th>
                                      <th>Note</th>
                                      <th>Action</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                
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
                                      <label for="nameGroom">Name of Groom</label>
                                      <input id="nameGroom" type="text" class="form-control" placeholder="" onblur="validate('nameGroom')" name="nameGroom">
                                    </div>
                                  </div>
                                  <div class="col-xl col-sm-6">
                                    <div class="form-group">
                                      <label for="nameBride">Name of Bride</label>
                                      <input id="nameBride" type="text" class="form-control" placeholder="" onblur="validate('nameBride')" name="nameBride">
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  
                                  <div class="col-xl-4 col-sm-4">
                                    <div class="form-group">
                                      <label for="phone">Phone number</label>
                                      <input id="phone" type="text" class="form-control" placeholder="" onblur="validate('phone')" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="phone">
                                    </div>
                                  </div>
                                  <div class="col-xl-3 col-sm-4">
                                    <div class="form-group">
                                      <label>Maximum table</label>
                                      <input type="text" class="form-control disable" name="tableMax" value=40 placeholder="" disabled>
                                    </div>
                                    
                                  </div>
                                  <div class="col-xl-3 col-sm-4">
                                    <div class="form-group">
                                      <label for="tableQuantity">Number of Tables</label>
                                      <input type="number" value=0 min=0 id="tableQuantity" name="tableQuantity" class="form-control" placeholder="" onblur="validate('tableQuantity')" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                    </div>
                                  </div>
                                  <div class="col-xl-2 col-sm-4">
                                    <div class="form-group">
                                      <label for="reservedTable">Extra tables</label>
                                      <input id="reservedTable" type="number" min=0 name="reservedTable"class="form-control" placeholder="" onblur="validate('reservedTable')" value=0 onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
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
                                        <th>Note</th>
                                        <th>Price</th>
                                        <th>Action</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <tbody>
                                    <tfoot>
                                      <tr>
                                        <th colspan="2">Total :</th>
                                        <td id="totalFood"></td>
                                        <th id="costMin">  
                                        </th>
                                      </tr>
                                      </tfoot>
                                  </table>
                                </div>

                                <!-- Deposit and menu-->
                                <div class="d-flex flex-direction-row align-items-center justify-content-between">
                                  <div class="form-group" style="width: 200px;">
                                    <label for="deposit">Deposit paid</label>
                                    <input type="number" min=0 id="deposit" type="text" class="form-control" onblur="validate('deposit')" style="width:100%" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="deposit">
                                  </div>
                                  <div id="alert-food" class="alert alert-danger mb-0">
                                    Please add more food to continue
                                  </div>
                                  <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#menuModal" onclick="showMenu()">Menu</button>
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
                                <div class="text-right">
                                  <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#servicesModal" onclick="showServices()">Menu</button>
                                </div>
                              </div>
                              <div class="col-sm-1"></div>
                            </div>
                          </div>
                
                        </form>
                        <div id="alert-lobby" class="alert alert-danger" role="alert">
                          Please choose at least one lobby to continue
                        </div>
                        
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm d-flex align-items-center justify-content-center btn-step">
                  <button id="btnNext" class="btn btn-secondary btn-sm d-flex align-items-center justify-content-center" onclick="confirm() && moveTab(1)" >
                    <i class="fa fa-angle-right"></i>
                  </button>
                </div>
              </div>
            </div>
        </div>

        <!-- invoice -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Your invoice</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body" id="modalInvoice">
                <div class="container-fluid">
                    <div class="row mb-3">
                      <div class="col-sm-6 col-lg-4">
                        <strong>Name of Groom:</strong>
                        <span></span>
                      </div>
                      <div class="col-sm-6 col-lg-4">
                        <strong>Name of Bride:</strong>
                        <span></span>
                      </div>
                      <div class="col-sm-6 col-lg-4" id="payDate">
                        <strong>Wedding date:</strong>
                        <span></span>
                      </div>
                      <div class="col-sm-6 col-lg-4">
                        <strong>Number of tables:</strong>
                        <span></span>
                      </div>
                      <div class="col-sm-6 col-lg-4">
                        <strong>Price per table:</strong>
                        <span></span>
                      </div>
                      <div class="col-sm-6 col-lg-4">
                        <strong>Total cost of table:</strong>
                        <span></span>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm" style="overflow-y: scroll; height: 250px;">
                          <table class="table table-sm">
                          <thead>
                              <tr>
                              <th>No.</th>
                              <th>Name</th>
                              <th>Price</th>
                              <th>Quantity</th>
                              <th>Price</th>
                              </tr>
                          </thead>
                          <tbody>
                              
                          <tbody>
                          
                          </table>
                      
                      </div> 
                    </div>
                    <div>
                      <strong>Total service cost: </strong>
                      <span></span>
                    </div>
                    <div>
                      <strong>Total wedding cost: </strong>
                      <span></span>
                    </div>
                    <div>
                      <strong>Deposit paid: </strong>
                      <span></span>
                    </div>
                    <div>
                      <strong>Balance: </strong>
                      <span></span>
                    </div>
                    <div>
                      <strong>Payment date: </strong>
                      <span id="payment-date"></span>
                    </div>
                </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal" >Cancel</button>
                <button type="submit" form="regEvent" class="btn btn-success btn-sm" onclick="">Confirm</button>
                
                </div>
            </div>
            </div>
        </div>

        <!-- menu -->
        <div class="modal fade" id="menuModal" tabindex="-1" role="dialog" aria-labelledby="menuModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Our menu</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body" id="modalMenu">
              <div style="overflow-y: scroll; height: 500px;">
                <table id="menu" class="table table-sm table-hover" >
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th>Note</th>
                      <th>Price</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    
                  <tbody>
                  
                </table>
              </div>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-success btn-sm" data-dismiss="modal" >OK</button>
            </div>
        </div>
        </div>
        </div>

        <!-- service -->
        <div class="modal fade" id="servicesModal" tabindex="-1" role="dialog" aria-labelledby="servicesModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
          <div class="modal-content">
              <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Our services</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
              </div>
              <div class="modal-body" id="modalServices">
                <!-- Services -->
                <div style="overflow-y: scroll;  height: 500px;">
                  <table id="servicesMenu" class="table table-sm table-hover">
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
              </div>
              <div class="modal-footer">
              <button type="button" class="btn btn-success btn-sm" data-dismiss="modal" >OK</button>
              </div>
          </div>
          </div>
          </div>
      </div>
      <footer class="footer text-center"> 2020 UIT &copy; wedding.com </footer>
    </div>

      
    <!-- Optional JavaScript -->
    <script src="<c:url value="/assets/js/reservation.js"/>"></script>
    <script src="<c:url value="/assets/js/header.js"/>"></script>
    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>