using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pollr.App_Code;

namespace Pollr
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                Session.RemoveAll();
                Session.Clear();
                Response.Redirect("../Home.aspx");
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }
    }
}