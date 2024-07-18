<%-- 
    Document   : viewinfoservice
    Created on : Mar 6, 2024, 9:48:23 AM
    Author     : ADMIN
--%>

<%@page import="dao.TypePetDao"%>
<%@page import="dao.TypeServiceDao"%>
<%@page import="dto.TypeService"%>
<%@page import="dto.TypePet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Pet Services</title>
        <meta name="description" content="Pet Services">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" href="https://i.pinimg.com/originals/ca/78/99/ca78993a468a835197b2e340dc214cd1.jpg">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
        <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
        <link rel="stylesheet" href="assets/css/lib/datatable/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>
    <body>
        <!-- Left Panel -->
        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">
                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <form action="mainController" method="post" >    
                                <i class="menu-icon fa fa-laptop"></i><button class="button_service_das" type="submit" value="adminhome" name="action">Data</button>
                            </form>
                        </li>
                        <li class="menu-title">UI elements</li><!-- /.menu-title -->
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i><button class="button_service_admin">Tables</button></a>
                            <form action="mainController" method="" >                              
                                <ul class="sub-menu children dropdown-menu">
                                                                        <li><i class="fa fa-table"></i><button class="button_service" type="submit" value="dashboard" name="action">Dashboard</button></li>
                                    <li><i class="fa fa-table"></i><button class="button_service" type="submit" value="manacustomer" name="action"></i>Customer</button></li>
                                    <li><i class="fa fa-table"></i><button class="button_service" type="submit" value="manaservice" name="action">Service</button></li>
                                    <li><i class="fa fa-table"></i><button class="button_service" type="submit" value="customer" name="action">Booking</button></li>
                                    <li><i class="fa fa-table"></i><button class="button_service" type="submit" value="customer" name="action">Invoice</button></li>
                                    <li><i class="fa fa-table"></i><button class="button_service" type="submit" value="manafeedback" name="action">Feedback</button></li>                                 
                                </ul>
                            </form>
                        </li>

                        <li>
<!--                            <a href="widgets.html"> <i class="menu-icon ti-email"></i>Widgets </a>-->
                        </li>

                        <li class="menu-item-has-children dropdown">
<!--                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><i class="menu-icon fa fa-line-chart"></i><a href="charts-chartjs.html">Chart JS</a></li>
                            </ul>-->
                        </li>

                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">Login</a></li>
                                <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">Register</a></li>
                                <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">Forget Pass</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>
        </aside>
        <!-- /#left-panel -->
        <!-- Right Panel -->
        <div id="right-panel" class="right-panel">
            <!-- Header-->
            <header id="header" class="header">
                <div class="top-left">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="./"><img src="images/doglogo.png" alt="Logo">PetServices</a>
                        <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                        <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                    </div>
                </div>
                <div class="top-right">
                    <div class="header-menu">
                        <div class="header-left">
                            <button class="search-trigger"><i class="fa fa-search"></i></button>
                            <div class="form-inline">
                                <form class="search-form">
                                    <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                    <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                                </form>
                            </div>

                            <div class="dropdown for-notification">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-bell"></i>
                                    <span class="count bg-danger">3</span>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="notification">
                                    <p class="red">You have 3 Notification</p>
                                    <a class="dropdown-item media" href="#">
                                        <i class="fa fa-check"></i>
                                        <p>Server #1 overloaded.</p>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <i class="fa fa-info"></i>
                                        <p>Server #2 overloaded.</p>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <i class="fa fa-warning"></i>
                                        <p>Server #3 overloaded.</p>
                                    </a>
                                </div>
                            </div>

                            <div class="dropdown for-message">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-envelope"></i>
                                    <span class="count bg-primary">4</span>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="message">
                                    <p class="red">You have 4 Mails</p>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/1.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Jonathan Smith</span>
                                            <span class="time float-right">Just now</span>
                                            <p>Hello, this is an example msg</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/2.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Jack Sanders</span>
                                            <span class="time float-right">5 minutes ago</span>
                                            <p>Lorem ipsum dolor sit amet, consectetur</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/3.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Cheryl Wheeler</span>
                                            <span class="time float-right">10 minutes ago</span>
                                            <p>Hello, this is an example msg</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/4.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Rachel Santos</span>
                                            <span class="time float-right">15 minutes ago</span>
                                            <p>Lorem ipsum dolor sit amet, consectetur</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="user-area dropdown float-right">
                            <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                            </a>

                            <div class="user-menu dropdown-menu">
                                <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>

                                <a class="nav-link" href="#"><i class="fa fa- user"></i>Notifications <span class="count">13</span></a>

                                <a class="nav-link" href="#"><i class="fa fa -cog"></i>Settings</a>

                                <a class="nav-link" href="#"><i class="fa fa-power -off"></i>Logout</a>
                            </div>
                        </div>

                    </div>
                </div>
            </header>

            <!-- /#header -->
            <!-- Header-->
            <div class="breadcrumbs">
                <div class="breadcrumbs-inner">
                    <div class="row m-0">
                        <div class="col-sm-4">
                            <div class="page-header float-left">
                                <div class="page-title">
                                    <h1>Dashboard</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="page-header float-right">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="#">Dashboard</a></li>
                                        <li><a href="#">Table</a></li>
                                        <li class="active">Services - Information</li>

                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--code for tan-->
            <%
                Service service = (Service) request.getAttribute("service");
                TypeServiceDao tsd = new TypeServiceDao();
                TypePetDao tpd = new TypePetDao();

            %>
            <div class="content">
                <div class="card">

                    <div class="card-header d-flex justify-content-between align-items-center">
                        <strong class="card-title">SERVICE INFOMATION</strong>
                        <span>
                            <h2 class="font-italic"><%= service.getTypeservice().toUpperCase()%></h2>
                        </span>
                    </div>
                    <div class="card-body">
                        <div class="profile mb-15 ">
                            <form action="mainController" method="post">

                                <label for="description">Type Service:</label>
                                <input  type="hidden" name="txttypeservice"  value="<%=  service.getTypeservice()%>" >
                                <td><%=  tsd.getTypeServiceById(service.getTypeservice()).getName()%> </td>
                                <br>

                                <label for="description">Type Pet:</label>
                                <input  type="hidden" name="txttypepetid"  value="<%=  service.getTypepetid()%> " >
                                <d><%=  tpd.getTypePetById(service.getTypepetid()).getName()%> </td>
                                    <br>


                                    <label for="description">Description:</label>
                                    <input type="text" id="description" name="txtdescription" required placeholder="Enter the description" value="<%= service.getDescription()%>"></input>
                                    <br>

                                    <label for="weightrange">Weight range:</label>
                                    <input type="number" id="weightrange" name="txtweightrange" required placeholder="Enter the weight range" value="<%= service.getWeightrange()%>">
                                    <br>



                                    <label for="price">Price:</label>
                                    <input type="number" id="price" name="txtprice" required placeholder="Enter the price" value="<%= service.getPrice()%>" min="0">
                                    <br>

                                    <label for="discount">Discount(%):</label>
                                    <input type="number" id="discount" name="txtdiscount" required placeholder="Enter the discount" value="<%= service.getDiscount()%>" min="0">
                                    <br>

                                    <%
                                        if (!service.getTypeservice().equalsIgnoreCase("A") && !service.getTypeservice().equalsIgnoreCase("B") && !service.getTypeservice().equalsIgnoreCase("C")) {
                                    %>

                                    <label for="expiration">Expiration date:</label>
                                    <input type="date" id="expiration" name="txtexpiration" required placeholder="Select the expiration date" value="<%= service.getExpiration()%>">
                                    <br>

                                    <label for="quantity">Quantity:</label>
                                    <input type="number" id="quantity" name="txtquantity" required placeholder="Enter the quantity" value="<%= service.getQuantity()%>" min="0">
                                    <br>

                                    <%
                                        }
                                    %>
                                    <p> 
                                        <button type='submit' onclick="return window.confirm('Are you sure ?')">Update</button>
                                        <input type='hidden' value="<%= service.getId()%>" name='txtserviceid'/>
                                        <input  type ="hidden" name="action" value="updateservice">
                                    </p>
                            </form>
                            <%
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
        <script src="assets/js/main.js"></script>


        <script src="assets/js/lib/data-table/datatables.min.js"></script>
        <script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
        <script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
        <script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
        <script src="assets/js/lib/data-table/jszip.min.js"></script>
        <script src="assets/js/lib/data-table/vfs_fonts.js"></script>
        <script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
        <script src="assets/js/lib/data-table/buttons.print.min.js"></script>
        <script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
        <script src="assets/js/init/datatables-init.js"></script>
    </body>
</html>
