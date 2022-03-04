<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addComment.aspx.cs" Inherits="postgrad_office.addComment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Add Comment</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label CssClass="label" ID="Label1" runat="server" Text="Thesis serial number"></asp:Label>
            <br />
            <asp:TextBox CssClass="textbox" ID="serial" runat="server" type="number"></asp:TextBox>
            <br />
            <asp:Label CssClass="label" ID="Label2" runat="server" Text="Defense date"></asp:Label>
            <br />
            <asp:TextBox CssClass="textbox" ID="date" runat="server" type="datetime-local"></asp:TextBox>
            <br />
            <asp:Label CssClass="label" ID="Label3" runat="server" Text="Commment"></asp:Label>
            <br />
            <asp:TextBox CssClass="textbox" ID="com" runat="server" Height="300px"></asp:TextBox>
            <br />
        <asp:Button CssClass="button" ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
        <asp:Button CssClass="button" ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" />
            <br />
            <asp:Label CssClass="label" ID="Label4" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
