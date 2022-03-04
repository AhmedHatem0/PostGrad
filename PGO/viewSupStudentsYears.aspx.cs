using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PGO
{
    public partial class viewSupStudentsYears : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "2")
            {
                Response.Redirect("login.aspx");
            }
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewSup = new SqlCommand("ViewSupStudentsYears", conn);
            viewSup.CommandType = CommandType.StoredProcedure;
            viewSup.Parameters.Add(new SqlParameter("@supervisorID", SqlDbType.Int)).Value = Session["id"];

            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(viewSup);
            DataTable table = new DataTable();
            da.Fill(table);
            grid.DataSource = table;
            grid.DataBind();
            conn.Close();

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("supervisor.aspx");
        }
    }
}