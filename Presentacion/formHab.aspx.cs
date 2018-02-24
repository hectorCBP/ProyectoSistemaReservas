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
    List<Control> listaRequeridos()
    {
        List<Control> lstCampos = new List<Control>();

        lstCampos.Add(lstHoteles);
        lstCampos.Add(txtNumeroHab);
        lstCampos.Add(txtDescripcionHab);
        lstCampos.Add(txtHuespedHab);
        lstCampos.Add(txtCosto);
        lstCampos.Add(txtPisoHab);

        return lstCampos;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                foreach (Hotel h in LogicaHotel.ListaHoteles())
                {
                    lstHoteles.Items.Add(h.Nombre);
                }
            }
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }

    }
    protected void btnEstadoHab_Click(object sender, EventArgs e)
    {
        Response.Redirect("formEstadoHab.aspx");
    }
    protected void btnBuscarHab_Click(object sender, EventArgs e)
    {
        try
        {
            if(String.IsNullOrEmpty(txtNumeroHab.Text))
                throw new Exception("Número de habitación no puede ser vacío");

            Habitacion habitacion = LogicaHabitacion.ObtenerHabitacion(lstHoteles.Text, txtNumeroHab.Text);

            txtHuespedHab.Text = habitacion.CantHuesped.ToString();
            txtPisoHab.Text = habitacion.Piso.ToString();
            txtDescripcionHab.Text = habitacion.Descripcion;
            txtCosto.Text = habitacion.Costo.ToString();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void btnAgregarHab_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (Control campo in listaRequeridos())
            {
                if (campo is DropDownList)
                {
                    if (((DropDownList)campo).SelectedIndex == -1)
                        throw new Exception("Existen campos sin completar");
                }
                string box = ((TextBox)campo).Text;
                if (String.IsNullOrEmpty(box))
                    throw new Exception("Existen campos sin completar");
            }

            Habitacion habitacion = new Habitacion(
                Convert.ToInt32(txtNumeroHab.Text),
                (string)lstHoteles.Text,
                (string)txtDescripcionHab.Text,
                Convert.ToInt32(txtHuespedHab.Text),
                Convert.ToDecimal(txtCosto.Text),
                Convert.ToInt32(txtPisoHab.Text));

            LogicaHabitacion.Agregar(habitacion);
            lblMsj.Text = "Se agrego correctamente";
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void btnModificarHab_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (Control campo in listaRequeridos())
            {
                if (campo is DropDownList)
                {
                    if (((DropDownList)campo).SelectedIndex == -1)
                        throw new Exception("Existen campos sin completar");
                }
                string box = ((TextBox)campo).Text;
                if (String.IsNullOrEmpty(box))
                    throw new Exception("Existen campos sin completar");
            }

            Habitacion habitacion = new Habitacion(
                Convert.ToInt32(txtNumeroHab.Text),
                (string)lstHoteles.Text,
                (string)txtDescripcionHab.Text,
                Convert.ToInt32(txtHuespedHab.Text),
                Convert.ToDecimal(txtCosto.Text),
                Convert.ToInt32(txtPisoHab.Text));

            LogicaHabitacion.Modificar(habitacion);
            lblMsj.Text = "Se mopdificó correctamente";
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
}