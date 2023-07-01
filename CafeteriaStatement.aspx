<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CafeteriaStatement.aspx.cs" Inherits="TEZBI.CafeteriaStatement" %>

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
    <style type="text/css">
        .HeaderBarThreshold {
            padding-left: 10px;
            font-weight: bold;
        }

            .HeaderBarThreshold:hover {
                color: Red;
            }
    </style>

</head>

<body>
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="upd" runat="server">
            <ContentTemplate>
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

                <section class="sec-table1">
                    <div class="container">
                        <div class="table-bg">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end close-sec">
                                    <asp:Button ID="closebutton" runat="server" CssClass="btn-close" OnClick="closebutton_Click" />

                                    <%-- <i class="fa fa-close close-sec-table"></i>--%>
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
                                            <%-- <button type="submit" class="btn btn-primary cafe-btn float-end">Search</button>--%>
                                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade  show active" >
                                <div class="row mt-5">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="table-responsive">
                                            <asp:GridView ID="GvCafeteria" runat="server" CssClass="table-responsive" DataKeyNames="ItemCode"
                                                AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" PageSize="100" Width="100%" GridLines="None"
                                                EmptyDataText="No Records Found !">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Item Code" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("ItemCode") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Item Name" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("ItemDesc") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Price" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("Price") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Quantity" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("Quantity") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Purchased Date" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Purchased By" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Company Name" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    </div>
                </section>

                <%--POPUP FOR EDIT--%>

                <%--      <div class="modal" id="editModal" data-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header" style="background-image: linear-gradient(to right,#f6d538 0,#f6d538 100%); color: #01227e">
                                <h4 class="modal-title" id="myModalLabel"><b style="font-family: Calibri">Company Details</b></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row mb-12">
                                     <div class="col-md-12">
                                        <b>
                                            <label>Item Name</label>
                                            <span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control" TabIndex="2" Placeholder="Company Name" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>
                                    <div class="col-md-12">
                                        <b>
                                            <label>Item Name</label>
                                            <span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtItemDesc" runat="server" CssClass="form-control" TabIndex="2" Placeholder="Company Name" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>
                                    <div class="col-md-12">
                                        <b>
                                            <label>Price</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" TabIndex="1" Placeholder="Company Email ID" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>
                                    <div class="col-md-12">
                                        <b>
                                            <label>Quantity </label>
                                            <span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" TabIndex="3" Placeholder="Contact Number" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>
                                    <div class="col-md-12">
                                        <b>
                                            <label>Weightage </label>
                                            <span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtWeightage" runat="server" CssClass="form-control" TabIndex="4" Placeholder="Authorized Person" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer" style="background-image: linear-gradient(to right,#f6d538 0,#f6d538 100%); color: #FFFFFF">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClientClick="javascript:return EValidate();"
                                    OnClick="btnUpdate_Click1" CausesValidation="true" ValidationGroup="Update"></asp:Button>
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" />
                            </div>
                        </div>
                    </div>
                </div>--%>



                <div class="sidebaroverlay"></div>
                <script src="js/jquery-3.6.0.js"></script>
                <script src="js/jquery-ui.js"></script>
                <script src="js/common.js"></script>


            </ContentTemplate>

        </asp:UpdatePanel>
    </form>
</body>

</html>
