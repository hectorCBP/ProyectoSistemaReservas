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
        btnUsr.Enabled = false;
    }
    protected void btnHab_Click(object sender, EventArgs e)
    {
        Response.Redirect("formHab.aspx");
    }
    protected void btnHot_Click(object sender, EventArgs e)
    {
        Response.Redirect("formHot.aspx");
    }
    protected void btnReserva_Click(object sender, EventArgs e)
    {
        Response.Redirect("formResAdmin.aspx");
    }
    protected void cboTipoUsr_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvUsers.SelectedIndex = -1;

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

}