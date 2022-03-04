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
using System.Windows.Forms;

namespace postGradOffice
{
    public partial class studentProgress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "0")
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                theses.Items.Clear();
                theses2.Items.Clear();
                String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand view = new SqlCommand("ViewMyTheses", conn);
                view.CommandType = CommandType.StoredProcedure;
                view.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["id"];
                conn.Open();
                view.ExecuteNonQuery();
                SqlDataReader rdr = view.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    theses.Items.Add(rdr.GetInt32(rdr.GetOrdinal("serial_num")) + "");
                    theses2.Items.Add(rdr.GetInt32(rdr.GetOrdinal("serial_num")) + "");
                }
                populate_report();
                conn.Close();
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            try { 
                String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand add = new SqlCommand("AddProgressReport", conn);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = int.Parse(theses.Text);
                add.Parameters.Add(new SqlParameter("@progressReportDate", SqlDbType.Date)).Value = date.Text;
                conn.Open();
                add.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Progress Report Added Successfully");
                populate_report();
            }
            catch (Exception)
            {
                MessageBox.Show("Enter A Valid Date");
            }
        }

        protected void fill_Click(object sender, EventArgs e)
        {
            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand fill = new SqlCommand("FillProgressReport", conn);
                fill.CommandType = CommandType.StoredProcedure;
                fill.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = int.Parse(theses2.Text);
                fill.Parameters.Add(new SqlParameter("@progressReportNo", SqlDbType.Int)).Value = int.Parse(report.Text);
                fill.Parameters.Add(new SqlParameter("@state", SqlDbType.Int)).Value = int.Parse(state.Text);
                fill.Parameters.Add(new SqlParameter("@description", SqlDbType.VarChar)).Value = description.Text;
                conn.Open();
                fill.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Progress Report Filled Successfully");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter A Valid State");
            }
        }

        protected void theses2_SelectedIndexChanged(object sender, EventArgs e)
        {
            report.Items.Clear();
            populate_report();
        }

        protected void populate_report()
        {
            if (theses2.Text == "") 
                return;
            string connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand view = new SqlCommand("ViewProgressReports", conn);
            view.CommandType = CommandType.StoredProcedure;
            view.Parameters.Add(new SqlParameter("@serial_num", SqlDbType.Int)).Value = int.Parse(theses2.Text);
            conn.Open();
            view.ExecuteNonQuery();
            SqlDataReader rdr = view.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                report.Items.Add(rdr.GetInt32(rdr.GetOrdinal("report_num")) + "");
            }
            conn.Close();
        }
        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("student.aspx");
        }
    }
}