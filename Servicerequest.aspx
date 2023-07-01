<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Servicerequest.aspx.cs" Inherits="TEZBI.Servicerequest" %>

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
    <form id="form1" runat="server" autocomplete="off">
     
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
                            <a class="nav-link" href="cafeteria.html">Cafeteria</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="meeting_room.html">Meeting Room</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="stationery.html">Stationery</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="service_request.html">Service Request</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="guestregistration.html">Guest Registration</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="feedback.html">Feedback</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="banner-sec">
            <div class="container service-req-bg">
                <div class="row h-100">
                    <div class="col-12 d-flex justify-content-center align-items-center align-items-lg-end">
                        <h1 class="banner-title">Service Request</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="product-sec">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <button type="button" class="check-statement"><i class="fa fa-file-o"></i> Check Your Statement</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="mb-3">
                                    <label class="form-label cafe-label">Service Request Type*</label>
                                    <div class="position-relative cafe-select cafe-select-grey">
                                        <select name="select-menu" class="form-select select-menu">
                                            <option selected="selected">Select</option>
                                            <option>Air Conditioner</option>
                                            <option>Parking</option>
                                            <option>Restroom</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-3 mt-4">
                                    <label class="form-label cafe-label">Issue*</label>
                                    <div class="position-relative cafe-select cafe-select-grey">
                                        <select name="select-menu" class="form-select select-menu">
                                            <option selected="selected">Select</option>
                                            <option>Air Conditioner</option>
                                            <option>Parking</option>
                                            <option>Restroom</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="mb-3">
                                    <label class="form-label cafe-label">Comment</label>
                                    <textarea class="form-control cafe-input-grey" rows="4"></textarea>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center mt-5">
                                <button type="submit" class="btn btn-primary cafe-btn book-btn me-3 mb-3" data-bs-toggle="modal" data-bs-target="#bookServiceModal">BOOK SERVICE REQUEST</button>
                                <button type="submit" class="btn btn-primary cafe-btn cafe-btn-grey mb-3">CANCEL</button>
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
                        <div class="col-lg-11 col-md-12 col-sm-12 col-12 m-auto">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-12 col-12 mb-3">
                                    <div class="position-relative cafe-select">
                                        <select name="select-menu" class="form-select select-menu">
                                            <option selected="selected">Company Name</option>
                                            <option>XXX</option>
                                            <option>YYY</option>
                                            <option>ZZZ</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-12 col-12 mb-3">
                                    <div class="position-relative cafe-select">
                                        <select name="select-menu" class="form-select select-menu">
                                            <option selected="selected">Employee Name</option>
                                            <option>XXX</option>
                                            <option>YYY</option>
                                            <option>ZZZ</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-12 col-12 mb-3">
                                    <div class="position-relative date-picker">
                                        <input type="text" class="datepicker" placeholder="From Date" />
                                        <i class="fa fa-calendar-o" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-12 col-12 mb-3">
                                    <div class="position-relative date-picker">
                                        <input type="text" class="datepicker" placeholder="To Date" />
                                        <i class="fa fa-calendar-o" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 mt-4 mx-auto">
                                    <button type="submit" class="btn btn-primary cafe-btn float-start float-lg-end mb-3 me-3 me-lg-0">Search</button>
                                    <button type="submit" class="btn btn-primary cafe-btn cafe-btn-grey float-start float-lg-end me-3 mb-3">Download Report</button>
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
                                            <th scope="col">SR Number</th>
                                            <th scope="col">SR Type</th>
                                            <th scope="col">Issue</th>
                                            <th scope="col">Raised Date</th>
                                            <th scope="col">Raised By</th>
                                            <th scope="col">Current Status</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><div>001</div></td>
                                            <td><div>Restroom</div></td>
                                            <td><div>Not cleaned</div></td>
                                            <td><div>06-01-2023</div></td>
                                            <td><div>xxx</div></td>
                                            <td><div>Pending</div></td>
                                            <td><div class="cafe-delete">Delete</div></td>
                                        </tr>
                                        <tr>
                                            <td><div>002</div></td>
                                            <td><div>Cafe</div></td>
                                            <td><div>Over crowding</div></td>
                                            <td><div>05-01-2023</div></td>
                                            <td><div>xxx</div></td>
                                            <td><div>Solved</div></td>
                                            <td><div></div></td>
                                        </tr>
                                        <tr>
                                            <td><div>003</div></td>
                                            <td><div>AC</div></td>
                                            <td><div>Not working</div></td>
                                            <td><div>01-01-2023</div></td>
                                            <td><div>xxx</div></td>
                                            <td><div>Pending</div></td>
                                            <td><div class="cafe-delete">Delete</div></td>
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
        <div class="modal" id="bookServiceModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="bookServiceModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-4">
                                <p class="service-request">Your service request has been registered with the following ID</p>
                                <p class="service-request"><b>SR202</b></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.6.0.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/common.js"></script>
    </form>
</body>
</html>
