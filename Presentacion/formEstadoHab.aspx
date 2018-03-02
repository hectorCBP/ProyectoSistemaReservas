<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formEstadoHab.aspx.cs" Inherits="formEstadoHab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 44px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td align="center">
                <asp:Label ID="lblMsj" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                            <table class="formulario" style="width:100%;">
                                <tr>
                                    <td colspan="3" class="style1">
                <asp:Label ID="lblSubTitulo" runat="server" 
                Text="Estado de habitaciones" CssClass="subtitulo" ForeColor="#47D363"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
            <td align="left" width="33%">
&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Nombre de hotel"></asp:Label>
            </td>
            <td align="center" width="33%">
                <asp:DropDownList ID="lstHoteles" runat="server" Width="90%">
                    <asp:ListItem Selected="True" Value="-1">Seleccionar</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="left" width="33%">
                <asp:Button ID="btnCargarHab" runat="server" CssClass="btnForm" 
                    Text="Cargar habitaciones" onclick="btnCargarHab_Click" />
            </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                <asp:GridView ID="gvEstadoHab" runat="server" Width="100%" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    ForeColor="Black" GridLines="Horizontal">
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
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        &nbsp;</td>
                                </tr>
                            </table>
            </td>
        </tr>
    </table>
</asp:Content>

