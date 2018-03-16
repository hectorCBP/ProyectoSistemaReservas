<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formHot.aspx.cs" Inherits="formHot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width: 100%; margin-left: 0px;" id="formMaster" class="userForm">
        <tr>
            <td id="formHot" class="formulario" align="center">
                <table style="width: 100%;">
                    <tr>
                        <td align="center" colspan="3">
                <asp:Label ID="lblMsj" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="3">
                <asp:Label ID="lblHoteles" runat="server" Text="Mantenimiento de Hoteles" 
                    CssClass="subtitulo" ForeColor="#47D363"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:TextBox ID="txtBuscarH" runat="server" CssClass="txtBoxReg" placeholder="nombre del hotel a buscar"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnBuscarH" runat="server" CssClass="btnForm" Text="Buscar" 
                                onclick="btnBuscarH_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;</td>
                        <td align="center">
                            <asp:Image ID="imgFotoH" runat="server" CssClass="foto" Visible="False" />
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblFoto" runat="server" Text="Imágen de hotel"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:FileUpload ID="txtFotoH" runat="server" Enabled="False" />
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblHotel" runat="server" Text="Nombre  De Hotel"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtHotel" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblCategoriaH" runat="server" Text="Categoría"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtCategoriaH" runat="server" Width="90%" MaxLength="1"></asp:TextBox>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center" style="width: 66%">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblCalle" runat="server" Text="Dirección"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtCalleH" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblNumeroH" runat="server" Text="Nº De Puerta"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtNumeroH" runat="server" Width="90%" MaxLength="10"></asp:TextBox>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblCiudadH" runat="server" Text="Ciudad"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtCuidadH" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" 
                            style="width: 66%;" colspan="3">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblTelH" runat="server" Text="Teléfono"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtTelH" runat="server" MaxLength="10" Width="90%"></asp:TextBox>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblFaxH" runat="server" Text="Fax"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtFaxH" runat="server" MaxLength="10" Width="90%"></asp:TextBox>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center" style="width: 66%">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblPiscinaH" runat="server" Text="Tiene Piscina"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:CheckBox ID="chkPiscinaH" runat="server" Enabled="False" />
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblPlayaH" runat="server" Text="Próximo a playa"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:CheckBox ID="chkPlayaH" runat="server" Enabled="False" />
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center" style="width: 66%">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" height="30px" width="33%">
                            <asp:Button ID="btnEliminarH" runat="server" CssClass="btnForm" 
                                Text="Eliminar" onclick="btnEliminarH_Click" Enabled="False" />
                        </td>
                        <td align="center" height="30px" width="33%">
                            <asp:Button ID="btnModificarH" runat="server" CssClass="btnForm" 
                                Text="Modificar" onclick="btnModificarH_Click" Enabled="False" />
                        </td>
                        <td align="center" width="33%">
                            <asp:Button ID="btnAgregarH" runat="server" CssClass="btnForm" Text="Agregar" 
                                onclick="btnAgregarH_Click" Enabled="False" />
                        </td>
                    </tr>
                    </table>
            </td>
        </tr>
    </table>
</asp:Content>

