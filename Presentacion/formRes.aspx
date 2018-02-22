<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formRes.aspx.cs" Inherits="formRes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width:100%;" class="userForm">
        <tr>
            <td class="botonera" width="50%">
                <asp:Button ID="btnCrearRes" runat="server" CssClass="boton" 
                    Text="Crear reserva" />
            </td>
            <td class="botonera" width="50%">
                <asp:Button ID="btnLstRes" runat="server" CssClass="boton" 
                    onclick="btnLstRes_Click" Text="Listado de reservas" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lblMsj" runat="server" Text="[lblMsj]"></asp:Label>
            </td>
        </tr>
        <tr>
           <td id="formReserva"  class="formulario" colspan="2">
                <asp:Label ID="lblReservas" runat="server" Text="Crear Reserva" 
                    CssClass="subtitulo"></asp:Label>
                <hr />
                <table style="width: 100%;">
                    <tr>
                        <td>
                            crear aqui el formulario de alta</td>
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

