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
    public partial class UpdateExtension : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "1")
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void UpdateButton(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int SerialNum = int.Parse(SNum.Text);
            SqlCommand AdminUpdateExtensionProc = new SqlCommand("AdminUpdateExtension", conn);
            AdminUpdateExtensionProc.CommandType = CommandType.StoredProcedure;
            AdminUpdateExtensionProc.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = SerialNum;
            SqlParameter success = AdminUpdateExtensionProc.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            conn.Open();
            AdminUpdateExtensionProc.ExecuteNonQuery();
            conn.Close();
            if (success.Value.ToString() == "True")
            {
                string script = "alert(\"Thesis number of extensions updated successfully\");";
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

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }
    }
}