<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formAdmin.aspx.cs" Inherits="formAdmin" %>

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
                <asp:Button ID="btnHab" runat="server" CssClass="boton" onclick="btnHab_Click" 
                    Text="Habitaciones" />
            </td>
            <td class="botonera" width="33%">
                <asp:Button ID="btnHot" runat="server" CssClass="boton" onclick="btnHot_Click" 
                    Text="Hoteles" />
            </td>
            <td class="botonera" width="33%">
                <asp:Button ID="btnUsr" runat="server" CssClass="boton" onclick="btnUsr_Click" 
                    Text="Usuarios" />
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="lblMsj" runat="server"></asp:Label>
            </td>
        </tr>
        </table>
</asp:Content>

