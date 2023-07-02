<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="TEZBI.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cafe</title>
    <link href="font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/jquery-ui.css" />
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
    <form id="loginform" runat="server" autocomplete="off">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="upd" runat="server">
            <ContentTemplate>
        <section>
            <div class="row mb-5 mt-5">
                <div class="col-lg-12 col-md-12 col-sm-12 col-12 px-5">
                    <div class="login-box mx-auto">
                        <img src="img/login-05.png" class="img-fluid cafe-popup-img" />
                        <div class="row login-form">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                                        <div class="cafe-profile">
                                            <img src="img/user.png" />
                                        </div>
                                        <h1 class="m-2 mb-4"><span class="playfair-font">Forget Password</span></h1>
                                    </div>
                                    <div class="col-lg-5 col-md-12 col-sm-12 col-12 m-auto">
                                        <div class="mb-4">
                                            <asp:TextBox ID="txtUsername" runat="server" autocomplete="off" CssClass="form-control cafe-input-grey" Placeholder="Enter Your UserName" Width="100%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="Req_txtUserName" runat="server" ControlToValidate="txtUserName" CssClass="text-danger" ErrorMessage="UserName required."></asp:RequiredFieldValidator>
                                        </div>
                                       


                                        <asp:Button ID="btnSendPassword" runat="server" Text="Change password" CssClass="btn btn-primary cafe-btn me-0 me-lg-3 mb-2" OnClick="btnSendPassword_Click" />
                                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" style="color:red" Visible="true"></asp:Label>
                                    </div>
                                </div>

                                <%-- <div class="row">
                                    <div class="col-lg-5 col-md-12 col-sm-12 col-12 m-auto">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input cms-check" runat="server" type="checkbox" value="" id="flexCheckChecked" checked />
                                                    <label class="form-check-label cafe-label" for="flexCheckChecked">
                                                        Remember me
                                               
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-6 text-end">
                                                <span class="forgot-password" data-bs-dismiss="modal" aria-label="Close" data-bs-toggle="modal" data-bs-target="#forgotpasswordModal">Forgot Password?</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <%-- <div class="modal" id="loginModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4 p-lg-0">
                        <img src="img/login-05.png" class="img-fluid cafe-popup-img" />
                        <div class="row login-form">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                                        <div class="cafe-profile">
                                            <img src="img/user.png" />
                                        </div>
                                        <h1 class="m-2 mb-4"><span class="playfair-font">Login</span></h1>
                                    </div>
                                    <div class="col-lg-5 col-md-12 col-sm-12 col-12 m-auto">
                                        <div class="mb-4">
                                            <input type="text" class="form-control cafe-input-grey" placeholder="Username*" />
                                        </div>
                                        <div class="mb-4">
                                            <input type="password" class="form-control cafe-input-grey" placeholder="Password" />
                                        </div>
                                        <button type="submit" class="btn btn-primary cafe-btn mb-2 w-100">SUBMIT</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5 col-md-12 col-sm-12 col-12 m-auto">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-6">
                                                <div class="form-check">
                                                   <input class="form-check-input cms-check" type="checkbox" value="" id="flexCheckCheckeds" runat="server" />

                                                    <label class="form-check-label cafe-label" for="flexCheckCheckeds">
                                                        Remember me
                                                   
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-6 text-end">
                                                <span class="forgot-password" data-bs-dismiss="modal" aria-label="Close" data-bs-toggle="modal" data-bs-target="#forgotpasswordModal">Forgot Password?</span>
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
        <div class="modal" id="forgotpasswordModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="forgotpasswordModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4 p-lg-0">
                        <img src="img/forgot_password.png" class="img-fluid cafe-forgot-img" />
                        <div class="row forgot-form">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                                        <h1 class="m-2 mb-4"><span class="playfair-font">Forgot Password</span></h1>
                                    </div>
                                    <div class="col-lg-5 col-md-12 col-sm-12 col-12 m-auto">
                                        <div class="mb-4">
                                            <input type="text" class="form-control cafe-input-grey" placeholder="Username*" />
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control cafe-input-grey" placeholder="Email ID*" />
                                        </div>
                                        <button type="submit" class="btn btn-primary cafe-btn mb-2 w-100" data-bs-dismiss="modal" aria-label="Close" data-bs-toggle="modal" data-bs-target="#verifypasswordModal">SUBMIT</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="verifypasswordModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="verifypasswordModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body verify-form">
                        <div class="row mb-5">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                                        <h1 class="mb-4"><span class="playfair-font">Verify Password</span></h1>
                                    </div>
                                    <div class="col-lg-5 col-md-12 col-sm-12 col-12 m-auto">
                                        <div class="mb-4">
                                            <input type="text" class="form-control cafe-input-grey" placeholder="Current Password*" />
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control cafe-input-grey" placeholder="New Password*" />
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control cafe-input-grey" placeholder="Retype New Password*" />
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="modal" id="successModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0">
                        <asp:Button ID="closebutton" runat="server" CssClass="btn-close" OnClick="closebutton_Click" />
                        <%--<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                <h4 class="cafe-success text-success">Password Mailed to your registered Email ID!!!</h4>
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
