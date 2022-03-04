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

namespace PGO
{
    public partial class Issuethesispayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "1")
            {
                Response.Redirect("login.aspx");
            }

        }
        protected void Issue(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int SerialNum = 0;
            decimal Amount1 = 0;
            int InstallmentNum = 0;
            decimal Fund = 0;
            try
            {
                 SerialNum = int.Parse(SNum.Text);

            }
            catch (Exception)
            {
                string script = "alert(\"Please entre a thesis serial number\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            try
            {  
                Amount1 = decimal.Parse(Amount.Text);
              
            }
            catch (Exception)
            {
                string script = "alert(\"Please entre the amount\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            try
            { 
                InstallmentNum = int.Parse(NumInstallment.Text);
            }
            catch (Exception)
            {
                string script = "alert(\"Please entre the number of installments\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            try
            {
                Fund = decimal.Parse(FundPercentage.Text);
            }
            catch (Exception)
            {
                string script = "alert(\"Please entre fund percentage\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }

            SqlCommand AdminIssueThesisPaymentProc = new SqlCommand("AdminIssueThesisPayment", conn);
            AdminIssueThesisPaymentProc.CommandType = CommandType.StoredProcedure;
            AdminIssueThesisPaymentProc.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = SerialNum;
            AdminIssueThesisPaymentProc.Parameters.Add(new SqlParameter("@amount", SqlDbType.Decimal)).Value = Amount1;
            AdminIssueThesisPaymentProc.Parameters.Add(new SqlParameter("@noOfInstallments", SqlDbType.Int)).Value = InstallmentNum;
            AdminIssueThesisPaymentProc.Parameters.Add(new SqlParameter("@fundPercentage", SqlDbType.Int)).Value = Fund;
            SqlParameter success = AdminIssueThesisPaymentProc.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            conn.Open();
            AdminIssueThesisPaymentProc.ExecuteNonQuery();
                
            conn.Close();
            if(success.Value.ToString() == "True")
            {
                string script = "alert(\"Payment was issued successfully\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            else
            {
                string script = "alert(\"There is No thesis with this serial number\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
        }

        protected void SNum_TextChanged(object sender, EventArgs e)
        {

        }

        protected void NumInstallment_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }
    }
}