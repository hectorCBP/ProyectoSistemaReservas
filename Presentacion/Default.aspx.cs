using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        try
        {
            string user = txtUsuario.Text;
            string pass = txtClave.Text;

            Usuario usuario = LogicaUsuario.Logueo(user, pass);

            if (usuario == null)
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('El usuario y/o la contraseña no son correctas');</script>");
            else
            {
                Session["usuario"] = usuario.Nombre;
                Session["tipoUsuario"] = usuario is Cliente ? "cliente" : "administrador";
                if (usuario is Cliente)
                    Response.Redirect("formCliente.aspx");
                else
                    Response.Redirect("formAdmin.aspx");
            }
        }
        catch (Exception ex)
        { Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('"+ex.Message+"');</script>"); }
    }
    protected void btnRegistro_Click(object sender, EventArgs e)
    {
        Response.Redirect("formRegistro.aspx");
    }
}