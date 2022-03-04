using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace PGO
{
    public partial class evaluateReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "2")
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
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
                if (thesesNums.Text != "") 
                {
                    fillReportList();
                }

                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand reportEval = new SqlCommand("EvaluateProgressReport", conn);
            reportEval.CommandType = CommandType.StoredProcedure;
            reportEval.Parameters.Add(new SqlParameter("@supervisorID", SqlDbType.Int)).Value = (int)Session["id"];
            reportEval.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = int.Parse(thesesNums.Text);
            reportEval.Parameters.Add(new SqlParameter("@progressReportNo", SqlDbType.Int)).Value = int.Parse(reportsNums.Text);
            reportEval.Parameters.Add(new SqlParameter("@evaluation", SqlDbType.Int)).Value = int.Parse(TextBox1.Text);
            SqlParameter success = reportEval.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            conn.Open();
            reportEval.ExecuteNonQuery();
            conn.Close();
            if (success.Value.ToString() == "True")
            {
            MessageBox.Show("evaluation added successfully");
            }
            else
            {
             MessageBox.Show("failed to add evaluation, please enter valid report number");
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("supervisor.aspx");
        }




           protected void thesesNums_SelectedIndexChanged(object sender, EventArgs e)
           {

            fillReportList();
           }

        protected void fillReportList()
        {
            reportsNums.Items.Clear();
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand getReports = new SqlCommand("ViewProgressReports", conn);
            getReports.CommandType = CommandType.StoredProcedure;
            getReports.Parameters.Add(new SqlParameter("@serial_num", SqlDbType.Int)).Value = thesesNums.Text;

            conn.Open();
            getReports.ExecuteNonQuery();
            SqlDataReader rdr = getReports.ExecuteReader(CommandBehavior.CloseConnection);


            while (rdr.Read())
            {
                reportsNums.Items.Add(rdr.GetInt32(rdr.GetOrdinal("report_num")) + "");
            }
            conn.Close();
           

        }


    }
}