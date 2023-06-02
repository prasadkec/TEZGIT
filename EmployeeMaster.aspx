<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EmployeeMaster.aspx.cs" Inherits="TEZBI.EmployeeMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="master-tab">
    <div class="tab-pane " >
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
                                            <a class="nav-link active" id="data-entry-tab2" data-bs-toggle="tab" href="#dataentry2" role="tab" aria-controls="dataentry2" aria-selected="true">Data Entry</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="transaction-tab2" data-bs-toggle="tab" href="#transaction2" role="tab" aria-controls="transaction2" aria-selected="false">Transaction Details</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="tab-content sub-tab-content">
                                        <div class="tab-pane fade show active" id="dataentry2" role="tabpanel" aria-labelledby="dataentry-tab2">
                                            <div class="row mt-5">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Select Company*</label>
                                                        <div class="position-relative cafe-select cafe-select-grey">
                                                            <select name="select-menu" class="form-select select-menu">
                                                                <option selected="selected">Choose company from masters</option>
                                                                <option>X Company</option>
                                                                <option>Y Company</option>
                                                                <option>Z Company</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Company Email ID*</label>
                                                        <input type="text" class="form-control cafe-input-grey" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Employee Name*</label>
                                                        <input type="text" class="form-control cafe-input-grey" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Contact Number*</label>
                                                        <input type="text" class="form-control cafe-input-grey" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Employee ID*</label>
                                                        <input type="text" class="form-control cafe-input-grey" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center mt-5">
                                                    <button type="submit" class="btn btn-primary cafe-btn me-0 me-lg-3 mb-2">SUBMIT</button>
                                                    <button type="submit" class="btn btn-primary cafe-btn cafe-btn-grey mb-2">BULK UPLOAD</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="transaction2" role="tabpanel" aria-labelledby="transaction-tab2">
                                            <div class="row mt-5">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">Employee ID</th>
                                                                    <th scope="col">Employee Name</th>
                                                                    <th scope="col">Email ID</th>
                                                                    <th scope="col">Company Name</th>
                                                                    <th scope="col">Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><div>123</div></td>
                                                                    <td><div>XXX</div></td>
                                                                    <td><div>XXX</div></td>
                                                                    <td><div>XXX</div></td>
                                                                    <td>
                                                                        <div><span>Edit</span>/<span>View</span>/<span class="cafe-delete">Delete</span></div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
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
                                                                </tr>
                                                                <tr>
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
                                                                </tr>
                                                                <tr>
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
</asp:Content>
