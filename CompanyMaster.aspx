﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompanyMaster.aspx.cs" Inherits="TEZBI.CompanyMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <%--  <script type="text/javascript">    

        function Validate() {
            var CompanyId = document.getElementById("<%=txtCompanyId.ClientID%>").value;
            var EmailId = document.getElementById("<%=txtEmailId.ClientID%>").value;
            var CompanyName = document.getElementById("<%=txtCompanyName.ClientID%>").value;
            var ContactNo = document.getElementById("<%=txtContactNo.ClientID%>").value;
            var AuthorizedPerson = document.getElementById("<%=txtAuthorizedPerson.ClientID%>").value;

            if (CompanyId == '') {
                alert("Please enter CompanyId");
                return false;
            }

            if (EmailId == '') {
                alert("Please enter EmailId");
                return false;
            }

            if (CompanyName == '') {
                alert("Please enter CompanyName");
                return false;
            }

            if (ContactNo == '') {
                alert("Please enter ContactNo");
                return false;
            }

            if (AuthorizedPerson == '') {
                alert("Please enter AuthorizedPerson");
                return false;
            }
        }
        function EValidate() {
            var CompanyName = document.getElementById("<%=CompanyName.ClientID%>").value;
            var EmailId = document.getElementById("<%=EmailId.ClientID%>").value;

            var ContactNo = document.getElementById("<%=ContactNo.ClientID%>").value;
            var AuthorizedPerson = document.getElementById("<%=AuthorizedPerson.ClientID%>").value;

            if (CompanyName == '') {
                alert("Please enter CompanyName");
                return false;
            }

            if (EmailId == '') {
                alert("Please enter EmailId");
                return false;
            }

            if (ContactNo == '') {
                alert("Please enter ContactNo");
                return false;
            }

            if (AuthorizedPerson == '') {
                alert("Please enter AuthorizedPerson");
                return false;
            }
        }
    </script>
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
    </style>--%>
    <section class="master-tab">
        <div class="tab-pane fade show active">
            <div class="table-bg pt-5">
                <div class="row">
                    <%--<div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end close-sec">
                                    <i class="fa fa-close close-sec-table"></i>
                                </div>--%>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                        <h1 class="table-title">Company Master</h1>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 m-auto">
                        <ul class="nav nav-tabs sub-tab">
                            <li class="nav-item">
                                <a class="nav-link active" id="transaction-tab1" data-bs-toggle="tab" href="#transaction1" role="tab" aria-controls="transaction1" aria-selected="false">View Details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="data-entry-tab1" data-bs-toggle="tab" href="#dataentry1" role="tab" aria-controls="dataentry1" aria-selected="true">Data Entry</a>
                            </li>
                            
                        </ul>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="tab-content sub-tab-content">
                            <div class="tab-pane fade" id="dataentry1" role="tabpanel" aria-labelledby="dataentry-tab1">
                                <div class="row mt-5">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Company Name</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvCompNamed" runat="server" ControlToValidate="txtCompanyName" Text="Company Name is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Company Email ID</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtEmailId" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvEmailidd" runat="server" ControlToValidate="txtEmailId" Text="E-Mail ID required." CssClass="text-danger"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revEmailidd" runat="server" ControlToValidate="txtEmailId" ErrorMessage="Invalid Email ID format." ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" CssClass="text-danger"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Contact Number</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvcontnumbd" runat="server" ControlToValidate="txtContactNo" Text="Contact Number required." CssClass="text-danger"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revcontnumbd" runat="server" ControlToValidate="txtContactNo" ErrorMessage="Contact Number should be 10 digits." ValidationExpression="^\d{10}$" CssClass="text-danger"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Authorized Person</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtAuthorizedPerson" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvauthpersond" runat="server" ControlToValidate="txtAuthorizedPerson" Text="AuthorizedPerson required." CssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <%--<div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Company Document</label><span class="Validationcolors">*</span>
                                            <div class="file cafe-file">
                                                <label for="input-file">Upload Document<i class="fa fa-cloud-upload"></i> </label>
                                                <input id="input-file" type="file" />
                                            </div>
                                        </div>
                                    </div>--%>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center mt-5">
                                        <%--<button type="submit" class="btn btn-primary cafe-btn me-0 me-lg-3 mb-2">SUBMIT</button>--%>


                                        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary cafe-btn me-0 me-lg-3 mb-2" OnClick="btnSubmit_Click" />


                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade  show active" id="transaction1" role="tabpanel" aria-labelledby="transaction-tab1">
                                <div class="row mt-5">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="table-responsive">
                                            <div class="row mt-3 mb-3">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                    <div class="product-search product-search-grey float-end position-relative me-3">
                                                        <i class="fa fa-search"></i>
                                                        <%--<input class="form-control" type="text" placeholder="Search Master..." />--%>
                                                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" CausesValidation="false" placeholder="Search..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                                                        <%--<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary cafe-btn me-0 me-lg-3 mb-2" OnClick="btnSearch_Click" />--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:GridView ID="GvCompanyMaster" runat="server" CssClass="table-responsive" DataKeyNames="CompanyId"
                                                AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" PageSize="10" Width="100%" GridLines="None"
                                                EmptyDataText="No Records Found !" OnRowEditing="GvCompanyMaster_RowEditing" OnRowDeleting="GvCompanyMaster_RowDeleting" OnPageIndexChanging="GvCompanyMaster_PageIndexChanging">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnEdit" runat="server" ToolTip="Edit" Text="Edit" CausesValidation="false" CommandArgument='<%#Eval("CompanyId") %>' CommandName="Edit"></asp:LinkButton>
                                                            <asp:LinkButton ID="btnDelete" runat="server" ToolTip="Delete" Text="Delete" CausesValidation="false" CommandArgument='<%#Eval("CompanyId") %>' CommandName="Delete"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CompanyId" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("CompanyId") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Company Name" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("CompanyName") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="EmailID" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("CompanyEmailID") %>
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
        <div class="modal" id="successModal" data-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header" style="background-image: linear-gradient(to right,#f6d538 0,#f6d538 100%); color: #01227e">
                        <h4 class="modal-title" id="myModalLabel"><b style="font-family: Calibri">Company Details</b></h4>
                    </div>
                    <div class="modal-body">
                        <div class="row mb-12">
                            <div class="col-md-12">
                                <b>
                                    <label>Company Name </label>
                                    <span class="Validationcolors">*</span>
                                    <asp:TextBox ID="CompanyName" runat="server" CssClass="form-control" TabIndex="2" Placeholder="Company Name" Width="100%"></asp:TextBox>
                                </b>
                            </div>
                            <div class="col-md-12">
                                <b>
                                    <label>Company Email ID</label><span class="Validationcolors">*</span>
                                    <asp:TextBox ID="EmailId" runat="server" CssClass="form-control" TabIndex="1" Placeholder="Company Email ID" Width="100%"></asp:TextBox>
                                </b>
                            </div>
                            <div class="col-md-12">
                                <b>
                                    <label>Contact Number </label>
                                    <span class="Validationcolors">*</span>
                                    <asp:TextBox ID="ContactNo" runat="server" CssClass="form-control" TabIndex="3" Placeholder="Contact Number" Width="100%"></asp:TextBox>
                                </b>
                            </div>
                            <div class="col-md-12">
                                <b>
                                    <label>Authorized Person </label>
                                    <span class="Validationcolors">*</span>
                                    <asp:TextBox ID="AuthorizedPerson" runat="server" CssClass="form-control" TabIndex="4" Placeholder="Authorized Person" Width="100%"></asp:TextBox>
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



        <div class="modal" id="companyaddsuccessModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0">
                        <asp:Button ID="closebutton" runat="server" CssClass="btn-close" OnClick="closebutton_Click" />
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                <h4 class="cafe-success text-success">Company Added Successfully!!!</h4>
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
                        <asp:Button ID="closebuttonerror" runat="server" CssClass="btn-close"  />
                    </div>
                    <div class="modal-body">
                        <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                            <h4 class="cafe-error text-danger" id="errorLabel">Company already Exists</h4>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="updatecompanysuccessModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0">
                        <asp:Button ID="btnupdatecompanysuccessModal" runat="server" CssClass="btn-close"  />
                    </div>
                    <div class="modal-body">
                        <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                            <h4 class="cafe-success text-success" id="updatesuccessLabel">Company Updated Successfully</h4>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="deletecompanysuccessModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0">
                        <asp:Button ID="btndeletesuccess" runat="server" CssClass="btn-close" OnClientClick="location.reload();" />
                    </div>
                    <div class="modal-body">
                        <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                            <h4 class="cafe-success text-success" id="deletesuccessLabel">Company Deleted Successfully</h4>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- Essential javascripts for application to work-->
    <script src="jss/jquery-3.3.1.min.js"></script>
   <%-- <script src="jss/popper.min.js"></script>--%>
   <%-- <script src="jss/bootstrap.min.js"></script>--%>
  <%--  <script src="jss/main.js"></script>--%>
    <!-- The javascript plugin to display page loading on top-->
    <script src="jss/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->


    <!-- POPUP script-->


    <script>
        function showModal(type, message) {
            if (type === 'success') {
                // Show success modal
                $('#companyaddsuccessModal').modal('show');
            } else if (type === 'error') {
                // Show error modal with message
                $('#errorModal .modal-body').text(message);
                $('#errorModal').modal('show');
            }
            else if (type === 'updatecompanysuccess') {
                // Show success modal
                $('#updatecompanysuccessModal').modal('show');
            }
            else if (type === 'deletecompanysuccess') {
                // Show success modal
                $('#deletecompanysuccessModal').modal('show');
            }

        }



    </script>

            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
