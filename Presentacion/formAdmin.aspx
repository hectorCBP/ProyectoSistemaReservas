<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formAdmin.aspx.cs" Inherits="formAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width: 100%; margin-left: 0px;" id="formMaster" class="userForm">
        <tr>
        <td width="25%">
            <asp:Button ID="btnHab" runat="server" CssClass="boton" Text="Habitaciones" 
                onclick="btnHab_Click"/>
        </td>
        <td width="25%">
            <asp:Button ID="btnHot" runat="server" CssClass="boton" Text="Hoteles" 
                onclick="btnHot_Click" />
        </td>
        <td width="25%">
            <asp:Button ID="btnUsr" runat="server" CssClass="boton" Text="Usuarios" 
                onclick="btnUsr_Click" />
        </td>
        <td width="25%">
            <asp:Button ID="btnReserva" runat="server" CssClass="boton" Text="Reservas" 
                onclick="btnReserva_Click"/>
        </td>
        </tr>
        <tr>
        <td colspan="4" align="center">
            <asp:Label ID="lblMsj" runat="server"></asp:Label>
        </td>
        </tr>
        </table>
</asp:Content>

