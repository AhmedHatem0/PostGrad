using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace postgrad_office
{
    public partial class addComment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["type"].ToString() != "3")
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String conStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection con = new SqlConnection(conStr);
            string ser =serial.Text;
            String dat = date.Text;
            String comm = com.Text;
                SqlCommand addcom = new SqlCommand("AddDefenseComment", con);
                addcom.CommandType = CommandType.StoredProcedure;

            if (ser.Length * dat.Length * comm.Length != 0)
            {
                addcom.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["id"];
                addcom.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = ser;
                addcom.Parameters.Add(new SqlParameter("@DefenseDate", SqlDbType.DateTime)).Value = dat;
                addcom.Parameters.Add(new SqlParameter("@comments", SqlDbType.VarChar)).Value = comm;
                SqlParameter bit = addcom.Parameters.Add("@bit", SqlDbType.Bit);
                bit.Direction = System.Data.ParameterDirection.Output;
                con.Open();
                addcom.ExecuteNonQuery();
                con.Close();
                if (bit.Value.ToString() == "True")
                {
                    Label4.Text = "Done!";

                }
                else
                {
                    Label4.Text = "Wrong input";
                }
            }
            else
            {
                Label4.Text = "Wrong input";
            }
            
            
          
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("examiner.aspx");

        }
    }
}