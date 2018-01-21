using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pollr.App_Code;

namespace Pollr
{
    public partial class Home : System.Web.UI.Page
    {
        DAL_USR dal = new DAL_USR();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string Email = txtEmall.Text;
                string Password = txtPassword.Text;
                DataTable dt = dal.USR_Login(Email, Password).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    Session["UserID"] = dt.Rows[0]["UserID"].ToString();
                    Session["FullName"] = dt.Rows[0]["FullName"].ToString();
                    Response.Redirect("User/USR_Profile.aspx");
                }
                else
                {
                    lblMesg.Text = "Login Failed";
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }

        }
        public void clear()
        {
            txtEmall.Text = "";
            txtPassword.Text = "";
        }
    }
}