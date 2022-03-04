<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thesisSearch.aspx.cs" Inherits="postgrad_office.thesisSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Thesis Search</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div>
            <asp:Label CssClass="label" ID="Label1" runat="server" Text="Search for thesis"></asp:Label>
            <br />
            <asp:TextBox CssClass="textbox" ID="Key" runat="server"></asp:TextBox>
            <br />
            <asp:Button CssClass="button" ID="Button2" runat="server" Text="Search" OnClick="Button2_Click" Height="50px" Width="215px" />
            <asp:GridView ID="GridView1" runat="server" Height="316px" Width="1287px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
        <asp:Button CssClass="button" ID="Button1" runat="server" Text="Back" Height="50px" OnClick="Button1_Click" Width="215px" />
        </div>
    </form>
</body>
</html>
