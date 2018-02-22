using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class formHab : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            foreach (Hotel h in LogicaHotel.ListaHoteles())
            {
                lstHoteles.Items.Add(h.Nombre);
            }
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }

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