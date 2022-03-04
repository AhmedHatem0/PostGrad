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
    public partial class ListAllsup : System.Web.UI.Page
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

                SqlCommand AdminListSupProc = new SqlCommand("AdminListSup", conn);
                AdminListSupProc.CommandType = CommandType.StoredProcedure;

                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(AdminListSupProc);
                DataTable table = new DataTable();
                da.Fill(table);
                grid.DataSource = table;
                grid.DataBind();
                conn.Close();
            }

        }
        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }

    }
}