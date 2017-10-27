using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private void Page_Load(object sender, System.EventArgs e)
    {

    }
    protected void lnkbtnContactUs_Click(object sender, EventArgs e)
    {
        string strScript = "<script>parent.window.main_frm.location.href='SCN_CONTACT_US.htm';parent.window.left_menu.location.href='CheckDSREL.aspx';</script>";
        ClientScript.RegisterStartupScript(GetType(), "onclick", strScript);

    }
    protected void lnkbtnFeedback_Click(object sender, EventArgs e)
    {
        string strScript = "<script>parent.window.main_frm.location.href='SCN_FEEDBACK.aspx';parent.window.left_menu.location.href='CheckDSREL.aspx';</script>";
        ClientScript.RegisterStartupScript(GetType(), "onclick", strScript);

    }
    protected void lnkbtnBlog_Click(object sender, EventArgs e)
    {
        string strScript = "<script>parent.window.main_frm.location.href='SCN_Blog.aspx';parent.window.left_menu.location.href='CheckDSREL.aspx';</script>";
        ClientScript.RegisterStartupScript(GetType(), "onclick", strScript);

    }
}