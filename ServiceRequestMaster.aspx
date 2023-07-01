<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ServiceRequestMaster.aspx.cs" Inherits="TEZBI.ServiceRequestMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="master-tab">
        <div class="tab-pane">
            <div class="table-bg pt-5">
                <div class="row">
                    <%--<div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end close-sec">
                                    <i class="fa fa-close close-sec-table"></i>
                                </div>--%>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center">
                        <h1 class="table-title">Service Request Master</h1>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 m-auto">
                        <ul class="nav nav-tabs sub-tab">
                             <li class="nav-item">
                                <a class="nav-link active" id="transaction-tab6" data-bs-toggle="tab" href="#transaction6" role="tab" aria-controls="transaction6" aria-selected="true">View Details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="data-entry-tab6" data-bs-toggle="tab" href="#dataentry6" role="tab" aria-controls="dataentry6" aria-selected="false">Data Entry</a>
                            </li>
                           
                        </ul>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="tab-content sub-tab-content">
                            <div class="tab-pane fade" id="dataentry6" role="tabpanel" aria-labelledby="dataentry-tab6">
                                <div class="row mt-5">
                                    <div class="col-lg-5 col-md-5 col-sm-12 col-12 m-auto">
                                        <div class="row">



                                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="mb-4">
                                                    <div class="position-relative cafe-select">
                                                        <asp:DropDownList ID="ddlServiceRequest" runat="server" CssClass="form-select select-menu">
                                                            <asp:ListItem Text="Select SR" Selected="True" />
                                                            <asp:ListItem Text="AC" />
                                                            <asp:ListItem Text="Parking" />
                                                            <asp:ListItem Text="Cafeteria" />
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="mb-4">
                                                    <asp:TextBox ID="txtServiceIssue" runat="server" Placeholder="Enter Service Issue" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvServiceIssue" runat="server" ControlToValidate="txtServiceIssue" Text="Service Issue required." CssClass="text-danger"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center mt-5">
                                        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary cafe-btn me-0 me-lg-3 mb-2" OnClick="btnSubmit_Click" />

                                        <button type="submit" class="btn btn-primary cafe-btn cafe-btn-grey mb-2">BULK UPLOAD</button>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade show active"  id="transaction6" role="tabpanel" aria-labelledby="transaction-tab6">
                                <div class="row mt-5 col-lg-4 col-md-4 col-sm-4 col-4">
                                    <div class="product-search float-end position-relative me-3">
                                        <i class="fa fa-search"></i>
                                        <input id="searchInput" class="form-control" type="text" placeholder="Search..." />
                                    </div>
                                </div>
                                <div class="row mt-5">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="table-responsive">
                                            <asp:GridView ID="GvServiceRequestMaster" runat="server" CssClass="table-responsive"
                                                AutoGenerateColumns="false" DataKeyNames="Id" AllowPaging="true" AllowSorting="true" OnRowDeleting="GvServiceRequestMaster_RowDeleting" PageSize="50" Width="100%" GridLines="None">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnDelete" runat="server" ToolTip="Delete" Text="Delete" CausesValidation="false" CommandArgument='<%#Eval("Id") %>' CommandName="Delete"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="SR ID" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("Id") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ServiceType" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("ServiceType") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ServiceIssue" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("ServiceIssue") %>
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
