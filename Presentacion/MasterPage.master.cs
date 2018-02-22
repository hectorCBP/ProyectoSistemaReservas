using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string nombre = (string)Session["usuario"];
            if (nombre == null)
                Response.Redirect("Default.aspx");

            lblNombre.Text = nombre;

             if ((string)Session["tipoUsuario"] == "cliente")
            {
                btnCrearRes.Visible = true;
                btnLstRes.Visible = true;
            }
            else
            {
                btnHab.Visible = true;
                btnHot.Visible = true;
                btnUsr.Visible = true;
                btnReserva.Visible = true;
            }
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
    protected void btnHab_Click(object sender, EventArgs e)
    {
        Response.Redirect("formHab.aspx");
    }
    protected void btnHot_Click(object sender, EventArgs e)
    {
        Response.Redirect("formHot.aspx");
    }
    protected void btnUsr_Click(object sender, EventArgs e)
    {
        Response.Redirect("formUsr.aspx");
    }
    protected void btnReserva_Click(object sender, EventArgs e)
    {
        Response.Redirect("formResAdmin.aspx");
    }
    protected void btnCrearRes_Click(object sender, EventArgs e)
    {
        Response.Redirect("formCliente.aspx");
    }
    protected void btnLstRes_Click(object sender, EventArgs e)
    {
        Response.Redirect("formLstRes.aspx");
    }
}
