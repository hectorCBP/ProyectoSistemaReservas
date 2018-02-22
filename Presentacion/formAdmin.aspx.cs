using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class formAdmin : System.Web.UI.Page
{
    /** INICIO DE PAGINA */
    protected void Page_Load(object sender, EventArgs e)
    {

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
}