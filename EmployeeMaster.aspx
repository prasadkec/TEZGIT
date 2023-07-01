<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EmployeeMaster.aspx.cs" Inherits="TEZBI.EmployeeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <style type="text/css">
                .Validationcolors {
                    color: red;
                }
            </style>
            <style type="text/css">
                .highlight {
                    text-decoration: none;
                    font-weight: bold;
                    color: black;
                    background: yellow;
                }
            </style>
            <section class="master-tab">
                <div class="tab-pane">
                    <div class="table-bg pt-5">
                        <div class="row">
                            <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end close-sec">
                                    <i class="fa fa-close close-sec-table"></i>
                                </div>--%>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                                <h1 class="table-title">Employee Master</h1>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12 m-auto">
                                <ul class="nav nav-tabs sub-tab">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="transaction-tab2" data-bs-toggle="tab" href="#transaction2" role="tab" aria-controls="transaction2" aria-selected="false">View Details</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " id="data-entry-tab2" data-bs-toggle="tab" href="#dataentry2" role="tab" aria-controls="dataentry2" aria-selected="true">Data Entry</a>
                                    </li>
                                    
                                </ul>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="tab-content sub-tab-content">
                                    <div class="tab-pane fade" id="dataentry2" role="tabpanel" aria-labelledby="dataentry-tab2">
                                        <div class="row mt-5">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label cssclass="form-label cafe-label">Select Company*</label>
                                                    <div class="position-relative cafe-select cafe-select-grey">
                                                        <asp:DropDownList ID="ddlCompanyName" runat="server" CssClass="form-select select-menu">
                                                            <asp:ListItem Text="Choose Company From Masters" Value="0"></asp:ListItem>
                                                        </asp:DropDownList>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddlCompanyName" Text="Select Company" CssClass="text-danger"></asp:RequiredFieldValidator>
                                               
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label cssclass="form-label cafe-label">Employee Type</label>
                                                    <div class="position-relative cafe-select cafe-select-grey">
                                                        <asp:DropDownList ID="ddlemptype" runat="server" CssClass="form-select select-menu">
                                                            <asp:ListItem Text="Select" Value="0" Selected="True"></asp:ListItem>
                                                            <asp:ListItem Text="Admin"></asp:ListItem>
                                                            <asp:ListItem Text="Employee"></asp:ListItem>
                                                            <asp:ListItem Text="Visitors"></asp:ListItem>
                                                        </asp:DropDownList>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="0" ControlToValidate="ddlemptype" Text="Select Employee Type" CssClass="text-danger"></asp:RequiredFieldValidator>
                                               

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label cssclass="form-label cafe-label">Employee Id</label>
                                                    <asp:TextBox ID="txtEmployeeId" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtEmpName" Text="Employee Name is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>


                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label cssclass="form-label cafe-label">Employee Name</label>
                                                    <asp:TextBox ID="txtEmpName" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvEmpName" runat="server" ControlToValidate="txtEmpName" Text="Employee Name is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label cssclass="form-label cafe-label">Email ID</label>
                                                    <asp:TextBox ID="txtEmpID" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvEmailid" runat="server" ControlToValidate="txtEmpID" Text="E-Mail ID required" CssClass="text-danger"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revEmailid" runat="server" ControlToValidate="txtEmpID" ErrorMessage="Invalid Email ID format." ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" CssClass="text-danger"></asp:RegularExpressionValidator>

                                                </div>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label cssclass="form-label cafe-label">Contact Number</label>
                                                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvcontnum" runat="server" ControlToValidate="txtEmpName" Text="Contact Number required" CssClass="text-danger"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revcontnum" runat="server" ControlToValidate="txtContactNumber" ErrorMessage="Contact Number should be 10 digits." ValidationExpression="^\d{10}$" CssClass="text-danger"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label cssclass="form-label cafe-label">Authorized Person</label>
                                                    <asp:TextBox ID="txtAuthorizedperson" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvautper" runat="server" ControlToValidate="txtAuthorizedperson" Text="Authorized Person required" CssClass="text-danger"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center mt-5">
                                                <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary cafe-btn me-0 me-lg-3 mb-2" OnClick="btnSubmit_Click" />

                                                <button type="submit" class="btn btn-primary cafe-btn cafe-btn-grey mb-2">BULK UPLOAD</button>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade  show active" id="transaction2" role="tabpanel" aria-labelledby="transaction-tab2">
                                        <div class="row mt-5 col-lg-4 col-md-4 col-sm-4 col-4">
                                            <div class="product-search float-end position-relative me-3">
                                                <i class="fa fa-search"></i>
                                                <input id="searchInput" class="form-control" type="text" placeholder="Search..." />
                                            </div>
                                        </div>
                                        <div class="row mt-5">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="table-responsive">
                                                    <asp:GridView ID="GvEmployeeMaster" runat="server" CssClass="table-responsive"
                                                        AutoGenerateColumns="false" DataKeyNames="EmployeeId" AllowPaging="true" OnRowEditing="GvEmployeeMaster_RowEditing" OnRowDeleting="GvEmployeeMaster_RowDeleting" AllowSorting="true" PageSize="100" Width="100%" GridLines="None">
                                                        <Columns>

                                                            <asp:TemplateField HeaderText="Actions" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnEdit" runat="server" ToolTip="Edit" Text="Edit" CausesValidation="false" CommandArgument='<%#Eval("CompanyId") %>' CommandName="Edit"></asp:LinkButton>
                                                                    <asp:LinkButton ID="btnDelete" runat="server" ToolTip="Delete" Text="Delete" CausesValidation="false" CommandArgument='<%#Eval("CompanyId") %>' CommandName="Delete"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Company Name" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("CompanyId") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Employee Type" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("EmployeeType") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Employee ID" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("EmployeeId") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Employee Name" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("EmployeeName") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="EmailID" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("EmailID") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Contact Number" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("ContactNumber") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Authorized Person" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("AuthorizedPerson") %>
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
                    </div>
                </div>
                <div class="modal" id="successModal1" data-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header" style="background-image: linear-gradient(to right,#f6d538 0,#f6d538 100%); color: #01227e">
                                <h4 class="modal-title" id="myModalLabel"><b style="font-family: Calibri">Company Details</b></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row mb-12">

                                    <%--    <div class="col-md-12">
                                        <b>
                                            <label>Employee Id</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="EmployeeId" runat="server" CssClass="form-control" TabIndex="2" Placeholder="Employee Name" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>--%>



                                    <div class="col-md-12">
                                        <b>
                                            <label>Employee Name</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="EmployeeName" runat="server" CssClass="form-control" TabIndex="2" Placeholder="Employee Name" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>

                                    <div class="col-md-12">
                                        <b>
                                            <label>EmailID </label>
                                            <span class="Validationcolors">*</span>
                                            <asp:TextBox ID="EmailId" runat="server" CssClass="form-control" TabIndex="3" Placeholder="Contact Number" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>
                                    <div class="col-md-12">
                                        <b>
                                            <label>Contact Number </label>
                                            <span class="Validationcolors">*</span>
                                            <asp:TextBox ID="ContactNumber" runat="server" CssClass="form-control" TabIndex="4" Placeholder="Authorized Person" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>
                                    <div class="col-md-12">
                                        <b>
                                            <label>Authorized Person </label>
                                            <span class="Validationcolors">*</span>
                                            <asp:TextBox ID="AuthorizedPerson" runat="server" CssClass="form-control" TabIndex="5" Placeholder="Authorized Person" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer" style="background-image: linear-gradient(to right,#f6d538 0,#f6d538 100%); color: #FFFFFF">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClientClick="javascript:return EValidate();"
                                    OnClick="btnUpdate_Click" CausesValidation="true" ValidationGroup="Update"></asp:Button>
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" />
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
                                        <h4 class="cafe-success text-success">Employee Added Successfully!!!</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal" id="errorModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-0">
                                <asp:Button ID="closebuttonerror" runat="server" CssClass="btn-close" OnClientClick="location.reload();" />
                            </div>
                            <div class="modal-body">
                                <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                    <h4 class="cafe-error text-danger" id="errorLabel">Employee already Exists</h4>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal" id="updatesuccessModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-0">
                                <asp:Button ID="btnUpdatesuccess" runat="server" CssClass="btn-close" OnClientClick="location.reload();" />
                            </div>
                            <div class="modal-body">
                                <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                    <h4 class="cafe-success text-success" id="updatesuccessLabel">Updated Successfully</h4>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                 <div class="modal" id="deletesuccessModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-0">
                                <asp:Button ID="btndeletesuccess" runat="server" CssClass="btn-close" OnClientClick="location.reload();" />
                            </div>
                            <div class="modal-body">
                                <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                    <h4 class="cafe-success text-success" id="deletesuccessLabel">Employee Deleted Successfully</h4>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </section>

            <!-- Essential javascripts for application to work-->
            <script src="jss/jquery-3.3.1.min.js"></script>
            <script src="jss/popper.min.js"></script>
            <script src="jss/bootstrap.min.js"></script>
            <script src="jss/main.js"></script>
            <!-- The javascript plugin to display page loading on top-->
            <script src="jss/plugins/pace.min.js"></script>
            <!-- Page specific javascripts-->

              <!-- POPUP script-->
            <script>
                function showModal(type, message) {
                    if (type === 'success') {
                        // Show success modal
                        $('#successModal').modal('show');
                    } else if (type === 'error') {
                        // Show error modal with message
                        $('#errorModal .modal-body').text(message);
                        $('#errorModal').modal('show');
                    }
                    else if (type === 'updatesuccess') {
                        // Show success modal
                        $('#updatesuccessModal').modal('show');
                    }
                    else if (type === 'deletesuccess') {
                        // Show success modal
                        $('#deletesuccessModal').modal('show');
                    }

                }
                //function showModal(type, message) {
                //    if (type === 'success') {
                //        // Show success modal
                //        $('#updatesuccessModal').modal('show');
                //    }
                //}
                //function showModal(type, message) {
                //    if (type === 'success') {
                //        // Show success modal
                //        $('#deletesuccessModal').modal('show');
                //    }
                //}
                
            </script>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
