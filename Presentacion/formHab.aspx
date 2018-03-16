<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formHab.aspx.cs" Inherits="formHab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width: 100%; margin-left: 0px;" id="formMaster" class="userForm">
    <tr>
        <td id="formHab"  class="formulario" align="center">
                <table style="width: 100%;">
                    <tr>
                        <td align="center" colspan="4" width="50%" style="width: 100%">
                <asp:Label ID="lblMsj" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" width="50%">
                <asp:Label ID="lblHab" runat="server" Text="Mantenimiento de Habitaciones" 
                    CssClass="subtitulo" ForeColor="#47D363"></asp:Label>
                        </td>
                        <td align="left" colspan="2" width="50%">
                            <asp:Button ID="btnEstadoHab" runat="server" CssClass="btnForm" 
                                onclick="btnEstadoHab_Click" Text="Estado de habitaciones" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4" style="width: 66%">
                <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblNomHotel" runat="server" Text="Nombre de hotel"></asp:Label>
                        </td>
                        <td align="center" width="33%" colspan="2">
                            <asp:DropDownList ID="lstHoteles" runat="server" Width="90%">
                                <asp:ListItem Selected="True" Value="-1">Seleccione un Hotel</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblNumHab" runat="server" Text="Nº de Habitación"></asp:Label>
                        </td>
                        <td align="center" colspan="2">
                            <asp:TextBox ID="txtNumeroHab" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnBuscarHab" runat="server" CssClass="btnForm" Text="Buscar" 
                                onclick="btnBuscarHab_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblHuespedHab" runat="server" Text="Nº de Huespedes"></asp:Label>
                        </td>
                        <td align="center" colspan="2">
                            <asp:TextBox ID="txtHuespedHab" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" class="style1">
                            <asp:Label ID="lblPisoHab" runat="server" Text="Nº de piso"></asp:Label>
                        </td>
                        <td align="center" class="style1" colspan="2">
                            <asp:TextBox ID="txtPisoHab" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td class="style1">
                            </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblCostoHab" runat="server" Text="Costo por día"></asp:Label>
                        </td>
                        <td align="center" colspan="2">
                            <asp:TextBox ID="txtCosto" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblDescirpcionHab" runat="server" Text="Breve descripción"></asp:Label>
                        </td>
                        <td align="center" colspan="2">
                            <asp:TextBox ID="txtDescripcionHab" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnEliminarHab" runat="server" CssClass="btnForm" 
                                Text="Eliminar" onclick="btnEliminarHab_Click" Enabled="False" />
                        </td>
                        <td align="center" colspan="2">
                            <asp:Button ID="btnModificarHab" runat="server" CssClass="btnForm" 
                                Text="Modificar" onclick="btnModificarHab_Click" Enabled="False" />
                        </td>
                        <td>
                            <asp:Button ID="btnAgregarHab" runat="server" CssClass="btnForm" 
                                Text="Agregar" onclick="btnAgregarHab_Click" Enabled="False" />
                        </td>
                    </tr>
                    </table>
            </td>        
    </tr>
    </table>
</asp:Content>

