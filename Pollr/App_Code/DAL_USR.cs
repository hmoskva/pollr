using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Pollr.App_Code
{
    public class DAL_USR
    {
        SqlConnection cn = new SqlConnection(@"Data Source=HABIB\HABIB;Initial Catalog=Pollr;Integrated Security=True");

        public DataSet USR_Register(string FullName, string Email, string Password, string Status)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "USR_Register";
            cmd.Parameters.AddWithValue("@FullName", FullName);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@Password", Password);
            cmd.Parameters.AddWithValue("@Status", Status);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet USR_Login(string email, string password)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "USR_Login";
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet USR_FetchAll(int UserID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "USR_FetchAll";
            cmd.Parameters.AddWithValue("@UserID", UserID);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet USR_ProfileUpdate(int UserID, string Phone, string Photo)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "USR_ProfileUpdate";
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@Phone", Phone);
            cmd.Parameters.AddWithValue("@Photo", Photo);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet USR_VoteInsert(int OptionID, int PollID, int UserID)
        {

            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "USR_VoteInsert";
            cmd.Parameters.AddWithValue("@OptionID", OptionID);
            cmd.Parameters.AddWithValue("@PollID", PollID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet USR_VoteFetch(int VoteID, int UserID, int PollID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "USR_VoteFetch";
            cmd.Parameters.AddWithValue("@VoteID", VoteID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@PollID", PollID);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet ADM_VoteCount(int PollID)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ADM_VoteCount";
            cmd.Parameters.AddWithValue("@PollID", PollID);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.Close();
            return ds;
        }
    }
}