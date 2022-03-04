<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Issuepaymentinstallment.aspx.cs" Inherits="PGO.Issuepaymentinstallment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Issue Installments</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button CssClass="button" ID="Button1" runat="server" Text="Back" OnClick="Back" />
            <br />
            choose the starting date</div>
        <asp:Calendar ID="datepicker" runat="server" OnSelectionChanged="datepicker_SelectionChanged1" BackColor="White" BorderColor="Black" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" Width="400px" DayNameFormat="Shortest" TitleFormat="Month" >
            <DayHeaderStyle Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" BackColor="#CCCCCC" />
            <DayStyle Width="14%" />
            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
            <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
            <TodayDayStyle BackColor="#CCCC99" />
        </asp:Calendar>
        Please entre payment ID<asp:Label CssClass="label" ID="Label1" runat="server" Text="Label" Visible ="false"></asp:Label>
        <br />
        <asp:TextBox CssClass="textbox" ID="paymentID" runat="server" type="number"></asp:TextBox>
        <br />
        <asp:Button CssClass="button" ID="Issue" runat="server" Text="Issue" OnClick="IssueInstall" />

    </form>
</body>
</html>
