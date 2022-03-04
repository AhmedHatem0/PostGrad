<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="postGradOffice.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Register New User</title>
</head>
<body>      
    <form id="form1" runat="server">
        <asp:Button CssClass="button" ID="back" runat="server" Text="Back" onclick="back_Click"/>
        <br />
        <asp:DropDownList CssClass="dropdown" ID="type" runat="server" OnSelectedIndexChanged="type_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem>Student</asp:ListItem>
            <asp:ListItem>Supervisor</asp:ListItem>
            <asp:ListItem>Examiner</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:panel id="general" runat="server">
            <asp:Label CssClass="label" ID="Label1" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox CssClass="textbox" ID="first_name" runat="server"></asp:TextBox>
            <br />
            <asp:Label CssClass="label" ID="Label2" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox CssClass="textbox" ID="last_name" runat="server"></asp:TextBox>
            <br />
            <asp:Label CssClass="label" ID="Label3" runat="server" Text="Email"></asp:Label>
            <asp:TextBox CssClass="textbox" ID="email" runat="server"></asp:TextBox>
            <br />
            <asp:Label CssClass="label" ID="Label4" runat="server" Text="Password"></asp:Label>
            <asp:TextBox CssClass="textbox" ID="password" runat="server"></asp:TextBox>
        </asp:panel>
        <asp:panel id="student" runat="server">
            <asp:Label CssClass="label" ID="Label5" runat="server" Text="Faculty"></asp:Label>
            <asp:TextBox CssClass="textbox" ID="faculty" runat="server"></asp:TextBox>
            <br />
            <asp:Label CssClass="label" ID="Label6" runat="server" Text="Address"></asp:Label>
            <asp:TextBox CssClass="textbox" ID="address" runat="server"></asp:TextBox>
            <br />
            <asp:Label CssClass="label" ID="Label7" runat="server" Text="Are You Gucian?"></asp:Label>
            <asp:DropDownList CssClass="dropdown" ID="gucian" runat="server">
                <asp:ListItem Value="True">Yes</asp:ListItem>
                <asp:ListItem Value="False">No</asp:ListItem>
            </asp:DropDownList>
        </asp:panel>
        <asp:panel id="supervisor" runat="server">
            <asp:Label CssClass="label" ID="Label8" runat="server" Text="Faculty"></asp:Label>
            <asp:TextBox CssClass="textbox" ID="faculty2" runat="server"></asp:TextBox>
        </asp:panel>
        <asp:panel id="examiner" runat="server">
            <asp:Label CssClass="label" ID="Label9" runat="server" Text="Field Of Work"></asp:Label>
            <asp:TextBox CssClass="textbox" ID="field" runat="server"></asp:TextBox>
            <br />
             <asp:Label CssClass="label" ID="Label10" runat="server" Text="Are You National?"></asp:Label>
            <asp:DropDownList CssClass="dropdown" ID="national" runat="server">
                <asp:ListItem Value="True">Yes</asp:ListItem>
                <asp:ListItem Value="False">No</asp:ListItem>
            </asp:DropDownList>
        </asp:panel>
        <asp:Button CssClass="button" ID="reg" runat="server" Text="Register" OnClick="reg_Click" />    
    </form>  
</body>
</html>
