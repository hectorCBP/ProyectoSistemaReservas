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
                <asp:DropDownList ID="lstHoteles" runat="server" Width="90%" 
                    AutoPostBack="True" onselectedindexchanged="lstHoteles_SelectedIndexChanged">
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
                <asp:GridView ID="gvEstadoHab" runat="server" Width="100%" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" onselectedindexchanged="gvEstadoHab_SelectedIndexChanged" 
                                            AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                        <asp:BoundField DataField="Numero" HeaderText="Número" />
                        <asp:BoundField DataField="Hotel.Nombre" HeaderText="Nombre Hotel" />
                        <asp:BoundField DataField="Costo" HeaderText="Costo" />
                        <asp:BoundField DataField="Piso" HeaderText="Piso" />
                        <asp:BoundField DataField="CantHuesped" HeaderText="Cantidad Huespedes" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
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
                                        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="True" 
                                            Height="18px" onselectedindexchanged="ddlFiltro_SelectedIndexChanged" 
                                            Visible="False" Width="348px">
                                            <asp:ListItem>Todas</asp:ListItem>
                                            <asp:ListItem Value="Activa">Activas</asp:ListItem>
                                            <asp:ListItem Value="Cancelada">Canceladas</asp:ListItem>
                                            <asp:ListItem Value="Finalizada">Finalizadas</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:GridView ID="gvResHab" runat="server" CellPadding="4" ForeColor="#333333" 
                                            GridLines="None" Visible="False" Width="100%" AutoGenerateColumns="False">
                                           <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="EstadoRes" HeaderText="Estado" />
                                                <asp:BoundField DataField="FechaIni" HeaderText="Check In" />
                                                <asp:BoundField DataField="FechaFin" HeaderText="Check Out" />
                                                <asp:BoundField DataField="Cli.Nombre" HeaderText="Cliente" />
                                                <asp:BoundField DataField="Hab.Numero" HeaderText="Nro Habitación" />
                                                <asp:BoundField DataField="Hab.Hotel.Nombre" HeaderText="Nombre Hotel" />
                                                <asp:BoundField DataField="numero" HeaderText="Número" />
                                            </Columns>
                                            <EditRowStyle BackColor="#7C6F57" />
                                            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle HorizontalAlign="Center" BackColor="#E3EAEB" />
                                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
            </td>
        </tr>
    </table>
</asp:Content>

