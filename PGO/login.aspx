<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="postGradOffice.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <asp:Label CssClass="label" ID="email_label" runat="server" Text="Enter Your Email"></asp:Label>
        <br />
        <asp:TextBox CssClass="textbox" ID="email" runat="server"></asp:TextBox>
        <br />
        <asp:Label CssClass="label" ID="password_label" runat="server" Text="Enter Your Password"></asp:Label>
        <br />
        <asp:TextBox CssClass="textbox" ID="password" runat="server" type="password"></asp:TextBox>
        <br />
        <asp:Button CssClass="button" ID="log" runat="server" OnClick="log_Click" Text="login" />
        <br />
        <asp:Button CssClass="button" ID="register" runat="server" OnClick="register_Click" Text="Register New User" />
    </form>
</body>
</html>
