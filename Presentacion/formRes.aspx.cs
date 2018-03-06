using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using EntidadesCompartidas;

public partial class formRes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //btnCrearRes.Enabled = false;
        try
        {

            int[] categorias = { 1, 2, 3, 4, 5 };
            if (!IsPostBack)
            {
                foreach (int cat in categorias)
                {
                    lstCategoria.Items.Add(cat.ToString());

                }
            }
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void btnLstRes_Click(object sender, EventArgs e)
    {
        Response.Redirect("formLstRes.aspx");
    }
    protected void btnCargarHab_Click(object sender, EventArgs e)
    {
        try
        {
            pnlHabitacion.Visible = false;
            lblHabitaciones.Visible = false;
            ddlHabitaciones.Visible = false;
            gvReserva.SelectedIndex = -1;
            gvReserva.DataSource = LogicaHotel.ListaCat(Convert.ToInt32(lstCategoria.Text));
            gvReserva.DataBind();
            lblHot.Visible = true;
            lblHot.Text = "Hoteles:";
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void gvReserva_SelectedIndexChanged(object sender, EventArgs e)
    {
        try{

            pnlHabitacion.Visible = false;
            string nombre_hotel = gvReserva.SelectedRow.Cells[1].Text;
            var listHabitaciones = LogicaHabitacion.ListadoHabitaciones(nombre_hotel);
            lblHabitaciones.Visible = true;
            ddlHabitaciones.Visible = true;
            ddlHabitaciones.SelectedIndex = -1;
            foreach (Habitacion hab in listHabitaciones) {
                ddlHabitaciones.Items.Add(hab.Numero.ToString());
            }
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void btnCalcular_Click(object sender, EventArgs e)
    {
        lblCosto.Visible = true;
        lblCosto.Text = "x pesos";
    }
    protected void ddlHabitaciones_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            
                pnlHabitacion.Visible = true;
                string nombre_hotel = gvReserva.SelectedRow.Cells[1].Text;
                Habitacion hab = LogicaHabitacion.ObtenerHabitacion(nombre_hotel, ddlHabitaciones.Text);
                tbNumero.Text = hab.Costo.ToString();
                tbNombre.Text = hab.NombreHotel;
                tbDesc.Text = hab.Descripcion;
                tbHues.Text = hab.CantHuesped.ToString();
                tbCosto.Text = hab.Costo.ToString();
                tbPiso.Text = hab.Piso.ToString();
            
            
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
        

    }
    protected void btnReservar_Click(object sender, EventArgs e)
    {
        DateTime fechaIn = clnFechaIn.SelectedDate;
        DateTime fechaFin = clnFechaFin.SelectedDate;

        int dias = (int)(fechaFin - fechaIn).TotalDays;
        if (dias < 1)
            throw new Exception("El período de alquiler puede ser como mínimo de 1 día.");
        string nombre_hotel = gvReserva.SelectedRow.Cells[1].Text;
        Habitacion hab = LogicaHabitacion.ObtenerHabitacion(nombre_hotel, ddlHabitaciones.Text);
        string nombre = (string)Session["usuario"];
        
    }
}