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
    public partial class ADM_DeleteUser : System.Web.UI.Page
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
                DataTable dt = dalu.USR_FetchAll(0).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["gdvUserA"] = dt;
                }
                else
                {
                    Session["gdvUserA"] = dt;
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
                    case "DELETEROW":
                        int DeleteID = Convert.ToInt32(e.CommandArgument);
                        if (dal.ADM_UserDelete(Convert.ToInt32(DeleteID)) == true)
                        {
                            lblMesg.Visible = true;
                            lblMesg.Text = "User Successfully Deleted";
                            LoadGrid();
                        }
                        else
                        {
                            lblMesg.Visible = true;
                            lblMesg.Text = "User Not Deleted!";
                        }
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
    }
}