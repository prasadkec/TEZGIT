<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CafeteriaMaster.aspx.cs" Inherits="TEZBI.CafeteriaMaster" %>
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
                                    <h1 class="table-title">Cafeteria Master</h1>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 m-auto">
                                    <ul class="nav nav-tabs sub-tab">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="data-entry-tab" data-bs-toggle="tab" href="#dataentry" role="tab" aria-controls="dataentry" aria-selected="true">Data Entry</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="transaction-tab" data-bs-toggle="tab" href="#transaction" role="tab" aria-controls="transaction" aria-selected="false">Transaction Details</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="tab-content sub-tab-content">
                                        <div class="tab-pane fade show active" id="dataentry" role="tabpanel" aria-labelledby="dataentry-tab">
                                            <div class="row mt-5">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Cafe List*</label>
                                                        <div class="position-relative cafe-select cafe-select-grey">
                                                            <select name="select-menu" class="form-select select-menu">
                                                                <option selected="selected">Select</option>
                                                                <option>Paperboat</option>
                                                                <option>Soft Drinks</option>
                                                                <option>Refer Excel Sheet-Cafe Menu</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Menu*</label>
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
                                        <div class="tab-pane fade" id="transaction" role="tabpanel" aria-labelledby="transaction-tab">
                                            <div class="row mt-5">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">List ID</th>
                                                                    <th scope="col">List Name</th>
                                                                    <th scope="col">Menu</th>
                                                                    <th scope="col">Price</th>
                                                                    <th scope="col">Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><div>001</div></td>
                                                                    <td><div>Soft drinks</div></td>
                                                                    <td><div>Pepsi</div></td>
                                                                    <td><div>40</div></td>
                                                                    <td>
                                                                        <div><span>Activate</span>/<span class="cafe-delete">Deactivate</span></div>
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
