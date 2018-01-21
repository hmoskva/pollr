using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pollr.App_Code;

namespace Pollr
{
    public partial class MasterUser : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["UserID"] != null && Session["UserID"].ToString() != "0")
                    {
                        lblFullName.Text = "Welcome, " + Session["FullName"].ToString();
                    }
                    else
                    {
                        Response.Redirect("../Home.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                Session.RemoveAll();
                Session.Clear();
                Session.Remove("UserID");
                Response.Redirect("../Home.aspx");
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }
    }
}