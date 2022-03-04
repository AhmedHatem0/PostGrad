<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditInfo.aspx.cs" Inherits="postgrad_office.EditInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Edit Info</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label CssClass="label" ID="Label1" runat="server" Text="New name"></asp:Label>
            <br />
            <asp:TextBox CssClass="textbox" ID="UpdateName" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <asp:Label CssClass="label" ID="Label2" runat="server" Text="New field of work"></asp:Label>
            <br />
            <asp:TextBox CssClass="textbox" ID="UpdateField" runat="server"></asp:TextBox>
            <br />
        </div>
        <asp:Button CssClass="button" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
        <asp:Button CssClass="button" ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" />
        <br />
        <asp:Label CssClass="label" ID="Label3" runat="server" Text=" "></asp:Label>
    </form>
</body>
</html>
