﻿using System;
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
    List<Control> listOfCtrls()
    {
        List<Control> lstCrtl = new List<Control>();

        lstCrtl.Add(txtHotel);
        lstCrtl.Add(txtCategoriaH);
        lstCrtl.Add(txtCalleH);
        lstCrtl.Add(txtNumeroH);
        lstCrtl.Add(txtCuidadH);
        lstCrtl.Add(txtTelH);
        lstCrtl.Add(txtFaxH);

        lstCrtl.Add(btnAgregarH);
        lstCrtl.Add(btnModificarH);
        lstCrtl.Add(btnEliminarH);

        return lstCrtl;
    }
    private void limpiarFomulario() 
    {
        foreach (Control item in listOfCtrls())
        {
            if (item is TextBox && item.ID != "txtBuscarH")
            {
                ((TextBox)item).Text = String.Empty;
                ((TextBox)item).Enabled = false;
            }
            if (item is Button)
                ((Button)item).Enabled = false;
        }
        imgFotoH.Visible = false;
        imgFotoH.ImageUrl = String.Empty;
        txtFotoH.Enabled = true;
        chkPiscinaH.Checked = false;
        chkPlayaH.Checked = false;
        txtBuscarH.Text = String.Empty;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                txtBuscarH.Attributes.Add("placeholder", "Ingrese el nombre de un Hotel");
                foreach (Control item in listOfCtrls())
                {
                    if (item is TextBox && item.ID != "txtBuscarH")
                        ((TextBox)item).Enabled = false;
                }
            }
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }

    /** BUSCAR HOTEL */
    protected void btnBuscarH_Click(object sender, EventArgs e)
    {
        try
        {
            if (String.IsNullOrEmpty(txtBuscarH.Text))
                throw new Exception("El campo de busqueda se encuetra vacío");

            Hotel hotel = LogicaHotel.Buscar(txtBuscarH.Text);

            foreach (Control item in listOfCtrls())
            {
                if (item is TextBox && item.ID != "txtHotel")
                    ((TextBox)item).Enabled = true;
            }
            btnModificarH.Enabled = true;
            btnEliminarH.Enabled = true;
            imgFotoH.Visible = true;
            txtFotoH.Enabled = true;
            chkPiscinaH.Enabled = true;
            chkPlayaH.Enabled = true;

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

            lblMsj.Text = hotel.UrlFoto;//String.Empty;
        }
        catch (Exception ex)
        {
            foreach (Control item in listOfCtrls())
            {
                if (item is TextBox)
                {
                    ((TextBox)item).Text = String.Empty;
                    ((TextBox)item).Enabled = true;
                }
                if (item is Button && item.ID != "btnAgregarH")
                    ((Button)item).Enabled = false;
            }

            imgFotoH.Visible = false;
            imgFotoH.ImageUrl = String.Empty;
            txtFotoH.Enabled = true;
            chkPiscinaH.Checked = false;
            chkPlayaH.Checked = false;
            btnAgregarH.Enabled = true;

            lblMsj.Text = ex.Message; 
        }
    }
    /** BOTONES ABM HOTEL */
    /** AGREGAR */
    protected void btnAgregarH_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (Control txtBox in listOfCtrls())
            {
                if (txtBox is TextBox && String.IsNullOrEmpty(((TextBox)txtBox).Text))
                    throw new Exception("Existen campos vacíos");
            }

            string rutaImg = "imagenes/hoteles/" + txtFotoH.FileName;

            Hotel hotel = new Hotel(txtHotel.Text, txtCalleH.Text, Convert.ToInt32(txtNumeroH.Text), txtCuidadH.Text,
                                    Convert.ToInt32(txtCategoriaH.Text), txtTelH.Text, txtFaxH.Text, rutaImg,
                                    chkPlayaH.Checked, chkPiscinaH.Checked);

            LogicaHotel.Agregar(hotel);
            txtFotoH.SaveAs(Server.MapPath(rutaImg));
            lblMsj.Text = "Hotel agregado correctamente";
            
            limpiarFomulario();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }

    }
    /** MODIFICAR */
    protected void btnModificarH_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (Control txtBox in listOfCtrls())
            {
                if (txtBox is TextBox && String.IsNullOrEmpty(((TextBox)txtBox).Text))
                    throw new Exception("Existen campos vacíos");
            }
            string rutaImg = txtFotoH.FileName !=  "" ? "imagenes/hoteles/" + txtFotoH.FileName : imgFotoH.ImageUrl;

            Hotel hotel = new Hotel(txtHotel.Text, txtCalleH.Text, Convert.ToInt32(txtNumeroH.Text), txtCuidadH.Text,
                                    Convert.ToInt32(txtCategoriaH.Text), txtTelH.Text, txtFaxH.Text, rutaImg,
                                    chkPlayaH.Checked, chkPiscinaH.Checked);

            LogicaHotel.Modificar(hotel);
            
            if(txtFotoH.FileName != "")
                txtFotoH.SaveAs(Server.MapPath(rutaImg));

            //lblMsj.Text = "Hotel modificado correctamente";
            lblMsj.Text = rutaImg;
            limpiarFomulario();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    /** ELIMINAR */
    protected void btnEliminarH_Click(object sender, EventArgs e)
    {
        try
        {
            LogicaHotel.Eliminar(txtHotel.Text);

            lblMsj.Text = "Hotel eliminado correctamente con sus dependecias";

            limpiarFomulario();
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
}