<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompanyMaster.aspx.cs" Inherits="TEZBI.CompanyMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script type="text/javascript">
        function openpopup() {
            $("#myModal").modal('show');
        }
        </script>
    <style type="text/css">
        .Validationcolors
        {
            color:red;
        }
    </style>
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
                                <a class="nav-link active" id="data-entry-tab1" data-bs-toggle="tab" href="#dataentry1" role="tab" aria-controls="dataentry1" aria-selected="true">Data Entry</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="transaction-tab1" data-bs-toggle="tab" href="#transaction1" role="tab" aria-controls="transaction1" aria-selected="false">Transaction Details</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="tab-content sub-tab-content">
                            <div class="tab-pane fade show active" id="dataentry1" role="tabpanel" aria-labelledby="dataentry-tab1">
                                <div class="row mt-5">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Company ID</label> <span class="Validationcolors">*</span>
                                            <%--<input type="text" class="form-control cafe-input-grey" />--%>
                                            <asp:TextBox ID="txtCompanyId" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Company Email ID</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtEmailId" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Company Name</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Contact Number</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Authorized Person</label><span class="Validationcolors">*</span>
                                       <asp:TextBox ID="txtAuthorizedPerson" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
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
                                        <button type="submit" class="btn btn-primary cafe-btn cafe-btn-grey mb-2">BULK UPLOAD</button>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="transaction1" role="tabpanel" aria-labelledby="transaction-tab1">
                                <div class="row mt-5">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Company ID</th>
                                                        <th scope="col">Company Name</th>
                                                        <th scope="col">Contact Person</th>
                                                        <th scope="col">Contact Number</th>
                                                        <th scope="col">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div>123</div>
                                                        </td>
                                                        <td class="cafe-doc-download" data-bs-toggle="modal" data-bs-target="#docDownloadModal">
                                                            <div>XXX</div>
                                                        </td>
                                                        <td>
                                                            <div>XXX</div>
                                                        </td>
                                                        <td>
                                                            <div>98888 88888</div>
                                                        </td>
                                                        <td>
                                                            <div><span>Edit</span>/<span>View</span>/<span class="cafe-delete">Delete</span></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                        <td>
                                                            <div></div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
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

    <!-- Bootstrap -->
<!-- Modal Popup -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;</button>
                <h4 class="modal-title">
                </h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">
                    Close</button>
            </div>
        </div>
    </div>
</div>
</asp:Content>
