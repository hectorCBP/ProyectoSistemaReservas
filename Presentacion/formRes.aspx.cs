using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using EntidadesCompartidas;
using System.Web.UI.HtmlControls;

public partial class formRes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            lblMsj.Text = "";
            lblCosto.Visible = false;
            lblCosto2.Visible = false;
            
            if (lstCategoria.SelectedIndex == 0)
            { btnCargarCat.Enabled = false; }
            else { btnCargarCat.Enabled = true;}
            
            int[] categorias = { 1, 2, 3, 4, 5 };
            if (!IsPostBack)
            {
                clnFechaIn.SelectedDate = DateTime.Today;
                clnFechaFin.SelectedDate = DateTime.Today;
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
        try
        {
            Response.Redirect("formLstRes.aspx");
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }

    protected void btnCargarCat_Click(object sender, EventArgs e)

    {
        try
        {
            
            btnReservar.Enabled = false;
            btnCalcular.Enabled = false;
            if (lstCategoria.SelectedIndex != 0)
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
            else 
            {
                gvReserva.Visible = false;
                pnlHabitacion.Visible = false;
                ddlHabitaciones.Visible = false;
            }


        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }

    protected void gvReserva_SelectedIndexChanged(object sender, EventArgs e)
    {
        try{
            
            pnlHabitacion.Visible = false;
            string nombre_hotel = Server.HtmlDecode(gvReserva.SelectedRow.Cells[1].Text);
            var listHabitaciones = LogicaHabitacion.ListadoHabitaciones(nombre_hotel);

            lblHabitaciones.Visible = true;
            ddlHabitaciones.Visible = true;
            ddlHabitaciones.SelectedIndex = -1;

            ddlHabitaciones.Items.Clear();
            ddlHabitaciones.Items.Add("Seleccione una Habitacíon");

            foreach (Habitacion hab in listHabitaciones) 
                ddlHabitaciones.Items.Add(hab.Numero.ToString());

        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }

    protected void btnCalcular_Click(object sender, EventArgs e)
    {

        try
        {

            DateTime fechaIn = clnFechaIn.SelectedDate;
            DateTime fechaFin = clnFechaFin.SelectedDate;
            int dias = (int)(fechaFin - fechaIn).TotalDays+1;
            string nombre_hotel = Server.HtmlDecode(gvReserva.SelectedRow.Cells[1].Text);

            Habitacion hab = LogicaHabitacion.ObtenerHabitacion(nombre_hotel, Convert.ToInt32(ddlHabitaciones.Text));
            decimal costo = dias * hab.Costo;
            lblCosto2.Visible = true;
            lblCosto.Visible = true;
            lblCosto.Text = costo.ToString()+"$";
        }

        catch (Exception ex)
        { lblMsj.Text = ex.Message; }

    }

    protected void ddlHabitaciones_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlHabitaciones.SelectedIndex != 0)
            {
                btnCalcular.Enabled = true;
                btnReservar.Enabled = true;


                pnlHabitacion.Visible = true;
                string nombre_hotel = Server.HtmlDecode(gvReserva.SelectedRow.Cells[1].Text);
                Habitacion hab = LogicaHabitacion.ObtenerHabitacion(nombre_hotel, Convert.ToInt32(ddlHabitaciones.Text));
                tbNumero.Text = hab.Numero.ToString();
                tbNombre.Text = hab.Hotel.Nombre;
                tbDesc.InnerText = hab.Descripcion;
                tbHues.Text = hab.CantHuesped.ToString();
                tbCosto.Text = hab.Costo.ToString();
                tbPiso.Text = hab.Piso.ToString();
            }
            else
            {
                btnCalcular.Enabled = false;
                btnReservar.Enabled = false;
                pnlHabitacion.Visible = false;
            }
            
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }

    protected void btnReservar_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime fechaIn = clnFechaIn.SelectedDate;
            DateTime fechaFin = clnFechaFin.SelectedDate;


            int dias = (int)(fechaFin - fechaIn).TotalDays+1;

            if (dias < 0)
                throw new Exception("La fecha de fin de la reserva debe ser posterior a la fecha de inicio.");

            string nombre_hotel = Server.HtmlDecode(gvReserva.SelectedRow.Cells[1].Text);

            Habitacion hab = LogicaHabitacion.ObtenerHabitacion(nombre_hotel, Convert.ToInt32(ddlHabitaciones.Text));

            string nombre = ((Usuario)Session["usuario"]).Nombre;
            Cliente cli = LogicaUsuario.BuscarCliente(nombre);

            decimal costo = dias * hab.Costo;
            Reserva res = new Reserva(11, fechaIn, fechaFin, "activa", cli, hab);

            LogicaReserva.Agregar(res);
            lblMsj.Text = "Reserva realizada correctamente";
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }

    protected void lstCategoria_SelectedIndexChanged(object sender, EventArgs e)
    {
     
    }
}