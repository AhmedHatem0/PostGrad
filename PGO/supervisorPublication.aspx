
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supervisorPublication.aspx.cs" Inherits="PGO.supervisorPublication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>View Publications</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Student ID</div>
        <asp:TextBox CssClass="textbox" ID="SID" runat="server"></asp:TextBox>
        <br />
        <asp:Button CssClass="button" ID="Button1" runat="server" OnClick="Button1_Click" Text="Show Publications" />
        <br />
        <asp:GridView ID="grid" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
        <br />
        <asp:Button CssClass="button" ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
    </form>
</body>
</html>
