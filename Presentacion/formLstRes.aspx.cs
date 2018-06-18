﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using EntidadesCompartidas;
using System.Web.UI.HtmlControls;

public partial class formLstRes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                
                string nombre = ((Usuario)Session["usuario"]).Nombre;

                gvResActivas.DataSource = LogicaReserva.ListadoCliente(nombre);
                gvResActivas.DataBind();
            }
            
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }

    protected void gvResActivas_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void gvResActivas_SelectedIndexChanged1(object sender, EventArgs e)
    {
        try
        {

            Reserva res = null;
            pnlDatosRes.Visible = true;
            int num = Convert.ToInt32(gvResActivas.SelectedRow.Cells[1].Text);
            res=LogicaReserva.Buscar(num);
            
            
            Hotel hot = LogicaHotel.Buscar(res.Hab.NombreHotel);
            
            txtNum.Text = res.Numero.ToString();
            txtEstado.Text = res.EstadoRes;
            txtFechaIn.Text = res.FechaIni.ToString();
            txtFechaFin.Text = res.FechaFin.ToString();
            txtCli.Text = res.Cli.Nombre;
            txtNumHab.Text = res.Hab.Numero.ToString();
            txtNomHot.Text = res.Hab.NombreHotel;
            tbDesc.InnerHtml = res.Hab.Descripcion;
            txtCantidad.Text = res.Hab.CantHuesped.ToString();
            txtCosto.Text = res.Hab.Costo.ToString();
            txtPiso.Text = res.Hab.Piso.ToString();
            txtNomHot2.Text = hot.Nombre;
            txtCalle.Text = hot.Calle;
            txtNum2.Text = hot.Numero.ToString();
            txtCiudad.Text = hot.Ciudad;
            txtCat.Text = hot.Categoria.ToString();
            txtTel.Text = hot.Telefono;
            txtFax.Text = hot.Fax;

            if (hot.Piscina == true)
            {
                chkPiscina.Checked = true;
            }
            else { chkPiscina.Checked = false; }

            if (hot.Playa == true)
            {
                chkPlaya.Checked = true;
            }
            else { chkPlaya.Checked = false; }

            imgFtoHotel.ImageUrl = hot.UrlFoto;
            
            
            
            
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        try
        {
            pnlDatosRes.Visible = false;
            int num_res = Convert.ToInt32(gvResActivas.SelectedRow.Cells[1].Text);

            int resp = LogicaReserva.Cancelar(num_res);
            
            Response.Redirect("formLstRes.aspx");
            
            
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
}