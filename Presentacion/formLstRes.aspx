<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="formLstRes.aspx.cs" Inherits="formLstRes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            width: 723px;
        }
        .style10
        {
        }
        .style12
        {
            width: 272px;
            height: 44px;
            text-align: left;
        }
        .style13
        {
            width: 26px;
            text-align: left;
        }
        .style15
        {
            text-align: left;
        }
        .style16
        {
            width: 121px;
        }
        .style17
        {
            width: 3px;
            height: 44px;
        }
        .style18
        {
            width: 26px;
            height: 44px;
        }
        .style19
        {
            height: 44px;
            text-align: center;
        }
        .style20
        {
            width: 121px;
            height: 44px;
        }
        .style21
        {
            height: 44px;
            text-align: left;
        }
        .style22
        {
        }
        .style23
        {
            height: 44px;
            text-align: left;
            width: 110px;
        }
    </style>
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
                <asp:Label ID="lblRegistradas" runat="server" Text=" Reservas Registradas" 
                    CssClass="subtitulo" ForeColor="#47D363"></asp:Label>
                <hr />
                <table align="center" width="100%">
                    <tr>
                        <td class="style10" style="text-align: left">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                            <asp:GridView ID="gvResActivas" runat="server" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" ForeColor="Black" GridLines="None" Width="100%" 
                                            onselectedindexchanged="gvResActivas_SelectedIndexChanged" 
                                            AutoGenerateColumns="False">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="numero" HeaderText="Numero" />
                                    <asp:BoundField DataField="EstadoRes" HeaderText="Estado" />
                                    <asp:BoundField DataField="FechaIni" HeaderText="Check In" />
                                    <asp:BoundField DataField="FechaFin" HeaderText="Check Out" />
                                    <asp:BoundField DataField="Hab.Numero" HeaderText="Nro Habitacion" />
                                    <asp:BoundField DataField="Hab.Hotel.Nombre" HeaderText="Nombre Hotel" />
                                </Columns>
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" />
                            </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style10" style="text-align: left">
                            <asp:Panel ID="pnlDatosRes" runat="server" style="text-align: center" 
                                Visible="False">
                                <table style="width:100%;" border="1px">
                                    <tr>
                                        <td class="style12" colspan="2">
                                            <asp:Label ID="lblDatosRes" runat="server" Text="Datos Reserva:" 
                                                style="text-decoration: underline; text-align: left"></asp:Label>
                                        </td>
                                        <td class="style21" colspan="2">
                                            <asp:Label ID="lblHab" runat="server" Text="Datos Habitación" 
                                                style="text-decoration: underline"></asp:Label>
                                        </td>
                                        <td class="style21" colspan="2">
                                            <asp:Label ID="lblHotel" runat="server" Text="Datos Hotel" 
                                                style="text-decoration: underline"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            <asp:Label ID="lblNum" runat="server" Text="Número"></asp:Label>
                                        </td>
                                        <td class="style13">
                                            <asp:TextBox ID="txtNum" runat="server" style="text-align: left"></asp:TextBox>
                                        </td>
                                        <td class="style22" style="text-align: left">
                                            <asp:Label ID="lblNumHab" runat="server" style="text-align: left" Text="Número"></asp:Label>
                                        </td>
                                        <td class="style16">
                                            <asp:TextBox ID="txtNumHab" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblNomHot2" runat="server" Text="Nombre"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNomHot2" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            <asp:Label ID="lblEstado" runat="server" Text="Estado"></asp:Label>
                                        </td>
                                        <td class="style18">
                                            <asp:TextBox ID="txtEstado" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="style23">
                                            <asp:Label ID="lblNomHot" runat="server" style="text-align: left" 
                                                Text="Nombre Hotel"></asp:Label>
                                        </td>
                                        <td class="style20">
                                            <asp:TextBox ID="txtNomHot" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="style19">
                                            <asp:Label ID="le" runat="server" Text="Calle"></asp:Label>
                                        </td>
                                        <td class="style19">
                                            <asp:TextBox ID="txtCalle" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            <asp:Label ID="lblFechaIn" runat="server" Text="CheckIn"></asp:Label>
                                        </td>
                                        <td class="style13">
                                            <asp:TextBox ID="txtFechaIn" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="style22" style="text-align: left">
                                            <asp:Label ID="lblDesc" runat="server" Text="Descripción"></asp:Label>
                                        </td>
                                        <td class="style16">
                                            <textarea ID="tbDesc" runat="server" cols="20" name="S1" rows="2"></textarea></td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblNum2" runat="server" Text="Número"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNum2" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            <asp:Label ID="lblFechaFin" runat="server" Text="CheckOut"></asp:Label>
                                        </td>
                                        <td class="style13">
                                            <asp:TextBox ID="txtFechaFin" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="style22" style="text-align: left">
                                            <asp:Label ID="Label1" runat="server" style="text-align: left" 
                                                Text="Cantidad Huespedes"></asp:Label>
                                        </td>
                                        <td class="style16">
                                            <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblCiudad" runat="server" Text="Ciudad"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCiudad" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            <asp:Label ID="lblNombre" runat="server" Text="Cliente"></asp:Label>
                                        </td>
                                        <td class="style13">
                                            <asp:TextBox ID="txtCli" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="style22" style="text-align: left">
                                            <asp:Label ID="lblCosto" runat="server" Text="Costo"></asp:Label>
                                        </td>
                                        <td class="style16">
                                            <asp:TextBox ID="txtCosto" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCat" runat="server" Text="Categoria"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCat" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            &nbsp;</td>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td class="style22" style="text-align: left">
                                            <asp:Label ID="lblPiso" runat="server" Text="Piso"></asp:Label>
                                        </td>
                                        <td class="style16">
                                            <asp:TextBox ID="txtPiso" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblTel" runat="server" Text="Teléfono"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            &nbsp;</td>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td class="style22" style="text-align: left">
                                            &nbsp;</td>
                                        <td class="style16">
                                            &nbsp;</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblFax" runat="server" Text="Fax"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFax" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            &nbsp;</td>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td class="style22" style="text-align: left">
                                            &nbsp;</td>
                                        <td class="style16">
                                            &nbsp;</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblPlaya" runat="server" Text="Playa"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkPlaya" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            &nbsp;</td>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td class="style22" style="text-align: left">
                                            &nbsp;</td>
                                        <td class="style16">
                                            &nbsp;</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="a" runat="server" Text="Piscina"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkPiscina" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15">
                                            &nbsp;</td>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td class="style22" style="text-align: left">
                                            &nbsp;</td>
                                        <td class="style16">
                                            &nbsp;</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblFoto" runat="server" Text="Foto"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;<asp:Image ID="imgFtoHotel" runat="server" Width="100%" 
                                                CssClass="foto2"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style15" colspan="6">
                                            <asp:Button ID="btnCancelar" runat="server" CssClass="btnForm" 
                                                onclick="btnCancelar_Click" Text="Cancelar Reserva Seleccionada" />
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
</asp:Content>

