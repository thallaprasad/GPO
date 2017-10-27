using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Resources;
using System.Globalization;
using System.Reflection;
using System.Data.SqlClient;


public partial class CheckDSREL : System.Web.UI.Page
{
    string LangID;
    private void Page_Load(object sender, System.EventArgs e)
    {
        String strProfileID;
        String strMainMenu, strSubMenu, strsuperSubMenu;
        try
        {



            if (Session["LoginPage"] != null)
            {
                string strLoginPage = Session["LoginPage"].ToString();
            }

            //if (Request.QueryString["LoginPage"] != null)
            //{
            //    string strLoginPage = Request.QueryString["LoginPage"].ToString();
            //}

            strProfileID = "PRF0000008";
            LangID = "EN";
            DataSet dsXMLMENU = new DataSet();
            dsXMLMENU = FillMenu(strProfileID); //Call the BL to
            //load the Menu Dataset
            //Create Relations between the tables in DataSet         
            DataRelation drMainSub = new DataRelation("MainSub", dsXMLMENU.Tables[0].Columns["MENU_ID"], dsXMLMENU.Tables[1].Columns["PARENT_MENU_ID"]);
            DataRelation drSubSuper = new DataRelation("SubSuper", dsXMLMENU.Tables[1].Columns["MENU_ID"], dsXMLMENU.Tables[2].Columns["PARENT_MENU_ID"]);
            //Add the relations to the dataSet
            dsXMLMENU.Relations.Add(drMainSub);
            dsXMLMENU.Relations.Add(drSubSuper);
            tblLeftMenu.Height = Unit.Percentage(100);
            String strTemplate = "<script type=text/javascript> ";
            String strTemplate1;
            strTemplate1 = "<script type=text/javascript>";
            //int i=1;
            int intMenu, intSM;
            intMenu = 1;
            //iterate through the Dataset tables and
            //form the menu dynamically
            //main menu Starts
            foreach (DataRow drMain in dsXMLMENU.Tables[0].Rows)
            {
                intSM = 1;
                if (drMain.GetChildRows(drMainSub).Length > 0)
                {
                    //strMainMenu =//ObjResMgr.GetString(drMain["Menu_ID"].ToString().Trim(),ObjCultInfo);
                    strMainMenu = drMain["Menu_Name"].ToString().Trim();

                    strMainMenu = strMainMenu.Replace("'", "\\\'");
                    //strTemplate+=" var menu"+intMenu+" = new SGMenu('"+drMain["MENU_NAME"]+"','#','menu_"+intMenu+"'"+");";
                    strTemplate += " var menu" + intMenu + " = new SGMenu('" + strMainMenu + "','#','menu_" + intMenu + "'" + ");";
                }
                //Sub menu Starts
                foreach (DataRow drSub in drMain.GetChildRows(drMainSub))
                {
                    //strSubMenu=ObjResMgr.GetString(drSub["Menu_ID"].ToString().Trim(),ObjCultInfo);
                    strSubMenu = drSub["Menu_Name"].ToString().Trim();
                    strSubMenu = strSubMenu.Replace("'", "\\\'");
                    if (drSub["SCREEN_MNEMONIC"].ToString() == "#")
                    {
                        strTemplate += "var m" + intMenu + "rub" + intSM + "=new SGRub('" + strSubMenu + "','CheckDSREL.aspx?MENUSELECTED=m" + intMenu + "rub" + intSM + "&MENUNO=1', '#');m" + intMenu + "rub" + intSM + ".addItem(new Item('',''));menu" + intMenu + ".addChild(m" + intMenu + "rub" + intSM + ");";
                    }
                    else
                    {
                        strTemplate += "var m" + intMenu + "rub" + intSM + "=new SGRub('" + strSubMenu + "','CheckDSREL.aspx?MENUSELECTED=m" + intMenu + "rub" + intSM + "&MENUNO=1','" + drSub["SCREEN_MNEMONIC"] + ".aspx?ACCESS=" + drSub["ACCESS_TYPE"] + "&MENU_ID=" + drSub["MENU_ID"] + "');m" + intMenu + "rub" + intSM + ".addItem(new Item('','')); menu" + intMenu + ".addChild(m" + intMenu + "rub" + intSM + ");";
                    }
                    //supersub menu Starts
                    if (drSub.GetChildRows(drSubSuper).Length > 0)
                    {
                        int intSSM = 2;
                        foreach (DataRow drSuperSub in drSub.GetChildRows(drSubSuper))
                        {
                            //strsuperSubMenu=ObjResMgr.GetString(drSuperSub["Menu_ID"].ToString().Trim(),ObjCultInfo);
                            strsuperSubMenu = drSuperSub["Menu_Name"].ToString().Trim();
                            strsuperSubMenu = strsuperSubMenu.Replace("'", "\\\'");
                            strTemplate += "m" + intMenu + "rub" + intSM + ".addItem(new Item('-" + strsuperSubMenu + "',\"Javascript:parent.window.left_menu.location='CheckDSREL.aspx?MENUSELECTED=m" + intMenu + "rub" + intSM + "&MENUNO=" + intSSM + "';Javascript:parent.window.main_frm.location='" + drSuperSub["SCREEN_MNEMONIC"] + ".aspx?ACCESS=" + drSub["ACCESS_TYPE"] + "&MENU_ID=" + drSub["MENU_ID"] + "'\"));";
                            intSSM++;
                        }
                    }
                    else
                    {
                        strTemplate += "m" + intMenu + "rub" + intSM + ".addItem(new Item('',''));";
                    }
                    if (Request.QueryString.Count > 0)
                    {
                        int intMenuNO;
                        String strMenuName;
                        strMenuName = Request.QueryString["MENUSELECTED"];
                        intMenuNO = Convert.ToInt32(Request.QueryString["MENUNO"]);
                        strTemplate1 += strMenuName + ".setSelected(" + intMenuNO + ");";
                    }
                    //}
                    intSM++;
                }
                //Sub menu ends
                if (drMain.GetChildRows(drMainSub).Length > 0)
                    strTemplate1 += "document.write(menu" + intMenu + ".getHTML());";

                intMenu++;
            }
            //main menu ends
            strTemplate += "</script>";
            if (!IsPostBack)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "InitialFocus", strTemplate);
            }
            strTemplate1 += "</script>";


            TableCell tcMenu1 = new TableCell();
            TableRow trMenu1 = new TableRow();
            tcMenu1.Width = Unit.Percentage(100);
            tcMenu1.VerticalAlign = VerticalAlign.Top;
            tcMenu1.Text = String.Format(strTemplate1);
            trMenu1.Cells.Add(tcMenu1);
            tblLeftMenu.Rows.Add(trMenu1);
           
            if (!IsPostBack)
                bdyINIT.Attributes.Add("onload", "InitialiseAreas();");
          

            
        }
        catch
        {
            throw;
        }
    }
   
  
    protected DataSet FillMenu(string strprofileId)
    {
        GPO_DB oGPO_DB = new GPO_DB();
        Hashtable htCourse = new Hashtable();
        htCourse.Add("@V_PROFILEID", strprofileId);
        DataSet dSCourse = oGPO_DB.DataInDataset("GPO_MENU_PROFILE", htCourse);
        return dSCourse;
    }
}