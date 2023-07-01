<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="StationeryMaster.aspx.cs" Inherits="TEZBI.StationeryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="master-tab">
        <div class="tab-pane">
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
                                <a class="nav-link active" id="transaction-tab5" data-bs-toggle="tab" href="#transaction5" role="tab" aria-controls="transaction5" aria-selected="false">View Details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="data-entry-tab5" data-bs-toggle="tab" href="#dataentry5" role="tab" aria-controls="dataentry5" aria-selected="true">Data Entry</a>
                            </li>
                           
                        </ul>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="tab-content sub-tab-content">
                            <div class="tab-pane fade" id="dataentry5" role="tabpanel" aria-labelledby="dataentry-tab5">
                                <div class="row mt-5">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Stationery Item Name</label>
                                            <asp:TextBox ID="txtStatItemName" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvStatItemName" runat="server" ControlToValidate="txtStatItemName" Text="Stationery Item Name required." CssClass="text-danger"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Price</label>
                                            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" Text="Price required." CssClass="text-danger"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Quantity</label>
                                            <asp:TextBox ID="txtItemQuantity" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvItemQuantity" runat="server" ControlToValidate="txtItemQuantity" Text="Quantity required." CssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Item Image</label><span class="Validationcolors">*</span><b style="color: red">(File format: .jpg .jpeg .png)</b>
                                            <div>
                                                <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control cafe-input-grey" />
                                                <b style="color: #fff">(Maximum File Size 1 MB)</b>
                                                <%--<label for="input-file"> Upload Image<i class="fa fa-cloud-upload"></i> </label>
                                                            <input id="input-file" type="file" />--%>
                                                 <asp:RequiredFieldValidator ID="rfvimgupload" runat="server" ControlToValidate="fuImage" Text="Please Upload Image." CssClass="text-danger"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center mt-5">
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary cafe-btn me-0 me-lg-3 mb-2" Text="Submit" OnClick="btnSubmit_Click" />
                                        <button type="submit" class="btn btn-primary cafe-btn cafe-btn-grey mb-2">BULK UPLOAD</button>
                                    </div>

                                </div>
                            </div>
                            <div class="tab-pane fade  show active" id="transaction5" role="tabpanel" aria-labelledby="transaction-tab5">
                                 <div class="row mt-5">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="table-responsive">
                                            <asp:GridView ID="GvStationeryMaster" runat="server" CssClass="table-responsive"
                                                AutoGenerateColumns="false" DataKeyNames="Id" AllowPaging="true" AllowSorting="true" OnRowDeleting="GvStationeryMaster_RowDeleting" PageSize="50" Width="100%" GridLines="None">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnDelete" runat="server" ToolTip="Delete" Text="Delete" CausesValidation="false" CommandArgument='<%#Eval("Id") %>' CommandName="Delete"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Item ID" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("Id") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Item Name" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("StationeryName") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Item Price" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("StationeryItemPrice") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Item Quantity" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("StationeryItemQuantity") %>
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
    </section>
</asp:Content>
