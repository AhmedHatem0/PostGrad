using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;
namespace PGO
{
    public partial class Issuepaymentinstallment : System.Web.UI.Page
    {
        public string s = " 00:00:00";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "1")
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void datepicker_SelectionChanged1(object sender, EventArgs e)
        {
             Label1.Text = datepicker.SelectedDate.ToShortDateString() +" 00:00:00";
           
        }

        protected void IssueInstall(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int PaymentID = int.Parse(paymentID.Text);
            SqlCommand AdminIssueInstallPaymentProc = new SqlCommand("AdminIssueInstallPayment", conn);
            AdminIssueInstallPaymentProc.CommandType = CommandType.StoredProcedure;
            AdminIssueInstallPaymentProc.Parameters.Add(new SqlParameter("@paymentID", SqlDbType.Int)).Value = PaymentID;
            AdminIssueInstallPaymentProc.Parameters.Add(new SqlParameter("@InstallStartDate", SqlDbType.Date)).Value = Label1.Text;
            conn.Open();
            try
            {
                AdminIssueInstallPaymentProc.ExecuteNonQuery();
                string script = "alert(\"Installments was Issued successfully\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            catch (SqlException)
            {
                string script = "alert(\"This Payment already have maximum number of installments\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            conn.Close();

        }

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }
    }
}