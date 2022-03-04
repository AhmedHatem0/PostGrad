<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentProgress.aspx.cs" Inherits="postGradOffice.studentProgress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Student Progress Reports</title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:Button CssClass="button" ID="back" runat="server" Text="Back" onclick="back_Click"/>
        <br />
        <div>
            <asp:Label CssClass="label" ID="choose" runat="server" Text="Choose Your Thesis"></asp:Label>
            <br />
            <asp:DropDownList CssClass="dropdown" ID="theses" runat="server" ></asp:DropDownList>
            <br />
            <asp:Label CssClass="label" ID="prdate" runat="server" Text="Enter Your Progress Report Date"></asp:Label>
            <br />
            <asp:TextBox CssClass="textbox" ID="date" runat="server" type="date"></asp:TextBox>
            <br />
            <asp:Button CssClass="button" ID="add" runat="server" Text="Add" OnClick="add_Click" />
            <br />
        </div>
        <br />
        <div>
            <asp:Label CssClass="label" ID="choose2" runat="server" Text="Choose Your Thesis"></asp:Label>
            <br />
            <asp:DropDownList CssClass="dropdown" ID="theses2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="theses2_SelectedIndexChanged" ></asp:DropDownList>
            <br />
             <asp:Label CssClass="label" ID="Label1" runat="server" Text="Choose Your Progress Report Number"></asp:Label>
            <br />
            <asp:DropDownList CssClass="dropdown" ID="report" runat="server" ></asp:DropDownList>
            <br />
            <asp:Label CssClass="label" ID="st" runat="server" Text="Enter Your Progress Report State"></asp:Label>
            <br />
            <asp:TextBox CssClass="textbox" ID="state" runat="server" type="number" min="0"></asp:TextBox>
            <br />
            <asp:Label CssClass="label" ID="desc" runat="server" Text="Enter Your Progress Report Description"></asp:Label>
            <br />
            <asp:TextBox CssClass="textbox" ID="description" runat="server" Height="240px" MaxLength="300"></asp:TextBox>
            <br />
            <asp:Button CssClass="button" ID="fill" runat="server" Text="Fill" OnClick="fill_Click" />
            <br />
        </div>

    </form>
</body>
</html>
