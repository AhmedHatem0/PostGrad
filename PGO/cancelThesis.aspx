<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancelThesis.aspx.cs" Inherits="PGO.cancelThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Cancel Thesis</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Thesis Number<br />
            <asp:TextBox CssClass="textbox" ID="snum" runat="server"></asp:TextBox>
            <br />
            <asp:Button CssClass="button" ID="Button1" runat="server" Text="Cancel Thesis" OnClick="Button1_Click" />
            <br />
            <asp:Button CssClass="button" ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
