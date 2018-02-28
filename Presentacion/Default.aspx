<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/estilo.css" type="text/css" rel="Stylesheet" />
    <title>Reservas UY</title>
</head>
<body>
    <form id="form1" runat="server" style="border-bottom: 1px solid #1a1a1a;">

        <table class="header">
            <tr>
                <td class="titulo">
                    <asp:Label ID="lblTitulo" runat="server" Text="RESERVAS UY" Font-Bold="True" 
                        ForeColor="#E86F65"></asp:Label>
                </td>
                <td class="itemsHeader" align="right" width="20%">
                    <asp:Label ID="lblUsuario" runat="server" Text="usuario: " class="lblIndex" 
                        Font-Size="14px"></asp:Label>
                    <asp:TextBox ID="txtUsuario" runat="server" class="txtBox" Width="100px"></asp:TextBox>
                </td>
                <td class="itemsHeader" align="right" width="20%">
                    <asp:Label ID="lblClave" runat="server" Text="clave: " class="lblIndex" 
                        Font-Size="14px"></asp:Label>
                    <asp:TextBox ID="txtClave" runat="server" class="txtBox" Width="100px" 
                        TextMode="Password"></asp:TextBox >
                </td>
                <td class="itemsHeader" align="right" width="15%">
                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" class="btnLogin" 
                        onclick="btnIngresar_Click" style="cursor: pointer" CssClass="btnHeader" />
                </td>
                <td class="itemsHeader" align="right" width="15%">
                    <asp:Button ID="btnRegistro" runat="server" CssClass="btnHeader" 
                        Text="Registrase" onclick="btnRegistro_Click" />
                </td>
            </tr>
        </table>
    </form>
    <div class="slider">
        <div class="image-container four-images">
            <img src="imagenes/uno.jpg">
            <img src="imagenes/dos.jpg">
            <img src="imagenes/tres.jpg">
            <img src="imagenes/cuatro.jpg">
        </div>
    </div>
</body>
</html>
