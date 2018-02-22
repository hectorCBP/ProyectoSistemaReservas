<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formResAdmin.aspx.cs" Inherits="formResAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width: 100%; margin-left: 0px;" id="formMaster" class="userForm">
        <tr>
            <td width="25%">
                <asp:Button ID="btnHab" runat="server" CssClass="boton" Text="Habitaciones" 
                    onclick="btnHab_Click" />
            </td>
            <td width="25%">
                <asp:Button ID="btnHot" runat="server" CssClass="boton" Text="Hoteles" 
                onclick="btnHot_Click" />
            </td>
            <td width="25%">
                <asp:Button ID="btnUsr" runat="server" CssClass="boton" Text="Usuarios" 
                onclick="btnUsr_Click" />
            </td>
            <td width="25%">
                <asp:Button ID="btnReserva" runat="server" CssClass="boton" Text="Reservas" />
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Label ID="lblMsj" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center" class="formulario">
                <table style="width:100%;">
                    <tr>
            <td align="left">
            <asp:Label ID="lblSubTitulo" runat="server" 
                Text="Listado de reservas" CssClass="subtitulo" ForeColor="#47D363"></asp:Label>
            </td>
                    </tr>
                    <tr>
            <td>
                <hr />
            </td>
                    </tr>
                    <tr>
            <td>
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
                        <td>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                
             </td>
        </tr>
        </table>
</asp:Content>

