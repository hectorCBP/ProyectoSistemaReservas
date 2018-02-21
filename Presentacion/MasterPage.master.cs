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
        string nombre = (string)Session["usuario"];
        if (nombre == null)
            Response.Redirect("Default.aspx");

        lblNombre.Text = nombre;
    }
    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}
