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
        if (!IsPostBack && Session["usuario"] == null)
            Response.Redirect("Default.aspx");

        if (!IsPostBack && Session["usuario"] is Cliente)
            Response.Redirect("formRes.aspx");
    }
}