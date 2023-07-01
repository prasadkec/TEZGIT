<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CafeteriaMaster.aspx.cs" Inherits="TEZBI.CafeteriaMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>


            <%-- <script type="text/javascript">    

        function Validate() {
            var Category = document.getElementById("<%=ddlCategory.ClientID%>");
            var Name = document.getElementById("<%=txtName.ClientID%>").value;
            var Price = document.getElementById("<%=txtPrice.ClientID%>").value;
            var Quantity = document.getElementById("<%=txtQuantity.ClientID%>").value;
            var Weightage = document.getElementById("<%=txtWeightage.ClientID%>").value;

            if (document.getElementById(Category).selectedIndex == 0) {
                alert("Please select category");
                return false;
            }

            if (Name == '') {
                alert("Please enter Name");
                return false;
            }
            if (Price == '') {
                alert("Please enter Price");
                return false;
            }
            if (Quantity == '') {
                alert("Please enter Quantity");
                return false;
            }
            if (Weightage == '') {
                alert("Please enter Weightage");
                return false;
            }
        }
    </script>--%>
            <style type="text/css">
                .Validationcolors {
                    color: red;
                }
            </style>
            <section class="master-tab">
                <div class="tab-pane">
                    <div class="table-bg pt-5">
                        <div class="row">
                            <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end close-sec">
                                    <i class="fa fa-close close-sec-table"></i>
                                </div>--%>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12 text">
                                <h1 class="table-title">Cafeteria Master</h1>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-end close-sec">
                                <asp:Button ID="btnredirect" runat="server" CssClass="btn btn-primary" Text="Add Cafe Items" OnClick="btnredirect_Click" />
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12 m-auto">
                                <ul class="nav nav-tabs sub-tab">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="transaction-tab" data-bs-toggle="tab" href="#transaction" role="tab" aria-controls="transaction" aria-selected="false">View Details</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " id="data-entry-tab" data-bs-toggle="tab" href="#dataentry" role="tab" aria-controls="dataentry" aria-selected="true">Data Entry</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="tab-content sub-tab-content">
                                    <div class="tab-pane fade " id="dataentry" role="tabpanel" aria-labelledby="dataentry-tab">
                                        <div class="row mt-5">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label class="form-label cafe-label">Cafe List</label><span class="Validationcolors">*</span>
                                                    <div class="position-relative cafe-select cafe-select-grey">
                                                        <asp:DropDownList ID="ddlCategory" runat="server" Value="0" CssClass="form-select select-menu">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ControlToValidate="ddlCategory" Text="Select Cafe List" CssClass="text-danger"></asp:RequiredFieldValidator>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label class="form-label cafe-label">Item Name</label><span class="Validationcolors">*</span>
                                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" Text="Item Name Required" CssClass="text-danger"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label class="form-label cafe-label">Price</label><span class="Validationcolors">*</span>
                                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice" Text="Item Price Required" CssClass="text-danger"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label class="form-label cafe-label">Quantity</label><span class="Validationcolors">*</span>
                                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtQuantity" Text="Quantity Required" CssClass="text-danger"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label class="form-label cafe-label">Weightage</label><span class="Validationcolors">*</span>
                                                    <asp:TextBox ID="txtWeightage" runat="server" CssClass="form-control cafe-input-grey"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtWeightage" Text="Weightage Required" CssClass="text-danger"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="mb-4">
                                                    <label class="form-label cafe-label">Product Image</label><span class="Validationcolors">*</span><b style="color: red">(Applicable File format: .jpg .jpeg .png)</b>
                                                    <div>
                                                        <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control cafe-input-grey" />
                                                        <%--<b style="color: #fff">(Maximum File Size 1 MB)</b>--%>
                                                        <%--<label for="input-file"> Upload Image<i class="fa fa-cloud-upload"></i> </label>
                                                            <input id="input-file" type="file" />--%>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="fuImage" Text="Select File" CssClass="text-danger"></asp:RequiredFieldValidator>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-12 text-center mt-5">

                                                <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary cafe-btn me-0 me-lg-3 mb-2"
                                                    OnClick="btnSubmit_Click" />

                                            </div>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade show active" id="transaction" role="tabpanel" aria-labelledby="transaction-tab">
                                        <div class="row mt-5">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="table-responsive">
                                                    <asp:GridView ID="GvCafeteriaMaster" runat="server" CssClass="table-responsive"
                                                        AutoGenerateColumns="false" DataKeyNames="ItemCode" OnRowEditing="GvCafeteriaMaster_RowEditing" AllowPaging="true" AllowSorting="true" PageSize="100" Width="100%" GridLines="None">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Actions" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnEdit" runat="server" ToolTip="Edit" Text="Edit" CausesValidation="false" CommandArgument='<%#Eval("ItemCode") %>' CommandName="Edit"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Item Code" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("ItemCode") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Item Name" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("ItemDesc") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Price" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("Price") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Quantity" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("Quantity") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Weightage" HeaderStyle-ForeColor="black" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#Eval("Weightage") %>
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

                <div class="modal" id="successModal1" data-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header" style="background-image: linear-gradient(to right,#f6d538 0,#f6d538 100%); color: #01227e">
                                <h4 class="modal-title" id="myModalLabel"><b style="font-family: Calibri">Item Details</b></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row mb-12">




                                    <div class="col-md-12">
                                        <b>
                                            <label>ItemDesc</label><span class="Validationcolors">*</span>
                                            <asp:TextBox ID="ItemDesc" runat="server" CssClass="form-control" TabIndex="2" Placeholder="ItemDesc" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>

                                    <div class="col-md-12">
                                        <b>
                                            <label>Price </label>
                                            <span class="Validationcolors">*</span>
                                            <asp:TextBox ID="Price" runat="server" CssClass="form-control" TabIndex="3" Placeholder="Price" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>
                                    <div class="col-md-12">
                                        <b>
                                            <label>Quantity </label>
                                            <span class="Validationcolors">*</span>
                                            <asp:TextBox ID="Quantity" runat="server" CssClass="form-control" TabIndex="4" Placeholder="Quantity" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>
                                    <div class="col-md-12">
                                        <b>
                                            <label>Weightage </label>
                                            <span class="Validationcolors">*</span>
                                            <asp:TextBox ID="Weightage" runat="server" CssClass="form-control" TabIndex="5" Placeholder="Weightage" Width="100%"></asp:TextBox>
                                        </b>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer" style="background-image: linear-gradient(to right,#f6d538 0,#f6d538 100%); color: #FFFFFF">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClientClick="javascript:return EValidate();"
                                    OnClick="btnUpdate_Click" CausesValidation="true" ValidationGroup="Update"></asp:Button>
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal" id="companyaddsuccessModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-0">
                                <asp:Button ID="btncloseaddsuccess" runat="server" Text="Close" OnClick="btncloseaddsuccess_Click1" />
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                        <h4 class="cafe-success text-success">Item Added Successfully!!!</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal" id="errorModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-0">
                                <asp:Button ID="btncloseadderror" runat="server" CssClass="btn-close" OnClick="btncloseadderror_Click" />
                            </div>
                            <div class="modal-body">
                                <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                    <h4 class="cafe-error text-danger" id="errorLabel">Item already Exists</h4>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal" id="updatesuccessModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-0">
                                <asp:Button ID="btnUpdatesuccess" runat="server" CssClass="btn-close" OnClick="btnUpdatesuccess_Click" />
                            </div>
                            <div class="modal-body">
                                <div class="col-lg-10 col-md-12 col-sm-12 col-12 m-auto text-center mb-5">
                                    <h4 class="cafe-success text-success" id="updatesuccessLabel">Updated Successfully</h4>

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
                        $('#companyaddsuccessModal').modal('show');
                    } else if (type === 'error') {
                        // Show error modal with message
                        $('#errorModal .modal-body').text(message);
                        $('#errorModal').modal('show');
                    }
                    else if (type === 'updatesuccess') {
                        // Show success modal
                        $('#updatesuccessModal').modal('show');
                    }
                }
            </script>

           


          <%--  <!-- Essential javascripts for application to work-->
            <script src="jss/jquery-3.3.1.min.js"></script>
            <script src="jss/popper.min.js"></script>
            <script src="jss/bootstrap.min.js"></script>
            <script src="jss/main.js"></script>
            <!-- The javascript plugin to display page loading on top-->
            <script src="jss/plugins/pace.min.js"></script>
            <!-- Page specific javascripts-->--%>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:AsyncPostBackTrigger ControlID="btncloseaddsuccess" />

        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
