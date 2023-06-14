<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CafeItemsMaster.aspx.cs" Inherits="TEZBI.CafeItemsMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">    

        function Validate() {
            var ItemDesc = document.getElementById("<%=txtItemName.ClientID%>").value;
           
            if (ItemDesc == '') {
                alert("Please enter Item Name");
                return false;
            }           
        }
    </script>
     <section class="master-tab">
     <div class="tab-pane fade show active" >
                        <div class="table-bg pt-5">
                            <div class="row">
                               <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end close-sec">
                                    <i class="fa fa-close close-sec-table"></i>
                                </div>--%>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                                    <h1 class="table-title">CafeItems Master</h1>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 m-auto">
                                    <ul class="nav nav-tabs sub-tab">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="data-entry0-tab" data-bs-toggle="tab" href="#dataentry" role="tab" aria-controls="dataentry" aria-selected="true">Data Entry</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="transaction0-tab" data-bs-toggle="tab" href="#transaction0" role="tab" aria-controls="transaction" aria-selected="false">Transaction Details</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="tab-content sub-tab-content">
                                        <div class="tab-pane fade show active" id="dataentry0" role="tabpanel" aria-labelledby="dataentry-tab">
                                            <div class="row mt-5">
                                               
                                                <%--<div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Item ID</label>
                                                        <input type="text" class="form-control cafe-input-grey" />
                                                    </div>
                                                </div>--%>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label class="form-label cafe-label">Item Name</label>
                                                        <%--<input type="text" class="form-control cafe-input-grey" />--%>
                                                        <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                             
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center mt-5">                                                   
                                                   <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary cafe-btn me-0 me-lg-3 mb-2"
                                            OnClientClick="javascript:return Validate();" OnClick="btnSubmit_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="transaction0" role="tabpanel" aria-labelledby="transaction0-tab">
                                            <div class="row mt-5">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">Item ID</th>
                                                                    <th scope="col">Item Name</th>
                                                                    <th scope="col">Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><div>001</div></td>
                                                                    <td><div>Juice</div></td>
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
