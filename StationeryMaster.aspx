﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="StationeryMaster.aspx.cs" Inherits="TEZBI.StationeryMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="master-tab">
     <div class="tab-pane" >
                        <div class="table-bg pt-5">
                            <div class="row">
                               <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end close-sec">
                                    <i class="fa fa-close close-sec-table"></i>
                                </div>--%>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                                    <h1 class="table-title">Stationery Master</h1>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 m-auto">
                                    <ul class="nav nav-tabs sub-tab">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="data-entry-tab5" data-bs-toggle="tab" href="#dataentry5" role="tab" aria-controls="dataentry5" aria-selected="true">Data Entry</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="transaction-tab5" data-bs-toggle="tab" href="#transaction5" role="tab" aria-controls="transaction5" aria-selected="false">Transaction Details</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="tab-content sub-tab-content">
                                        <div class="tab-pane fade show active" id="dataentry5" role="tabpanel" aria-labelledby="dataentry-tab5">
                                            <div class="row mt-5">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Stationery Name*</label>
                                                        <input type="text" class="form-control cafe-input-grey" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Price*</label>
                                                        <input type="text" class="form-control cafe-input-grey" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Product Image*</label>
                                                        <div class="file cafe-file">
                                                            <label for="input-file"> Upload Image<i class="fa fa-cloud-upload"></i> </label>
                                                            <input id="input-file" type="file" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center mt-5">
                                                    <button type="submit" class="btn btn-primary cafe-btn me-0 me-lg-3 mb-2">SUBMIT</button>
                                                    <button type="submit" class="btn btn-primary cafe-btn cafe-btn-grey mb-2">BULK UPLOAD</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="transaction5" role="tabpanel" aria-labelledby="transaction-tab5">
                                            <div class="row mt-5">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">Room ID</th>
                                                                    <th scope="col">Room Name</th>
                                                                    <th scope="col">Capacity</th>
                                                                    <th scope="col">Credits</th>
                                                                    <th scope="col">Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><div>021</div></td>
                                                                    <td><div>K2</div></td>
                                                                    <td><div>12</div></td>
                                                                    <td><div>1</div></td>
                                                                    <td>
                                                                        <div><span>Edit</span>/<span class="cafe-delete">Delete</span></div>
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
