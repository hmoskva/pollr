using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace Pollr.App_Code
{
    public class APP_BLL
    {
        public static void WriteLog(string msg)
        {
            if (msg.ToString().Contains("Thread was being aborted"))
            {
                //do nothing
            }
            else
            {
                HttpContext context = HttpContext.Current;
                //If context.Session["UserName"] Is Nothing Then
                string _path = null;
                _path = "~/App_Logs\\ErrorLog.txt";
                string path = context.Server.MapPath(_path);
                System.IO.StreamWriter writer = new System.IO.StreamWriter(path, true);
                writer.WriteLine(msg + "  ErrorDate-" + DateTime.Now);
                writer.Close();
            }
            //End If
        }

        public static void LoadPolls(DropDownList drp, int PollID)
        {
            try
            {
                HttpContext Context = HttpContext.Current;
                ListItem Li = new ListItem();
                Li.Value = "0";
                Li.Text = "--Select--";
                drp.AppendDataBoundItems = true;
                drp.Items.Clear();
                drp.Items.Add(Li);

                DAL_ADM dal = new DAL_ADM();
                DataTable dt = dal.ADM_PollFetchStarter(PollID).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    drp.DataSource = dt;
                    drp.DataTextField = "Name";
                    drp.DataValueField = "PollID";
                    drp.DataBind();
                }
                dt.Dispose();
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }
        public static void SaveAsExcel(string fileName, DataTable dt)
        {
            HttpContext context = HttpContext.Current;
            try
            {
                context.Response.Clear();
                context.Response.AddHeader("content-disposition", Convert.ToString("attachment;filename=") + fileName);
                context.Response.Charset = "";
                context.Response.ContentType = "application/vnd.xls";

                StringWriter stringWrite = new StringWriter();
                HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

                GridView gdv = new GridView();
                gdv.DataSource = dt;
                gdv.DataBind();
                gdv.RenderControl(htmlWrite);
                context.Response.Write(stringWrite.ToString());
                context.Response.Flush();
                context.Response.End();
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }
    }

}