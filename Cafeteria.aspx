<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cafeteria.aspx.cs" Inherits="TEZBI.Cafeteria" %>

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
                            <a class="nav-link active" href="Cafeteria.aspx">Cafeteria</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MeetingRoom.aspx">Meeting Room</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="stationery.html">Stationery</a>
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
            <div class="container cafeteria-bg">
                <div class="row h-100">
                    <div class="col-12 d-flex justify-content-center align-items-center align-items-lg-end">
                        <h1 class="banner-title">Cafeteria</h1>
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
                            <span class="position-absolute shopping-cart-badge">
                                2
                            </span>
                        </button>
                        <div class="product-search float-end position-relative me-3">
                            <i class="fa fa-search"></i>
                            <input class="form-control" type="text" placeholder="Search Product..." />
                        </div>
                    </div>
                </div>
                <div class="d-flex align-items-start">
                    <div class="nav flex-column nav-pills me-3 cafe-pill" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <h4 class="product-categories">Categories</h4>
                        <button class="nav-link light-text cafenav" id="v-pills-cofee-tab" data-bs-toggle="pill" data-bs-target="#v-pills-cofee" type="button" role="tab" aria-controls="v-pills-" aria-selected="true">Cofee</button>
                        <button class="nav-link light-text cafenav active" id="v-pills-juices-tab" data-bs-toggle="pill" data-bs-target="#v-pills-juices" type="button" role="tab" aria-controls="v-pills-juices" aria-selected="false">
                            Juices
                        </button>
                        <button class="nav-link light-text cafenav" id="v-pills-drinks-tab" data-bs-toggle="pill" data-bs-target="#v-pills-drinks" type="button" role="tab" aria-controls="v-pills-drinks" aria-selected="false">
                            Soft Drinks
                        </button>
                        <button class="nav-link light-text cafenav" id="v-pills-soups-tab" data-bs-toggle="pill" data-bs-target="#v-pills-soups" type="button" role="tab" aria-controls="v-pills-soups" aria-selected="false">Soups</button>
                        <button class="nav-link light-text cafenav" id="v-pills-noodles-tab" data-bs-toggle="pill" data-bs-target="#v-pills-noodles" type="button" role="tab" aria-controls="v-pills-noodles" aria-selected="false">
                            Noodles
                        </button>
                        <button class="nav-link light-text cafenav" id="v-pills-cookies-tab" data-bs-toggle="pill" data-bs-target="#v-pills-cookies" type="button" role="tab" aria-controls="v-pills-cookies" aria-selected="false">
                            Cookies
                        </button>
                    </div>
                    <div class="tab-content flex-fill" id="v-pills-tabContent">
                        <div class="tab-pane fade" id="v-pills-cofee" role="tabpanel" aria-labelledby="v-pills-cofee-tab">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/001.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Paper Boat Aamras</p>
                                                <p class="product-qnty">200ml</p>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                                <p class="product-rate">Rs.30</p>
                                                <div class="increment-input float-end">
                                                    <button class="decrebtn">-</button>
                                                    <input class="incrementCounter" type="text" value="1" min="1" />
                                                    <button class="increbtn">+</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade active show" id="v-pills-juices" role="tabpanel" aria-labelledby="v-pills-juices-tab">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/001.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Paper Boat Aamras</p>
                                                <p class="product-qnty">200ml</p>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                                <p class="product-rate">Rs.30</p>
                                                <div class="increment-input float-end">
                                                    <button class="decrebtn">-</button>
                                                    <input class="incrementCounter" type="text" value="1" min="1" />
                                                    <button class="increbtn">+</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/002.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Tropicana Orange Delight</p>
                                                <p class="product-qnty">200ml</p>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                                <p class="product-rate">Rs.30</p>
                                                <div class="increment-input float-end">
                                                    <button class="decrebtn">-</button>
                                                    <input class="incrementCounter" type="text" value="1" min="1" />
                                                    <button class="increbtn">+</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/003.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Amul Masti Spiced Buttermilk</p>
                                                <p class="product-qnty">200ml</p>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                                <p class="product-rate">Rs.30</p>
                                                <button type="button" class="add-product">Add</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/004.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Tropicana Litchi Delight</p>
                                                <p class="product-qnty">200ml</p>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                                <p class="product-rate">Rs.30</p>
                                                <button type="button" class="add-product">Add</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/005.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Tropicana Apple Delight</p>
                                                <p class="product-qnty">200ml</p>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                                <p class="product-rate">Rs.30</p>
                                                <button type="button" class="add-product">Add</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/006.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Tropicana Guava Delight</p>
                                                <p class="product-qnty">200ml</p>
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
                        <div class="tab-pane fade" id="v-pills-drinks" role="tabpanel" aria-labelledby="v-pills-drinks-tab">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/006.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Tropicana Guava Delight</p>
                                                <p class="product-qnty">200ml</p>
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
                        <div class="tab-pane fade" id="v-pills-soups" role="tabpanel" aria-labelledby="v-pills-soups-tab">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/001.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Paper Boat Aamras</p>
                                                <p class="product-qnty">200ml</p>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                                <p class="product-rate">Rs.30</p>
                                                <div class="increment-input float-end">
                                                    <button class="decrebtn">-</button>
                                                    <input class="incrementCounter" type="text" value="1" min="1" />
                                                    <button class="increbtn">+</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="v-pills-noodles" role="tabpanel" aria-labelledby="v-pills-noodles-tab">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/006.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Tropicana Guava Delight</p>
                                                <p class="product-qnty">200ml</p>
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
                        <div class="tab-pane fade" id="v-pills-cookies" role="tabpanel" aria-labelledby="v-pills-cookies-tab">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                                    <div class="product-list">
                                        <div class="product-img">
                                            <img src="img/001.jpg" class="img-fluid" alt="Product" />
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                <p class="product-name">Paper Boat Aamras</p>
                                                <p class="product-qnty">200ml</p>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                                <p class="product-rate">Rs.30</p>
                                                <div class="increment-input float-end">
                                                    <button class="decrebtn">-</button>
                                                    <input class="incrementCounter" type="text" value="1" min="1" />
                                                    <button class="increbtn">+</button>
                                                </div>
                                            </div>
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
                        <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-12 mb-3">
                                    <div class="position-relative cafe-select">
                                        <select name="select-menu" class="form-select select-menu">
                                            <option selected="selected">Company Name</option>
                                            <option>XXX</option>
                                            <option>YYY</option>
                                            <option>ZZZ</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-12 mb-3">
                                    <div class="position-relative cafe-select">
                                        <select name="select-menu" class="form-select select-menu">
                                            <option selected="selected">Employee Name</option>
                                            <option>XXX</option>
                                            <option>YYY</option>
                                            <option>ZZZ</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-12 mb-3">
                                    <div class="position-relative date-picker">
                                        <input type="text" class="datepicker" placeholder="From Date" />
                                        <i class="fa fa-calendar-o" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-12 mb-3">
                                    <div class="position-relative date-picker">
                                        <input type="text" class="datepicker" placeholder="To Date" />
                                        <i class="fa fa-calendar-o" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-md-8 col-sm-12 col-12">
                                    <button type="submit" class="btn btn-primary cafe-btn float-end">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">List</th>
                                            <th scope="col">Item Name</th>
                                            <th scope="col">Ordered By</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Order Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><div>Soft drinks</div></td>
                                            <td><div>Coke</div></td>
                                            <td><div>Same user as Success per login</div></td>
                                            <td><div>1</div></td>
                                            <td><div>35</div></td>
                                            <td><div>06-01-2023</div></td>
                                            <td><div>Success</div></td>
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
                                        <img src="img/001.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-6 col-12 g-0">
                                    <p class="product-name">Paper Boat Aamras</p>
                                    <p class="product-qnty">200ml</p>
                                    <div class="increment-input pull-left mt-2">
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
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="shopping-list">
                            <div class="row mb-3">
                                <div class="col-lg-5 col-md-12 col-sm-12 col-12">
                                    <div class="shopping-img">
                                        <img src="img/002.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-6 col-12 g-0">
                                    <p class="product-name">Tropicana Orange Delight</p>
                                    <p class="product-qnty">200ml</p>
                                    <div class="increment-input pull-left mt-2">
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
                        <p class="product-name">Rs.60</p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end mb-3">
                        <button type="submit" class="btn btn-primary cafe-btn w-100 mt-3" onclick="closeNav()" data-bs-toggle="modal" data-bs-target="#successModal">CHECK OUT</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="successModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                <h4 class="cafe-success text-success">Your order is successfully placed</h4>
                            </div>
                        </div>
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
