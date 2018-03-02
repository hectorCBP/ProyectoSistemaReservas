using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;

public partial class formCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnCrearRes_Click(object sender, EventArgs e)
    {
        Response.Redirect("formRes.aspx");
    }
    protected void btnLstRes_Click(object sender, EventArgs e)
    {
        Response.Redirect("formLstRes.aspx");
    }
    
}