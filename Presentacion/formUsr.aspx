<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formUsr.aspx.cs" Inherits="formCli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            height: 44px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width: 100%; margin-left: 0px;" id="formMaster" class="userForm">
    <tr>
            <td class="formulario">
                <table style="width: 100%;">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblMsj" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="lblUsr" runat="server" Text="Usuarios" CssClass="subtitulo" 
                    ForeColor="#47D363"></asp:Label>
                <hr />
                <table style="width: 100%;">
                    <tr>
                        <td align="center" class="style1" colspan="2" width="50%">
                <asp:Label ID="lblSelectUsr0" runat="server" Text="Seleccione el tipo de usuario:" 
                                CssClass="subtitulo"></asp:Label>
                            <asp:DropDownList ID="cboTipoUsr" runat="server" Height="100%" Width="217px" 
                                onselectedindexchanged="cboTipoUsr_SelectedIndexChanged" 
                                AutoPostBack="True">
                                <asp:ListItem Selected="True"></asp:ListItem>
                                <asp:ListItem>Administradores</asp:ListItem>
                                <asp:ListItem>Clientes</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
<<<<<<< HEAD
                        <td class="style1" style="border-right-style: inset" valign="top" width="60%">
=======
                        <td width="50%">
                            <asp:Button ID="btnEliminaUsr" runat="server" CssClass="btnForm" 
                                Text="Eliminar" />
                        </td>
                        <td width="50%">
                            <asp:Button ID="btnModificaUsr" runat="server" CssClass="btnForm" 
                                Text="Modificar" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
>>>>>>> e9e14bc88768846ae93724ca0e835e46749380de
                            <asp:GridView ID="gvUsers" runat="server" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
                                Font-Size="X-Small" CaptionAlign="Top" ClientIDMode="AutoID" Height="100%" 
                                onselectedindexchanged="gvUsers_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" SelectText="Selec." />
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#DDDDDD" Font-Bold="True" Font-Size="Medium" 
                                    ForeColor="Black" Height="0px" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle HorizontalAlign="Center" BackColor="#FAFAFA" ForeColor="#333333" 
                                    Height="0px" />
                                <SelectedRowStyle BackColor="#47D363" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                        </td>
<<<<<<< HEAD
                        <td valign="top" width="50%">
                            <asp:Panel ID="pnlModificar" runat="server" Visible="False">
                                <table style="width:100%;">
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="btnEliminar" runat="server" CssClass="btnForm" 
                                                Text="Eliminar" />
                                        </td>
                                        <td align="left">
                                            <asp:Button ID="Button2" runat="server" CssClass="btnForm" 
                                                Text="Convertir en Admin" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label1" runat="server" Font-Size="Small" Text="Nombre:"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtNombre" runat="server" Font-Size="Small"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label2" runat="server" 
                Text="Nombre Completo:" Font-Size="Small"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtNomCompleto" runat="server" Font-Size="Small"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label3" runat="server" Text="Clave:" Font-Size="Small"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtClave" runat="server" Font-Size="Small"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblCargoDire" runat="server" Font-Size="Small" Text="Cargo" 
                                                Visible="False"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtCargoDire" runat="server" Font-Size="Small" Visible="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style2">
                                            <asp:Label ID="lblTarj" runat="server" Font-Size="Small" 
                                                Text="Tarjeta de credito:" Visible="False"></asp:Label>
                                        </td>
                                        <td align="left" class="style2">
                                            <asp:TextBox ID="txtTarjeta" runat="server" Font-Size="Small" Visible="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            &nbsp;</td>
                                        <td align="left">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            &nbsp;</td>
                                        <td align="left">
                                            <asp:Button ID="btnGuardar" runat="server" CssClass="btnForm" Text="Guardar" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
=======
>>>>>>> e9e14bc88768846ae93724ca0e835e46749380de
                    </tr>
                    </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
</table>
</asp:Content>

