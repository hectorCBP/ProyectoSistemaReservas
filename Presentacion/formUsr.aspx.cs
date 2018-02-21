using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class formCli : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnUsr.Enabled = false;
    }
    protected void btnHab_Click1(object sender, EventArgs e)
    {
        Response.Redirect("formHab.aspx");
    }
    protected void btnHot_Click(object sender, EventArgs e)
    {
        Response.Redirect("formHot.aspx");
    }
}