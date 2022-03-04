using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;

namespace PGO
{
    public partial class ListAlltheses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "1")
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand AdminViewAllThesesproc = new SqlCommand("AdminViewAllTheses", conn);
                AdminViewAllThesesproc.CommandType = CommandType.StoredProcedure;

                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(AdminViewAllThesesproc);
                DataTable table = new DataTable();
                da.Fill(table);
                GridView1.DataSource = table;
                GridView1.DataBind();
                conn.Close();
            }

        }
        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }

        protected void OnGoing(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AdminViewOnGoingThesesProc = new SqlCommand("AdminViewOnGoingTheses", conn);
            AdminViewOnGoingThesesProc.CommandType = CommandType.StoredProcedure;

            SqlParameter thesesCount = AdminViewOnGoingThesesProc.Parameters.Add("@thesesCount", SqlDbType.Int);
            thesesCount.Direction = ParameterDirection.Output;
            conn.Open();
            AdminViewOnGoingThesesProc.ExecuteNonQuery();
            conn.Close();
            label.Text = "Number of on going theses: " + thesesCount.Value.ToString();
            
        }
    }
}