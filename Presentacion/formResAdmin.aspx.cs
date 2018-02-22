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
            gvHabActivas.DataSource = LogicaHabitacion.ConReservasActivas();
            gvHabActivas.DataBind();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
}