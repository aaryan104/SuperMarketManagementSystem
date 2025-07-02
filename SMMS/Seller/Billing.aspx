<%@ Page Title="" Language="C#" MasterPageFile="~/SMMS/Seller/Seller.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="SuperMarketManagementSystem.SMMS.Seller.Billing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript">
        window.onload = function () {
            document.onkeydown = function (e) {
                e = e || window.event;
                var charCode = e.which || e.keyCode;

                if (charCode == 191) { // "/"
                    document.getElementById('<%= GivenMoney.ClientID %>').focus();
                e.preventDefault();
            }
            if (charCode == 190) { // "."
                document.getElementById('<%= QtyTb.ClientID %>').focus();
                    e.preventDefault();
                }
            };
        };

        function confirmAction()
        {
            var result = confirm("Do you want to proceed?");
            return result; 
        }

        function PrintPanel()
        {
            var printWindow = window.open('', 'PrintGrid', 'left=200,top=200,width=1024,height=768,toolbar=0,scrollbars=1,status=0,resizable=1');
            var billDetails = document.getElementById('<%=BillList.ClientID %>');
            var item = document.getElementById('<%=countItem.ClientID %>');
            var qty = document.getElementById('<%=countQty.ClientID %>');
            var grandTotal = document.getElementById('<%=grandTotalLabel.ClientID %>');
            var Givencash = document.getElementById('<%=GivenMoney.ClientID %>');
            var Paidcash = document.getElementById('<%=CountMoney.ClientID %>');
            var sellerName = document.getElementById('<%= txtName.ClientID %>');

            console.log("BillList:", billDetails);
            console.log("Items:", item);
            console.log("Qty:", qty);
            console.log("GrandTotal:", grandTotal);
            console.log("GivenMoney:", Givencash);
            console.log("CountMoney:", Paidcash);
            console.log("Seller Name:", sellerName);

            if (!billDetails || !grandTotal || !sellerName || !Givencash || !Paidcash) {
                alert("Required elements are missing. Check your IDs and try again.");
                return;
            }
            else
            {
                printWindow.document.write('<html><head><title>Invoice Print</title>');
                printWindow.document.write('<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">');
                printWindow.document.write('<style>');
                printWindow.document.write(`
                body, th, td { 
                    font-family: 'Roboto', sans-serif; 
                }
                .header { 
                    text-align: center; margin-bottom: 12px; 
                }
                .store-details { 
                    margin-bottom: 20px; 
                }
                .footer { 
                    text-align: center; margin: 20px; 
                }
                table { 
                    width: 100%; border-collapse: collapse; 
                }
                th, td { 
                    text-align: left; padding: 8px; border-bottom: 1px solid #ddd; 
                }
                .total { 
                    text-align: right; font-weight: bold; 
                }
                b {
                    margin-right: 20px;
                }
                .hr {
                    padding-top: 20px;
                    border-top: 2px double red;
                    margin: 0 auto; 
                    text-align: center; 
                }
            `);
                printWindow.document.write('</style></head><body>');

                printWindow.document.write('<div class="header">');
                printWindow.document.write('<h1>Super Market</h1>');
                printWindow.document.write('<p>Avenue Supermarts Ltd.</p>');
                printWindow.document.write('</div>');

                printWindow.document.write('<div class="store-details">');
                printWindow.document.write('Seller Name: <b>' + sellerName.innerText + '</b><br>');
                printWindow.document.write('Date: ' + new Date().toLocaleString());
                printWindow.document.write('</div>');

                // Write the bill details
                printWindow.document.write(billDetails.outerHTML);

                printWindow.document.write('<br><br>');
                printWindow.document.write('<hr width="100%" color="red" size="2px" style="color: red">');

                // Ensure the values for items, quantity, and total are written
                printWindow.document.write('<div class="footer">');
                printWindow.document.write('Items: <b>' + item.innerText + '</b>');
                printWindow.document.write('Qty: <b>' + qty.innerText + '</b>');
                printWindow.document.write('Total: <b>' + grandTotal.innerText + '</b>');
                printWindow.document.write('</div>');

                printWindow.document.write('<div class="hr">');
                printWindow.document.write('Cash&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:   <b>' + Givencash.value + '</b><br>');
                printWindow.document.write('Balance Paid in Cash&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:   <b>' + Paidcash.innerText + '</b>');
                printWindow.document.write('</div>');

                printWindow.document.write('</body></html>');
                printWindow.document.close();

                printWindow.focus();

                setTimeout(function () {
                    printWindow.print();
                    printWindow.close();
                }, 500);

            }
            
        }
    </script>

    <style>
        #inp {
            margin-bottom: 8px;
        }
        .control {
            width: 300px;
            border: 1px solid gray;
            border-radius: 5px;
            height: 30px;
        }
        .control1 {
            width: 200px;
            border: 1px solid gray;
            border-radius: 5px;
            height: 30px;
            margin-left: 570px;
            margin-top: 15px;
        }
        span {
            font-weight: 600;    
        }
        #center_text {
            text-align: center;
        }
        .gt {
            display: flex; 
            flex-direction: column;
            align-items: center;
            color: crimson;
            font-size: large;
        }
        .item-count {
            margin-bottom: 15px; 
            text-align: center; 
        }
        .button-group {
            display: flex; 
            gap: 10px; 
            justify-content: center; 
        }
        .btPrit {
            margin-left: 60px;
        }
        .auto-style2 {
            height: 495px;
            width: 590px;
        }
        .auto-style3 {
            color: #FF0000;
        }
        a.reload {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;Welcome, <asp:Label ID="txtName" runat="server" style="color:red;font-size:larger" Text="CustName" ForeColor="#FDCD3B"></asp:Label>
    <asp:Label ID="id" runat="server" CssClass="auto-style9" ForeColor="white" Text="CustId" style="font-size: 1pt"></asp:Label>
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="row">
                    <div class="col"></div>
                    <div class="col">
                        <!--h2 class="text-danger pl-4">&nbsp;&nbsp;Selles <img src="../../Asset/images/Rupee.jpg" class="auto-style1"/></!--h2 -->
                        
                    </div>
                    <div class="col"></div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group" id="inp">
                            <label for="NameTb"><span>Product Name</span>
                                <asp:RequiredFieldValidator ID="errName" runat="server" CssClass="auto-style3" ErrorMessage="*" ValidationGroup="BillValidation" ControlToValidate="NameTb"></asp:RequiredFieldValidator>
                            </label>
                            &nbsp;<input type="text" class="control" id="NameTb" placeholder="Name" runat="server">
                        </div>

                        <div class="form-group" id="inp">
                            <label for="PriceTb"><span>Product Price<label for="NameTb">
                                <asp:RequiredFieldValidator ID="errPrice" runat="server" CssClass="auto-style3" ErrorMessage="*" ValidationGroup="BillValidation" ControlToValidate="PriceTb"></asp:RequiredFieldValidator>
                            </label>
                            </span></label>
                            &nbsp;<input type="text" class="control" id="PriceTb" placeholder="Price" runat="server">
                        </div>

                        <div class="form-group" id="inp">
                            <label for="QtyTb"><span>Product Qty<label for="NameTb">
                                <asp:RequiredFieldValidator ID="errQty" runat="server" CssClass="auto-style3" ErrorMessage="*" ValidationGroup="BillValidation" ControlToValidate="QtyTb"></asp:RequiredFieldValidator>
                            </label>
                            </span></label>
                            &nbsp;<input type="text" class="control" id="QtyTb" placeholder="Qty" runat="server">
                        </div>
                        <br />
                        
                    </div>
                    <div class="col-md-4">
                        <br />&nbsp;&nbsp;
                            <label ID="OutputBill" runat="server" class="msag"></label>
                        <br />
                            <asp:Button ID="btnAtb" runat="server" class="btn btn-danger" BackColor="Green" BorderColor="Green" Text="Add To Bill" Width="110px" OnClick="btnAtb_Click" ValidationGroup="BillValidation"/>
                        &nbsp;<br /><br />
                            <asp:Button ID="btnReset" runat="server" class="btn btn-danger" Text="Reset" Width="110px" OnClick="btnReset_Click"/>
                        &nbsp;<br /><br />
                    </div>
                </div>

                    <div class="column" id="center_text">
                        <div style="overflow-y: scroll; margin: 0 auto;" class="auto-style2">
                            <asp:GridView ID="ProductList" runat="server" AutoGenerateColumns="false" class="table table-hover" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="572px" OnSelectedIndexChanged="ProductList_SelectedIndexChanged" BorderStyle="None" HorizontalAlign="Left">
                                <Columns>
                                    <asp:BoundField DataField="PrId" HeaderText="ID" />
                                    <asp:BoundField DataField="PrName" HeaderText="P. Name" />
                                    <asp:BoundField DataField="PrPrice" HeaderText="Price" />
                                    <asp:BoundField DataField="PrQty" HeaderText="Quantity" />
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Image ID="ProductImage" runat="server" ImageUrl='<%# Eval("PrImg") %>' Width="70px" Height="80px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
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
                    </div>
                </div>


            <div class="col-md-8">
                <div class="row">
                    <!-- div class="col-5"></!--div -->
                    <div class="col"><h1 class="text-danger pl-2" style="margin: 15px 10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Client Billing</h1></div>
                </div>
                <div class="row" id="center_text">
                    <div style="height: 350px; overflow-y: scroll; width: 600px; margin: 0 auto; background-color: rgb(241, 229, 229);">
                        <asp:GridView ID="BillList" runat="server" CellPadding="4" class="table table-hover" ForeColor="#333333" GridLines="None" Width="100%" HorizontalAlign="Center">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#FE2626" Font-Bold="True" ForeColor="white" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="black" />
                            <SelectedRowStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="#353839" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                    </div>
                </div>
                    <div class="form-group" id="inp">
                        <asp:TextBox ID="GivenMoney" placeholder="Cash" runat="server" class="control1" AutoPostBack="True" OnTextChanged="GivenMoney_TextChanged" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="errMoney" runat="server" ErrorMessage="Enter Amount" ForeColor="Red" ValidationGroup="inputMoney" ControlToValidate="GivenMoney"></asp:RequiredFieldValidator>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Paid In Cash&nbsp;Rs. <asp:Label class="CountMoney" ID="CountMoney" runat="server" Text="00.00"></asp:Label>

                    </div>
                    <hr width="80%" color="red" size="4px" style="margin-left: 97px; color: red" />
                <div class="row" style="margin-top: 25px;">
                    <div class="col-11"></div>
                    <div class="gt">
                        <div class="item-count">
                            Item: <asp:Label ID="countItem" runat="server" Text="0"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                            Qty: <asp:Label ID="countQty" runat="server" Text="0"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                            Rs. <asp:Label ID="grandTotalLabel" runat="server" Text="0"></asp:Label>
                        </div>
                        <div class="button-group">
                            <asp:Button ID="btnPrint" runat="server" class="btn btn-primary" OnClientClick="PrintPanel()" Text="Print Bill" Width="110px" OnClick="btnPrint_Click" ValidationGroup="inputMoney"/>
                            <asp:Button ID="btnCancel" runat="server" class="btn btn-danger" Text="Cancel Bill" Width="110px" OnClientClick="return confirmAction();" OnClick="btnCancel_Click"/>
                            &nbsp;<a href="Billing.aspx" class="fa fa-refresh reload" style="font-size:30px;"></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content> 