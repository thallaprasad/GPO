<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SCR_TOP_LOGIN.aspx.cs" Inherits="SCR_TOP_LOGIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>SCR_TOP_LOGIN</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" href="css/opera.css" type="text/css">
    <link rel="stylesheet" href="css/main.css" type="text/css">

    <script src="js/opera.js" charset="iso-8859-1" type="text/JavaScript"></script>

    <script language="javascript" type="text/javascript">
        function logout() {
            /* parent.window.top_menu.location='scr-top-main.htm';
            parent.window.left_menu.location='menu_scr-blank-001.htm';
            parent.window.main_frm.location='scr-login-001.htm'; */
            parent.window.location.href = 'scr_login_001.aspx'
        }
    </script>

    <meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
</head>
<body>
    <form id="Form2" method="post" class="clearFix" runat="server">
    <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
            <td width="50%" height="55" align="left" valign="top">
                <div class="mLeft10">
                    <img src="Images/menu_images/GPO_Logo_Type2_Large.png" width="50" alt="" 
                        style="height: 50px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
                        <h1 class="logoH1">Global Planting Organisation</h1>
                </div>
            </td>
            <td width="50%" height="55" align="right" valign="top">
               <asp:LinkButton ID="lnkLogin" runat="server"  CssClass="logout_text"  onclick="lnkLogin_Click">Login</asp:LinkButton>
                    <span class="separator">|</span>
                            <asp:LinkButton ID="lnkSignOut" runat="server"  CssClass="logout_text" onclick="lnkSignOut_Click">Logout</asp:LinkButton>
                            <span  class="separator"></span>
            </td>
        </tr>
        <tr>
            <!-- -->
            <td height="20" colspan="2" class="topnav-wrapper" align="left" valign="middle">
                <div class="width50-per">
                    <div class="fLeft mLeft10 mRight10">
                        <span class="bold"></span>  <asp:Label ID="lblProfile" visible="false" runat="server"></asp:Label>
                    </div>
                    <div  class="fLeft mRight10"></div>
                    <div class="fLeft mRight10">
                    <span class="bold">
                        <asp:Label ID="lblUserName" visible="false" Text="Label" runat="server" ></asp:Label> 
                        </span>
                        
                    </div>
                </div>
                <div class="width50-per">
                    <div class="aRight mRight10">
                        <img src="Images/menu_images/help_header.png" width="16" height="16" alt="" />
                        <asp:LinkButton ID="lnkbtnHelp" runat="server" CssClass="logout_text">Help</asp:LinkButton>
                        <span class="separator">|</span>
                        <img src="Images/menu_images/help_header.png" width="16" height="16" alt="" />
                        <asp:LinkButton ID="lnkbtnContact" runat="server" CssClass="logout_text">FAQ</asp:LinkButton><span
                            class="separator">|</span>
                        <img src="Images/menu_images/home1.png" width="16" height="16" alt="" />
                        <asp:LinkButton ID="lnkbtnHome" runat="server" CssClass="logout_text">Home</asp:LinkButton><span
                            class="separator"></span>
                        
                    </div>
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
