<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examiner.aspx.cs" Inherits="postgrad_office.Examiner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Examiner</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Button CssClass="button" ID="Button1" runat="server" Text="Edit info" OnClick="Button1_Click" />
            <br />
            <asp:Button CssClass="button" ID="Button2" runat="server" Text="My theses info" OnClick="Button2_Click" />   
            <br />
            <asp:Button CssClass="button" ID="Button3" runat="server" Text="Comment on a defense" OnClick="Button3_Click" />
            <br />
            <asp:Button CssClass="button" ID="Button4" runat="server" Text="Evaluate a defense" OnClick="Button4_Click" />  
            <br />
            <asp:Button CssClass="button" ID="Button5" runat="server" Text="Search for thesis" OnClick="Button5_Click1" />
            
        </div>
    </form>
</body>
</html>
