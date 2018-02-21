<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formHab.aspx.cs" Inherits="formHab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width: 100%; margin-left: 0px;" id="formMaster" class="userForm">
    <tr>
        <td class="botonera" width="33%">
            <asp:Button ID="btnHab" runat="server" CssClass="boton" Text="Habitaciones" />
        </td>
        <td class="botonera" width="33%">
            <asp:Button ID="btnHot" runat="server" CssClass="boton" Text="Hoteles" 
                onclick="btnHot_Click" />
        </td>
        <td class="botonera" width="33%">
            <asp:Button ID="btnUsr" runat="server" CssClass="boton" Text="Usuarios" 
                onclick="btnUsr_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
            <asp:Label ID="lblMsj" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td id="formHab"  class="formulario" colspan="3">
                <asp:Label ID="lblHab" runat="server" Text="Mantenimiento de Habitaciones" 
                    CssClass="subtitulo" ForeColor="#47D363"></asp:Label>
                <hr />
                <table style="width: 100%;">
                    <tr>
                        <td align="center" colspan="3">
                            <asp:Label ID="lblSubTitulo" runat="server" 
                                Text="Habitaciones con reservas activas"></asp:Label>
                            &nbsp; &nbsp;</td>
                        </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <hr />
                        </td>
                        </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="gvHabActivas" runat="server" Width="100%" BackColor="White" 
                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                ForeColor="Black" GridLines="Horizontal">
                                <Columns>
                                    <asp:ButtonField HeaderText="Acción" ShowHeader="True" Text="Finalizar">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:ButtonField>
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
                        <td align="center" colspan="3" style="width: 66%">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="33%">
                            <asp:Label ID="lblNomHotel" runat="server" Text="Nombre de hotel"></asp:Label>
                        </td>
                        <td align="center" width="33%">
                            <asp:DropDownList ID="lstHoteles" runat="server" Width="90%">
                                <asp:ListItem Selected="True" Value="-1">Seleccione un Hotel</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="center" width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblNumHab" runat="server" Text="Nº de Habitación"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtNumeroHab" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnCargarHab" runat="server" CssClass="btnForm" Text="Cargar" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblHuespedHab" runat="server" Text="Nº de Huespedes"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtHuespedHab" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" class="style1">
                            <asp:Label ID="lblPisoHab" runat="server" Text="Nº de piso"></asp:Label>
                        </td>
                        <td align="center" class="style1">
                            <asp:TextBox ID="txtPisoHab" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td class="style1">
                            </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblCostoHab" runat="server" Text="Costo por noche"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtCosto" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblDescirpcionHab" runat="server" Text="Breve descripción"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtDescripcionHab" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnEliminarHab" runat="server" CssClass="btnForm" 
                                Text="Eliminar" />
                        </td>
                        <td align="center">
                            <asp:Button ID="btnModificarHab" runat="server" CssClass="btnForm" 
                                Text="Modificar" />
                        </td>
                        <td>
                            <asp:Button ID="btnAgregarHab" runat="server" CssClass="btnForm" 
                                Text="Agregar" />
                        </td>
                    </tr>
                    </table>
            </td>        
    </tr>
    </table>
</asp:Content>

