using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace postGradOffice
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void log_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand loginproc = new SqlCommand("userLogin", conn);
            loginproc.CommandType = CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = email.Text;
            loginproc.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = password.Text;
            SqlParameter id = loginproc.Parameters.Add("@id", SqlDbType.Int);
            SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Bit);
            SqlParameter type = loginproc.Parameters.Add("@type", SqlDbType.Int);
            id.Direction = ParameterDirection.Output;
            success.Direction = ParameterDirection.Output;
            type.Direction = ParameterDirection.Output;
            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();
            if (success.Value.ToString()=="True")
            {
                Session["id"] = id.Value;
                Session["type"] = type.Value;
                if (type.Value.ToString() == "0")
                {
                    Response.Redirect("student.aspx");
                }
                else if (type.Value.ToString() == "1")
                {
                    Response.Redirect("admin.aspx");
                }
                else if (type.Value.ToString() == "2")
                {
                    Response.Redirect("supervisor.aspx");
                }
                else
                {
                    Response.Redirect("examiner.aspx");
                }
            }
            
        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}