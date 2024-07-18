<%-- 
    Document   : formLogin
    Created on : Mar 9, 2024, 11:17:20 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <!--        <link rel="stylesheet" href="css/style.css">-->
        <style>
            body {
                font-family: "Lato", Arial, sans-serif;
                font-size: 16px;
                line-height: 1.8;
                font-weight: normal;
                color: gray;
                position: relative;
                z-index: 0;
                padding: 0; }
            body:after {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                content: '';
                background: #000;
                opacity: .3;
                z-index: -1; }
            .img {
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center center; }
            .heading-section {
                font-size: 28px;
                color: #fff; }
            .ftco-section {
                padding: 7em 0; }
            .ftco-no-pt {
                padding-top: 0; }
            .ftco-no-pb {
                padding-bottom: 0; }
            .login-wrap {
                position: relative;
                color: rgba(255, 255, 255, 0.9); }
            .login-wrap h3 {
                font-weight: 300;
                color: #fff; }
            .login-wrap .social {
                width: 100%; }
            .login-wrap .social a {
                width: 100%;
                display: block;
                border: 1px solid rgba(255, 255, 255, 0.4);
                color: #000;
                background: #fff; }
            .login-wrap .social a:hover {
                background: #000;
                color: #fff;
                border-color: #000; }
            .form-group {
                position: relative; 
                margin-bottom: 1rem;}
            .field-icon {
                position: absolute;
                top: 50%;
                right: 15px;
                -webkit-transform: translateY(-50%);
                -ms-transform: translateY(-50%);
                transform: translateY(-50%);
                color: rgba(255, 255, 255, 0.9); }
            .form-control {
                background: transparent;
                border: none;
                height: 50px;
                color: white !important;
                border: 1px solid transparent;
                background: rgba(255, 255, 255, 0.08);
                border-radius: 40px;
                padding-left: 20px;
                padding-right: 20px;
                -webkit-transition: 0.3s;
                -o-transition: 0.3s;
                transition: 0.3s; }
            @media (prefers-reduced-motion: reduce) {
                .form-control {
                    -webkit-transition: none;
                    -o-transition: none;
                    transition: none; } }
            .form-control::-webkit-input-placeholder {
                /* Chrome/Opera/Safari */
                color: rgba(255, 255, 255, 0.8) !important; }
            .form-control::-moz-placeholder {
                /* Firefox 19+ */
                color: rgba(255, 255, 255, 0.8) !important; }
            .form-control:-ms-input-placeholder {
                /* IE 10+ */
                color: rgba(255, 255, 255, 0.8) !important; }
            .form-control:-moz-placeholder {
                /* Firefox 18- */
                color: rgba(255, 255, 255, 0.8) !important; }
            .form-control:hover, .form-control:focus {
                background: transparent;
                outline: none;
                -webkit-box-shadow: none;
                box-shadow: none;
                border-color: rgba(255, 255, 255, 0.4); }
            .form-control:focus {
                border-color: rgba(255, 255, 255, 0.4); }

            textarea.form-control {
                height: inherit !important; }

            .checkbox-wrap {
                display: block;
                position: relative;
                padding-left: 30px;
                margin-bottom: 12px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 500;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none; }

            /* Hide the browser's default checkbox */
            .checkbox-wrap input {
                position: absolute;
                opacity: 0;
                cursor: pointer;
                height: 0;
                width: 0; }

            /* Create a custom checkbox */
            .checkmark {
                position: absolute;
                top: 0;
                left: 0; }

            /* Create the checkmark/indicator (hidden when not checked) */
            .checkmark:after {
                content: "\f0c8";
                font-family: "FontAwesome";
                position: absolute;
                color: rgba(255, 255, 255, 0.1);
                font-size: 20px;
                margin-top: -4px;
                -webkit-transition: 0.3s;
                -o-transition: 0.3s;
                transition: 0.3s; }
            @media (prefers-reduced-motion: reduce) {
                .checkmark:after {
                    -webkit-transition: none;
                    -o-transition: none;
                    transition: none; } }

            /* Show the checkmark when checked */
            .checkbox-wrap input:checked ~ .checkmark:after {
                display: block;
                content: "\f14a";
                font-family: "FontAwesome";
                color: rgba(0, 0, 0, 0.2); }

            /* Style the checkmark/indicator */
            .checkbox-primary {
                color: #08A88A; }
            .checkbox-primary input:checked ~ .checkmark:after {
                color: #08A88A; }

            .btn {
                cursor: pointer;
                border-radius: 40px;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                font-size: 15px;
                text-transform: uppercase; }
            .btn:hover, .btn:active, .btn:focus {
                outline: none; }
            .btn.btn-primary {
                background: #08A88A !important;
                border: 1px solid #08A88A !important;
                color: #000 !important; }
            .btn.btn-primary:hover {
                border: 1px solid #08A88A;
                background: transparent;
                color: #08A88A; }
            .btn.btn-primary.btn-outline-primary {
                border: 1px solid #08A88A;
                background: transparent;
                color: #08A88A; }
            .btn.btn-primary.btn-outline-primary:hover {
                border: 1px solid transparent;
                background: #08A88A;
                color: #fff; }

            @media (min-width: 768px) {
                .text-md-left {
                    text-align: left !important; }
                .text-md-right {
                    text-align: right !important; }
                .text-md-center {
                    text-align: center !important; } }
                </style>

            </head>
            <body class="img js-fullheight" style="background-image: url(images/img_for_home.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h1 class="heading-section" >Pet Services</h1>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Have an account?</h3>
                            <form action="mainController" method="post" class="signin-form">
                                <input type="hidden" name="action" value="login" />
                                <div class="form-group">
                                    <input type="text"  name="txtemail" class="form-control" placeholder="Enter email" required>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" class="form-control" name="txtpassword" placeholder="Enter password" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <input type="submit" name="btnLogin" class="form-control btn btn-primary submit px-3">Sign In</input>
                                </div>
                                <%
                                    String error = (String) request.getAttribute("ERROR");
                                    if (error != null && !error.isEmpty()) {
                                %>
                                <p style="color: white"><%= error%></p>
                                <% }%>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <label class="checkbox-wrap checkbox-primary">Remember Me
                                            <input type="checkbox" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="#" style="color: #fff">Forgot Password</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <script src="assets/home/jquery.min.js"></script>
        <script src="assets/home/js/popper.js"></script>
        <script src="assets/home/bootstrap.min.js"></script>
        <script src="assets/home/main.js"></script>
    </body>
</html>
