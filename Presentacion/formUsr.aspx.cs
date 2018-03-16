﻿using System;
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
        lblMsj.Text = "";
        try
        {
            gvUsers.DataSource = LogicaAdministrador.ListarAdmins();
            gvUsers.DataBind();
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }
    
    protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
        vaciarCampos();
        if (gvUsers.SelectedIndex == -1)
        {
            pnlModificar.Visible = false;
            btnCancelAgreg.Text = "Nuevo Administrador";
            //si no tiene nada seleccionado en la grilla saco el panel de modificacion
        }
        else
        {
            btnCancelAgreg.Text = "Cancelar";
            gvUsers.Enabled = false;
            btnEliminar.Visible = true;
            pnlModificar.Visible = true;
            
            Administrador a = LogicaAdministrador.BuscarAdmin( Server.HtmlDecode(gvUsers.SelectedRow.Cells[0].Text));
            txtNombre.Text = a.Nombre.ToString();
            txtNombre.Enabled = false;
            txtNomCompleto.Text = a.NombreCompleto.ToString();            
            txtClave.Text = a.Clave.ToString();            
            txtCargo.Text = a.Cargo.ToString();
        }
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }

    void vaciarCampos() {
        txtCargo.Text = "";
        txtNomCompleto.Text = "";
        txtNombre.Text = "";
        txtClave.Text = "";
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            Administrador a = new Administrador(txtNombre.Text, txtNomCompleto.Text, txtClave.Text, txtCargo.Text);

            if (a.Nombre != (string)Session["usuario"])
            {
                if (LogicaAdministrador.EliminarAdmin(a))
                {
                    lblMsj.Text = "Usuario eliminado correctamente";
                    vaciarCampos();
                    gvUsers.DataSource = LogicaAdministrador.ListarAdmins();
                    gvUsers.DataBind();
                }
                
            }
            else
                throw new Exception("No puedes borrar el Usuario logueado actualmente");
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        try
        {
        if (btnCancelAgreg.Text == "Cancelar")
        {
            gvUsers.SelectedIndex = -1;
            pnlModificar.Visible = false;
            gvUsers.Enabled = true;
            btnCancelAgreg.Text = "Nuevo Administrador";
        }
        else if (btnCancelAgreg.Text == "Nuevo Administrador") 
        {
            vaciarCampos();
            btnEliminar.Visible = false;
            btnCancelAgreg.Text = "Cancelar";
            gvUsers.Enabled = false;
            pnlModificar.Visible = true;
            txtNombre.Enabled = true;
        }
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try{

            foreach (Control campo in listaRequeridos())
            {
                if (String.IsNullOrEmpty(((TextBox)campo).Text))
                    throw new Exception("Debe completar todos los campos!");
            }

        Administrador a = new Administrador(txtNombre.Text,txtNomCompleto.Text,txtClave.Text,txtCargo.Text);
        if (gvUsers.SelectedIndex == -1)
        {
            if (LogicaAdministrador.AgregarAdmin(a))
            {
                lblMsj.Text = "Usuario agregado correctamente";
                vaciarCampos();
            }
        }
        else
        {
            if (LogicaAdministrador.ModificarAdmin(a))
                lblMsj.Text = "Usuario modificado correctamente";
        }
        gvUsers.DataSource = LogicaAdministrador.ListarAdmins();
        gvUsers.DataBind();
        }
        catch (Exception ex) { lblMsj.Text = ex.Message; }
    }

    List<Control> listaRequeridos()
    {
        List<Control> requeridos = new List<Control>();

        requeridos.Add(txtNombre);
        requeridos.Add(txtNomCompleto);
        requeridos.Add(txtClave);
        requeridos.Add(txtCargo);
   
        return requeridos;
    }
}