using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Logica;
using EntidadesCompartidas;

public partial class formCli : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
                Limpiar();
            lblMsj.Text = "";
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            Administrador a = LogicaUsuario.BuscarAdmin(txtNombre.Text);
            Session["admin"] = a;
            if (a == null)
            {
                Cliente c = LogicaUsuario.BuscarCliente(txtNombre.Text);
                if (c == null)
                    CamposAgregar();
                else
                    lblMsj.Text = "Existe un cliente con ese nombre";
            }
            else
            {
                txtNomCompleto.Text = a.NombreCompleto;
                txtClave.Text = a.Clave;
                txtCargo.Text = a.Cargo;
                CamposModificarEliminar();
            }
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        Limpiar();
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            if (((Administrador)Session["admin"]).Nombre == ((Usuario)Session["usuario"]).Nombre)
                throw new Exception("No puedes eliminar el usuario logueado actualmente");
            else
            {
                LogicaUsuario.EliminarAdmin((Administrador)Session["admin"]);
                lblMsj.Text = "Eliminado correctamente";
                Limpiar();
            }
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            ((Administrador)Session["admin"]).NombreCompleto = txtNomCompleto.Text;
            ((Administrador)Session["admin"]).Cargo = txtCargo.Text;
            ((Administrador)Session["admin"]).Clave = txtClave.Text;
            LogicaUsuario.ModificarAdmin((Administrador)Session["admin"]);
            lblMsj.Text = "Modificado correctamente";
            Limpiar();
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            Session["admin"] = new Administrador(txtNombre.Text, txtNomCompleto.Text, txtClave.Text, txtCargo.Text);
            LogicaUsuario.AgregarAdmin(((Administrador)Session["admin"]));
            lblMsj.Text = "Agregado correctamente";
            Limpiar();
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }



    protected void Limpiar()
    {
        txtNombre.Text = "";
        txtNombre.Enabled = true;
        btnBuscar.Enabled = true;
        txtNomCompleto.Enabled = false;
        txtNomCompleto.Text = "";
        txtClave.Enabled = false;
        txtClave.Text = "";
        txtCargo.Text = "";
        txtCargo.Enabled = false;
        txtCargo.Text = "";
        btnAgregar.Enabled = false;
        btnModificar.Enabled = false;
        btnEliminar.Enabled = false;
    }
    protected void CamposAgregar()
    {
        txtNombre.Enabled = false;
        btnBuscar.Enabled = false;
        txtNomCompleto.Enabled = true;
        txtCargo.Enabled = true;
        txtClave.Enabled = true;
        btnAgregar.Enabled = true;
        btnModificar.Enabled = false;
        btnEliminar.Enabled = false;
    }
    protected void CamposModificarEliminar()
    {
        txtNombre.Enabled = false;
        btnBuscar.Enabled = false;
        txtNomCompleto.Enabled = true;
        txtCargo.Enabled = true;
        txtClave.Enabled = true;
        btnAgregar.Enabled = false;
        btnModificar.Enabled = true;
        btnEliminar.Enabled = true;

    }
}