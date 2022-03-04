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
    public partial class EditInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "3")
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String conStr= WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection con = new SqlConnection(conStr);
            String name = UpdateName.Text;
            String field = UpdateField.Text;
            if (name.Length> 0)
            {
                Label3.Text = "Done!";
                SqlCommand upname = new SqlCommand("UpdateExaminerName", con);
                upname.CommandType = CommandType.StoredProcedure;
                upname.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["id"];
                upname.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar)).Value = name;
                con.Open();
                upname.ExecuteNonQuery();
                con.Close();
            }  
            if (field.Length > 0)
            {
                Label3.Text = "Done!";
                SqlCommand upfield = new SqlCommand("UpdateExaminerField", con);
                upfield.CommandType = CommandType.StoredProcedure;
                upfield.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["id"];
                upfield.Parameters.Add(new SqlParameter("@field_of_work", SqlDbType.VarChar)).Value = field;
                con.Open();
                upfield.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("examiner.aspx");
        }
    }
}