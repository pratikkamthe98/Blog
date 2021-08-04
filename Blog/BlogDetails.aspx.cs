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
    public partial class BlogDetails : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                displayBlofDetails();
                displayReviewData();
                displayCommentCount();
            }
        }

        void displayBlofDetails()
        {
            SqlConnection con = new SqlConnection(connection);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("procBlogDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = new SqlParameter("@BlogID", Session["BlogID"]);
            cmd.Parameters.Add(p1);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblBlogTitle.Text = dr.GetValue(1).ToString();
                    lblBlogContent.Text = dr.GetValue(2).ToString();
                    lblBlogID.Text = dr.GetValue(0).ToString();
                    lblAuthorName.Text = dr.GetValue(3).ToString();
                    lblDate.Text = dr.GetValue(4).ToString();


                }
            }
        }



        protected void btnSubmitReview_click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connection);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("procAddReview", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CommentDate", DateTime.Now);
            cmd.Parameters.AddWithValue("@Rating", ddlRating.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@CommentContent", txtComment.Text.Trim());
            cmd.Parameters.AddWithValue("@BlogID", Session["BlogID"]);
            cmd.Parameters.AddWithValue("@UserID", Session["userid"]);
            cmd.ExecuteNonQuery();
            con.Close();
            txtComment.Text = string.Empty;

            displayReviewData();

        }
        void displayReviewData()
        {
            SqlConnection con = new SqlConnection(connection);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }


            SqlCommand cmd = new SqlCommand("procDisplayReviews", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = new SqlParameter("@BlogID", Session["BlogID"]);
            cmd.Parameters.Add(p1);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            rptReview.DataSource = dt;
            rptReview.DataBind();

        }
        void displayCommentCount()
        {
            SqlConnection con = new SqlConnection(connection);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }


            SqlCommand cmd = new SqlCommand("procCommentsCount", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = new SqlParameter("@BlogID", Session["BlogID"]);
            cmd.Parameters.Add(p1);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblCommentCount.Text = dr.GetValue(0).ToString();



                }
            }
            else
                lblCommentCount.Text = "0";


        }

    }
}