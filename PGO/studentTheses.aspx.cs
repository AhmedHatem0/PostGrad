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
    public partial class studentTheses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "0")
            {
                Response.Redirect("login.aspx");
            }
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand view = new SqlCommand("ViewMyTheses", conn);
            view.CommandType = CommandType.StoredProcedure;
            view.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["id"];
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(view);
            DataTable table = new DataTable();
            da.Fill(table);
            grid.DataSource = table;
            grid.DataBind();
            conn.Close();

        }
        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("student.aspx");
        }
    }
}