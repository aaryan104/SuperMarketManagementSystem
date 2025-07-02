<%@ Page Title="" Language="C#" MasterPageFile="~/SMMS/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="SuperMarketManagementSystem.SMMS.Admin.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Asset/Lib/Bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>SMMS / Categories</title>
    <style type="text/css">
        .auto-style1 {
            width: 200px;
            height: 185px;
        }
        p {
            margin-left: 370px;
            font-size: xx-large;
        }
        h2 {
            margin-left: 35px;
        }
        #inp {
            margin-bottom: 10px;
        }
        .msag {
            margin-left: 190px;
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
        input[type="search"] {
            width: 400px;
            height: 42px;
            margin-left: 52%;
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
        .control {            
            width: 460px;
            border: 1px solid gray;
            border-radius: 5px;
            height: 30px;
        }
        span {
            font-weight: 600;
        }
        .center_text {
            text-align: center;
        }
        .auto-style2 {
            color: #FF0000;
            font-weight: bold;
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
                        <h2 class="text-danger pl-4"> Category</h2>
                        <img src="../../Asset/images/Category.jpg" class="auto-style1"/>
                    </div>
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col">
                        <form>
                            <br />
                                <div class="form-group" id="inp">
                                    <label for="CustNameTb"><span>Category Name</span>
                                    <strong>
                                    <asp:RequiredFieldValidator ID="errName" runat="server" CssClass="auto-style2" ErrorMessage="*" ValidationGroup="categoryValidation" ControlToValidate="NameTb"></asp:RequiredFieldValidator>
                                    </strong>
                                    </label>
                                    <br />
                                    &nbsp;<input type="text" class="control" id="NameTb" placeholder="Name" runat="server">
                                </div>
                                <div class="form-group" id="inp">
                                    <label for="DescTb"><span>Category Description</span>
                                    <label for="CustNameTb"><strong>
                                    <asp:RequiredFieldValidator ID="errDesc" runat="server" CssClass="auto-style2" ErrorMessage="*" ValidationGroup="categoryValidation" ControlToValidate="DescTb"></asp:RequiredFieldValidator>
                                    </strong>
                                    </label>
                                    </label>
                                    <br />
                                    &nbsp;<input type="text" class="control" id="DescTb" placeholder="Description" runat="server">
                                </div>
                            <br />
                                <label id="msg" runat="server" class="msag"></label>
                            <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="edit" runat="server" class="btn btn-warning" Text="Edit" Width="110px" OnClick="edit_Click" ValidationGroup="categoryValidation"/>
                                &nbsp;
                                <asp:Button ID="add" runat="server" class="btn btn-danger" BackColor="Green" BorderColor="Green" Text="Add" Width="110px" OnClick="add_Click" ValidationGroup="categoryValidation"/>
                                &nbsp;
                                <asp:Button ID="delete" runat="server" class="btn btn-danger" Text="Delete" Width="110px" OnClick="delete_Click"/>
                            <br />
                            <br />
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                 
                <p>Category List</p>
                    <asp:TextBox ID="SearchOpt" placeholder="Search Category Name Here"  aria-label="Search" TextMode="Search" runat="server" OnTextChanged="SearchOpt_TextChanged" AutoPostBack="True"></asp:TextBox>
                    <!-- i class="fa fa-search search-icon"></! -->
                <br />
                <br />
                <asp:GridView class="center_text table table-hover" ID="CustomerList" runat="server" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="962px" OnSelectedIndexChanged="CustomerList_SelectedIndexChanged" BackColor="White">
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
</asp:Content>
