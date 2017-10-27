<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SCR_LOGIN.aspx.cs" Inherits="SCR_LOGIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link rel="stylesheet" href="css/forms.css" type="text/css">
    <style type="text/css">
        .style1
        {
            height: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
     <div>
      <div class="mainDiv">
        <table width="100%" cellspacing="0" cellpadding="0">
            <tr>
                <td width="150" valign="top" align="left">
                    <h2>
                        User Settings</h2>
                </td>
                <td width="*" height="20">
                    <asp:Label ID="lblMessage" CssClass="req" runat="server"></asp:Label>
                    <span class="req" style="display: none" id="message"></span>&nbsp;
                </td>
            </tr>
              </table>
    </div>
        <asp:Menu
            ID="Menu1"
            Width="168px"
            runat="server"
            Orientation="Horizontal"
            StaticEnableDefaultPopOutImage="False"
            OnMenuItemClick="Menu1_MenuItemClick">
            <Items>
                <asp:MenuItem ImageUrl="~/Images/MultiView/login tab.GIF" Text="" Value="0"></asp:MenuItem>
                <asp:MenuItem ImageUrl="~/Images/MultiView/signup tab.GIF" Text="" Value="1"></asp:MenuItem>
                <asp:MenuItem ImageUrl="~/Images/MultiView/change pwd.GIF"  Text="" Value="2"></asp:MenuItem>
                <asp:MenuItem ImageUrl="~/Images/MultiView/update.GIF"  Text="" Value="3"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <asp:MultiView 
            ID="UserMultiView"
            runat="server"
            ActiveViewIndex="0"  >
           <asp:View ID="Login" runat="server"  >
             <table class="formElements" width="80%"  cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"> Login User </td>
            </tr>
            <tr>
                <td width="50%">
                    User Id/Email Id</td>
                <td width="50%" align="left">
        <asp:TextBox ID="txtLoginUserId" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
               
                <td width="50%">
                    Password</td>
                <td width="50%">
                    <asp:TextBox ID="txtLoginPwd" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
              
                <td width="50%">
                    &nbsp;</td>
                <td width="50%">
                    &nbsp;</td>
              
            </tr>
            <tr>
                <td class="buttonPannel" align="Center" colspan="2">
        <asp:Button ID="btnLogin" runat="server" Text="Login" onclick="btnLogin_Click" />
                </td>
            </tr>
        </table>
           </asp:View>
            <asp:View ID="SignUp" runat="server">
            <table class="formElements" width="80%"  cellspacing="0" cellpadding="0">
             <tr>
                <td align="center"> Signup User </td>
            </tr>
            <tr>
                
                <td width="50%">
        First Name:</td>
                <td width="50%" align="left">
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
               
                <td width="50%">
        Last Name:&nbsp;</td>
                <td width="50%">
        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
               
                <td width="50%">
        Email Id:
                </td>
                <td width="50%">
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
               
            </tr>
           
              <tr>
               
                <td width="50%">
        Password:
                </td>
                <td width="50%">
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td class="buttonPannel" align="Center" colspan="2">
        <asp:Button ID="bthSignUp" runat="server" Text="Submit" onclick="Button1_Click" />
                </td>
            </tr>
        </table>
            </asp:View>
            <asp:View ID="ChangePassword" runat="server">
                 <table class="formElements" width="80%"  cellspacing="0" cellpadding="0">
                  <tr>
                <td align="center"> Change or update user password </td>
            </tr>
            <tr>
                
                <td width="50%">
                    User Id/Email Id</td>
                <td width="50%" align="left">
        <asp:TextBox ID="txtExistingUserId" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
               
                <td width="50%" class="style1">
                    New Password</td>

                <td width="50%" class="style1">
                    <asp:TextBox ID="txtNewPwd" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
              
                <td width="50%">
                    &nbsp;</td>
                <td width="50%">
                    &nbsp;</td>
              
            </tr>
            <tr>
                <td class="buttonPannel" align="Center" colspan="2">
        <asp:Button ID="btnChangePassword" runat="server" Text="Login" onclick="Button3_Click" />
                </td>
            </tr>
        </table>
            </asp:View>
            <asp:View ID="UpdateDetails" runat="server">
               <table class="formElements" width="80%"  cellspacing="0" cellpadding="0">

                <tr>
                <td align="center"> Update User Details </td>
            </tr>
            <tr>
                
                <td width="50%">
        First Name:</td>
                <td width="50%" align="left">
                    <asp:TextBox ID="txtUpdFName" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
               
                <td width="50%">
        Last Name:&nbsp;</td>
                <td width="50%">
        <asp:TextBox ID="txtUpdLName" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
               
                <td width="50%">
                    &nbsp;</td>
                <td width="50%">
                    &nbsp;</td>
               
            </tr>
           
            <tr>
                <td class="buttonPannel" align="Center" colspan="2">
        <asp:Button ID="btnUpdPerDetails" runat="server" Text="Submit" onclick="btnUpdPerDetails_Click" />
                </td>
            </tr>
        </table>
            </asp:View>
           
        </asp:MultiView></div>
    
    </form>
</body>
</html>

