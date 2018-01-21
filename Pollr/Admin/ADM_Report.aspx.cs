using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using Pollr.App_Code;

namespace Pollr.Admin
{
    public partial class ADM_Report : System.Web.UI.Page
    {
        DAL_ADM dal = new DAL_ADM();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void drpFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                switch (drpFilter.SelectedValue)
                {
                    case "1":
                        pnlStatus.Visible = true;
                        pnlTime.Visible = false;
                        pnlyear.Visible = false;
                        pnlendyear.Visible = false;
                        pnlmonth.Visible = false;
                        pnlendmonth.Visible = false;
                        break;
                    case "2":
                        pnlStatus.Visible = false;
                        pnlTime.Visible = true;
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void btnGen_Click(object sender, EventArgs e)
        {
            try
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                string WhereC = "";
                if (drpStatus.SelectedValue != "0")
                {
                    WhereC = " WHERE Status = '" + drpStatus.SelectedItem.Text + "'";
                }
                switch (drpTime.SelectedValue)
                {
                    case "1":
                        WhereC = " WHERE YEAR(StartDate) = " + drpyear.SelectedItem.Text;
                        break;
                    case "2":
                        WhereC = " WHERE YEAR(StartDate) BETWEEN " + drpyear.SelectedItem.Text + " AND " + drpEndyear.SelectedItem.Text;
                        break;
                    case "3":
                        WhereC = " WHERE YEAR(StartDate) = " + drpyear.SelectedItem.Text + " AND MONTH(StartDate) = " + drpmonth.SelectedValue;
                        break;
                    case "4":
                        WhereC = " WHERE YEAR(StartDate) = " + drpyear.SelectedItem.Text + " AND MONTH(StartDate) BETWEEN " + drpmonth.SelectedValue + " AND " + drpendmonth.SelectedValue;
                        break;
                    default:
                        break;
                }
                APP_BLL.WriteLog(WhereC);
                DataTable dt = dal.RPT_Poll(WhereC).Tables[0];
                Session["GridView1_RPT"] = dt;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                btnSavetoExcel.Visible = true;

            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void drpTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                switch (drpTime.SelectedValue)
                {
                    case "1":
                        pnlyear.Visible = true;
                        pnlendyear.Visible = false;
                        pnlmonth.Visible = false;
                        pnlendmonth.Visible = false; ;
                        break;
                    case "2":
                        pnlyear.Visible = true;
                        pnlendyear.Visible = true;
                        pnlmonth.Visible = false;
                        pnlendmonth.Visible = false; ;
                        break;
                    case "3":
                        pnlyear.Visible = true;
                        pnlendyear.Visible = false;
                        pnlmonth.Visible = true;
                        pnlendmonth.Visible = false; ;
                        break;
                    case "4":
                        pnlyear.Visible = true;
                        pnlendyear.Visible = false;
                        pnlmonth.Visible = true;
                        pnlendmonth.Visible = true; ;
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int PollIDV = Convert.ToInt32(e.CommandArgument);
                Session["PollIDV"] = PollIDV;
                string url = ResolveUrl(string.Format("AppraisalDetails.aspx?id={0}", PollIDV));
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('" + url + "', '_blank', 'height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,titlebar=no');", true);
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void btnSavetoExcel_Click(object sender, EventArgs e)
        {
            try
            {
                ExportGrid();
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /*Tell the compiler that the control is rendered
			 * explicitly by overriding the VerifyRenderingInServerForm event.*/
        }

        private void ExportGrid()
        {
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ClearContent();
                Response.ClearHeaders();
                Response.Charset = "";
                string FileName = "ExcelFile" + DateTime.Now + ".xls";
                StringWriter str = new StringWriter();
                HtmlTextWriter htmlw = new HtmlTextWriter(str);
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = "Application/vnd.ms-excel";
                Response.AddHeader("Content-Disposition", "attachment;FileName=" + FileName);
                GridView1.GridLines = GridLines.Both;
                GridView1.HeaderStyle.Font.Bold = true;
                GridView1.RenderControl(htmlw);
                Response.Write(str.ToString());
                Response.End();
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }
    }
}