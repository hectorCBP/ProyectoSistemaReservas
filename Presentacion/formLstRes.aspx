<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formLstRes.aspx.cs" Inherits="formLstRes" %>

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
                 Text="Listado de reservas" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lblMsj" runat="server" Text="[lblMsj]"></asp:Label>
            </td>
        </tr>
        <tr>
             <td id="formRegistrada"  class="formulario" colspan="2">
                <asp:Label ID="lblRegistradas" runat="server" Text=" Reservas Registradas" 
                    CssClass="subtitulo"></asp:Label>
                <hr />
                <table style="width: 100%;">
                    <tr>
                        <td>
                            crear aqui grilla listado y cancelacion</td>
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

