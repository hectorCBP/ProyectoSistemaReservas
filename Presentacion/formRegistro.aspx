<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formRegistro.aspx.cs" Inherits="formRegistro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" type="text/css" href="css/estilo.css"/>
    <title>Registro</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="contenedorReg" style="max-with: 800px">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblTitulo" runat="server" Text="RESERVAS UY" Font-Bold="True" 
                        ForeColor="#E86F65"></asp:Label>
                </td>
                <td align="right">
                    <asp:Button ID="btnHome" runat="server" BackColor="Transparent" 
                        BorderStyle="None" Font-Underline="True" PostBackUrl="~/Default.aspx" 
                        Text="Página de inicio" style="cursor: pointer"/>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Label ID="lblSubTitulo" runat="server" Text="REGISTRO DE USUARIO"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="userForm" align="right" width="40%">
                    <asp:Label ID="lblNomUsr" runat="server" CssClass="lblReg" 
                        Text="Nombre de usuario *"></asp:Label>
                </td>
                <td class="userForm" colspan="2" align="center">
                    <asp:TextBox ID="txtNomUsr" runat="server" CssClass="txtBoxReg"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="userForm" align="right" width="40%">
                    <asp:Label ID="lblNomCom" runat="server" CssClass="lblReg" 
                        Text="Nombre completo *"></asp:Label>
                </td>
                <td class="userForm" colspan="2" align="center">
                    <asp:TextBox ID="txtNomCom" runat="server" CssClass="txtBoxReg"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="userForm" align="right" width="40%">
                    <asp:Label ID="lblPass" runat="server" CssClass="lblReg" Text="Contraseña *"></asp:Label>
                </td>
                <td class="userForm" colspan="2" align="center">
                    <asp:TextBox ID="txtPass" runat="server" CssClass="txtBoxReg" 
                        TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="userForm" align="right" width="40%">
                    <asp:Label ID="lblRepPass" runat="server" CssClass="lblReg" 
                        Text="Repetir Contraseña *"></asp:Label>
                </td>
                <td class="userForm" colspan="2" align="center">
                    <asp:TextBox ID="txtRepPass" runat="server" CssClass="txtBoxReg" 
                        TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="userForm" align="right" width="40%">
                    <asp:Label ID="lblDir" runat="server" CssClass="lblReg" Text="Dirección *"></asp:Label>
                </td>
                <td class="userForm" colspan="2" align="center">
                    <asp:TextBox ID="txtDir" runat="server" CssClass="txtBoxReg"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="userForm" align="right" width="40%">
                    <asp:Label ID="lblTarj" runat="server" CssClass="lblReg" 
                        Text="Número de tarjeta *"></asp:Label>
                </td>
                <td class="userForm" colspan="2" align="center">
                    <asp:TextBox ID="txtTarj" runat="server" CssClass="txtBoxReg"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="userForm" align="right" width="40%">
                    <asp:Label ID="lblTel" runat="server" CssClass="lblReg" Text="Teléfono *"></asp:Label>
                </td>
                <td class="userForm" colspan="2" align="center">
                    <asp:TextBox ID="txtTel" runat="server" CssClass="txtBoxReg"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="userForm" align="right" width="40%">
                    <asp:Label ID="lblSegTel" runat="server" CssClass="lblReg" 
                        Text="Segundo Teléfono"></asp:Label>
                </td>
                <td class="userForm" colspan="2" align="center">
                    <asp:TextBox ID="txtSegTel" runat="server" CssClass="txtBoxReg"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="userForm" align="right" width="40%">
                    <asp:Label ID="lblMovil" runat="server" CssClass="lblReg" 
                        Text="Telefono móvil"></asp:Label>
                </td>
                <td class="userForm" colspan="2" align="center">
                    <asp:TextBox ID="txtMovil" runat="server" CssClass="txtBoxReg"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" class="userForm" colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="userForm" colspan="3">
                    <asp:Label ID="lblInfo" runat="server" Text="* campos requeridos"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" class="userForm" colspan="3">
                    <asp:Label ID="lblMsj" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="userForm" colspan="3">
                    <asp:Button ID="btnReg" runat="server" CssClass="btnHeader" 
                        Text="Completar Registro" Width="40%" Height="40px" 
                        onclick="btnReg_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
