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
    public partial class cancelThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "2")
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Snum = int.Parse(snum.Text);
            SqlCommand cancel = new SqlCommand("CancelThesis", conn);
            cancel.CommandType = CommandType.StoredProcedure;
            cancel.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = Snum;
            SqlParameter success = cancel.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            conn.Open();
            cancel.ExecuteNonQuery();
            if ((Boolean)success.Value)
            {
                MessageBox.Show("Thesis canceled successfully");
            }
            else
            {
                MessageBox.Show("failed to cancel thesis, the evaluation of the last progress report of the thesis may not be zero or the thesis does not exist");

            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("supervisor.aspx");
        }
    }
}