<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Issuethesispayment.aspx.cs" Inherits="PGO.Issuethesispayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Issue Payment</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button CssClass="button" ID="Button2" runat="server" Text="Back" OnClick="Back" />
            <br />
        Serial Number<br />
        <asp:TextBox CssClass="textbox" ID="SNum" runat="server" OnTextChanged="SNum_TextChanged" type="number"></asp:TextBox>
            <br />
            Amount<br />
        <asp:TextBox CssClass="textbox" ID="Amount" runat="server" type="number"></asp:TextBox>
            <br />
            Number of Installments<br />
        
        <asp:TextBox CssClass="textbox" ID="NumInstallment" runat="server" type="number"></asp:TextBox>
            <br />
             Fund percentage<br />
             <asp:TextBox CssClass="textbox" ID="FundPercentage" runat="server" type="number"></asp:TextBox>
        <br />
        <asp:Button CssClass="button" ID="Button1" runat="server" Text="Issue" OnClick="Issue" />
        </div>
    </form>
</body>
</html>
