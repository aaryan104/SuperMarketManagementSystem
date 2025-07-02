<%@ Page Title="" Language="C#" MasterPageFile="~/SMMS/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SuperMarketManagementSystem.SMMS.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nm {
            margin-left: 40px;
        }
        .control {
            background-color: black;
            color: white;
            border: 2px solid black;
            height: 30px;
            width: 280px;
            font-size: medium;
            border-radius: 2em / 5em;
            padding-left: 10px;
            transition: 1s ease;
        }
        .control:active {
            transform: scale(1.05);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid">
        <div class="row" style="height:100px">
            <div class="col-md-4"></div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-1"><img src="../../Asset/images/dashboard.jpg" height="40px" width="30px" class="rounded" /> </div>
                    <div class="nm col-8"> <h2 class="text-danger" style="margin-top:25px;">SuperMarket Dashboard</h2></div>
                </div>
            </div>
        </div>

        <br />

        <!-- ******************************************************************************************** -->
        <div class="row">
            <div class="col-1" style="margin-left:40px"></div>
            <div class="col-10" style="padding-top:9px;">
                <div class="row" style="padding-top:20px;">
                    
                    <div class="col-md-3 rounded" style="background-color:#7D161D">
                        <div class="row" style="padding:20px">
                            <div class="col-md-2"><img src="../../Asset/images/d1.jpg" height="55px" width="50px" style="margin-top:9px"/></div>
                            <div class="col-md-10">
                                <h2 class="nm text-white" style="padding-top:10px;padding-left:10px">Products</h2>
                                <h2 class="nm text-white">
                                    <asp:Label ID="CountProduct" runat="server" Text="0" style="padding-left:10px"></asp:Label></h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-1 bg-white">
                        
                    </div>

                    <div class="col-md-3 bg-warning rounded">
                        <div class="row" style="padding:20px">
                            <div class="col-md-2"><img src="../../Asset/images/d2.jpg" style="border:2px solid #FFC107" /></div>
                            <div class="col-md-10">
                                <h2 class="nm" style="padding-top:10px;padding-left:10px">Category</h2>
                                <h2 class="nm">
                                    <asp:Label ID="CountCategory" runat="server" Text="0" style="padding-left:10px"></asp:Label></h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-1 bg-white">
    
                    </div>

                    <div class="col-md-3 bg-primary rounded">
                        <div class="row" style="padding:20px">
                            <div class="col-md-2"><img src="../../Asset/images/d3.jpg" height="55px" width="50px"/></div>
                            <div class="col-md-10">
                                <h2 class="nm text-white" style="padding-top:10px;padding-left:10px">Finance</h2>
                                <h2 class="nm text-white">
                                    <asp:Label ID="CountFinance" runat="server" Text="0" style="padding-left:10px"></asp:Label></h2>
                            </div>
                        </div>
                    </div>   

                    <div class="col-md-1 bg-white">
    
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
        <!-- ******************************************************************************************** -->
            <div class="row mb-5 md-5"></div>
        <!-- ******************************************************************************************** -->
        <div class="row">
            <div class="col-1" style="margin-left:40px"></div>
            <div class="col-10">
                <div class="row">
            
                    <div class="row mb-2 md-2">
                        <div class="form-group" id="inp">
                            &nbsp;<asp:DropDownList class="control" ID="SellerTb" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="CategoryTb_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-3 bg-info rounded">
                        <div class="row" style="padding:20px">
                            <div class="col-md-2"><img src="../../Asset/images/d4.jpg" height="60px" width="40px" style="margin-top:9px;padding-right:5px"/></div>
                            <div class="col-md-10" style="padding-left:20px">
                                <h4 class="nm text-white" style="padding-top:10px;padding-bottom:5px">Seller Wise Amount</h4>
                                <h2 class="nm text-white">
                                    <asp:Label ID="CountSellerAmount" runat="server" Text="0"></asp:Label></h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-1 bg-white">
                
                    </div>

                    <div class="col-md-3 bg-secondary rounded">
                        <div class="row" style="padding:18px">
                            <div class="col-md-2"><img src="../../Asset/images/d5.jpg" height="60px" width="50px" style="margin-top:9px;padding-right:5px;" /></div>
                            <div class="col-md-10" style="padding-left:20px">
                                <h2 class="nm text-white" style="padding-top:15px;padding-left:10px;padding-bottom:10px">Total Sells</h2>
                                <h2 class="nm text-white">
                                    <asp:Label ID="CountSells" runat="server" Text="0" style="padding-left:10px"></asp:Label></h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-1 bg-white">
    
                    </div>

                    <div class="col-md-3 bg-danger rounded">
                        <div class="row" style="padding:20px">
                            <div class="col-md-2"><img src="../../Asset/images/d6.jpg" height="60px" width="50px" style="margin-top:9px" /></div>
                            <div class="col-md-10">
                                <h2 class="nm text-white" style="padding-top:10px;padding-left:10px">Sellers</h2>
                                <h2 class="nm text-white">
                                    <asp:Label ID="CountSeller" runat="server" Text="0" style="padding-left:10px"></asp:Label></h2>
                            </div>
                        </div>
                    </div>   

                    <div class="col-md-1 bg-white">
    
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
        <!-- ******************************************************************************************** -->
    </div>
</asp:Content>
