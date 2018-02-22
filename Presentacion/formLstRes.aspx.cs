using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class formLstRes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnLstRes.Enabled = false;
    }
    protected void btnCrearRes_Click(object sender, EventArgs e)
    {
        Response.Redirect("formRes.aspx");
    }
}