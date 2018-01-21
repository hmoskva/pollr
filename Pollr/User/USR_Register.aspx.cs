using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pollr.App_Code;
using System.Data;


namespace Pollr.User
{
    public partial class USR_Register : System.Web.UI.Page
    {
        DAL_USR dal = new DAL_USR();
        DAL_ADM dala = new DAL_ADM();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            try
            {
                string fn = txtName.Text;
                string em = txtEmail.Text;
                string pw = txtPassword.Text;
                DataSet ds = dal.USR_Register(fn, em, pw, "Pending Approval");
               
                DataTable dt = ds.Tables[0];
               // DataTable dt2 = ds.Tables[1];
                if (dt.Rows[0]["OperationResult"].ToString() == "0")
                {
                    lblMesg.Text = dt.Rows[0]["OperationMessage"].ToString()+ "Kindly wait for an approval to log in";
                    lblMesg.Visible = true;
                    lblMesg.ForeColor = System.Drawing.Color.Black;
                    clearControls();
                }
                else
                {
                    lblMesg.Text = "Email already exists";
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }

        }
        public void clearControls()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
        }
    }
}