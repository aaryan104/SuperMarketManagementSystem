<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="drop.aspx.cs" Inherits="SuperMarketManagementSystem.drop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .dropdown {
            background-color: black;
            color: white;
            border: 2px solid black;
            height: 30px;
            width: 250px;
            font-size: medium;
            border-radius: 20px;
            padding-left: 20px;
            transition: 1s ease;
        }
        .dropdown:active {
            transform: scale(1.05);
        }
        
    </style>
    <script>
        function Validate()
        {
            var name;

            name = document.getElementById("txtName").value;

            if (name == '') {
                alert("Enter Name Field!");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList class="dropdown"  ID="city" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="city_SelectedIndexChanged">
            </asp:DropDownList>
            <br /><br /><br />
            <form>
                Enter Name
                <asp:TextBox ID="txtName" runat="server" required></asp:TextBox>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            </form>
        </div>
    </form>
</body>
</html>
