<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formCliente.aspx.cs" Inherits="formCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width:100%;" class="userForm">
        <tr>
            <td class="botonera">
                <input id="btnReservas" class="boton" type="button" value="Crear Reservas" /></td>
            <td class="botonera">
                <input id="btnRegistradas" class="boton" type="button" 
                    value="Reservas Registradas" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lblMsj" runat="server" Text="[lblMsj]"></asp:Label>
            </td>
        </tr>
        <tr>
           <td id="formReserva"  class="formulario hideForm" colspan="3">
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
        <tr>
             <td id="formRegistrada"  class="formulario hideForm" colspan="3">
                <asp:Label ID="lblRegistradas" runat="server" Text=" Reservas Registradas" 
                    CssClass="subtitulo"></asp:Label>
                <hr />
                <table style="width: 100%;">
                    <tr>
                        <td>
                            crear aqui grilla modificacion y cancelacion</td>
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

