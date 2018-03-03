<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formRes.aspx.cs" Inherits="formRes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width:100%;" class="userForm">
        <tr>
            <td align="center">
                <asp:Label ID="lblMsj" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
             <td id="formRegistrada"  class="formulario">
                <asp:Label ID="lblReserva" runat="server" Text="Crear Reserva" 
                    CssClass="subtitulo" ForeColor="#47D363"></asp:Label>
                <hr />
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <table class="style3" width="100%">
                                <tr>
            <td align="left">
&nbsp;&nbsp;
                <asp:Label ID="lblCat" runat="server" Text="Categoria de hotel"></asp:Label>
            </td>
            <td align="center" width="33%" colspan="2">
                <asp:DropDownList ID="lstCategoria" runat="server" Width="90%">
                    <asp:ListItem Selected="True" Value="-1">Seleccionar</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="left" width="33%">
                <asp:Button ID="btnCargarCat" runat="server" CssClass="btnForm" 
                    Text="Mostrar Hoteles" onclick="btnCargarHab_Click" />
            </td>
                                </tr>
                                <tr>
            <td align="left" colspan="4">
                <hr />
            </td>
                                </tr>
                                <tr>
            <td align="center" colspan="4">
                <asp:Label ID="lblHotHab" runat="server" Visible="False"></asp:Label>
            </td>
                                </tr>
                                <tr>
            <td align="center" colspan="4">
                <asp:GridView ID="gvReserva" runat="server" Width="100%" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    ForeColor="Black" GridLines="Horizontal" AutoGenerateSelectButton="True" 
                                            onselectedindexchanged="gvReserva_SelectedIndexChanged">
                    <Columns>
                        <asp:ImageField>
                        </asp:ImageField>
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
                                </tr>
                                <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblFechaIn" runat="server" style="text-align: left" 
                    Text="Fecha de check-in"></asp:Label>
            </td>
            <td align="center" colspan="2">
                <asp:Label ID="lblFechaFin0" runat="server" Text="Fecha de check-out"></asp:Label>
            </td>
                                </tr>
                                <tr>
            <td align="center" colspan="2" valign="top">
                <asp:Calendar ID="clnFechaIn" runat="server" Height="220px" Width="400px" 
                    BackColor="White" BorderColor="Black" DayNameFormat="Shortest" 
                    Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" 
                    NextPrevFormat="FullMonth" TitleFormat="Month">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" 
                        ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" 
                        Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" 
                        ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                </asp:Calendar>
            </td>
            <td align="center" colspan="2">
                <asp:Calendar ID="clnFechaFin" runat="server" Width="400px" BackColor="White" 
                    BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" 
                    Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" 
                    TitleFormat="Month">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" 
                        ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" 
                        Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" 
                        ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                </asp:Calendar>
            </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <hr />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnCalcular" runat="server" CssClass="btnForm" 
                                onclick="btnCalcular_Click" Text="Calcular Costo" />
                                    </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblCosto" runat="server" Visible="False"></asp:Label>
                                    </td>
                    </tr>
                    </table>
            </td>
        </tr>
    </table>
                            </asp:Content>

