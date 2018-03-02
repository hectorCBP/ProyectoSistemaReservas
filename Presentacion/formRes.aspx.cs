using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;

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
            gvReserva.DataSource = LogicaHotel.ListaCat(Convert.ToInt32(lstCategoria.Text));
            gvReserva.DataBind();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void gvReserva_SelectedIndexChanged(object sender, EventArgs e)
    {
        try{

            string nombre_hotel = gvReserva.SelectedRow.Cells[1].Text;
            gvReserva.DataSource = LogicaHabitacion.ListadoHabitaciones(nombre_hotel);
            gvReserva.DataBind();
            //gvReserva.SelectedIndex = -1;

            if (gvReserva.SelectedIndex > 0)
            {
                Response.Write("<script>alert('El costo total de la reserva es de: ');</script>");

                
            }
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
}