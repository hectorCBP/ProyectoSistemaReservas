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

    void LimpiarFormulario() 
    {
        foreach (Control item in listaRequeridos())
        {
            if (item is TextBox && item.ID != "txtNumeroHab")
            {
                ((TextBox)item).Text = String.Empty;
                ((TextBox)item).Enabled = false;
            }
        }

        txtNumeroHab.Text = String.Empty;
        lstHoteles.SelectedIndex = -1;
        btnAgregarHab.Enabled = false;
        btnModificarHab.Enabled = false;
        btnEliminarHab.Enabled = false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                foreach (Hotel h in LogicaHotel.ListaHoteles())
                    lstHoteles.Items.Add(h.Nombre);

                foreach (Control item in listaRequeridos())
                {
                    if (item is TextBox && item.ID != "txtNumeroHab")
                        ((TextBox)item).Enabled = false;
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
            lblMsj.Text = String.Empty;
            if(lstHoteles.SelectedIndex == -1)
                throw new Exception("Debe seleccionar un hotel");
            if(String.IsNullOrEmpty(txtNumeroHab.Text))
                throw new Exception("Número de habitación no puede ser vacío");

            Habitacion habitacion = LogicaHabitacion.ObtenerHabitacion(lstHoteles.Text, Convert.ToInt32(txtNumeroHab.Text));

            foreach (Control item in listaRequeridos())
            {
                if (item is TextBox)
                    ((TextBox)item).Enabled = true;
            }
            btnAgregarHab.Enabled = false;
            btnModificarHab.Enabled = true;
            btnEliminarHab.Enabled = true;

            txtHuespedHab.Text = habitacion.CantHuesped.ToString();
            txtPisoHab.Text = habitacion.Piso.ToString();
            txtDescripcionHab.Text = habitacion.Descripcion;
            txtCosto.Text = habitacion.Costo.ToString();
        }
        catch (Exception ex)
        {
            foreach (Control item in listaRequeridos())
            {
                if (item is TextBox && item.ID != "txtNumeroHab")
                {
                    ((TextBox)item).Text = String.Empty;
                    ((TextBox)item).Enabled = true;
                }
            }
            btnAgregarHab.Enabled = true;
            btnModificarHab.Enabled = false;
            btnEliminarHab.Enabled = false;
            lblMsj.Text = ex.Message; 
        }
    }
    protected void btnAgregarHab_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsj.Text = String.Empty;
            foreach (Control campo in listaRequeridos())
            {
                if (campo is DropDownList)
                {
                    if (((DropDownList)campo).SelectedIndex == -1)
                        throw new Exception("Existen campos sin completar");
                }
                if(campo is TextBox)
                {
                    if (String.IsNullOrEmpty(((TextBox)campo).Text))
                        throw new Exception("Existen campos sin completar");
                }
            }

            Habitacion habitacion = new Habitacion(
                Convert.ToInt32(txtNumeroHab.Text.Trim()),
                lstHoteles.Text.Trim(),
                txtDescripcionHab.Text.Trim(),
                Convert.ToInt32(txtHuespedHab.Text.Trim()),
                Convert.ToDecimal(txtCosto.Text.Trim()),
                Convert.ToInt32(txtPisoHab.Text.Trim()));

            LogicaHabitacion.Agregar(habitacion);
            lblMsj.Text = "Se agrego correctamente";
            LimpiarFormulario();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void btnModificarHab_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsj.Text = String.Empty;
            foreach (Control campo in listaRequeridos())
            {
                if (campo is DropDownList)
                {
                    if (((DropDownList)campo).SelectedIndex == -1)
                        throw new Exception("Existen campos sin completar");
                }
                if (campo is TextBox)
                {
                    string box = ((TextBox)campo).Text;
                    if (String.IsNullOrEmpty(box))
                        throw new Exception("Existen campos sin completar");
                }
            }

            Habitacion habitacion = new Habitacion(
                Convert.ToInt32(txtNumeroHab.Text),
                (string)lstHoteles.Text,
                (string)txtDescripcionHab.Text,
                Convert.ToInt32(txtHuespedHab.Text),
                Convert.ToDecimal(txtCosto.Text),
                Convert.ToInt32(txtPisoHab.Text));

            LogicaHabitacion.Modificar(habitacion);
            lblMsj.Text = "Se modificó correctamente";
            LimpiarFormulario();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void btnEliminarHab_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsj.Text = String.Empty;
            if (String.IsNullOrEmpty(txtNumeroHab.Text) || lstHoteles.SelectedValue == "-1")
                throw new Exception("ERROR - Sin completar número de Habitación o nombre de Hotel");

            LogicaHabitacion.Eliminar(lstHoteles.Text, txtNumeroHab.Text);
            lblMsj.Text = "Se eliminó correctamente";
            LimpiarFormulario();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
}