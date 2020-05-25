<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Login</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href='<c:url value="/assets/css/style.css"/>'>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
    <div class="loginBackground container-fluid">
        <div class="row">
            <div class="col-sm"></div>
            <div class="col-sm-8 d-flex">
                <div class="animationBg">
                    <div class="loginForm active" id="loginForm">
                        <p class="loginTitle">Welcome back</p>
                        <form action="" method=""> 
                            <p>Username</p>
                            <input name="username" id="username" type="text" required>
                            <p>Password</p>
                            <input name="password" id="password" type="password" required>
                            <div class="text-center mb-4">
                                <button type="submit" class="btn">Get Started</button>
                            </div>
                            <div class="text-center">
                                <a onclick="changeForm('recoverForm')">Forgot your password?</a>
                            </div>
                        </form>
                    </div>
                    <div class="loginForm disable" id="recoverForm">
                        <p class="loginTitle">Recover Password</p>
                        <form action="" method=""> 
                            <p>Username</p>
                            <input type="text" name="username" required>
                            <p>What is your favorite food?</p>
                            <input type="text" name="secret_answer" required>
                            <div class="text-center mb-4">
                                <button  class="btn" onclick="changeForm('loginForm')" type="button">Cancel</button>
                                <button class="btn" type="button" onclick="changeForm('changePasswordForm')" type="button">Next</button>
                            </div>
                        </form>
                    </div>
                    <div class="loginForm disable" id="changePasswordForm">
                        <p class="loginTitle" style="font-size: 25px;">Change your Password</p>
                        <form action="" method=""> 
                            <p>New password</p>
                            <input name="new-password" id="new-password" type="password"  required>
                            <p>Re-enter your new password</p>
                            <input name="re-password" id="re-password" type="password" value="" required>
                            <div class="text-center mb-4">
                                <button type="button" class="btn" onclick="changeForm('loginForm')">Cancel</button>
                                <button type="button" class="btn" onclick="changeForm('loginForm')">Accept</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm"></div>
        </div>
    </div>













    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src='<c:url value="/assets/js/login.js"/>'></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>