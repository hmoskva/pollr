using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pollr.App_Code;

namespace Pollr.User
{
    public partial class USR_Profile : System.Web.UI.Page
    {
        DAL_USR dal = new DAL_USR();
        DAL_ADM dalad = new DAL_ADM();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = dal.USR_FetchAll(Convert.ToInt32(Session["UserID"])).Tables[0];
                //APP_BLL.WriteLog("sessionuserid: " + Session["UserID"].ToString());
                if (dt.Rows.Count > 0)
                {
                    imgDP.ImageUrl = dt.Rows[0]["Photo"].ToString();
                }
                APP_BLL.LoadPolls(drpPolls, 0);
                LoadOptions();
            }
        }

        protected void btnVote_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = dal.USR_VoteInsert(Convert.ToInt32(rbtOptions.SelectedValue.ToString()), Convert.ToInt32(drpPolls.SelectedValue), Convert.ToInt32(Session["UserID"])).Tables[0];
                //APP_BLL.WriteLog("optionid: " + rbtOptions.SelectedValue);
                if (dt.Rows[0]["OperationResult"].ToString() == "0")
                {
                    lblMesg.Visible = true;
                    lblMesg.Text = dt.Rows[0]["OperationMessage"].ToString();
                    pnlPoll.Visible = false;
                    drpPolls.SelectedValue = "0";
                }
                else
                {
                    lblMesg.Visible = true;
                    lblMesg.CssClass = "col-sm-6 col-sm-offset-3 alert alert-danger";
                    lblMesg.Text = "Oops! Something went wrong. Your vote wasn't saved";
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void drpPolls_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (drpPolls.SelectedValue != "0")
                {
                    pnlPoll.Visible = true;
                    LoadOptions();
                    lblDesc.Visible = true;
                    DataTable dt = dalad.ADM_PollFetch(Convert.ToInt32(drpPolls.SelectedValue), "Ongoing").Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        lblDesc.Text = dt.Rows[0]["Description"].ToString();
                        lblDesc.ForeColor = System.Drawing.Color.Green;
                        lblDesc.Font.Italic = true;
                    }
                    else
                    {
                       //nada 
                    }
                }
                else
                {
                    lblMesg.Visible = true;
                    lblMesg.CssClass = "col-sm-6 col-sm-offset-3 alert alert-danger";
                    lblMesg.Text = "Please select a poll";
                    lblDesc.Text = "";
                    lblMesg.ForeColor = System.Drawing.Color.Red;
                    pnlPoll.Visible = false;
                    btnVote.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        public void LoadOptions()
        {
            try
            {
                rbtOptions.DataSource = null;
                rbtOptions.DataBind();
                DataTable dt = dalad.ADM_OptionsFetch(0, Convert.ToInt32(drpPolls.SelectedValue)).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    rbtOptions.DataSource = dt;
                    rbtOptions.DataTextField = "Name";
                    rbtOptions.DataValueField = "PollOptionID";
                    //rbtOptions.AppendDataBoundItems = true;
                    //rbtOptions.EnableViewState = false;
                    rbtOptions.DataBind();
                    rbtOptions.CssClass = "form-control";
                    rbtOptions.AppendDataBoundItems = false;
                }
                else
                {
                    //nada
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void pnlPoll_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    LoadOptions();
                }
                DataTable dt = dal.USR_VoteFetch(0, Convert.ToInt32(Session["UserID"]), Convert.ToInt32(drpPolls.SelectedValue)).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    btnVote.Enabled = false;
                    lblMesg.Visible = true;
                    lblMesg.Text = Session["FullName"].ToString() + " has already voted on this poll";
                }
                else
                {
                    btnVote.Enabled = true;
                    lblMesg.Text = "";
                }

            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }
    }
}