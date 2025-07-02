<%@ Page Title="" Language="C#" MasterPageFile="~/SMMS/Seller/Seller.Master" AutoEventWireup="true" CodeBehind="BillHistory.aspx.cs" Inherits="SuperMarketManagementSystem.SMMS.Seller.BillHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table {
            margin-top: 3%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:GridView ID="ProductList" runat="server" class="table table-hover" 
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="800px" 
            BorderStyle="None" HorizontalAlign="Center" OnSelectedIndexChanged="ProductList_SelectedIndexChanged">
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
</asp:Content>
