using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Logica;
using EntidadesCompartidas;

public partial class formCli : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void cboTipoUsr_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvUsers.SelectedIndex = -1;
        pnlModificar.Visible = false;

        if (cboTipoUsr.Text == "Administradores")
        {
            gvUsers.DataSource = LogicaAdministrador.ListarAdmins();
            gvUsers.DataBind();
            
        }
        else if (cboTipoUsr.Text == "Clientes")
        {
            gvUsers.DataSource = LogicaCliente.ListarClientes();
            gvUsers.DataBind();

        }

    }

    protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        vaciarCampos();
        if (gvUsers.SelectedIndex == -1)
        {
            pnlModificar.Visible = false;
            
        }
        else
        {
            if (cboTipoUsr.Text == "Administradores")
            {
                txtNombre.Text = gvUsers.SelectedRow.Cells[2].Text;
                txtNomCompleto.Text = gvUsers.SelectedRow.Cells[3].Text;
                txtClave.Text = gvUsers.SelectedRow.Cells[4].Text;
                txtCargoDire.Text = gvUsers.SelectedRow.Cells[1].Text;
                txtCargoDire.Visible = true;
                lblCargoDire.Text = "Cargo:";
                lblCargoDire.Visible = true;
                
            }
            else if (cboTipoUsr.Text == "Clientes") 
            {
                txtNombre.Text = gvUsers.SelectedRow.Cells[3].Text;
                txtNomCompleto.Text = gvUsers.SelectedRow.Cells[4].Text;
                txtClave.Text = gvUsers.SelectedRow.Cells[5].Text;
                txtCargoDire.Text = gvUsers.SelectedRow.Cells[1].Text;
                txtCargoDire.Visible = true;
                lblCargoDire.Text = "Direccion:";
                lblCargoDire.Visible = true;
                lblTarj.Visible = true;
                txtTarjeta.Text = gvUsers.SelectedRow.Cells[2].Text;
                txtTarjeta.Visible = true;
            }
            pnlModificar.Visible = true;
        }
    }
    void vaciarCampos() {
        txtCargoDire.Text = "";
        txtCargoDire.Visible = false;
        lblCargoDire.Visible = false;
        txtTarjeta.Text = "";
        lblTarj.Visible = false;
        txtNomCompleto.Text = "";
        txtNombre.Text = "";
        txtClave.Text = "";
    }
}