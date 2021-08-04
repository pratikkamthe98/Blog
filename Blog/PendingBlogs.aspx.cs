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
    public partial class PendingBlogs : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            displayPendingBlogs();

        }
        void displayPendingBlogs()
        {
            SqlConnection con = new SqlConnection(connection);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }

            SqlCommand cmd = new SqlCommand("procPendingBlog", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                DataTable dt = new DataTable();
                dt.Load(reader);
                dlPendingBlogs.DataSource = dt;
                dlPendingBlogs.DataBind();
            }
        }


        protected void Item_Command(object sender, DataListCommandEventArgs e)
        {

            if (e.CommandName == "Post")
            {
                int index = e.Item.ItemIndex;
                Label BlogID = (Label)dlPendingBlogs.Items[index].FindControl("lblBlogID");


                try
                {
                    SqlConnection con = new SqlConnection(connection);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }



                    SqlCommand cmd = new SqlCommand("procPostBlog", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BlogID", Convert.ToInt32(BlogID.Text.Trim()));

                    cmd.ExecuteNonQuery();


                    displayPendingBlogs();


                }
                catch (Exception ex)
                {


                }


            }





        }





    }
}