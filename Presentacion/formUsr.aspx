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
        .style4
        {
            height: 44px;
            width: 242px;
        }
        .style5
        {
            width: 242px;
        }
        .style6
        {
            height: 48px;
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
                        <td class="style1" style="border-right-style: inset" valign="top" width="60%" 
                            rowspan="2">
                            <asp:GridView ID="gvUsers" runat="server" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
                                Font-Size="X-Small" CaptionAlign="Top" ClientIDMode="AutoID" Height="100%" 
                                onselectedindexchanged="gvUsers_SelectedIndexChanged" 
                                AutoGenerateColumns="False">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                    <asp:BoundField DataField="NombreCompleto" HeaderText="Nombre Completo" />
                                    <asp:BoundField DataField="Clave" HeaderText="Contraseña" />
                                    <asp:BoundField DataField="Cargo" HeaderText="Cargo" />
                                    <asp:CommandField ShowSelectButton="True" SelectText="Selec." />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Medium" 
                                    ForeColor="White" Height="0px" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle HorizontalAlign="Center" BackColor="#E3EAEB" 
                                    Height="0px" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </td>
                        <td valign="top" width="50%" class="style6">
                            <asp:Button ID="btnCancelAgreg" runat="server" CssClass="btnForm" Height="100%" 
                                onclick="btnCancelar_Click" Text="Nuevo Administrador" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" width="50%">
                            <asp:Panel ID="pnlModificar" runat="server" Visible="False">
                                <table style="width:100%;">
                                    <tr>
                                        <td align="right" class="style5" width="50%">
                                            &nbsp;</td>
                                        <td align="left" width="50%">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style5" width="50%">
                                            <asp:Label ID="Label1" runat="server" Font-Size="Small" Text="Nombre:"></asp:Label>
                                        </td>
                                        <td align="left" width="50%">
                                            <asp:TextBox ID="txtNombre" runat="server" Font-Size="Small" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style5" width="50%">
                                            <asp:Label ID="Label2" runat="server" 
                Text="Nombre Completo:" Font-Size="Small"></asp:Label>
                                        </td>
                                        <td align="left" width="50%">
                                            <asp:TextBox ID="txtNomCompleto" runat="server" Font-Size="Small"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style5" width="50%">
                                            <asp:Label ID="Label3" runat="server" Text="Clave:" Font-Size="Small"></asp:Label>
                                        </td>
                                        <td align="left" width="50%">
                                            <asp:TextBox ID="txtClave" runat="server" Font-Size="Small"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style5" width="50%">
                                            <asp:Label ID="lblCargo" runat="server" Font-Size="Small" Text="Cargo"></asp:Label>
                                        </td>
                                        <td align="left" width="50%">
                                            <asp:TextBox ID="txtCargo" runat="server" Font-Size="Small"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style5" width="50%">
                                            &nbsp;</td>
                                        <td align="left" width="50%">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style5" width="50%">
                                            <asp:Button ID="btnEliminar" runat="server" CssClass="btnForm" 
                                                onclick="btnEliminar_Click" Text="Eliminar" />
                                        </td>
                                        <td align="left" width="50%">
                                            <asp:Button ID="btnGuardar" runat="server" CssClass="btnForm" Text="Guardar" 
                                                onclick="btnGuardar_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
</table>
</asp:Content>

