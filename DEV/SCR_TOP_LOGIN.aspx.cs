using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SCR_TOP_LOGIN : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            lblProfile.Text = "my profile";
            lblUserName.Text = "Login User Name";

        }
    }
    protected void lnkSignOut_Click(object sender, EventArgs e)
    {
        string strScript = "<script>parent.window.location.href='SCR_LOOUT.aspx'</script>";
        ClientScript.RegisterStartupScript(GetType(), "onclick", strScript);
    }
    protected void lnkSignup_Click(object sender, EventArgs e)
    {
        string strScript = "<script>parent.window.main_frm.location.href='SCR_SIGNUP.aspx';parent.window.left_menu.location.href='CheckDSREL.aspx';</script>";
        ClientScript.RegisterStartupScript(GetType(), "onclick", strScript);
    }
    protected void lnkLogin_Click(object sender, EventArgs e)
    {

        string strScript = "<script>parent.window.main_frm.location.href='SCR_LOGIN.aspx';parent.window.left_menu.location.href='CheckDSREL.aspx';</script>";
        ClientScript.RegisterStartupScript(GetType(), "onclick", strScript);
    }
}