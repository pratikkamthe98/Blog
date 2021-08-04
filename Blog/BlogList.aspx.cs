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
    public partial class BlogList : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (System.Web.HttpContext.Current.Session["role"] == null || (System.Web.HttpContext.Current.Session["role"]).ToString() == "")
                {
                    btnCreateBlog.Visible = false;
                }
                else if (Session["role"].Equals("ADMIN"))
                {
                    btnCreateBlog.Visible = false;

                }
                else if (Session["role"].Equals("USER"))
                {
                    btnCreateBlog.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }

            if (!Page.IsPostBack)
            {
                displayBlogs();


            }


        }
        void displayBlogs()
        {
            SqlConnection con = new SqlConnection(connection);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }

            SqlCommand cmd = new SqlCommand("procDisplayBlog", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                DataTable dt = new DataTable();
                dt.Load(reader);
                dlBlogs.DataSource = dt;
                dlBlogs.DataBind();
            }

        }
        protected void btnNewBlog_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("CreateNewBlog.aspx");
        }
        protected void Item_Command(object sender, DataListCommandEventArgs e)
        {

            if (e.CommandName == "Detail")
            {
                int index = e.Item.ItemIndex;
                Label id = (Label)dlBlogs.Items[index].FindControl("lblBlogID");
                Session["BlogID"] = id.Text;
                Response.Redirect("~/BlogDetails.aspx");


            }

        }

    }
}