using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class formHot : System.Web.UI.Page
{

    /** HERRAMIENTAS PARA CONTROLES */
    List<Control> listOfTxtBox()
    {
        List<Control> lstTB = new List<Control>();

        lstTB.Add(txtHotel);
        lstTB.Add(txtCategoriaH);
        lstTB.Add(txtCalleH);
        lstTB.Add(txtNumeroH);
        lstTB.Add(txtCuidadH);
        lstTB.Add(txtTelH);
        lstTB.Add(txtFaxH);

        return lstTB;
    }
    List<Control> listOfBtn()
    {
        List<Control> lstBtn = new List<Control>();

        return lstBtn;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            btnHot.Enabled = false;
            txtBuscarH.Attributes.Add("placeholder", "Ingrese el nombre de un Hotel");
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    
    protected void btnHab_Click(object sender, EventArgs e)
    {
        Response.Redirect("formHab.aspx");
    }
    protected void btnUsr_Click(object sender, EventArgs e)
    {
        Response.Redirect("formUsr.aspx");
    }
    protected void btnReserva_Click(object sender, EventArgs e)
    {
        Response.Redirect("formResAdmin.aspx");
    }

    /** BUSCAR HOTEL */
    protected void btnBuscarH_Click(object sender, EventArgs e)
    {
        try
        {
            if (String.IsNullOrEmpty(txtBuscarH.Text))
                throw new Exception("El campo de busqueda se encuetra vacío");

            Hotel hotel = LogicaHotel.Buscar(txtBuscarH.Text);

            txtHotel.Text = hotel.Nombre;
            txtCategoriaH.Text = hotel.Categoria.ToString();
            txtCalleH.Text = hotel.Calle;
            txtNumeroH.Text = hotel.Numero.ToString();
            txtCuidadH.Text = hotel.Ciudad;
            txtTelH.Text = hotel.Telefono;
            txtFaxH.Text = hotel.Fax;
            chkPlayaH.Checked = hotel.Playa;
            chkPiscinaH.Checked = hotel.Piscina;

            imgFotoH.ImageUrl = hotel.UrlFoto;

            lblMsj.Text = String.Empty;
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    /** BOTONES ABM HOTEL */
    /** AGREGAR */
    protected void btnAgregarH_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (Control txtBox in listOfTxtBox())
            {
                if (String.IsNullOrEmpty(((TextBox)txtBox).Text))
                    throw new Exception("Existen campos vacíos");
            }

            string rutaImg = "~/imagenes/hoteles/" + txtFotoH.FileName;

            Hotel hotel = new Hotel(txtHotel.Text, txtCalleH.Text, Convert.ToInt32(txtNumeroH.Text), txtCuidadH.Text,
                                    Convert.ToInt32(txtCategoriaH.Text), txtTelH.Text, txtFaxH.Text, rutaImg,
                                    chkPlayaH.Checked, chkPiscinaH.Checked);

            LogicaHotel.Agregar(hotel);
            txtFotoH.SaveAs(Server.MapPath(rutaImg));
            lblMsj.Text = "Hotel agregado correctamente";
            // TO DO limpiar campos
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }

    }
    /** MODIFICAR */
    protected void btnModificarH_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (Control txtBox in listOfTxtBox())
            {
                if (String.IsNullOrEmpty(((TextBox)txtBox).Text))
                    throw new Exception("Existen campos vacíos");
            }
            string rutaImg = "~/imagenes/hoteles/" + txtFotoH.FileName;

            Hotel hotel = new Hotel(txtHotel.Text, txtCalleH.Text, Convert.ToInt32(txtNumeroH.Text), txtCuidadH.Text,
                                    Convert.ToInt32(txtCategoriaH.Text), txtTelH.Text, txtFaxH.Text, rutaImg,
                                    chkPlayaH.Checked, chkPiscinaH.Checked);

            LogicaHotel.Modificar(hotel);
            txtFotoH.SaveAs(Server.MapPath(rutaImg));
            lblMsj.Text = "Hotel modificado correctamente";
            // TO DO limpiar campos
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    /** ELIMINAR */
    protected void btnEliminarH_Click(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
}