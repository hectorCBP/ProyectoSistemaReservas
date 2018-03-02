<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formRes.aspx.cs" Inherits="formRes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style11
        {
            height: 57px;
            width: 30%;
        }
        .style9
        {
            height: 57px;
        }
        .style13
        {
            width: 30%;
            height: 241px;
            margin-left: 80px;
        }
        .style14
        {
            width: 66%;
            height: 241px;
        }
        .style12
        {
            height: 6px;
            width: 30%;
        }
        .style10
        {
            height: 6px;
            width: 66%;
        }
        .style7
        {
            height: 295px;
        }
        .style15
        {
            height: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width:100%;" class="userForm">
        <tr>
            <td align="center" class="style15">
                <asp:Label ID="lblMsj" runat="server" Text="[lblMsj]"></asp:Label>
            </td>
        </tr>
        <tr>
                        <td align="left">
                <asp:Label ID="lblReserva" runat="server" Text="Crear Reserva" 
                    CssClass="subtitulo" ForeColor="#47D363"></asp:Label>
                        </td>
                    </tr>
    </table>
                            <table class="style3" width="100%">
                                <tr>
            <td align="left" class="style11">
&nbsp;&nbsp;
                <asp:Label ID="lblCat" runat="server" Text="Categoria de hotel"></asp:Label>
            </td>
            <td align="center" width="33%" class="style9">
                <asp:DropDownList ID="lstCategoria" runat="server" Width="90%">
                    <asp:ListItem Selected="True" Value="-1">Seleccionar</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="left" width="33%" class="style9">
                <asp:Button ID="btnCargarCat" runat="server" CssClass="btnForm" 
                    Text="Mostrar Hoteles" onclick="btnCargarHab_Click" />
            </td>
                                </tr>
                                <tr>
            <td align="left" class="style13">
                <asp:Label ID="lblFechaIn" runat="server" style="text-align: left" 
                    Text="Fecha Inicio"></asp:Label>
            </td>
            <td align="center" width="33%" class="style14" colspan="2">
                <asp:Calendar ID="clnFechaIn" runat="server" Height="324px" Width="343px">
                </asp:Calendar>
            </td>
                                </tr>
                                <tr>
            <td align="left" class="style12">
                <asp:Label ID="lblFechaFin" runat="server" Text="Fecha Fin"></asp:Label>
            </td>
            <td align="center" width="33%" class="style10" colspan="2">
                <asp:Calendar ID="clnFechaFin" runat="server" Width="343px"></asp:Calendar>
            </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="style7">
                <asp:GridView ID="gvReserva" runat="server" Width="100%" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    ForeColor="Black" GridLines="Horizontal" AutoGenerateSelectButton="True" 
                                            onselectedindexchanged="gvReserva_SelectedIndexChanged">
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
                            </table>
            </asp:Content>

