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
            if(String.IsNullOrEmpty(txtNumeroHab.Text) || lstHoteles.SelectedIndex == -1)
                throw new Exception("Debe completar todos los campos de busqueda");

            Session["habitacion"] = LogicaHabitacion.ObtenerHabitacion(lstHoteles.Text, Convert.ToInt32(txtNumeroHab.Text));

            if ((Habitacion)Session["habitacion"] != null)
            {
                foreach (Control item in listaRequeridos())
                {
                    if (item is TextBox)
                        ((TextBox)item).Enabled = true;
                }
                btnAgregarHab.Enabled = false;
                btnModificarHab.Enabled = true;
                btnEliminarHab.Enabled = true;

                txtHuespedHab.Text = ((Habitacion)Session["habitacion"]).CantHuesped.ToString();
                txtPisoHab.Text = ((Habitacion)Session["habitacion"]).Piso.ToString();
                txtDescripcionHab.Text = ((Habitacion)Session["habitacion"]).Descripcion;
                txtCosto.Text = ((Habitacion)Session["habitacion"]).Costo.ToString();
            }
            else 
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
            }
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
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

            Session["habitacion"] = new Habitacion(
                Convert.ToInt32(txtNumeroHab.Text.Trim()),
                LogicaHotel.Buscar(lstHoteles.Text.Trim()),
                txtDescripcionHab.Text.Trim(),
                Convert.ToInt32(txtHuespedHab.Text.Trim()),
                Convert.ToDecimal(txtCosto.Text.Trim()),
                Convert.ToInt32(txtPisoHab.Text.Trim()));

            LogicaHabitacion.Agregar((Habitacion)Session["habitacion"]);
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

                ((Habitacion)Session["habitacion"]).Numero = Convert.ToInt32(txtNumeroHab.Text);
                ((Habitacion)Session["habitacion"]).Hotel = LogicaHotel.Buscar((string)lstHoteles.Text);
                ((Habitacion)Session["habitacion"]).Descripcion= (string)txtDescripcionHab.Text;
                ((Habitacion)Session["habitacion"]).CantHuesped= Convert.ToInt32(txtHuespedHab.Text);
                ((Habitacion)Session["habitacion"]).Costo = Convert.ToDecimal(txtCosto.Text);
                ((Habitacion)Session["habitacion"]).Piso = Convert.ToInt32(txtPisoHab.Text);

            LogicaHabitacion.Modificar(((Habitacion)Session["habitacion"]) );
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

            LogicaHabitacion.Eliminar(((Habitacion)Session["habitacion"]));
            lblMsj.Text = "Se eliminó correctamente";
            LimpiarFormulario();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
}