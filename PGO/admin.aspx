<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="postGradOffice.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Admin</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button CssClass="button" ID="listSup" runat="server" Text="List All Supervisors" OnClick ="ListSup" />
        <p>
            <asp:Button CssClass="button" ID="listthesis" runat="server" Text="List all theses" OnClick ="ListThesis" />
        </p>
        <asp:Button CssClass="button" ID="issuepayment" runat="server" Text="Issue a thesis payment" OnClick="IssuePayment" />
        <p>
            <asp:Button CssClass="button" ID="issueinstallment" runat="server" Text="Issue a payment installment" OnClick ="IssueInstallment" />
        </p>
        <p>
            <asp:Button CssClass="button" ID="updateextension" runat="server" Text="Update number of thesis extension" OnClick="UpdateExtension" />
        </p>
    </form>
</body>
</html>
