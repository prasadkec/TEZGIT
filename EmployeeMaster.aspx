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
                                                        <label CssClass="form-label cafe-label">Select Company*</label>
                                                        <div class="position-relative cafe-select cafe-select-grey">
                                                             <asp:DropDownList ID="selectMenu" runat="server" CssClass="form-select select-menu">
                                                            <asp:ListItem Text="Choose company from masters" Value=""></asp:ListItem>
                                                               
                                                          
                                                                 </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                   <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label CssClass="form-label cafe-label">Employee Name*</label>
                                                         <asp:TextBox ID="txtEmpName" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                    
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label CssClass="form-label cafe-label">Email ID*</label>
                                                          <asp:TextBox ID="txtEmpID" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    </div>
                                                </div>
                                             
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label CssClass="form-label cafe-label">Contact Number*</label>
                                                        <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="mb-4">
                                                        <label CssClass="form-label cafe-label">Authorized Person*</label>
                                                       <asp:TextBox ID="txtAuthorizedperson" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center mt-5">
                                                      <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary cafe-btn me-0 me-lg-3 mb-2" OnClick="btnSubmit_Click" />
                                      
                                                      <button type="submit" class="btn btn-primary cafe-btn cafe-btn-grey mb-2">BULK UPLOAD</button>
                                                </div>
                                            </div>
                                        </div>
                                         
                                            
                                        <div class="tab-pane fade" id="transaction2" role="tabpanel" aria-labelledby="transaction-tab2">
                                            <div class="row mt-5 col-lg-4 col-md-4 col-sm-4 col-4">
                                                 <div class="product-search float-end position-relative me-3">
                                                  <i class="fa fa-search"></i>
                                                  <input class="form-control" type="text" placeholder="Search..." />
                                            </div>
                                            </div>    
                                            <div class="row mt-5">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                    <div class="table-responsive">
                                                         <asp:GridView ID="GvEmployeeMaster" runat="server" CssClass="table-responsive" 
                                                AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" PageSize="10" Width="100%" GridLines="None">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Company Name" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("CompanyId") %>
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
    </section>
</asp:Content>
