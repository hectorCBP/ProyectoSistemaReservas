<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formCliente.aspx.cs" Inherits="formCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width:100%;" class="userForm">
        <tr>
            <td class="botonera" width="50%">
                <asp:Button ID="btnCrearRes" runat="server" CssClass="boton" 
                    onclick="btnCrearRes_Click" Text="Crear reserva" />
            </td>
            <td class="botonera" width="50%">
                <asp:Button ID="btnLstRes" runat="server" CssClass="boton" 
                    onclick="btnLstRes_Click" Text="Listado de reservas" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" class="style1">
                <asp:Label ID="lblMsj" runat="server" Text="[lblMsj]"></asp:Label>
            </td>
        </tr>
        </table>
</asp:Content>

