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
    public partial class ADM_ApproveUser : System.Web.UI.Page
    {
        DAL_ADM dal = new DAL_ADM();
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
                DataTable dt = dal.ADM_UserFetchUnapproved(0).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["gdvUsersUn"] = dt;
                }
                else
                {
                    Session["gdvUsersUn"] = dt;
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
                    case "APPROVE":
                        int ApproveID = Convert.ToInt32(e.CommandArgument);
                        Session["AbsUserID"] = ApproveID;
                        DataTable dt = dal.ADM_UserStatusUpdate(ApproveID, "Approved").Tables[0];
                        if (dt.Rows[0]["OperationResult"].ToString() == "0")
                        {
                            LoadGrid();
                            pnlMesg.Visible = true;
                            lblMesg.Text = "User Approved Successfully";
                            lblMesg.ForeColor = System.Drawing.Color.Black;
                        }
                        else
                        {
                            //nada
                        }
                        break;
                    case "REJECT":
                        int RejectID = Convert.ToInt32(e.CommandArgument);
                        DataTable dt2 = dal.ADM_UserStatusUpdate(RejectID, "Rejected").Tables[0];
                        if (dt2.Rows[0]["OperationResult"].ToString() == "0")
                        {
                            LoadGrid();
                            pnlMesg.Visible = true;
                            lblMesg.Text = "User Rejected Successfully";
                            lblMesg.ForeColor = System.Drawing.Color.Black;
                        }
                        else
                        {
                           //nada
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