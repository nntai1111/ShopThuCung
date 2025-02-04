<%-- 
    Document   : viewservice
    Created on : Mar 4, 2024, 9:10:02 AM
    Author     : ADMIN
--%>

<%@page import="dto.TypePet"%>
<%@page import="java.sql.Date"%>
<%@page import="dao.TypePetDao"%>
<%@page import="dao.TypeServiceDao"%>
<%@page import="dto.TypeService"%>
<%@page import="dto.Service"%>
<%@page import="java.util.ArrayList"%>
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
        <style>
            /* Styling for the pop-up */
            .popup {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.5);
            }

            .popup-content {
                background-color: #fefefe;
                margin: 10% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <!-- Left Panel -->
        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">
                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
<!--                        <li class="active">
                            <form action="mainController" method="post" >    
                                <i class="menu-icon fa fa-laptop"></i><button class="button_service_das" type="submit" value="adminhome" name="action">Data</button>
                            </form>
                        </li>-->
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
                                        <li class="active">Services</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--table-->

            <div class="content">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header d-flex" style="jus">
                                    <!--<strong class="card-title">Services</strong>-->   
                                    <div class="dropdown dropend">
                                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Filter</button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">Type Services</a></li>
                                            <li><a class="dropdown-item " href="#">Type Pet</a></li>
                                            <li><a class="dropdown-item " href="#">Price</a></li>
                                        </ul>
                                    </div>
                                    <div class=" col-sm-11 p-0 d-flex justify-content-end">
                                        <button href="#addService" class="btn btn-success" data-toggle="modal">
                                            <i class="bi bi-plus"></i> Add New Services</button>
                                    </div> 
                                </div>
                                <div class="card-body">
                                    <%
                                        TypeServiceDao tsd = new TypeServiceDao();
                                        TypePetDao tpd = new TypePetDao();
                                        ArrayList<Service> list = (ArrayList) request.getAttribute("listService");
                                        if (list != null && list.size() > 0) {
                                    %>
                                    <table id="bootstrap-data-table" class="table table-hover table-striped table-bordered text-center">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Type Service</th>
                                                <th>Type Pet</th>
                                                <th>Price</th>
                                                <th>Discount(%)</th>
                                                <th>Quantity</th>
                                                <th>Action</th>
                                                <th>NOTE</th>
                                            </tr>
                                        </thead>
                                        <%
                                            for (Service ser : list) {
                                                if (ser.getStatus() != 0) {
                                                    Date currentDate = new Date(System.currentTimeMillis());
                                                    Date expirationDate = ser.getExpiration();

                                                    // Kiểm tra xem expirationDate có nhỏ hơn ngày hiện tại không
                                                    boolean isExpired = expirationDate != null && expirationDate.before(currentDate);
                                        %>
                                        <form>
                                            <input type='hidden' value="<%= ser.getId()%>" name='txtserviceid'/> 
                                            <tr>
                                                <td><%=  ser.getId()%> </td>
                                                <td><%=  tsd.getTypeServiceById(ser.getTypeservice()).getName()%> </td>
                                                <td><%=  tpd.getTypePetById(ser.getTypepetid()).getName()%> </td>
                                                <td><%=  ser.getPrice()%>$ </td>
                                                <td><%=  ser.getDiscount()%> </td>
                                                <td><%=  ser.getQuantity()%> </td>
                                                <td class="d-flex justify-content-center">
                                                    <form action='mainController' method='post'>
                                                    </form>
                                                    <form action='mainController' method='post'>
                                                        <input type='hidden' value="<%= ser.getId()%>" name='txtserid'/> 
                                                        <p>
                                                            <button class="button_view view-button"  type="submit" name="editBtn">View</button>
                                                            <input type="hidden" value="viewinfoservice" name="action"/>
                                                        </p>
                                                    </form>
                                                    <form action='mainController' method='post'>
                                                        <input type='hidden' value="<%= ser.getId()%>" name='txtserid'/> 
                                                        <p>
                                                            <button class="button_view"  type='submit' name='deleteBtn' onclick="return window.confirm('Are you sure ?')">Delete</button>
                                                            <input type="hidden" value="deleteservice" name="action"/>
                                                        </p>
                                                    </form>
                                                </td>

                                                <td>
                                                    <% if (isExpired) { %>
                                                    <span style="color:red;">Expired</span>
                                                    <% } else { %>
                                                    <span style="color:green;">None</span>
                                                    <% } %>
                                                </td>
                                            </tr>
                                        </form>
                                        <%
                                                }
                                            }
                                        %>
                                    </table>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Edit view Ser -->    

            <!-- Edit add Ser -->
            <div id="addService" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <form action="mainController" method="">

                            <div class="modal-header">
                                <h4 class="modal-title">Add new service</h4>
                                <button type="button" class="close" style="margin-top: -3rem" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>

                            <div class="modal-body" style="position:relative">

                                <div class="form-group">
                                    <label for="typeservice">Type of service:</label>
                                    <select id="typeservice" name="txttypeservice" required onchange="toggleFields()">
                                        <option  value="A">Booking</option>
                                        <option  value="B">Spa</option>
                                        <option  value="C">Grooming</option>
                                        <option  value="D">Food</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="typepetid">Type of pet ID:</label>
                                    <select id="typepetid" name="txttypepetid" required>
                                        <option name="TP01" value="TP01">Dog</option>
                                        <option name="TP02" value="TP02">Cat</option>
                                        <option name="TP03" value="TP03">Mouse</option>
                                    </select>
                                </div>
                                <div class="form-group">               
                                    <label for="description">Description:</label>
                                    <input id="description" name="txtdescription" required placeholder="Enter the description"></input>
                                </div>
                                <div class="form-group">
                                    <label for="weightrange">Weight range:</label>
                                    <input type="number" id="weightrange" name="txtweightrange" required placeholder="Enter the weight range" min="0">
                                </div>
                                <div class="form-group">
                                    <label for="price">Price:</label>
                                    <input type="number" id="price" name="txtprice" required placeholder="Enter the price" min="0">
                                </div>
                                <div class="form-group">
                                    <label for="discount">Discount(%):</label>
                                    <input type="number" id="discount" name="txtdiscount" required placeholder="Enter the discount" min="0">
                                </div>
                                <div class="form-group" id="expirationContainer" style="display: none;">
                                    <label for="expiration">Expiration date:</label>
                                    <input type="date" id="expiration" name="txtexpiration" placeholder="Select the expiration date">
                                </div>
                                <div  class="form-group" id="quantityContainer" style="display: none;">
                                    <label for="quantity">Quantity:</label>
                                    <input type="number" id="quantity" name="txtquantity" placeholder="Enter the quantity" min="0">
                                </div>

                            </div>

                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" onclick="return window.confirm('Are you sure ?')" value="Add">
                                <input  type ="hidden" name="action" value="addservice">
                            </div>
                        </form>
                        <script>
                            function toggleFields() {
                                var selectedService = document.getElementById("typeservice").value;
                                var expirationContainer = document.getElementById("expirationContainer");
                                var quantityContainer = document.getElementById("quantityContainer");
                                var expirationInput = document.getElementById("expiration");
                                var quantityInput = document.getElementById("quantity");

                                // Check if selected service matches A, B, or C and show/hide fields accordingly
                                if (selectedService !== "A" && selectedService !== "B" && selectedService !== "C") {
                                    expirationContainer.style.display = "block";
                                    quantityContainer.style.display = "block";
                                    expirationInput.required = true; // Set required attribute
                                    quantityInput.required = true; // Set required attribute
                                } else {
                                    expirationContainer.style.display = "none";
                                    quantityContainer.style.display = "none";
                                    expirationInput.required = false; // Remove required attribute
                                    quantityInput.required = false; // Remove required attribute
                                }
                            }

                        </script>

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


            <script type="text/javascript">
                            $(document).ready(function () {
                                $('#bootstrap-data-table-export').DataTable();
                            });
            </script>

    </body>
</html>
