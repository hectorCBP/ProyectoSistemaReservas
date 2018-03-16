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

            Cliente cliente = new Cliente(usuario, nombreComleto, clave, direccion, tarjeta);

            List<TelefonoCliente> lstObjTel = new List<TelefonoCliente>();
            /*
             * THIS NEED A FIX
             * 
            List<string> lstTel = new List<string>();            
            TelefonoCliente telCli = null;

            if (txtSegTel.Text != null)
                lstTel.Add(txtSegTel.Text.Trim());
            if (txtMovil.Text != null)
                lstTel.Add(txtMovil.Text.Trim());
            
            foreach (string numTel in lstTel)
            {
                telCli = new TelefonoCliente(txtNomUsr.Text, numTel);
                lstObjTel.Add(telCli);
            }
            */            
            LogicaCliente.Agregar(cliente, lstObjTel);           
            lblMsj.Text = "Se ha registrado con éxito";

            foreach (Control campo in listaRequeridos())
                ((TextBox)campo).Text = String.Empty;

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