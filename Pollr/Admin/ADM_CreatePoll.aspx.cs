using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Pollr.App_Code;

namespace Pollr.Admin
{
    public partial class ADM_CreatePoll : System.Web.UI.Page
    {
        DAL_ADM dal = new DAL_ADM();
        DataTable dtg = new DataTable();
        DataColumn dc = new DataColumn();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    DataTable dt = dal.ADM_ExpirePoll().Tables[0];
                    if (dt.Rows[0]["OperationResult"].ToString() == "0")
                    {
                        LoadPollsGrid();
                    }
                    else
                    {
                        LoadPollsGrid();
                    }
                    absOptiongrid();
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }

        }
        public void LoadPollsGrid()
        {
            try
            {
                gdvPolls.DataSource = null;
                gdvPolls.DataBind();
                DataTable dt = dal.ADM_PollFetch(0, "Ongoing").Tables[0];
                if (dt.Rows.Count > 0)
                {
                    gdvPolls.DataSource = dt;
                    gdvPolls.DataBind();
                    Session["gdvPolls"] = dt;
                }
                else
                {
                    Session["gdvPolls"] = dt;
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }
        public void loadOptionsGrid()
        {
            try
            {
                gdvOptions.DataSource = null;
                gdvOptions.DataBind();
                DataTable dt = dal.ADM_OptionsFetch(0, Convert.ToInt32(Session["PollID"])).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    gdvOptions.DataSource = dt;
                    gdvOptions.DataBind();
                    Session["gdvOptions"] = dt;
                }
                else
                {
                    Session["gdvOptions"] = dt;
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        public void absOptiongrid()
        {
            //DataTable dt = new DataTable();
            //DataColumn dc = new DataColumn();
            try
            {
                dtg = new DataTable();
                dc = new DataColumn("Name");
                dtg.Columns.Add(dc);
                Session["POs"] = dtg;
                Session["initPOs"] = dtg;
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
            // return dt;
        }

        protected void gdvPolls_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName.ToUpper())
                {
                    case "EDITROW":
                        int EditID = Convert.ToInt32(e.CommandArgument);
                        Session["PollID"] = EditID;
                        DataTable dt = dal.ADM_PollFetch(EditID, "Ongoing").Tables[0];
                        if (dt.Rows.Count > 0)
                        {
                            pnlOptions.Visible = true;
                            btnUpdatePoll.Enabled = true;
                            btnSavePoll.Enabled = false;
                            txtName.Text = dt.Rows[0]["Name"].ToString();
                            txtDes.Text = dt.Rows[0]["Description"].ToString();
                            txtStartDate.Text = Convert.ToDateTime(dt.Rows[0]["StartDate"]).ToShortDateString();
                            txtEndDate.Text = Convert.ToDateTime(dt.Rows[0]["EndDate"]).ToShortDateString();
                            //.Text = "SessionPollID: " + Convert.ToInt32(Session["PollID"]).ToString();
                            loadOptionsGrid();
                        }
                        else
                        {
                            //nada
                        }
                        break;
                    case "DELETEROW":
                        int DeleteID = Convert.ToInt32(e.CommandArgument);

                        if (dal.ADM_PollsDelete(Convert.ToInt32(DeleteID)) == true)
                        {
                            lblMesg.Text = "Poll Successfully Deleted.";
                            LoadPollsGrid();
                            clear();
                        }
                        else
                        {
                            lblMesg.Text = "Poll Not Deleted!";
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

        protected void pnlOptions_Load(object sender, EventArgs e)
        {
            //loadOptionsGrid();
        }

        protected void btnSavePoll_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = dal.ADM_PollInsert(txtName.Text, txtDes.Text, Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text), Convert.ToInt32(Session["AdminID"]), "Ongoing");
                DataTable dt = ds.Tables[0];
                DataTable dt2 = ds.Tables[1];
                if (dt.Rows[0]["OperationResult"].ToString() == "0")
                {
                    Session["PollID"] = dt2.Rows[0]["PollID"].ToString();
                    LoadPollsGrid();
                    clear();
                    pnlOptions.Visible = true;
                }
                else
                {
                    //return nothing
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }
        public void clear()
        {
            txtDes.Text = "";
            txtEndDate.Text = "";
            txtName.Text = "";
            txtOption.Text = "";
            txtStartDate.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                clear();
                pnlOptions.Visible = false;
                btnUpdatePoll.Enabled = false;
                btnSavePoll.Enabled = true;
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }

        }

        protected void btnOptionAdd_Click(object sender, EventArgs e)
        {
            try
            {
                //DataTable dt = initgrid();
                DataTable dt2 = new DataTable();
                dt2 = (DataTable)Session["POs"];
                dtg = dt2;
                // BLL.WriteLog("Rows: " + dt.Rows.Count.ToString());
                // BLL.WriteLog("Columns: " + dt.Columns.Count.ToString());
                int poid = dtg.Rows.Count + 1;
                dtg.Rows.Add(txtOption.Text);
                gdvabsPoll.DataSource = dtg;
                gdvabsPoll.DataBind();
                Session["POs"] = dtg;

                txtOption.Text = "";
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in gdvabsPoll.Rows)
                {
                    Label lblABSTitle = new Label();
                    lblABSTitle = (row.FindControl("lbltitle") as Label);
                    DataTable td = new DataTable();
                    td = dal.ADM_OptionsInsert(((row.FindControl("lbltitle") as Label).Text), Convert.ToInt32(Session["PollID"])).Tables[0];

                    if (td.Rows.Count == 0)
                    {
                        lblMesg.Text = (row.FindControl("lbltitle") as Label).Text + " not saved";
                    }
                    else
                    {
                        absOptiongrid();
                        loadOptionsGrid();
                        gdvabsPoll.DataSource = null;
                        gdvabsPoll.DataBind();
                        txtOption.Text = "";
                    }

                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void btnUpdatePoll_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = dal.ADM_PollsUpdate(Convert.ToInt32(Session["PollID"]), txtName.Text, txtDes.Text, Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text), "Ongoing").Tables[0];
                if (dt.Rows[0]["OperationResult"].ToString() == "0")
                {
                    lblMesg.Text = dt.Rows[0]["OperationMessage"].ToString();
                    pnlOptions.Visible = false;
                    LoadPollsGrid();
                }
                else
                {
                    lblMesg.Text = "Poll not updated";
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }

        }

        protected void gdvOptions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName.ToUpper())
                {
                    case "EDITROW":
                        int EditID = Convert.ToInt32(e.CommandArgument);
                        Session["OpUpdateID"] = EditID;
                        DataTable dt = dal.ADM_OptionsFetch(EditID, Convert.ToInt32(Session["PollID"])).Tables[0];
                        if (dt.Rows.Count > 0)
                        {
                            btnOpUpdate.Enabled = true;
                            btnSave.Enabled = false;
                            btnOptionAdd.Visible = false;
                            txtOption.Text = dt.Rows[0]["Name"].ToString();
                        }
                        else
                        {
                            //nada
                        }
                        break;
                    case "DELETEROW":
                        int DeleteID = Convert.ToInt32(e.CommandArgument);
                        if (dal.ADM_OptionsDelete(Convert.ToInt32(DeleteID)) == true)
                        {
                            lblMesg.Text = "Option Successfully Deleted.";
                            loadOptionsGrid();
                            txtOption.Text = "";
                        }
                        else
                        {
                            lblMesg.Text = "Opttion Not Deleted!";
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

        protected void btnOpUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = dal.ADM_OptionsUpdate(Convert.ToInt32(Session["OpUpdateID"]), txtOption.Text).Tables[0];
                if (dt.Rows[0]["OperationResult"].ToString() == "0")
                {
                    lblMesg.Text = dt.Rows[0]["OperationMessage"].ToString();
                    txtOption.Text = "";
                    loadOptionsGrid();
                    btnOpUpdate.Enabled = false;
                    btnSave.Enabled = true;
                    btnOptionAdd.Visible = true;
                }
            }
            catch (Exception ex)
            {
                APP_BLL.WriteLog(ex.Message + ex.StackTrace);
            }
        }

        protected void btnOpCancel_Click(object sender, EventArgs e)
        {
            txtOption.Text = "";
            btnOptionAdd.Visible = true;
            btnOpUpdate.Enabled = false;
            btnSave.Enabled = true;
        }
    }
}