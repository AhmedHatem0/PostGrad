<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="evaluateReport.aspx.cs" Inherits="PGO.evaluateReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Evaluate Progress Report</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            choose thesis<br />
            <asp:DropDownList CssClass="dropdown" ID="thesesNums" runat="server" type="number" AutoPostBack="True" OnSelectedIndexChanged="thesesNums_SelectedIndexChanged" >
            </asp:DropDownList>
            <br />choose progress report number<br />
            <asp:DropDownList CssClass="dropdown" ID="reportsNums" type="number" runat="server" >
            </asp:DropDownList>
            <br />
            set evaluation<br />
            <asp:TextBox CssClass="textbox" ID="TextBox1" type="number" min="0" Max="3" runat="server"></asp:TextBox>
            <br />
            <asp:Button CssClass="button" ID="Button1" runat="server" Text="submit evaluation" OnClick="Button1_Click" />
            <br />
            <br />
        </div>
        <asp:Button CssClass="button" ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" />
    </form>
</body>
</html>
