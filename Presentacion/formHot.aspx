﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formHot.aspx.cs" Inherits="formHot" %>

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
                <asp:Button ID="btnHot" runat="server" CssClass="boton" Text="Hoteles"/>
            </td>
            <td class="botonera" width="33%">
                <asp:Button ID="btnUsr" runat="server" CssClass="boton" Text="Usuarios" 
                    onclick="btnUsr_Click1" />
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="lblMsj" runat="server"></asp:Label>
                </td>
        </tr>
        <tr>
            <td id="formHot" class="formulario" colspan="3">
                <asp:Label ID="lblHoteles" runat="server" Text="Mantenimiento de Hoteles" 
                    CssClass="subtitulo" ForeColor="#47D363"></asp:Label>
                <hr />
                <table style="width: 100%;">
                    <tr>
                        <td align="center" colspan="2">
                            <asp:TextBox ID="txtBuscarH" runat="server" CssClass="txtBoxReg"></asp:TextBox>
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
                            <asp:Image ID="imgFotoH" runat="server" CssClass="foto" />
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblFoto" runat="server" Text="Imágen de hotel"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:FileUpload ID="txtFotoH" runat="server" />
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
                            <asp:Label ID="lblHotel" runat="server" Text="Hotel"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:Label ID="lblCategoriaH" runat="server" Text="Categoría"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtHotel" runat="server" Width="90%"></asp:TextBox>
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
                        <td align="center" 
                            style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000" 
                            width="33%">
                            <asp:Label ID="lblUbicacionH" runat="server" ForeColor="#47D363" 
                                Text="Ubicación"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblCalle" runat="server" Text="calle"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:Label ID="lblNumeroH" runat="server" Text="nº puerta"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:Label ID="lblCiudadH" runat="server" Text="ciudad"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtCalleH" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtNumeroH" runat="server" Width="90%" MaxLength="10"></asp:TextBox>
                        </td>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtCuidadH" runat="server" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="33%" 
                            style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000">
                            <asp:Label ID="lblContactoH" runat="server" ForeColor="#47D363" 
                                Text="Contacto"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblTelH" runat="server" Text="Teléfono"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:Label ID="lblFaxH" runat="server" Text="Fax"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:TextBox ID="txtTelH" runat="server" MaxLength="10" Width="90%"></asp:TextBox>
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
                        <td align="center" 
                            style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000" 
                            width="33%">
                            <asp:Label ID="lblCaracteristicasH" runat="server" ForeColor="#47D363" 
                                Text="Características"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblPiscinaH" runat="server" Text="piscina"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CheckBox ID="chkPiscinaH" runat="server" />
                        </td>
                        <td align="center" width="33%">
                            <asp:Label ID="lblPlayaH" runat="server" Text="playa"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CheckBox ID="chkPlayaH" runat="server" />
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
                                Text="Eliminar" onclick="btnEliminarH_Click" />
                        </td>
                        <td align="center" height="30px" width="33%">
                            <asp:Button ID="btnModificarH" runat="server" CssClass="btnForm" 
                                Text="Modificar" onclick="btnModificarH_Click" />
                        </td>
                        <td align="center" width="33%">
                            <asp:Button ID="btnAgregarH" runat="server" CssClass="btnForm" Text="Agregar" 
                                onclick="btnAgregarH_Click" />
                        </td>
                    </tr>
                    </table>
            </td>
        </tr>
    </table>
</asp:Content>

