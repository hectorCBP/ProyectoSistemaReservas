using System;
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
                gvResActivas.Visible = true;
                gvResActivas.AutoGenerateColumns = false;
                gvResActivas.DataSource = LogicaReserva.ListadoCliente(((Usuario)Session["usuario"]).Nombre);
                gvResActivas.DataBind();
                
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }

    protected void gvResActivas_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            Reserva res = null;
            pnlDatosRes.Visible = true;
            int num = Convert.ToInt32(gvResActivas.SelectedRow.Cells[1].Text);
            res=LogicaReserva.Buscar(num);
            Session["reservaActiva"] = res;
            
            Hotel hot = LogicaHotel.Buscar(res.Hab.Hotel.Nombre);
            
            txtNum.Text = res.Numero.ToString();
            txtEstado.Text = res.EstadoRes;
            txtFechaIn.Text = res.FechaIni.ToString();
            txtFechaFin.Text = res.FechaFin.ToString();
            txtCli.Text = res.Cli.Nombre;
            txtNumHab.Text = res.Hab.Numero.ToString();
            txtNomHot.Text = res.Hab.Hotel.Nombre;
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
            gvResActivas.Columns.Clear();
            Response.CacheControl = "no-cache";
            LogicaReserva.Cancelar((Reserva)Session["reservaActiva"]);
            
            gvResActivas.DataSource = LogicaReserva.ListadoCliente(((Usuario)Session["usuario"]).Nombre);
            gvResActivas.DataBind();
            gvResActivas.SelectedIndex = -1;
            
            Response.Redirect("formLstRes.aspx");
            
            
        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
}