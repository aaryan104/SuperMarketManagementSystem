<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registered.aspx.cs" Inherits="SuperMarketManagementSystem.SMMS.registered" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMMS / Register</title>
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'>
    <style>
        /* Google Fonts - Poppins */
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap");

        * {
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
            margin-right: 0;
            margin-top: 0;
            margin-bottom: 0;
        }
        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(150deg, #fe2626 45%, #fff 45%);
        }
        .container {
            position: relative;
            max-width: 450px;
            width: 61%;
            padding: 25px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4);
            top: 0px;
            left: 0px;
            height: 600px;
            text-align: center;
        }
        .container header {
            font-size: 22px;
            text-align: center;
            font-weight: 600;
            color: #333;
        }
        .container form {
            margin-top: 30px;
        }
        form .field {
            margin-bottom: 20px;
        }
        form .input-field {
            position: relative;
            height: 55px;
            width: 100%;
        }
        .input-field input {
            height: 100%;
            width: 100%;
            outline: none;
            border: none;
            border-radius: 8px;
            padding: 0 15px;
            border: 1px solid #d1d1d1;
        }
        .input-fields input {
            outline: none;
            border: none;
            border-radius: 80px;
            border: 1px solid #d1d1d1;
        }
        .invalid input {
            border-color: #d93025;
        }
        .input-field .show-hide {
            position: absolute;
            right: 13px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: #919191;
            cursor: pointer;
            padding: 3px;
        }
        .field .error {
            display: flex;
            align-items: center;
            margin-top: 6px;
            color: #d93025;
            font-size: 13px;
            display: none;
        }
        .invalid .error {
            display: flex;
        }
        .error .error-icon {
            margin-right: 6px;
            font-size: 15px;
        }
        .create-password .error {
            align-items: flex-start;
        }
        .create-password .error-icon {
            margin-top: 4px;
        }
        .button {
            margin: 0 0 6px;
        }
        .button input {
            color: #fff;
            font-size: 16px;
            font-weight: 450;
            background-color: #fe2626;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            width: 259px;
            height: 47px;
            border: 3px solid #fe2626;
        }
        .button input:hover {
            color: #fe2626;
            background-color: #fff;
            border: 3px solid #fe2626;
        }
        .button input:active {
            transform: scale(0.95);
        }
        .auto-style1 {
            font-weight: normal;
            color: #FE2626;
        }
        .auto-style2 {
            color: #000000;
        }
        a {
            text-decoration: none;
        }
        label {
            color: #FE2626;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="auto-style1">Create Account</h2>
        <form action="#" runat="server">
            <div class="field name-field">
                <div class="input-field">
                    <asp:TextBox ID="NameTb" runat="server" type="text" placeholder="Enter your name" class="name"></asp:TextBox>
                </div>
            </div>

            <div class="field phone-field">
                <div class="input-field">
                    <asp:TextBox ID="PhoneTb" runat="server" type="number" placeholder="Enter your phone number" class="phone"></asp:TextBox>
                </div>
            </div>

            <div class="field email-field">
                <div class="input-field">
                    <asp:TextBox ID="EmailTb" runat="server" type="email" placeholder="Enter your email" class="email"></asp:TextBox>
                </div>
            </div>

            <div class="field confirm-password">
                <div class="input-field">
                    <asp:TextBox ID="PasswordTb" runat="server" type="text" placeholder="Enter password" class="cPassword"></asp:TextBox>
                </div>
            </div>

            <div class="field Address-field">
                <div class="input-field">
                    <asp:TextBox ID="AddressTb" runat="server" type="text" placeholder="Enter your address" class="address"></asp:TextBox>
                </div>
            </div>
            
            <div class="input-fields button">
                <label id="msg" runat="server"></label>
                <br />
                <a href="login.aspx"><span class="auto-style2">Login Now?</span></a>
                <br />
                <asp:Button ID="btn" runat="server" Text="Submit Now" OnClick="btn_Click" />
                <br />
                <a href="Home.aspx"><span class="auto-style2">Go Back</span></a>

            </div>
        </form>
    </div>
</body>
</html>
