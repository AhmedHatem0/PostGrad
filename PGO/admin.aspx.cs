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

namespace postGradOffice
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "1")
            {
                Response.Redirect("login.aspx");
            }

        }
        protected void ListThesis(object sender, EventArgs e)
        {
            Response.Redirect("ListAlltheses.aspx");

        }
        protected void ListSup(object sender, EventArgs e)
        {
            Response.Redirect("ListAllsup.aspx");
            
        }
        protected void IssuePayment(object sender, EventArgs e)
        {
            Response.Redirect("Issuethesispayment.aspx");
            
        }
        protected void IssueInstallment(object sender, EventArgs e)
        {
            Response.Redirect("Issuepaymentinstallment.aspx");

        }

        protected void UpdateExtension(object sender, EventArgs e)
        {
            Response.Redirect("UpdateExtension.aspx");

        }

    }
}