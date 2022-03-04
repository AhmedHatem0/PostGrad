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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                supervisor.Visible = false;
                examiner.Visible = false;
            }
        }

        protected void type_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (type.Text == "Student")
            {
                student.Visible = true;
                supervisor.Visible = false;
                examiner.Visible = false;
            }
            else if (type.Text == "Supervisor")
            {
                student.Visible = false;
                supervisor.Visible = true;
                examiner.Visible = false;
            }
            else
            {
                student.Visible = false;
                supervisor.Visible = false;
                examiner.Visible = true;
            }
        }

        protected void reg_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);



            SqlCommand register;
            if (type.Text == "Student")
            {
               register = new SqlCommand("StudentRegister", conn);
               register.Parameters.Add(new SqlParameter("@faculty", SqlDbType.VarChar)).Value = faculty.Text;
               register.Parameters.Add(new SqlParameter("@address", SqlDbType.VarChar)).Value = address.Text;
               register.Parameters.Add(new SqlParameter("@Gucian", SqlDbType.Bit)).Value = gucian.Text;
            }
            else if (type.Text == "Supervisor")
            {
               register = new SqlCommand("SupervisorRegister", conn);
               register.Parameters.Add(new SqlParameter("@faculty", SqlDbType.VarChar)).Value = faculty2.Text;
            }
            else
            {
               register = new SqlCommand("ExaminerRegister", conn);
               register.Parameters.Add(new SqlParameter("@field_of_work", SqlDbType.VarChar)).Value = field.Text;
               register.Parameters.Add(new SqlParameter("@is_national", SqlDbType.Bit)).Value = national.Text;
            }
            register.CommandType = CommandType.StoredProcedure;
            register.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = email.Text;
            register.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = password.Text;
            register.Parameters.Add(new SqlParameter("@first_name", SqlDbType.VarChar)).Value = first_name.Text;
            register.Parameters.Add(new SqlParameter("@last_name", SqlDbType.VarChar)).Value = last_name.Text;
            conn.Open();
            try
            {
                register.ExecuteNonQuery();
                System.Windows.Forms.MessageBox.Show("User Registered Successfully");
            }
            catch(Exception )
            {
                System.Windows.Forms.MessageBox.Show("Invalid User Registeration");
            }
            conn.Close();
           
        }
        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

    }
}