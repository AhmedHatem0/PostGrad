<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListAlltheses.aspx.cs" Inherits="PGO.ListAlltheses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>List Theses</title>
    <style>
        form{
            transform: translate(-50%, -20%);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button CssClass="button" ID="Button1" runat="server" Text="Back" OnClick ="Back" />
        <br />
        <div>
            <asp:Button CssClass="button" ID="Button2" runat="server" Text="view Count of on going thesis" OnClick="OnGoing" />
            <br />
            <asp:Label CssClass="label" ID="label" runat="server" Text=""></asp:Label>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
