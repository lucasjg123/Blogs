<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blogs.aspx.cs" Inherits="Blogs.Blogs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Index.aspx">Menu</asp:HyperLink><br><br>
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="BLOGS"></asp:Label>
            <br>
            <asp:Label ID="Label1" runat="server" Text="Texto:"></asp:Label>
            <br>
            <asp:TextBox ID="txtTexto" runat="server" TextMode="MultiLine" Height="207px" CharSet="UTF-8" Width="455px"></asp:TextBox><br>
            <asp:Label ID="Label2" runat="server" Text="Autor:"></asp:Label>
            <asp:DropDownList ID="dropdownAutor" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombreCompleto" DataValueField="id">
            </asp:DropDownList><br>
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" Visible="False" OnClick="btnLimpiar_Click" />
            <br><br>
            <asp:Label ID="Label3" runat="server" Text="Filtro"></asp:Label><br>
            <asp:DropDownList ID="dropdownFiltro" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombreCompleto" DataValueField="id">
            </asp:DropDownList>
            <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" Width="63px" /> 
            <asp:Button ID="BtnDesfiltrar" runat="server" Text="Desfiltrar" OnClick="BtnDesfiltrar_Click" />
            <br><br>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="745px" EmptyDataText="No hay registros de datos para mostrar" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="texto" HeaderText="texto" SortExpression="texto" ItemStyle-Width="300px">
                    <ControlStyle Width="400px" />

<ItemStyle Width="300px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="idAutor" HeaderText="idAutor" InsertVisible="False" SortExpression="idAutor" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT blogs.id, blogs.texto, autores.nombre, autores.apellido, autores.id as idAutor from blogs left join autores on blogs.idAutor = autores.id" DeleteCommand="delete from blogs where id = @id" InsertCommand="INSERT INTO [Blogs] ([texto], [idAutor]) VALUES (@texto, @autor)" UpdateCommand="UPDATE [Blogs] SET [texto] = @texto, [idAutor] = @idAutor WHERE [id] = @id">
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtTexto" Name="texto" PropertyName="Text" />
                    <asp:ControlParameter ControlID="dropdownAutor" Name="autor" PropertyName="SelectedValue" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtTexto" Name="texto" PropertyName="Text" />
                    <asp:ControlParameter ControlID="dropdownAutor" Name="idAutor" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="select id, CONCAT(nombre, ' ', apellido) AS nombreCompleto FROM autores"></asp:SqlDataSource>
    </form>
</body>
</html>
