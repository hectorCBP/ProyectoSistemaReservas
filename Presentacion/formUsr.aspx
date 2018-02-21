<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formUsr.aspx.cs" Inherits="formCli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 44px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width: 100%; margin-left: 0px;" id="formMaster" class="userForm">
    <tr>
        <td class="botonera" width="33%">
            <asp:Button ID="btnHab" runat="server" CssClass="boton" Text="Habitaciones" 
                onclick="btnHab_Click1" />
        </td>
        <td class="botonera" width="33%">
            <asp:Button ID="btnHot" runat="server" CssClass="boton" Text="Hoteles" 
                onclick="btnHot_Click" />
        </td>
        <td class="botonera" width="33%">
            <asp:Button ID="btnUsr" runat="server" CssClass="boton" Text="Usuarios" />
        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
            <asp:Label ID="lblMsj" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
            <td colspan="3" class="formulario">
                <asp:Label ID="lblUsr" runat="server" Text="Usuarios" CssClass="subtitulo"></asp:Label>
                <hr />
                <table style="width: 100%;">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
</table>
</asp:Content>

