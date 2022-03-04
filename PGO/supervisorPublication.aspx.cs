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
    public partial class supervisorPublication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "2")
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int sid = int.Parse(SID.Text);
            SqlCommand ViewAStudentPublications = new SqlCommand("ViewAStudentPublications", conn);
            ViewAStudentPublications.CommandType = CommandType.StoredProcedure;
            ViewAStudentPublications.Parameters.Add(new SqlParameter("@StudentID", SqlDbType.Int)).Value = sid;


            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(ViewAStudentPublications);
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