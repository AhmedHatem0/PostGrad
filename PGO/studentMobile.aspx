<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentMobile.aspx.cs" Inherits="postGradOffice.studentMobile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Add Mobile Number</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button CssClass="button" ID="back" runat="server" Text="Back" onclick="back_Click"/>
        <br />
        <asp:Label CssClass="label" ID="Label" runat="server" Text="Enter Your Moblie Phone Number"></asp:Label>
        <br />
        <asp:TextBox CssClass="textbox" ID="mobile" runat="server" MaxLength="20"></asp:TextBox>
        <br />
        <asp:Button CssClass="button" ID="add" runat="server" Text="Add" OnClick="add_Click"/>
        
    </form>
</body>
</html>
