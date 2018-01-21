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
    public partial class ADM_Dashboard : System.Web.UI.Page
    {
        DAL_ADM dala = new DAL_ADM();
        DAL_USR dalu = new DAL_USR();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    DataTable dt = dala.UserFetchApproved(0).Tables[0];
                    DataTable dt2 = dala.ADM_UserFetchUnapproved(0).Tables[0];
                    DataTable dt3 = dala.ADM_PollFetch(0, "Ongoing").Tables[0];
                    DataTable dt4 = dala.ADM_PollFetch(0, "Completed").Tables[0];
                    lblEmpCount.Text = dt.Rows.Count.ToString();
                    lblPend.Text = dt2.Rows.Count.ToString();
                    lblOngoing.Text = dt3.Rows.Count.ToString();
                    lblComp.Text = dt4.Rows.Count.ToString();
                    lblReject.Text = "0";
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }
    }
}