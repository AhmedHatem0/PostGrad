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
    public partial class studentPublication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["id"] == null || Session["type"].ToString() != "0")
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                theses.Items.Clear();
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
                }
                conn.Close();
                populate_publication();
            }
        }

        protected void populate_publication()
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            publication.Items.Clear();
            SqlCommand pub = new SqlCommand("ViewPublications", conn);
            pub.CommandType = CommandType.StoredProcedure;

            conn.Open();
            pub.ExecuteNonQuery();
            SqlDataReader rdr = pub.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                publication.Items.Add(rdr.GetInt32(rdr.GetOrdinal("pubId")) + "");
            }
            conn.Close();
        }
        protected void add_Click(object sender, EventArgs e)
        {
            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand add = new SqlCommand("addPublication", conn);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar)).Value = title.Text;
                add.Parameters.Add(new SqlParameter("@pubDate", SqlDbType.Date)).Value = pubDate.Text;
                add.Parameters.Add(new SqlParameter("@host", SqlDbType.VarChar)).Value = host.Text;
                add.Parameters.Add(new SqlParameter("@place", SqlDbType.VarChar)).Value = place.Text;
                add.Parameters.Add(new SqlParameter("@accepted", SqlDbType.Bit)).Value = accept.Text;
                conn.Open();
                add.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Publication Added Successfully");
                populate_publication();
            }
            catch (Exception)
            {
                MessageBox.Show("Enter Valid Date");
            }
        }

        protected void link_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["postgrad_office"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand link = new SqlCommand("linkPubThesis", conn);
            link.CommandType = CommandType.StoredProcedure;
            link.Parameters.Add(new SqlParameter("@pubId", SqlDbType.Int)).Value = int.Parse(publication.Text);
            link.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = int.Parse(theses.Text);
            SqlParameter success = link.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            conn.Open();
            link.ExecuteNonQuery();
            conn.Close();
            if(success.Value.ToString() == "True")
            {
                MessageBox.Show("Publication Linked To Thesis Successfully");
            }
            else
            {
                MessageBox.Show("This Publication is Already Linked To This Thesis");
            }
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("student.aspx");
        }
        
    }
}