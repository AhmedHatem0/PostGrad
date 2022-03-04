<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addDefenseView.aspx.cs" Inherits="PGO.addDefenseView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Add defense</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            choose Thesis SerialNum<br />
            <asp:DropDownList CssClass="dropdown" ID="thesesNums" runat="server"></asp:DropDownList>
            <br />Enter Defense Date<br />
            <asp:TextBox CssClass="textbox" ID="DDate" runat="server" type="datetime-local"></asp:TextBox>
            <br />Enter Defense Location<br />
            <asp:TextBox CssClass="textbox" ID="DLocation" runat="server"></asp:TextBox>
            <br />
            <asp:Button CssClass="button" ID="Button1" runat="server" Text="Add Defense" OnClick="Button1_Click" />
            <br />
            Enter Examiner Name<br />
            <asp:TextBox CssClass="textbox" ID="EName" runat="server"></asp:TextBox>
            <br />is National Examiner?<br />
            <asp:TextBox CssClass="textbox" ID="IsNational" runat="server"></asp:TextBox>
            <br />Enter Field of Work<br />
            <asp:TextBox CssClass="textbox" ID="FOW" runat="server"></asp:TextBox>
            <br />Enter Password<br />
            <asp:TextBox CssClass="textbox" ID="Pass" runat="server"></asp:TextBox>


            <br />
            <asp:Button CssClass="button" ID="Button3" runat="server" Text="Add Examiner" OnClick="Button3_Click" />
            <br />
        </div>
            <asp:Button CssClass="button" ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" />
    </form>
</body>
</html>
