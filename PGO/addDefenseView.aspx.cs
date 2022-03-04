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
    public partial class addDefenseView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "2")
            {
                Response.Redirect("login.aspx");
            }
            thesesNums.Items.Clear();
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int vid = (int)Session["id"];
            SqlCommand getTheses = new SqlCommand("supervisorTheses", conn);
            getTheses.CommandType = CommandType.StoredProcedure;
            getTheses.Parameters.Add(new SqlParameter("@vid", SqlDbType.Int)).Value = vid;

            conn.Open();
            getTheses.ExecuteNonQuery();
            SqlDataReader rdr = getTheses.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                thesesNums.Items.Add(rdr.GetInt32(rdr.GetOrdinal("serial_num")) + "");
            }
            

            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int snum = int.Parse(thesesNums.Text);
            DateTime dd = DateTime.Parse(DDate.Text);
            String Dloc = DLocation.Text;

            SqlCommand checkGUCian = new SqlCommand("isGucianThesis", conn);
            checkGUCian.CommandType = CommandType.StoredProcedure;
            checkGUCian.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = snum;
            SqlParameter isGucian = checkGUCian.Parameters.Add("@isGucian", SqlDbType.Int);
            isGucian.Direction = ParameterDirection.Output;
            conn.Open();
            checkGUCian.ExecuteNonQuery();
            if(isGucian.Value.ToString() == "1") //add defense for gucian
            {
                SqlCommand defenseGUCian = new SqlCommand("AddDefenseGucian", conn);
                defenseGUCian.CommandType = CommandType.StoredProcedure;
                defenseGUCian.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = snum;
                defenseGUCian.Parameters.Add(new SqlParameter("@DefenseDate", SqlDbType.DateTime)).Value = dd;
                defenseGUCian.Parameters.Add(new SqlParameter("@DefenseLocation", SqlDbType.Text)).Value = Dloc;
                defenseGUCian.ExecuteNonQuery();
                System.Windows.Forms.MessageBox.Show("Defense Added for a Gucian Student");

              

            }
            else if (isGucian.Value.ToString() == "0") //add defense for nonGucian
            {
                SqlCommand defenseNonGUCian = new SqlCommand("AddDefenseNonGucian", conn);
                defenseNonGUCian.CommandType = CommandType.StoredProcedure;
                defenseNonGUCian.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = snum;
                defenseNonGUCian.Parameters.Add(new SqlParameter("@DefenseDate", SqlDbType.DateTime)).Value = dd;
                defenseNonGUCian.Parameters.Add(new SqlParameter("@DefenseLocation", SqlDbType.Text)).Value = Dloc;
                defenseNonGUCian.ExecuteNonQuery();
                System.Windows.Forms.MessageBox.Show("Defense Added for a NonGucian Student");


            }
            else    // thesis is not assigned for a student
            {
                System.Windows.Forms.MessageBox.Show("no student is assigned for this thesis");
      
            }
            conn.Close();

        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int snum = int.Parse(thesesNums.Text);
            DateTime dd = DateTime.Parse(DDate.Text);
            String ename = EName.Text;
            String fieldOfWork = FOW.Text;
            Boolean isNational = Boolean.Parse(IsNational.Text);
            String Password = Pass.Text;

            SqlCommand AddExaminer = new SqlCommand("AddExaminer", conn);
            AddExaminer.CommandType = CommandType.StoredProcedure;
            AddExaminer.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = snum;
            AddExaminer.Parameters.Add(new SqlParameter("@DefenseDate", SqlDbType.DateTime)).Value = dd;
            AddExaminer.Parameters.Add(new SqlParameter("@ExaminerName", SqlDbType.Text)).Value = ename;
            AddExaminer.Parameters.Add(new SqlParameter("@Password", SqlDbType.Text)).Value = Password;
            AddExaminer.Parameters.Add(new SqlParameter("@National", SqlDbType.Bit)).Value = isNational;
            AddExaminer.Parameters.Add(new SqlParameter("@fieldOfWork", SqlDbType.Text)).Value = fieldOfWork;
          
            conn.Open();
            AddExaminer.ExecuteNonQuery();
            conn.Close();
            System.Windows.Forms.MessageBox.Show("Examiner Added Successfully to the Defense");

        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("supervisor.aspx");

        }



      
    }
}