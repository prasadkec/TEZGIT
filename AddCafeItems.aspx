<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddCafeItems.aspx.cs" Inherits="TEZBI.AddCafeItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="master-tab">
        <div class="tab-pane fade show active">
            <div class="table-bg pt-5">
                <div class="row">
                     <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end close-sec">
                                    <%--<i class="fa fa-close close-sec-table"></i>--%>
                         <asp:Button ID="btnredirect" runat="server" CssClass="btn-close" OnClick="btnredirect_Click" />
                                </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                        <h1 class="table-title">CafeItems Master</h1>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 m-auto">
                        <ul class="nav nav-tabs sub-tab">
                             <li class="nav-item">
                                <a class="nav-link active" id="transaction11-tab" data-bs-toggle="tab" href="#transaction11" role="tab" aria-controls="transaction11" aria-selected="false">View Details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="data-entry11-tab" data-bs-toggle="tab" href="#dataentry11" role="tab" aria-controls="dataentry11" aria-selected="true">Data Entry</a>
                            </li>
                           
                        </ul>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="tab-content sub-tab-content">
                            <div class="tab-pane fade " id="dataentry11" role="tabpanel" aria-labelledby="dataentry11-tab">
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
                            <div class="tab-pane fade show active" id="transaction11" role="tabpanel" aria-labelledby="transaction11-tab">
                                <div class="row mt-5">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="table-responsive">
                                            <asp:GridView ID="GvCafeItemsMaster" runat="server" CssClass="table-responsive"
                                                AutoGenerateColumns="false" DataKeyNames="Id" AllowPaging="true" AllowSorting="true" PageSize="100" Width="100%" GridLines="None">
                                                <Columns>



                                                    <asp:TemplateField HeaderText="Cafe Item Id" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("Id") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cafe Item Name" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("ItemDesc") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("Status") %>
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
                                <h4 class="cafe-success text-success">Cafe Items Added Successfully!!!</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

     <script>
         function showModal(type, message) {
             if (type === 'success') {
                 // Show success modal
                 $('#successModal').modal('show');
             }
         }
         </script>
</asp:Content>
