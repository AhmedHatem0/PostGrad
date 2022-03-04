<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supervisor.aspx.cs" Inherits="PGO.supervisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Supervisor</title>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Button CssClass="button" ID="studentsInfo" runat="server" Text="View Students Information" OnClick="studentsInfo_Click" Width="286px" />
        <br />
        <br />
        <asp:Button CssClass="button" ID="ViewAStudentPublications" runat="server" Text="View Student's Publications" OnClick="ViewAStudentPublications_Click" Width="286px" />
        <br />
        <br />
        <asp:Button CssClass="button" ID="AddDefense" runat="server" Text="Add Defense For a Thesis" OnClick="AddDefense_Click" Width="286px" />
        <br />
        <br />
        <asp:Button CssClass="button" ID="evaluate" runat="server" Text="Evaluate Progress Report" OnClick="evaluate_Click" Width="286px" />
        <br />
        <br />
        <asp:Button CssClass="button" ID="Button1" runat="server" Text="Cancel a Thesis" OnClick="Button1_Click" Width="286px" />
    </form>
</body>
</html>
