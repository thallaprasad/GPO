

using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;
using System.Xml.Linq;


public class GPOBaseClass : System.Web.UI.Page
{


    /// <summary>
    /// Gets System Internet Protocol Address
    /// </summary>
    public string IpAddress
    {
        get { return this.GetIPAddress(); }
    }

    /// <summary>
    /// Methods returns system IP
    /// </summary>
    /// <returns>IP address</returns>
    public string GetIPAddress()
    {
        string currentIP = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (!string.IsNullOrEmpty(currentIP))
        {
            string[] strIpRange = currentIP.Split(',');
            currentIP = strIpRange[0];
        }
        else
        {
            currentIP = Request.ServerVariables["REMOTE_ADDR"];
        }

        return currentIP;
    }

    /// <summary>
    /// this method will fire while application error occor.
    /// </summary>
    /// <param name="e">Error event arugument</param>
    protected override void OnError(EventArgs e)
    {
        //GPOBaseClass GPOBaseClass = new GPOBaseClass();
        //string username = this.UserName;
        //string userID = this.UserID;
        //string agencyName = this.AgencyName;
        //string currentIP = string.Empty;
        //string requestForComplaintID = this.RFCID;

        //currentIP = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        //if (!string.IsNullOrEmpty(currentIP))
        //{
        //    string[] strIpRange = currentIP.Split(',');
        //    currentIP = strIpRange[0];
        //}
        //else
        //{
        //    currentIP = Request.ServerVariables["REMOTE_ADDR"];
        //}

        //////GPOBaseClass.GetUserDetails(out username, out userID, out agencyName, out requestForComplaintID);

        //HttpContext ctx = HttpContext.Current;
        //Exception exception = ctx.Server.GetLastError();
        //string errorInfo =
        //    "\n" + "Offending URL: " + ctx.Request.Url.ToString() +
        //    "\n" + "Source: " + exception.Source +
        //    "\n" + "Message: " + exception.Message +
        //    "\n" + "Stack trace: " + exception.StackTrace +
        //    "\n" + "Date: " + DateTime.Now;

        //errorInfo = errorInfo.Replace("'", "''");

        //Hashtable hshErrorData = new Hashtable();
        //XmlDocument objXDErrorData = new XmlDocument();
        //GPOCommonClass objErrorClass = new GPOCommonClass();
        //hshErrorData.Add(SMTPResource.ExceptionURI, ctx.Request.Url.ToString());
        //hshErrorData.Add(SMTPResource.ExceptionSource, exception.Source);
        //hshErrorData.Add(SMTPResource.ExceptionMessage, exception.Message);
        //hshErrorData.Add(SMTPResource.ExceptionStackTrace, "Please Check mail for stack trace");
        //hshErrorData.Add(SMTPResource.ExceptionDate, DateTime.Now);
        //hshErrorData.Add(SMTPResource.ExceptionIP, currentIP);
        //hshErrorData.Add(SMTPResource.UserName, string.IsNullOrEmpty(username) ? "Unknown" : username);
        //hshErrorData.Add(SMTPResource.Employee_ID, string.IsNullOrEmpty(userID) ? "Unknown" : userID);
        //hshErrorData.Add(SMTPResource.AgencyName, string.IsNullOrEmpty(agencyName) ? "Unknown" : agencyName);

        //objXDErrorData = objErrorClass.GenerateXML(hshErrorData);//, SMTPResource.AppError, SMTPResource.AppError_ID, string.Empty
        //GPOServiceClient obj = new GPOServiceClient();
        //string str = obj.CallGPOService(objXDErrorData.DocumentElement, Purpose.Application);

        //GPOCommonClass GPOCommonClass = new GPOCommonClass();
        //////please enable this method when configure the SMTP details
        //////GPOCommonClass.SenderrorMail(exception, Request.RawUrl, User.Identity.Name);
        //Response.Redirect(@"~\ErrorPages\Oops.aspx");
    }
}