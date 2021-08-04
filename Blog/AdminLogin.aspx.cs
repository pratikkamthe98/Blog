using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blog
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtAdminName.Text == "admin" && txtPassword.Text == "admin")
                {


                    Session["adminname"] = "admin";
                    Session["role"] = "ADMIN";
                    lblMessage.Text = "Login Successfully";
                    Response.Redirect("LandingPage.aspx");

                }
                else
                {
                    lblMessage.Text = "Invalid credentials";
                }

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

    }
}