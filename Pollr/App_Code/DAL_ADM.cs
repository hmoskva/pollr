using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Pollr.App_Code
{
    public class DAL_ADM
    {
        SqlConnection cn = new SqlConnection(@"Data Source=HABIB\HABIB;Initial Catalog=Pollr;Integrated Security=True");

        //public DataSet ADM_Login()
        //{
        //    cn.Open();
        //    SqlCommand cmd = cn.CreateCommand();
        //    cmd.CommandType = System.Data.CommandType.StoredProcedure;
        //    cmd.CommandText = "ADM_Login";


        //}

        #region User
        public DataSet ADM_UserFetchUnapproved(int UserID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_UserFetchUnapproved";
            cmd.Parameters.AddWithValue("@UserID", UserID);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet UserFetchApproved(int UserID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_UserFetchApproved";
            cmd.Parameters.AddWithValue("@UserID", UserID);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet ADM_UserStatusUpdate(int UserID, string Status)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_UserStatusUpdate";
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@Status", Status);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public Boolean ADM_UserDelete(int UserID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_UserDelete";
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.ExecuteNonQuery();
            cn.Close();
            return true;

        }
        #endregion

        #region Poll
        public DataSet ADM_PollInsert(string name, string des, DateTime sd, DateTime ed, int cb, string stat)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_PollInsert";
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Description", des);
            cmd.Parameters.AddWithValue("@StartDate", sd);
            cmd.Parameters.AddWithValue("@EndDate", ed);
            cmd.Parameters.AddWithValue("@CreatedBy", cb);
            cmd.Parameters.AddWithValue("@Status", stat);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet ADM_PollsUpdate(int pollID, string name, string des, DateTime sd, DateTime ed, string stat)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_PollsUpdate";
            cmd.Parameters.AddWithValue("@PollID", pollID);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Description", des);
            cmd.Parameters.AddWithValue("@StartDate", sd);
            cmd.Parameters.AddWithValue("@EndDate", ed);
            cmd.Parameters.AddWithValue("@Status", stat);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }


        public DataSet ADM_PollFetch(int PollID, string Status)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_PollFetch";
            cmd.Parameters.AddWithValue("@PollID", PollID);
            cmd.Parameters.AddWithValue("@Status", Status);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet ADM_PollFetchStarter(int PollID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_PollFetchStarter";
            cmd.Parameters.AddWithValue("@PollID", PollID);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet ADM_PollFetchByEmp(int PollID, int UserID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_PollFetchByEmp";
            cmd.Parameters.AddWithValue("@PollID", PollID);
            cmd.Parameters.AddWithValue("@UserID", UserID);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public Boolean ADM_PollsDelete(int PollID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_PollsDelete";
            cmd.Parameters.AddWithValue("@PollID", PollID);
            cmd.ExecuteNonQuery();
            cn.Close();
            return true;
        }

        public DataSet RPT_Poll(string WhereC)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "RPT_Poll";
            cmd.Parameters.AddWithValue("@WhereC", WhereC);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet ADM_ExpirePoll()
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_ExpirePoll";

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }
        #endregion

        #region Options
        public DataSet ADM_OptionsInsert(string name, int pollID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_OptionsInsert";
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@PollID", pollID);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }
        public DataSet ADM_OptionsFetch(int PollOptionID, int pollID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_OptionsFetch";
            cmd.Parameters.AddWithValue("@PollOptionID", PollOptionID);
            cmd.Parameters.AddWithValue("@PollID", pollID);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public Boolean ADM_OptionsDelete(int PollOptionID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_OptionsDelete";
            cmd.Parameters.AddWithValue("@PollOptionID", PollOptionID);
            cmd.ExecuteNonQuery();
            cn.Close();
            return true;

        }

        public DataSet ADM_OptionsUpdate(int PollOptionID, string Name)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_OptionsUpdate";
            cmd.Parameters.AddWithValue("@PollOptionID", PollOptionID);
            cmd.Parameters.AddWithValue("@Name", Name);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }
        #endregion
    }

}