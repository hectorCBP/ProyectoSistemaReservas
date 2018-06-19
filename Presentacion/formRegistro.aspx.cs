using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class formRegistro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsj.Text = "";
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (Control campo in listaRequeridos())
            {
                if (String.IsNullOrEmpty(((TextBox)campo).Text))
                    throw new Exception("Existen campos requeridos sin completar");
            }

            if (txtPass.Text != txtRepPass.Text)
                throw new Exception("Los campos de clave no coinciden");

            string usuario = txtNomUsr.Text.Trim();
            string nombreComleto = txtNomCom.Text.Trim();
            string clave = txtPass.Text.Trim();
            string direccion = txtDir.Text.Trim();
            string tarjeta = txtTarj.Text.Trim();
            List<string> tels = new List<string>();
            tels.Add(txtTel.Text);
            if (txtSegTel.Text!="")
                tels.Add(txtSegTel.Text);
            if (txtMovil.Text!="")
                tels.Add(txtMovil.Text);
            

            Cliente cliente = new Cliente(usuario, nombreComleto, clave, direccion, tarjeta,tels);
            LogicaUsuario.AgregarCliente(cliente);
            LogicaUsuario.AgregarTelefono(cliente);
            lblMsj.Text = "Cliente Agregado correctamente.";
          
                txtNomUsr.Text = "";
                txtNomCom.Text = "";
                txtTarj.Text = "";
                txtDir.Text = "";
                txtTel.Text = "";
                txtSegTel.Text = "";
                txtMovil.Text = "";

        }
        catch (Exception ex)
        { lblMsj.Text = ex.Message; }
    }
    List<Control> listaRequeridos()
    {
        List<Control> requeridos = new List<Control>();

        requeridos.Add(txtNomUsr);
        requeridos.Add(txtNomCom);
        requeridos.Add(txtPass);
        requeridos.Add(txtRepPass);
        requeridos.Add(txtDir);
        requeridos.Add(txtTarj);
        requeridos.Add(txtTel);

        return requeridos;
    }
}