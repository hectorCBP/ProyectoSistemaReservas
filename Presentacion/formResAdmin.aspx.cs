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
            gvResActivas.Visible = true;
            gvResActivas.DataSource = LogicaReserva.Listado();
            gvResActivas.DataBind();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void gvResActivas_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int numero = Convert.ToInt32(gvResActivas.SelectedRow.Cells[1].Text);
            LogicaReserva.FinalizarReszerva(numero);
            Response.Redirect("formResAdmin.aspx");
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
}