<%@ Page Title="" Language="C#" MasterPageFile="~/SMMS/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductSells.aspx.cs" Inherits="SuperMarketManagementSystem.SMMS.Admin.ProductSells" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .table {
            margin-top: 3%;
        }
        input[type="search"] {
            width: 250px;
            height: 42px;
            /*display: block;*/
            padding: 10px;
            margin-top: 20px;
            padding-left: 35px;
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
        /*.search-icon {
            position: absolute;
            right: 937px;
            top: 102px;
            transform: translateY(-50%);
            font-size: 20px;
            color: #888;
            pointer-events: none;
        }*/
        a.reload {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; margin-top: 20px;">
        <asp:TextBox ID="SearchOpt" placeholder="Search Seller Name Here" aria-label="Search" TextMode="Search" runat="server" AutoPostBack="True" OnTextChanged="SearchOpt_TextChanged1"></asp:TextBox>
        <asp:TextBox ID="SearchOpt2" placeholder="Search Product Name Here" aria-label="Search" TextMode="Search" runat="server" AutoPostBack="True" OnTextChanged="SearchOpt_TextChanged2"></asp:TextBox>
        <asp:TextBox ID="SearchOpt3" placeholder="Search Bill No. Here" aria-label="Search" TextMode="Search" runat="server" AutoPostBack="True" OnTextChanged="SearchOpt_TextChanged3"></asp:TextBox>
        &nbsp;
        <a href="ProductSells.aspx" class="fa fa-refresh reload" style="font-size:30px;"></a>

    </div>
    <!-- i class="fa fa-search search-icon"></! -->
    <div style="height: 650px; overflow-y: scroll; width: 1000px; margin-left:auto; margin-right:auto">
        <asp:GridView ID="ProductsList" runat="server" class="table table-hover" 
        CellPadding="4" ForeColor="#333333" GridLines="None" Width="980px" 
        BorderStyle="None" HorizontalAlign="Center" DataKeyNames="Id">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#FE2626" Font-Bold="True" ForeColor="white" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center"/>
            <RowStyle BackColor="White" ForeColor="black" />
            <SelectedRowStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="#353839" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    </div>
</asp:Content>