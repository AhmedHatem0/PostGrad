using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace postgrad_office
{
    public partial class thesisSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "3")
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("examiner.aspx");

        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            String conStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection con = new SqlConnection(conStr);
            SqlCommand thesis = new SqlCommand("ExaminerThesisSearch", con);
            thesis.CommandType = CommandType.StoredProcedure;
            String K = Key.Text;

            thesis.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["id"];
            thesis.Parameters.Add(new SqlParameter("@key", SqlDbType.VarChar)).Value = K;

            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(thesis);
            DataTable table = new DataTable();
            da.Fill(table);
            GridView1.DataSource = table;
            GridView1.DataBind();
            con.Close();
        }
    }
}