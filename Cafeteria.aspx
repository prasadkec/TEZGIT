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
                <section class="product-sec">
                    <div class="container">
                        <div class="row mb-5">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-12 mb-2">
                                <asp:Button ID="btncheckstatement" Text="Check Your Statement" runat="server" CssClass="check-statement " OnClick="btncheckstatement_Click" />
                                <%--<button type="button" class="check-statement"><i class="fa fa-file-o"></i>Check Your Statement</button>--%>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                <button type="button" class="position-relative float-end shopping-cart" onclick="openNav()">
                                    <i class="fa fa-shopping-cart"></i>
                                    <%-- <span class="position-absolute shopping-cart-badge">
                                    </span>--%>
                                    <asp:Label ID="lblcartcount" runat="server" CssClass="position-absolute shopping-cart-badge"></asp:Label>
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


                                <asp:ListView ID="ListView1" runat="server">
                                    <LayoutTemplate>
                                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                            <asp:Label ID="lblNoDataFound" runat="server" ForeColor="Black" Text="No records found" Visible="false"></asp:Label>
                                            <asp:LinkButton ID="lnkItemDesc" runat="server" Text='<%# Eval("ItemDesc")%>' CommandArgument='<%# Eval("itemcode")%>' CssClass="nav-link light-text cafenav " Style="text-decoration: none !important;" OnClick="lnkItemDesc_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                            <asp:LinkButton ID="lnkItemDesc" runat="server" Text='<%# Eval("ItemDesc")%>' CommandArgument='<%# Eval("ItemCode")%>' CssClass="nav-link light-text cafenav " Style="text-decoration: none !important;" OnClick="lnkItemDesc_Click"></asp:LinkButton>
                                    </AlternatingItemTemplate>
                                    <EmptyDataTemplate>
                                    </EmptyDataTemplate>
                                </asp:ListView>

                            </div>
                            <div class="tab-content flex-fill">

                                <div class="tab-pane fade active show" >
                                    <div class="row 1">
                                        <asp:ListView ID="LstItems" runat="server" GroupItemCount="10" OnItemDataBound="LstItems_ItemDataBound" GroupPlaceholderID="groupPlaceHolder1"
                                            ItemPlaceholderID="itemPlaceHolder1">
                                            <LayoutTemplate>
                                                <div class="row 2">
                                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                                </div>
                                            </LayoutTemplate>
                                            <GroupTemplate>
                                                <div class="row 2">
                                                <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                                </div>
                                            </GroupTemplate>
                                            <ItemTemplate>
                                                <%--<div class="tab-content flex-fill" >--%>
                                                    
                                                            <asp:Panel ID="myDiv" CssClass="col-lg-4 col-md-6 col-sm-3 col-3" runat="server">
                                                                <div class="product-list">
                                                                    <div class="product-img">
                                                                        <asp:Label ID="lblimage" runat="server" Text='<%#Eval("ItemFilePath")%>' Visible="false"></asp:Label>
                                                                        <asp:Image ID="Image1" runat="server" CssClass="app-sidebar__user-avatar" src='<%#Eval("ItemFilePath")%>' Style="height: auto; max-width: 80%;" />
                                                                    </div>
                                                                    <div class="row mt-2">
                                                                        <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                                                            <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblitemtype" runat="server" Text='<%#Eval("itemtype")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblitemcode" runat="server" Text='<%#Eval("itemcode")%>' Visible="false"></asp:Label>
                                                                            <p class="product-name">
                                                                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("itemdesc")%>'></asp:Label>
                                                                            </p>
                                                                            <p class="product-qnty">
                                                                                <asp:Label ID="lblWeight" runat="server" Text='<%#Eval("weightage")%>'></asp:Label>
                                                                            </p>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-4 col-4 text-end">
                                                                            <p class="product-rate">Rs.<asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price")%>'></asp:Label></p>

                                                                            <%--<button class="decrebtn">-</button>
                                                                    <input class="incrementCounter" type="text" value="1" min="1">
                                                                    <button class="increbtn">+</button>--%>
                                                                            <asp:DropDownList ID="ddlincredecre" runat="server" Width="43px" Style="border-radius: 5px;">
                                                                                <%--<asp:ListItem Value="1" Text="1"></asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                                                        <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                                                        <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                                                        <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                                                        <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                                                        <asp:ListItem Value="7" Text="7"></asp:ListItem>
                                                                        <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                                                        <asp:ListItem Value="9" Text="9"></asp:ListItem>
                                                                        <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                                                        <asp:ListItem Value="11" Text="11"></asp:ListItem>
                                                                        <asp:ListItem Value="12" Text="12"></asp:ListItem>
                                                                        <asp:ListItem Value="13" Text="13"></asp:ListItem>
                                                                        <asp:ListItem Value="14" Text="14"></asp:ListItem>
                                                                        <asp:ListItem Value="15" Text="15"></asp:ListItem>--%>
                                                                            </asp:DropDownList>

                                                                            <div>
                                                                                <asp:Button ID="btnAddCart" runat="server" Text="Add" CssClass="book-now mt-3" OnClick="btnAddCart_Click" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                          
                                                    <%--</div>--%>
                                            </ItemTemplate>
                                            <EmptyDataTemplate>
                                                <asp:Label ID="lblRecord" runat="server" Text="No Data Found" Font-Size="Larger"></asp:Label>
                                            </EmptyDataTemplate>
                                        </asp:ListView>
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
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>


                                                <asp:ListView ID="ListView2" runat="server" GroupItemCount="10" GroupPlaceholderID="groupPlaceHolder1" OnItemDeleting="ListView2_ItemDeleting" OnItemDataBound="ListView2_ItemDataBound" ItemPlaceholderID="itemPlaceHolder1">
                                                    <LayoutTemplate>
                                                        <div class="row">
                                                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                                        </div>
                                                    </LayoutTemplate>
                                                    <GroupTemplate>
                                                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                                        </div>
                                                    </GroupTemplate>
                                                    <ItemTemplate>
                                                        <div class="col-lg-5 col-md-12 col-sm-12 col-12">

                                                            <div class="shopping-img">

                                                                <asp:LinkButton ID="btnDelete" runat="server" ToolTip="Delete" Text="Delete" CommandName="Delete" OnClientClick="location.reload();"><i style="color:red; font-size:large" class='icon fa fa-trash' aria-hidden="true"></i></asp:LinkButton>
                                                                <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity")%>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblimage" runat="server" Text='<%#Eval("ItemFilePath")%>' Visible="false"></asp:Label>
                                                                <asp:Image ID="Image1" runat="server" CssClass="app-sidebar__user-avatar" src='<%#Eval("ItemFilePath")%>' Style="height: auto; max-width: 100%;" />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-5 col-md-6 col-sm-6 col-12 g-0">
                                                            <asp:Label ID="lblitemtype" runat="server" Text='<%#Eval("itemtype")%>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblitemcode" runat="server" Text='<%#Eval("itemcode")%>' Visible="false"></asp:Label>
                                                            <p class="product-name">
                                                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("itemdesc")%>'></asp:Label>
                                                            </p>
                                                            <p class="product-qnty">
                                                                <asp:Label ID="lblWeight" runat="server" Text='<%#Eval("weightage")%>'></asp:Label>
                                                            </p>
                                                            <div class="increment-input pull-left mt-2">
                                                                <asp:Label ID="lblItemcount" runat="server" CssClass="form-control"></asp:Label>
                                                                <%-- <asp:DropDownList ID="ddlincredecre" runat="server" Width="35px">
                                                                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                                                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                                                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                                                    <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                                                    <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                                                    <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                                                    <asp:ListItem Value="7" Text="7"></asp:ListItem>
                                                                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                                                    <asp:ListItem Value="9" Text="9"></asp:ListItem>
                                                                    <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                                                    <asp:ListItem Value="11" Text="11"></asp:ListItem>
                                                                    <asp:ListItem Value="12" Text="12"></asp:ListItem>
                                                                    <asp:ListItem Value="13" Text="13"></asp:ListItem>
                                                                    <asp:ListItem Value="14" Text="14"></asp:ListItem>
                                                                    <asp:ListItem Value="15" Text="15"></asp:ListItem>
                                                                </asp:DropDownList>--%>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2 col-md-6 col-sm-6 col-12 text-start text-sm-end text-lg-end">
                                                            <p class="product-rate">Rs.<asp:Label ID="lblPrice1" runat="server" Text='<%#Eval("ItemTotalAmount")%>'></asp:Label></p>
                                                            </p>
                                                        </div>
                                                    </ItemTemplate>
                                                    <EmptyDataTemplate>
                                                        <asp:Label ID="lblRecord" runat="server" Text="No Data Found" Font-Size="Larger"></asp:Label>
                                                    </EmptyDataTemplate>
                                                </asp:ListView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ListView2" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                <p class="product-name">Total</p>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-12 text-start text-sm-end text-lg-end">
                                <p class="product-name">Rs.<asp:Label ID="lblTotalPrice" runat="server" Text='<%#Eval("ItemTotalAmount")%>'></asp:Label></p>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end mb-3">
                                <button type="submit" class="btn btn-primary cafe-btn w-100 mt-3" onclick="closeNav()" data-bs-toggle="modal" data-bs-target="#successModal">CHECK OUT</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal" id="successModal1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
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

                <div class="modal" id="successModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-0">
                                <asp:Button ID="closebutton" runat="server" CssClass="btn-close" OnClientClick="location.reload();" />
                                <%--<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                        <h4 class="cafe-success text-success">Item Added To Cart!!!</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <script>
                    function showModal(type, message) {
                        if (type === 'success') {
                            // Show success modal
                            $('#successModal').modal('show');
                        }
                    }



                </script>

                <div class="sidebaroverlay"></div>
                <script src="js/jquery-3.6.0.js"></script>
                <script src="js/jquery-ui.js"></script>
                <script src="js/common.js"></script>
            </ContentTemplate>

        </asp:UpdatePanel>

    </form>
</body>
</html>
