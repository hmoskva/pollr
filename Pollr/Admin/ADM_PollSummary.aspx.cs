using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pollr.App_Code;

namespace Pollr.Admin
{
    public partial class ADM_PollSummary : System.Web.UI.Page
    {
        DAL_ADM dal = new DAL_ADM();
        DAL_USR dalu = new DAL_USR();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
            }
        }

        public void LoadGrid()
        {
            try
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                DataTable dt = dal.ADM_PollFetch(0, "Completed").Tables[0];
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["gdvPolls"] = dt;
                }
                else
                {
                    Session["gdvPolls"] = dt;
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
                switch (e.CommandName.ToUpper())
                {
                    case "VIEWRESULTS":
                        int EditID = Convert.ToInt32(e.CommandArgument);
                        Session["PollID"] = EditID;
                        // DataTable dt = dal.ADM_OptionsFetch(EditID, Convert.ToInt32(Session["PollID"])).Tables[0];
                        loadOption();
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

        public void loadOption()
        {
            try
            {
                GridView2.DataSource = null;
                GridView2.DataBind();
                DataTable dt = dalu.ADM_VoteCount(Convert.ToInt32(Session["PollID"])).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    Session["gdvOps"] = dt;
                }
                else
                {
                    Session["gdvOps"] = dt;
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }
    }
}