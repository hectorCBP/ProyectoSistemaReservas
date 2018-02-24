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
        gvUsers.DataSource = LogicaAdministrador.ListarAdmins();
        gvUsers.DataBind();
    }
    

    protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        vaciarCampos();
        if (gvUsers.SelectedIndex == -1)
        {
            pnlModificar.Visible = false;
            btnCancelAgreg.Text = "Nuevo Administrador";
            //si no tiene nada seleccionado en la grilla saco el panel de modificacion
        }
        else
        {
            btnCancelAgreg.Text = "Cancelar";
            gvUsers.Enabled = false;
            btnEliminar.Visible = true;
            pnlModificar.Visible = true;
            txtNombre.Text = gvUsers.SelectedRow.Cells[0].Text;
            txtNomCompleto.Text = gvUsers.SelectedRow.Cells[1].Text;
            txtClave.Text = gvUsers.SelectedRow.Cells[2].Text;
            txtCargo.Text = gvUsers.SelectedRow.Cells[3].Text;
            
        }
    }
    void vaciarCampos() {
        txtCargo.Text = "";
        txtNomCompleto.Text = "";
        txtNombre.Text = "";
        txtClave.Text = "";
    }

    
    protected void btnConvertir_Click(object sender, EventArgs e)
    {

    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {

    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        if (btnCancelAgreg.Text == "Cancelar")
        {
            gvUsers.SelectedIndex = -1;
            pnlModificar.Visible = false;
            gvUsers.Enabled = true;
            btnCancelAgreg.Text = "Nuevo Administrador";
        }
        else if (btnCancelAgreg.Text == "Nuevo Administrador") 
        {
            vaciarCampos();
            btnEliminar.Visible = false;
            btnCancelAgreg.Text = "Cancelar";
            gvUsers.Enabled = false;
            pnlModificar.Visible = true;
        }
    }
}