using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class formEstadoHab : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                foreach (Hotel h in LogicaHotel.ListaHoteles())
                    lstHoteles.Items.Add(h.Nombre);
            }
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void btnCargarHab_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsj.Text = String.Empty;

            if (lstHoteles.SelectedValue == "-1")
                throw new Exception("Debe seleccionar un Hotel");
            gvEstadoHab.Visible = true;
            gvEstadoHab.DataSource = LogicaHabitacion.ListadoHabitaciones(lstHoteles.Text);
            gvEstadoHab.DataBind();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void gvEstadoHab_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblMsj.Text = String.Empty;
            gvResHab.Visible = false;
            ddlFiltro.Visible = false;
            if (lstHoteles.SelectedValue == "-1")
                throw new Exception("Debe seleccionar un Hotel");

            string numeroHab = gvEstadoHab.SelectedRow.Cells[3].Text;
            List<Reserva> lstRes = LogicaReserva.ListarPorHabitacion(numeroHab, lstHoteles.Text,"");

            if (lstRes.Count == 0)
                throw new Exception("No existen reservas para esta habitación");
            else
            {
                ddlFiltro.Visible = true;
                gvResHab.Visible = true;
                gvResHab.AutoGenerateColumns = false;
                gvResHab.DataSource = lstRes;
                gvResHab.DataBind();
            }

        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void lstHoteles_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblMsj.Text = String.Empty;
            gvEstadoHab.DataSource = null;
            gvEstadoHab.DataBind();
            gvEstadoHab.Visible = false;
            gvResHab.Visible = false;
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            string numeroHab = gvEstadoHab.SelectedRow.Cells[3].Text;
            string filtro = ddlFiltro.SelectedValue;
            if (ddlFiltro.Text == "Todas") filtro = "";
            gvResHab.DataSource = LogicaReserva.ListarPorHabitacion(numeroHab, lstHoteles.Text, filtro);
            gvResHab.DataBind();
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }
}