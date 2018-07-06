<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formResAdmin.aspx.cs" Inherits="formResAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenedor" Runat="Server">
    <table style="width: 100%; margin-left: 0px;" id="formMaster" class="userForm">
        <tr>
            <td align="center" class="formulario">
                <table style="width:100%;">
                    <tr>
            <td align="center">
                <asp:Label ID="lblMsj" runat="server"></asp:Label>
            </td>
                    </tr>
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

                <asp:GridView ID="gvResActivas" runat="server" Width="100%" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" 
                    onselectedindexchanged="gvResActivas_SelectedIndexChanged" 
                    AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                        <asp:CommandField HeaderText="Acción" SelectText="Finalizar" 
                            ShowSelectButton="True" />

                        <asp:BoundField DataField="numero" HeaderText="Número" />
                        <asp:BoundField DataField="EstadoRes" HeaderText="Estado" />
                        <asp:BoundField DataField="FechaIni" HeaderText="Check In" />
                        <asp:BoundField DataField="FechaFin" HeaderText="Check Out" />
                        <asp:BoundField DataField="Cli.Nombre" HeaderText="Cliente" />
                        <asp:BoundField DataField="Hab.Numero" HeaderText="Nro Habitación" />
                        <asp:BoundField DataField="Hab.Hotel.Nombre" HeaderText="Nombre Hotel" />
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

