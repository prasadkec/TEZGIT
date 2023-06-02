<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stationery.aspx.cs" Inherits="TEZBI.Stationery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Cafe</title>
        <link href="font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/jquery-ui.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
       <nav class="navbar navbar-expand-lg navbar-light cafe-header position-relative master-menu other-menu">
            <div class="container">
                <a class="navbar-brand" href="masters.html">
                    <img src="img/logo.png" height="100" alt="Logo" class="logo" />
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="CafeteriaMaster.aspx">Masters</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Cafeteria.aspx">Cafeteria</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MeetingRoom.aspx">Meeting Room</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="Stationery.aspx">Stationery</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="service_request.html">Service Request</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.html">Guest Registration</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Feedback</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="banner-sec">
            <div class="container stationery-bg">
                <div class="row h-100">
                    <div class="col-12 d-flex justify-content-center align-items-center align-items-lg-end">
                        <h1 class="banner-title">Stationery</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="product-sec">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-12 mb-2">
                        <button type="button" class="check-statement"><i class="fa fa-file-o"></i> Check Your Statement</button>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <button type="button" class="position-relative float-end shopping-cart" onclick="openNav()">
                            <i class="fa fa-shopping-cart"></i>
                            <!-- <span class="position-absolute shopping-cart-badge">
                2
              </span> -->
                        </button>
                        <div class="product-search float-end position-relative me-3">
                            <i class="fa fa-search"></i>
                            <input class="form-control" type="text" placeholder="Search Product..." />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                                <div class="product-list">
                                    <div class="product-img">
                                        <img src="img/a4.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                            <p class="product-name">A4 Sheet Ream</p>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                            <p class="product-rate">Rs.170</p>
                                            <button type="button" class="add-product">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                                <div class="product-list">
                                    <div class="product-img">
                                        <img src="img/green_cover.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                            <p class="product-name">Green Cover</p>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                            <p class="product-rate">Rs.30</p>
                                            <button type="button" class="add-product">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                                <div class="product-list">
                                    <div class="product-img">
                                        <img src="img/white_envelope.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                            <p class="product-name">White Envelope</p>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                            <p class="product-rate">Rs.30</p>
                                            <button type="button" class="add-product">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                                <div class="product-list">
                                    <div class="product-img">
                                        <img src="img/a4.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                            <p class="product-name">A4 Sheet Ream</p>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                            <p class="product-rate">Rs.170</p>
                                            <button type="button" class="add-product">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                                <div class="product-list">
                                    <div class="product-img">
                                        <img src="img/green_cover.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                            <p class="product-name">Green Cover</p>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                            <p class="product-rate">Rs.30</p>
                                            <button type="button" class="add-product">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                                <div class="product-list">
                                    <div class="product-img">
                                        <img src="img/white_envelope.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                            <p class="product-name">White Envelope</p>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                            <p class="product-rate">Rs.30</p>
                                            <button type="button" class="add-product">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="sec-table">
            <div class="container">
                <div class="table-bg">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end close-sec">
                            <i class="fa fa-close close-sec-table"></i>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                            <h1 class="table-title">Your Statement</h1>
                        </div>
                    </div>
                    <div class="row mb-5 mt-5">
                        <div class="col-lg-3 col-md-12 col-sm-12 col-12 mb-3">
                            <div class="position-relative cafe-select">
                                <select name="select-menu" class="form-select select-menu">
                                    <option selected="selected">Company Name</option>
                                    <option>XXX</option>
                                    <option>YYY</option>
                                    <option>ZZZ</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12 col-12 mb-3">
                            <div class="position-relative cafe-select">
                                <select name="select-menu" class="form-select select-menu">
                                    <option selected="selected">Employee Name</option>
                                    <option>XXX</option>
                                    <option>YYY</option>
                                    <option>ZZZ</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12 col-12 mb-3">
                            <div class="position-relative">
                                <input type="text" class="form-control cafe-input" placeholder="Item" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12 col-12 mb-3">
                            <div class="position-relative date-picker">
                                <input type="text" class="datepicker" placeholder="From Date" />
                                <i class="fa fa-calendar-o" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12 col-12 mb-3">
                            <div class="position-relative date-picker">
                                <input type="text" class="datepicker" placeholder="To Date" />
                                <i class="fa fa-calendar-o" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12 col-12 mb-3">
                            <div class="position-relative">
                                <input type="text" class="form-control cafe-input" placeholder="Status" />
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 col-12 mx-auto">
                            <button type="submit" class="btn btn-primary cafe-btn float-start float-lg-end mb-3 me-3 me-lg-0">Search</button>
                            <button type="submit" class="btn btn-primary cafe-btn cafe-btn-grey float-start float-lg-end me-3 mb-3">Download Report</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Item ID</th>
                                            <th scope="col">Item</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Purchased Date</th>
                                            <th scope="col">Purchased By</th>
                                            <th scope="col">Order Status</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><div>001</div></td>
                                            <td><div>A4 sheets</div></td>
                                            <td><div>30</div></td>
                                            <td><div>06-01-2023</div></td>
                                            <td><div>xxx</div></td>
                                            <td><div>06-01-2023</div></td>
                                            <td><div>View</div></td>
                                        </tr>
                                        <tr>
                                            <td><div>002</div></td>
                                            <td><div>Green Cover</div></td>
                                            <td><div>50</div></td>
                                            <td><div>05-01-2023</div></td>
                                            <td><div>xxx</div></td>
                                            <td><div>05-01-2023</div></td>
                                            <td><div>View</div></td>
                                        </tr>
                                        <tr>
                                            <td><div>003</div></td>
                                            <td><div>Envelope</div></td>
                                            <td><div>10</div></td>
                                            <td><div>01-01-2023</div></td>
                                            <td><div>xxx</div></td>
                                            <td><div>01-01-2023</div></td>
                                            <td><div>View</div></td>
                                        </tr>
                                        <tr>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                        </tr>
                                        <tr>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                            <td><div></div></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div id="mySidebar" class="sidebar">
            <div class="shopping-items">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <h1 class="shopping-title"><span class="playfair-font">Shopping</span> Cart</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="shopping-list">
                            <div class="row mb-3">
                                <div class="col-lg-5 col-md-12 col-sm-12 col-12">
                                    <div class="shopping-img">
                                        <img src="img/a4.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-6 col-12 g-0">
                                    <p class="product-name">A4 Sheet Ream</p>
                                    <div class="increment-input pull-left mt-3">
                                        <button class="decrebtn">-</button>
                                        <input class="incrementCounter" type="text" value="1" min="1" />
                                        <button class="increbtn">+</button>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-6 col-sm-6 col-12 text-start text-sm-end text-lg-end">
                                    <p class="product-rate">Rs.170</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="shopping-list">
                            <div class="row mb-3">
                                <div class="col-lg-5 col-md-12 col-sm-12 col-12">
                                    <div class="shopping-img">
                                        <img src="img/green_cover.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-6 col-12 g-0">
                                    <p class="product-name">Green Cover</p>
                                    <div class="increment-input pull-left mt-3">
                                        <button class="decrebtn">-</button>
                                        <input class="incrementCounter" type="text" value="1" min="1" />
                                        <button class="increbtn">+</button>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-6 col-sm-6 col-12 text-start text-sm-end text-lg-end">
                                    <p class="product-rate">Rs.30</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                        <p class="product-name">Total</p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-12 text-start text-sm-end text-lg-end">
                        <p class="product-name">Rs.210</p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end mb-3">
                        <button type="submit" class="btn btn-primary cafe-btn w-100 mt-3">CHECK OUT</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="sidebaroverlay"></div>
        <script src="js/jquery-3.6.0.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/common.js"></script>
</body>
</html>
