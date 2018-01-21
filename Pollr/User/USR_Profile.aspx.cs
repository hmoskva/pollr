using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using Pollr.App_Code;

namespace Pollr.User
{
    public partial class USR_Dashboard : System.Web.UI.Page
    {
        DAL_USR daluser = new DAL_USR();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = daluser.USR_FetchAll(Convert.ToInt32(Session["UserID"])).Tables[0];
                //APP_BLL.WriteLog("sessionuserid: " + Session["UserID"].ToString());
                if (dt.Rows.Count > 0)
                {
                    txtEmail.Text = dt.Rows[0]["Email"].ToString();
                    txtName.Text = dt.Rows[0]["FullName"].ToString();
                    txtPhone.Text = dt.Rows[0]["Phone"].ToString();
                    imgDP.ImageUrl = dt.Rows[0]["Photo"].ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string extension = Path.GetExtension(flUpload.FileName);
                if (flUpload.HasFile)
                {
                    string file = Path.GetFileName(flUpload.FileName);
                    string filePath = Server.MapPath("~/Assets/Uploaded_Files/" + "Picture_For_UserID_" + Convert.ToInt32(Session["UserID"]).ToString() + extension);
                    flUpload.PostedFile.SaveAs(filePath);
                }
                string file_Path = "~/Assets/Uploaded_Files" + "/" + "Picture_For_UserID_" + Convert.ToInt32(Session["UserID"]).ToString() + extension;
                DataTable dt = daluser.USR_ProfileUpdate((Convert.ToInt32(Session["UserID"])), txtPhone.Text, file_Path).Tables[0];
                if (dt.Rows[0]["OperationResult"].ToString() == "0")
                {
                    lblMesg.Text = dt.Rows[0]["OperationMessage"].ToString();
                    Response.Redirect("~/User/USR_Profile.aspx");
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtPhone.Text = "";
        }
    }
}