using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pollr.Admin
{
    public partial class ADM_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmall.Text == "admin@admin.com" && txtPassword.Text == "password")
                {
                    Session["AdminID"] = "0";
                    Response.Redirect("ADM_Dashboard.aspx");
                }
                else
                {
                    lblMesg.Text = "Login Failed";
                    lblMesg.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblMesg.Text = ex.Message + ex.StackTrace;
            }
        }
    }
}