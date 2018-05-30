<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formUsr.aspx.cs" Inherits="formCli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 44px;
        }
        .style2
        {
            height: 44px;
            width: 50%;
        }
        .style3
        {}
        .style4
        {
            height: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width: 100%; margin-left: 0px;" id="formMaster" class="userForm">
    <tr>
            <td class="formulario">
                <table style="width: 100%;">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblMsj" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="lblUsr" runat="server" Text="Usuarios" CssClass="subtitulo" 
                    ForeColor="#47D363"></asp:Label>
                <hr />
                            <table style="width: 100%;">
                                <tr>
                                    <td align="right" class="style2" colspan="2">
                                        <asp:Label ID="Label1" runat="server" Text="Nombre de usuario:"></asp:Label>
                                        <asp:TextBox ID="txtNombre" runat="server" Width="231px"></asp:TextBox>
                                    </td>
                                    <td class="style1" colspan="2" width="50%">
                                        <asp:Button ID="btnBuscar" runat="server" CssClass="btnForm2" 
                                            onclick="btnBuscar_Click" Text="Buscar" />
&nbsp;<asp:Button ID="btnLimpiar" runat="server" CssClass="btnForm2" onclick="btnLimpiar_Click" Text="Limpiar" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style2" colspan="2">
                                    </td>
                                    <td class="style1" colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style3" colspan="2">
                                        <asp:Label ID="Label2" runat="server" Text="Nombre Completo"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtNomCompleto" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style1" colspan="2">
                                        <asp:Label ID="Label3" runat="server" Text="Clave"></asp:Label>
                                    </td>
                                    <td class="style1" colspan="2">
                                        <asp:TextBox ID="txtClave" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style3" colspan="2">
                                        <asp:Label ID="Label4" runat="server" Text="Cargo"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtCargo" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style3" colspan="2">
                                        &nbsp;</td>
                                    <td colspan="2">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" class="style4">
                                        <asp:Button ID="btnAgregar" runat="server" CssClass="btnForm2" Enabled="False" 
                                            onclick="btnAgregar_Click" Text="Agregar" />
                                    </td>
                                    <td align="center" class="style4" colspan="2">
                                        <asp:Button ID="btnModificar" runat="server" CssClass="btnForm2" 
                                            Enabled="False" onclick="btnModificar_Click" Text="Modificar" />
                                    </td>
                                    <td align="left" class="style4">
                                        <asp:Button ID="btnEliminar" runat="server" CssClass="btnForm2" Enabled="False" 
                                            onclick="btnEliminar_Click" Text="Eliminar" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style3" colspan="2">
                                        &nbsp;</td>
                                    <td colspan="2">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
</table>
</asp:Content>

