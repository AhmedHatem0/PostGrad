<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentPublication.aspx.cs" Inherits="postGradOffice.studentPublication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="normalize.css" />
    <link rel="stylesheet" href="Style.css" />
    <title>Student Publications</title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:Button CssClass="button" ID="back" runat="server" Text="Back" onclick="back_Click"/>
        <br />
         <div>
             <asp:Label CssClass="label" ID="Label1" runat="server" Text="Tilte"></asp:Label>
             <br />
             <asp:TextBox CssClass="textbox" ID="title" runat="server" MaxLength="50"></asp:TextBox>
             <br />
             <asp:Label CssClass="label" ID="Label2" runat="server" Text="Publication Date"></asp:Label>
             <br />
             <asp:TextBox CssClass="textbox" ID="pubDate" runat="server" type="datetime-local"></asp:TextBox>
             <br />
             <asp:Label CssClass="label" ID="Label3" runat="server" Text="Host"></asp:Label>
             <br />
             <asp:TextBox CssClass="textbox" ID="host" runat="server" MaxLength="50"></asp:TextBox>
             <br />
             <asp:Label CssClass="label" ID="Label4" runat="server" Text="Place"></asp:Label>
             <br />
             <asp:TextBox CssClass="textbox" ID="place" runat="server" MaxLength="50"></asp:TextBox>
             <br />
             <asp:Label CssClass="label" ID="Label5" runat="server" Text="Accepted"></asp:Label>
             <br />
             <asp:DropDownList CssClass="dropdown" ID="accept" runat="server" >
                 <asp:ListItem Value="True">Yes</asp:ListItem>
                 <asp:ListItem Value="False">No</asp:ListItem>
             </asp:DropDownList>
             <br />
             <asp:Button CssClass="button" ID="add" runat="server" Text="Add Publication" OnClick="add_Click" />
        </div>
        <br />
        <div>
            <asp:Label CssClass="label" ID="Label6" runat="server" Text="Publication ID"></asp:Label>
            <br />
            <asp:DropDownList CssClass="dropdown" ID="publication" runat="server" AutoPostBack="true"></asp:DropDownList>
            <br />
            <asp:Label CssClass="label" ID="Label7" runat="server" Text="Thesis serial Number"></asp:Label>
            <br />
            <asp:DropDownList CssClass="dropdown" ID="theses" runat="server"></asp:DropDownList>
            <br />
             <asp:Button CssClass="button" ID="link" runat="server" Text="Link Publication To Thesis" OnClick="link_Click"  />

        </div>
    </form>
</body>
</html>
