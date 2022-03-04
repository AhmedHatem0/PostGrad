using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace postGradOffice
{
    public partial class student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "0")
            {
                Response.Redirect("login.aspx");
            }
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand prof = new SqlCommand("viewMyProfile", conn);
            prof.CommandType = CommandType.StoredProcedure;
            prof.Parameters.Add(new SqlParameter("@studentId", SqlDbType.Int)).Value = Session["id"];
            conn.Open();
            prof.ExecuteNonQuery();
            SqlDataReader rdr = prof.ExecuteReader(CommandBehavior.CloseConnection);
            if(rdr.FieldCount == 9)
            {
                coursesPanel.Visible = false;
            }
            conn.Close();
        }

        protected void profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentProfile.aspx");
        }

        protected void theses_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentTheses.aspx");
        }

        protected void courses_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentCourses.aspx");
        }

        protected void progress_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentProgress.aspx");
        }

        protected void publication_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentPublication.aspx");
        }

        protected void mobile_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentMobile.aspx");
        }
    }
}