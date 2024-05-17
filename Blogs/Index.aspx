<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Blogs.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="MENU"></asp:Label>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Autores.aspx">Gestionar Autores</asp:HyperLink>
            <br>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Blogs.aspx">Gestionar Blogs</asp:HyperLink>
        </p>
    </form>
</body>
</html>
