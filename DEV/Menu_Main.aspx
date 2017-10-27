<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Menu_Main.aspx.cs" Inherits="_Default" %>

<%@ Register src="SlideShowControl/SlideShow.ascx" tagname="SlideShow" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mourya Talla Web Site </title>
    <style type="text/css">
        .style2
        {
            width: 100%;
            height: 115px;
        }
        .style3
        {
            height: 19px;
        }
        .style4
        {
            height: 111px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">  

    
    <table class="style2">
        <tr>
            <td class="style3" colspan="2">
                        &nbsp;</td>
            <td class="style4" rowspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
    
    <uc1:SlideShow ID="SlideShow7" runat="server" XPath="site500x281"  Width="500" Height="281"
            ShowNavigation="true" 
             XMLSource="~/xml/500x281.xml"/>
    
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                &nbsp;</td>
        </tr>
       
    </table>
    
</form>

</body>
</html>
