<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateExtension.aspx.cs" Inherits="PGO.UpdateExtension" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Update Extensions</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button CssClass="button" ID="Button2" runat="server" Text="Back" OnClick="Back" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Thesis Serial Number"></asp:Label>
            <br />
            <asp:TextBox CssClass="textbox" ID="SNum" runat="server"></asp:TextBox>
        </div>
        <p>
            <asp:Button CssClass="button" ID="Button1" runat="server" Text="Update by 1" OnClick="UpdateButton" />
        </p>
    </form>
</body>
</html>
