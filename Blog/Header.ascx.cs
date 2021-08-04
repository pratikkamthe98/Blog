using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blog
{
    public partial class Header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (System.Web.HttpContext.Current.Session["role"] == null || (System.Web.HttpContext.Current.Session["role"]).ToString() == "")
                {
                    lnkbtnLogout.Visible = false;
                    lnkbtnLogin.Visible = true;
                    lnkPendingBlogs.Visible = false;
                }
                else if (Session["role"].Equals("ADMIN"))
                {
                    lnkbtnLogout.Visible = true;
                    lnkbtnLogin.Visible = false;
                    lnkPendingBlogs.Visible = true;
                }
                else if (Session["role"].Equals("USER"))
                {
                    lnkbtnLogout.Visible = true;
                    lnkbtnLogin.Visible = false;
                    lnkPendingBlogs.Visible = false;
                }
            }
            catch (Exception ex)
            {


            }



        }


        protected void lnkbtnPendingBlogs_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("PendingBlogs.aspx");
        }
        protected void btnLogOut_OnClick(object sender, EventArgs e)
        {
            Session["userid"] = "";
            Session["username"] = "";
            Session["adminname"] = "";
            Session["role"] = "";
            Response.Redirect("LandingPage.aspx");

        }
    }
}