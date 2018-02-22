<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formCliente.aspx.cs" Inherits="formCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width:100%;" class="userForm">
        <tr>
            <td align="center" class="style1">
                <asp:Label ID="lblMsj" runat="server" Text="[lblMsj]"></asp:Label>
            </td>
        </tr>
        <tr>
             <td id="formRegistrada"  class="formulario">
                <asp:Label ID="lblCrearRes" runat="server" Text="Creación de reserva" 
                    CssClass="subtitulo" ForeColor="#47D363"></asp:Label>
                <hr />
                <table style="width: 100%;">
                    <tr>
                        <td>
                            crear aqui formulario</td>
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

