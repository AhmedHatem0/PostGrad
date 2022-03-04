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
    public partial class studentMobile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "0")
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand add = new SqlCommand("addMobile", conn);
            add.CommandType = CommandType.StoredProcedure;
            add.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar)).Value = Session["id"];
            add.Parameters.Add(new SqlParameter("@mobile_number", SqlDbType.VarChar)).Value = mobile.Text;
            conn.Open();
            add.ExecuteNonQuery();
            conn.Close();
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("student.aspx");
        }
    }
}