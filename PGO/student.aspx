<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="postGradOffice.student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Student</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button CssClass="button" ID="profile" runat="server" OnClick="profile_Click" Text="View My Profile"/>
            <br />
            <br />
            <asp:Button CssClass="button" ID="theses" runat="server" OnClick="theses_Click" Text="View My Theses"  />
            <br />
            <asp:Panel ID="coursesPanel" runat="server">
                <br />
                <asp:Button CssClass="button" ID="courses" runat="server" OnClick="courses_Click" Text="View My Courses"/>
                <br />
            </asp:Panel>
            <br />
            <asp:Button CssClass="button" ID="progress" runat="server" OnClick="progress_Click" Text="Add And Fill Progress Report" />
            <br />
            <br />
            <asp:Button CssClass="button" ID="publication" runat="server" OnClick="publication_Click" Text="Add And Link Publications"  />
            <br />
            <br />
            <asp:Button CssClass="button" ID="mobile" runat="server" OnClick="mobile_Click" Text="Add Mobile Phone"  />
        </div>
    </form>
</body>
</html>
