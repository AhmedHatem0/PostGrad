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
    public partial class supervisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "2")
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void studentsInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewSupStudentsYears.aspx");
        }

        protected void ViewAStudentPublications_Click(object sender, EventArgs e)
        {
            Response.Redirect("supervisorPublication.aspx");
        }

        protected void AddDefense_Click(object sender, EventArgs e)
        {
            Response.Redirect("addDefenseView.aspx");
        }

        protected void evaluate_Click(object sender, EventArgs e)
        {
            Response.Redirect("evaluateReport.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("cancelThesis.aspx");
        }
    }
}