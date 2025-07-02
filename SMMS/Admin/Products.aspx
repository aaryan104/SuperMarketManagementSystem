<%@ Page Title="" Language="C#" MasterPageFile="~/SMMS/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SuperMarketManagementSystem.SMMS.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SMMS / Products</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
        .auto-style1 {
            width: 200px;
            height: 185px;
        }
        p {
            margin-left: 350px;
            font-size: xx-large;
        }
        h2 {
            margin-left: 37px;
        }
        .msag {
            margin-left: 184px;
        }
        input[type="search"] {
            width: 400px;
            height: 42px;
            margin-left: 59%;
            padding: 10px;
            padding-left: 30px;
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 25px;
            outline: none;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9;
        }
        input[type="search"]:focus {
            border-color: dimgray;
            background-color: #fff;
            /*box-shadow: 0 0 5px red;*/
        }
        input[type="search"]::placeholder {
            color: #888;
            font-style: italic;
        }
        .search-icon {
            position: absolute;
            right: 400px;
            top: 146px;
            transform: translateY(-50%);
            font-size: 20px;
            color: #888;
            pointer-events: none;
        }
        /*.bt {
            color: white;
            border-radius: 7px;
            padding: 5px;
            padding-left: 10px;
            padding-right: 10px;
            transition: 1s;
            border: 2px solid black;
        }
        .bt:hover {
            border-radius: 12px;
        }*/
        #inp {
            margin-bottom: 8px;
        }
        .control {
            width: 460px;
            border: 1px solid gray;
            border-radius: 5px;
            height: 30px;
        }
        span {
            font-weight: 600;    
        }
        .auto-style2 {
            color: #FF0000;
            font-weight: bold;
        }
        .center_text {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        document.onkeydown = function (e) {
            e = e || window.event;
            var charCode = e.which || e.keyCode;

            if (charCode == 49) { //1
                document.getElementById('<%= SearchOpt.ClientID %>').focus();
                e.preventDefault();
            }
        };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="row">
                    <div class="col"></div>
                    <div class="col">
                        <h2 class="text-danger pl-4">Products</h2>
                        <img src="../../Asset/images/Product.jpg" class="auto-style1"/>
                    </div>
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col">
                        <form>
                            <div class="form-group" id="inp">
                                <label for="NameTb"><span>Product Name</span>
                                    <asp:RequiredFieldValidator ID="errorName" runat="server" ControlToValidate="NameTb" CssClass="auto-style2" ErrorMessage="*" style="color: #FF0000" ValidationGroup="ProductValidation"></asp:RequiredFieldValidator>
                                </label>
                                    <br />
                                &nbsp;<input type="text" class="control" id="NameTb" placeholder="Name" runat="server">
                            </div>

                            <div class="form-group" id="inp">
                                <label for="CategoryTb"><span>Product Category</span>
                                    </label>
                                    <br />
                                &nbsp;<asp:DropDownList class="control" ID="CategoryTb" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="CategoryTb_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                            <div class="form-group" id="inp">
                                <label for="PriceTb"><span>Product Price</span>
                                    <asp:RequiredFieldValidator ID="errorPrice" ValidationGroup="ProductValidation" runat="server" ControlToValidate="PriceTb" CssClass="auto-style2" ErrorMessage="*" style="color: #FF0000"></asp:RequiredFieldValidator>
                                </label>
                                    <br />
                                &nbsp;<input type="number" class="control" id="PriceTb" placeholder="Price" runat="server">
                            </div>

                            <div class="form-group" id="inp">
                                <label for="QtyTb"><span>Product Qty</span>
                                    <asp:RequiredFieldValidator ID="errorQty" ValidationGroup="ProductValidation" runat="server" ControlToValidate="QtyTb" CssClass="auto-style2" ErrorMessage="*" style="color: #FF0000"></asp:RequiredFieldValidator>
                                </label>
                                    <br />
                                &nbsp;<input type="number" class="control" id="QtyTb" placeholder="Qty" runat="server">
                            </div>

                            <div class="form-group" id="inp">
                                <label for="DateTb"><span>Product Exp Date</span>
                                    </label>
                                    <br />
                                &nbsp;<input type="date" class="control" id="DateTb" runat="server">
                            </div>

                            <div class="form-group" id="inp">
                                <label for="ProdDescTb"><span>Product Description</span>
                                    <asp:RequiredFieldValidator ID="errorDesc" ValidationGroup="ProductValidation" runat="server" ControlToValidate="ProdDescTb" CssClass="auto-style2" ErrorMessage="*" style="color: #FF0000"></asp:RequiredFieldValidator>
                                </label>
                                    <br />
                                &nbsp;<input type="text" class="control" id="ProdDescTb" placeholder="Description" runat="server">
                            </div>

                            <div class="form-group" id="inp">
                                <label for="ImgTb"><span>Product Image</span>
                                    </label>
                                    <br />
                                &nbsp;<asp:FileUpload ID="ImgUpload" runat="server" />
                            </div>
                            <br />
                        
                            <label id="msg" runat="server" class="msag"></label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="edit" runat="server" class="btn btn-warning" Text="Edit" Width="110px" OnClick="edit_Click" ValidationGroup="ProductValidation"/>
                            &nbsp;
                                <asp:Button ID="add" runat="server" class="btn btn-danger" BackColor="Green" BorderColor="Green" Text="Add" Width="110px" OnClick="add_Click" ValidationGroup="ProductValidation"/>
                            &nbsp;
                                <asp:Button ID="delete" runat="server" class="btn btn-danger" Text="Delete" Width="110px" OnClick="delete_Click"/>
                            <br />
                            <br />
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
             
                <p>Products List</p>
                    <asp:TextBox ID="SearchOpt" placeholder="Search Product Name Here"  aria-label="Search" TextMode="Search" runat="server" OnTextChanged="SearchOpt_TextChanged" AutoPostBack="True"></asp:TextBox>
                    <!-- i class="fa fa-search search-icon"></! -->
                <br />
                <br />
                <div style="height: 630px; overflow-y: scroll; width: 1050px">
                    <asp:GridView class="center_text table table-hover" ID="ProductList" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" CellPadding="4" Width="1033px" OnSelectedIndexChanged="ProductList_SelectedIndexChanged" BackColor="White" ForeColor="#333333" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="PrId" HeaderText="ID" />
                            <asp:BoundField DataField="PrName" HeaderText="P. Name" />
                            <asp:BoundField DataField="PrCat" HeaderText="Category" />
                            <asp:BoundField DataField="PrPrice" HeaderText="Price" />
                            <asp:BoundField DataField="PrQty" HeaderText="Quantity" />
                            <asp:BoundField DataField="PrExpDate" HeaderText="Expiry Date" />
                            <asp:BoundField DataField="PrDesc" HeaderText="Description" />
                            <asp:TemplateField HeaderText="P. Image">
                                <ItemTemplate>
                                    <asp:Image ID="ProductImage" runat="server" ImageUrl='<%# Eval("PrImg") %>' Width="90px" Height="100px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#FE2626" Font-Bold="True" ForeColor="white" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="#353839" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                    </asp:GridView>
                </div>
            </div>          
        </div>
    </div>
</asp:Content>
