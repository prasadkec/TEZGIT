<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeetingRoom.aspx.cs" Inherits="TEZBI.MeetingRoom" %>

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
        <link rel="stylesheet" href="css/jquery.timepicker.min.css" />
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
                            <a class="nav-link" href="cafeteria.html">Cafeteria</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="meeting_room.html">Meeting Room</a>
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
            <div class="container meeting-room-bg">
                <div class="row h-100">
                    <div class="col-12 d-flex justify-content-center align-items-center align-items-lg-end">
                        <h1 class="banner-title">Meeting Room</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="product-sec">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <button type="button" class="check-statement"><i class="fa fa-download"></i> Download Company Statement</button>
                    </div>
                </div>
                <div class="row mb-2 mt-2">
                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                        <div class="mb-3">
                            <label class="form-label cafe-label">Meeting Date*</label>
                            <div class="position-relative date-picker">
                                <input type="text" class="datepicker form-control cafe-input-grey" />
                                <i class="fa fa-calendar-o" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                        <div class="mb-3">
                            <label class="form-label cafe-label">Balance Available Credits</label>
                            <input type="text" class="form-control cafe-input-grey" />
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                        <div class="mb-3">
                            <label class="form-label cafe-label">Meeting Start Time*</label>
                            <div class="position-relative time-picker">
                                <input type="text" class="form-control cafe-input-grey timepicker" />
                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                        <div class="mb-3">
                            <label class="form-label cafe-label">Meeting End Time*</label>
                            <div class="position-relative time-picker">
                                <input type="text" class="form-control cafe-input-grey timepicker" />
                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="product-list meeting-room-list">
                            <div class="product-img">
                                <img src="img/Meeting-Room-1.jpg" class="img-fluid" alt="Product" />
                            </div>
                            <div class="row g-0 p-3">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-6">
                                    <p class="product-name">Mont Blanc</p>
                                    <p class="product-qnty">Meeting Capacity - 20</p>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-6 text-end">
                                    <p class="product-rate">3 Credits</p>
                                    <button type="button" class="book-now mt-3" data-bs-toggle="modal" data-bs-target="#successModal">BOOK NOW</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="product-list meeting-room-list">
                            <div class="product-img">
                                <img src="img/Meeting-Room-2.jpg" class="img-fluid" alt="Product" />
                            </div>
                            <div class="row g-0 p-3">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-6">
                                    <p class="product-name">K2</p>
                                    <p class="product-qnty">Meeting Capacity - 20</p>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-6 text-end">
                                    <p class="product-rate">3 Credits</p>
                                    <button type="button" class="book-now mt-3" data-bs-toggle="modal" data-bs-target="#successModal">BOOK NOW</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="product-list meeting-room-list">
                            <div class="product-img">
                                <img src="img/Meeting-Room-3.jpg" class="img-fluid" alt="Product" />
                            </div>
                            <div class="row g-0 p-3">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-6">
                                    <p class="product-name">Everest</p>
                                    <p class="product-qnty">Meeting Capacity - 20</p>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-6 text-end">
                                    <p class="product-rate">3 Credits</p>
                                    <button type="button" class="book-now mt-3" data-bs-toggle="modal" data-bs-target="#successModal">BOOK NOW</button>
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
                            <h1 class="table-title">Company Statement</h1>
                        </div>
                    </div>
                    <div class="row mb-5 mt-5">
                        <div class="col-lg-8 col-md-12 col-sm-12 col-12 m-auto">
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
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 mt-4">
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
                                            <th scope="col">Meeting Room Name</th>
                                            <th scope="col">Company</th>
                                            <th scope="col">Booked By</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Hours Utilized</th>
                                            <th scope="col">Credits Consumed</th>
                                            <th scope="col">Order Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><div>Mont Blanc</div></td>
                                            <td><div>XXX</div></td>
                                            <td><div>Murali</div></td>
                                            <td><div>06-01-2023</div></td>
                                            <td><div>3</div></td>
                                            <td><div>3</div></td>
                                            <td><div>Success</div></td>
                                        </tr>
                                        <tr>
                                            <td><div>K2</div></td>
                                            <td><div>YYY</div></td>
                                            <td><div>Prasad</div></td>
                                            <td><div>05-01-2023</div></td>
                                            <td><div>0</div></td>
                                            <td><div>0</div></td>
                                            <td><div>Scheduled/Cancel</div></td>
                                        </tr>
                                        <tr>
                                            <td><div>Everest</div></td>
                                            <td><div>ZZZ</div></td>
                                            <td><div>Arun</div></td>
                                            <td><div>01-01-2023</div></td>
                                            <td><div>2</div></td>
                                            <td><div>8</div></td>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- <div class="modal" id="backModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="backModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-8 col-md-12 col-sm-12 col-12 m-auto">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12 mb-2">
                                        <img src="img/Meeting-Room-1.jpg" class="img-fluid" alt="Product" />
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <p class="product-name">Mont Blanc</p>
                                        <p class="product-qnty">Meeting Capacity - 20</p>
                                        <p class="product-rate mt-4">3 Credits</p>
                                    </div>
                                </div>
                                <div class="row mb-5 mt-5">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="mb-3">
                                            <label class="form-label cafe-label">Meeting Date*</label>
                                            <div class="position-relative date-picker">
                                                <input type="text" class="datepicker form-control cafe-input-grey" />
                                                <i class="fa fa-calendar-o" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="mb-3">
                                            <label class="form-label cafe-label">Balance Available Credits</label>
                                            <input type="text" class="form-control cafe-input-grey" />
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="mb-3">
                                            <label class="form-label cafe-label">Meeting Start Time*</label>
                                            <div class="position-relative time-picker">
                                                <input type="text" class="form-control cafe-input-grey timepicker" />
                                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="mb-3">
                                            <label class="form-label cafe-label">Meeting End Time*</label>
                                            <div class="position-relative time-picker">
                                                <input type="text" class="form-control cafe-input-grey timepicker" />
                                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 text-center mt-4">
                                        <button type="submit" class="btn btn-primary cafe-btn book-btn">BOOK MEETING ROOM</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <div class="modal" id="successModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                <h4 class="cafe-success text-success">Your meetingroom is successfully placed</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.6.0.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/common.js"></script>
        <script>
          $(document).ready(function() {
          $('.timepicker').timepicker({
          timeFormat: 'h:mm p',
          interval: 60,
          minTime: '12:00am',
          maxTime: '12:00pm',
          defaultTime: '24',
          startTime: '12:00am',
          dynamic: false,
          dropdown: true,
          scrollbar: true
          });
          });
        </script>
</body>
</html>
