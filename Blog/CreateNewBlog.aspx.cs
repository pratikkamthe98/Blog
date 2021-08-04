using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Blog
{
    public partial class CreateNewBlog : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmitBlog_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                String status = "Pending";
                SqlCommand cmd = new SqlCommand("procCreateBlog", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BlogTitle", txtBlogTitle.Text);
                cmd.Parameters.AddWithValue("@BlogContent", txtBlogContent.Text);
                cmd.Parameters.AddWithValue("@BlogDate", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@BlogStatus", status);
                cmd.Parameters.AddWithValue("@UserID", Session["userid"]);
                cmd.ExecuteNonQuery();
                lblMessage.Text = "Blog Created Successfully";




            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }



        }
    }
}