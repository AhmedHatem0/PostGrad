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
    public partial class studentProfile : System.Web.UI.Page
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
            while (rdr.Read())
            {
                
                object[] vals = new object[rdr.FieldCount];
                rdr.GetValues(vals);
                Label info = new Label();
                string s = "";
                for (int i = 0; i < vals.Length; i++)
                {
                    s += rdr.GetName(i) + ": " +vals[i] + "<br/>";
                }
                info.Text = s + "<br/>";
                form1.Controls.Add(info);
   
            }
            
            conn.Close();
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("student.aspx");
        }

    }
}