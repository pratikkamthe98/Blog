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
    public partial class UserLogin : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("procCheckUserLogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter("@Email", txtEmail.Text.Trim());
                cmd.Parameters.Add(p1);
                SqlParameter p2 = new SqlParameter("@Password", txtPassword.Text.Trim());
                cmd.Parameters.Add(p2);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        Session["userid"] = dr.GetValue(0).ToString();
                        Session["username"] = dr.GetValue(1).ToString();
                        Session["role"] = "USER";

                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Login Successfully";
                        Response.Redirect("LandingPage.aspx");
                    }

                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Invalid credentials";
                }

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }


        }

        protected void btnUserRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUp.aspx");

        }

    }
}