using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class formResAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            btnReserva.Enabled = false;
            btnHab.Enabled = false;
            gvHabActivas.DataSource = LogicaHabitacion.ConReservasActivas();
            gvHabActivas.DataBind();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
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
}