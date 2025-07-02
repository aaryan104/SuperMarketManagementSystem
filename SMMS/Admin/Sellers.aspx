<%@ Page Title="" Language="C#" MasterPageFile="~/SMMS/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Sellers.aspx.cs" Inherits="SuperMarketManagementSystem.SMMS.Admin.Sellers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SMMS / Seller</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            margin-left: 60px;
        }
        #inp {
            margin-bottom: 8px;
        }
        .msag {
            margin-left: 184px;
        }
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
       /* .bt {
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
        }
        .center_text {
            text-align: center;
        }
    </style>
    <script>
        document.onkeydown = function (e)
        {
            e = e || window.event;
            var charCode = e.which || e.keyCode;
            /*
            if (charCode == 49) { //1
                document.getElementById('%= NameTb.ClientID %>').focus();
                e.preventDefault();
            }
            if(charCode==50) { //2
                document.getElementById('%= EmailTb.ClientID %>').focus();
                e.preventDefault();
            }
            if(charCode==51) { //3
                document.getElementById('%= PasswordTb.ClientID %>').focus();
                e.preventDefault();
            }
            if(charCode==52) { //4
                document.getElementById('%= PhoneTb.ClientID %>').focus();
                e.preventDefault();
            }
            if(charCode==53) { //5
                document.getElementById('%= AddressTb.ClientID %>').focus();
                e.preventDefault();
            }  54  = 6
            
            if(charCode==49) { //1
                document.getElementById('%= SearchOpt.ClientID %>').focus();
                e.preventDefault();
            }
            
            if(charCode==48) { //0
                document.getElementById('%= add.ClientID %>').focus();
                e.preventDefault();
            }
            */
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
                        <h2 class="text-danger pl-4">Seller</h2>
                        <img src="../../Asset/images/Customer.jpg" class="auto-style1"/>
                    </div>
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col">
                        <form>
                            <div class="form-group" id="inp">
                                <label for="CustNameTb"><span>Seller Name</span>
                                <asp:RequiredFieldValidator ID="errorName" runat="server" ValidationGroup="SellerValidation" ErrorMessage="*" ControlToValidate="NameTb" CssClass="auto-style2"></asp:RequiredFieldValidator>
                                </label>
                                <br />
                                &nbsp;<input type="text" class="control" id="NameTb" placeholder="Name" runat="server">
                            </div>

                            <div class="form-group" id="inp">
                                <label for="EmailTb"><span>Seller Email</span>
                                <asp:RequiredFieldValidator ID="errorEm" runat="server" ValidationGroup="SellerValidation" ErrorMessage="*" ControlToValidate="EmailTb" CssClass="auto-style2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="errorEmail" runat="server" ErrorMessage="Enter Valid Email!" ControlToValidate="EmailTb" CssClass="auto-style2" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </label>
                                <br />
                                &nbsp;<input type="text" class="control" id="EmailTb" placeholder="Email" runat="server">
                            </div>

                            <div class="form-group" id="inp">
                                <label for="PasswordTb"><span>Seller Password</span>
                                <asp:RequiredFieldValidator ID="errorPass" runat="server" ValidationGroup="SellerValidation" ErrorMessage="*" ControlToValidate="PasswordTb" CssClass="auto-style2"></asp:RequiredFieldValidator>
                                </label>
                                <br />
                                &nbsp;<input type="text" class="control" id="PasswordTb" placeholder="Password" runat="server">
                            </div>

                            <div class="form-group" id="inp">
                                <label for="PhoneTb"><span>Seller Phone</span>
                                <asp:RequiredFieldValidator ID="errorPhone" runat="server" ValidationGroup="SellerValidation" ErrorMessage="*" ControlToValidate="PhoneTb" CssClass="auto-style2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="errorPho" runat="server" ControlToValidate="PhoneTb" CssClass="auto-style2" ErrorMessage="Enter Valid Number!" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                                </label>
                                <br />
                                &nbsp;<input type="text" class="control" id="PhoneTb" placeholder="Phone" runat="server">
                            </div>

                            <div class="form-group" id="inp">
                                <label for="AddressTb"><span>Seller Address</span>
                                <asp:RequiredFieldValidator ID="errorAdd" runat="server" ValidationGroup="SellerValidation" ErrorMessage="*" ControlToValidate="AddressTb" CssClass="auto-style2"></asp:RequiredFieldValidator>
                                </label>
                                <br />
                                &nbsp;<input type="text" class="control" id="AddressTb" placeholder="Address" runat="server">
                            </div>
                            <br />
                            
                            <label id="msg" runat="server" class="msag"></label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="edit" runat="server" class="btn btn-warning" Text="Edit" Width="110px" OnClick="edit_Click" ValidationGroup="SellerValidation"/>
                            &nbsp;
                                <asp:Button ID="add" runat="server" class="btn btn-danger" BackColor="Green" BorderColor="Green" Text="Add" Width="110px" OnClick="add_Click" ValidationGroup="SellerValidation"/>
                            &nbsp;
                                <asp:Button ID="delete" runat="server" class="btn btn-danger" Text="Delete" Width="110px" OnClick="delete_Click"/>
                            <br />
                            <br />
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                 
                <p>Seller List</p>
                    <asp:TextBox ID="SearchOpt" placeholder="Search Seller Name Here"  aria-label="Search" TextMode="Search" runat="server" OnTextChanged="SearchOpt_TextChanged" AutoPostBack="True"></asp:TextBox>
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
