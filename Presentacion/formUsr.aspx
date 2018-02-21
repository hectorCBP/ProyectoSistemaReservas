<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formUsr.aspx.cs" Inherits="formCli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
        }
        .style6
        {
            width: 25%;
        }
        .style7
        {
            width: 29%;
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
            <asp:Button ID="btnHot" runat="server" CssClass="boton" Text="Hoteles" 
                onclick="btnHot_Click" />
        </td>
        <td class="botonera" width="33%">
            <asp:Button ID="btnUsr" runat="server" CssClass="boton" Text="Usuarios" />
        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
            <asp:Label ID="lblMsj" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
            <td colspan="3" class="formulario">
                <asp:Label ID="lblUsr" runat="server" Text="Usuarios" CssClass="subtitulo" 
                    ForeColor="#47D363"></asp:Label>
                <hr />
                <table style="width: 100%;">
                    <tr>
                        <td class="style7">
                <asp:Label ID="lblSelectUsr0" runat="server" Text="Seleccione el tipo de usuario:" 
                                CssClass="subtitulo" Font-Size="Small"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:DropDownList ID="cboTipoUsr" runat="server" Height="100%" Width="304px" 
                                onselectedindexchanged="cboTipoUsr_SelectedIndexChanged" 
                                AutoPostBack="True">
                                <asp:ListItem Selected="True"></asp:ListItem>
                                <asp:ListItem>Administradores</asp:ListItem>
                                <asp:ListItem>Clientes</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <asp:Button ID="btnEliminaUsr" runat="server" CssClass="boton" 
                                Text="Eliminar" />
                        </td>
                        <td class="style6">
                            <asp:Button ID="btnModificaUsr" runat="server" CssClass="boton" 
                                Text="Modificar" />
                        </td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvUsers" runat="server" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="100%" 
                                Font-Size="X-Small">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                        </td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
</table>
</asp:Content>

