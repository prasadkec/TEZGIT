<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MeetingroomMaster.aspx.cs" Inherits="TEZBI.MeetingroomMaster" %>

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
                        <h1 class="table-title">Meeting Room Master</h1>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12 m-auto">
                        <ul class="nav nav-tabs sub-tab">
                             <li class="nav-item">
                                <a class="nav-link active" id="transaction-tab4" data-bs-toggle="tab" href="#transaction4" role="tab" aria-controls="transaction4" aria-selected="false">View Details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="data-entry-tab4" data-bs-toggle="tab" href="#dataentry4" role="tab" aria-controls="dataentry4" aria-selected="true">Data Entry</a>
                            </li>
                           
                        </ul>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="tab-content sub-tab-content">
                            <div class="tab-pane fade" id="dataentry4" role="tabpanel" aria-labelledby="dataentry-tab4">
                                <div class="row mt-5">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Meeting Room Name</label>
                                            <asp:TextBox ID="txtMeetingRoomName" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvMeetname" runat="server" ControlToValidate="txtMeetingRoomName" Text="MeetingRoom Name is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Credits</label>
                                            <asp:TextBox ID="txtCredits" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvcredits" runat="server" ControlToValidate="txtCredits" Text="MeetingRoom Credits is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Meeting Room Capacity </label>
                                            <asp:TextBox ID="txtRoomCapacity" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="rfvroomcap" runat="server" ControlToValidate="txtRoomCapacity" Text="Room Capacity required." CssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="mb-4">
                                            <label class="form-label cafe-label">Meeting Room Image</label><span class="Validationcolors">*</span><b style="color: red">(File format: .jpg .jpeg .png)</b>
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
                            <div class="tab-pane fade  show active" id="transaction4" role="tabpanel" aria-labelledby="transaction-tab4">
                                 <div class="row mt-5">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="table-responsive">
                                            <asp:GridView ID="GvMeetingRoomMaster" runat="server" CssClass="table-responsive"
                                                AutoGenerateColumns="false" DataKeyNames="Id" AllowPaging="true" AllowSorting="true" OnRowDeleting="GvMeetingRoomMaster_RowDeleting" PageSize="50" Width="100%" GridLines="None">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnDelete" runat="server" ToolTip="Delete" Text="Delete" CausesValidation="false" CommandArgument='<%#Eval("Id") %>' CommandName="Delete"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MeetingRoom ID" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("Id") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="MeetingRoom Name" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("MeetingRoomName") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credits" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("Credits") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Room Capacity" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%#Eval("RoomCapacity") %>
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
