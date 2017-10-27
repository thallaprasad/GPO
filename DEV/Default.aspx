<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Home Page</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link rel="stylesheet" href="css/opera.css" type="text/css">
    <link rel="stylesheet" href="css/main.css" type="text/css">

    <script language="javascript" src="js/opera.js" charset="iso-8859-1"></script>

    <script language="javascript">
        function loadpage() {
            document.body.scroll = 'no';
        }
    </script>

</head>
<body ms_positioning="GridLayout" onload="loadpage();">
    <form id="Form1" method="post" runat="server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
        <tr>
            <td colspan="2" height="75" class="borderBotGreen">
                <iframe src="SCR_TOP_LOGIN.aspx" width="100%" scrolling="no" name="top_menu" height="100%"
                    frameborder="0"></iframe>
            </td>
        </tr>
        <tr>
            <td width="140" class="borderRight borderBottom" align="left" valign="bottom">
                <iframe src="CheckDSREL.aspx" width="100%" scrolling="no" name='left_menu' height="100%"
                    frameborder="0" bordercolor="#FFFFFF"></iframe>
            </td>
            <td id="mainCol" class="borderBottom">
                <iframe src="SCR_BLANK_001.htm" width="100%" scrolling="no" name="main_frm" height="100%"
                    frameborder="0"></iframe>
            </td>
        </tr>
        <!-- Start for STATUS -->
        <tr>
            <td height="10" colspan="2" align="center" valign="middle" id="menuCol" class="smallFont">
                <div id="footer">
                    <p>
                        &copy; 2010 - 2011 Global Planting Organization | 
                        <asp:LinkButton ID="lnkbtnContactUs" runat="server" CssClass="logout_text" 
                            onclick="lnkbtnContactUs_Click">Contact Us</asp:LinkButton> |
                        
                        <asp:LinkButton ID="lnkbtnFeedback" runat="server" CssClass="logout_text" onclick="lnkbtnFeedback_Click" 
                            >Feedback</asp:LinkButton> 
                            <asp:LinkButton ID="lnkbtnBlog" Visible="false" runat="server" CssClass="logout_text" onclick="lnkbtnBlog_Click" 
                            >Blog</asp:LinkButton> 
                            
                      
                </div>
            </td>
        </tr>
        <!-- END STATUS -->
    </table>
    </form>
</body>
</html>
