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
                Response.Write("<script>alert('El usuario y/o la contraseña no son correctas');</script>");
            else
            {
                Session["usuario"] = usuario;
                
                if (usuario is Cliente)
                {
                    
                    Response.Redirect("formRes.aspx");
                }
                else
                {
                    Response.Redirect("formHab.aspx");
                }
            }
        }
        catch (Exception ex)
        { Response.Write("<script>alert('" + ex.Message + "');</script>"); }
    }
    protected void btnRegistro_Click(object sender, EventArgs e)
    {
        Response.Redirect("formRegistro.aspx");
    }
}