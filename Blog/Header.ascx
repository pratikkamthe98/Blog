<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Blog.Header" %>

<header class="header-desktop3 d-none d-lg-block">
    <div class="section__content section__content--p35">
        <div class="header3-wrap">
            <div class="header__logo">
                <a href="LandingPage.aspx"><span>Blog</span></a>
            </div>

            <div class="header__navbar">
                <ul class="list-unstyled">





                    <li class="has-sub">
                        <a href="BlogList.aspx">
                            <i class="fas fa-desktop"></i>
                            <span class="bot-line"></span>Blog</a>
                    </li>
                    <li class="has-sub">
                        <asp:LinkButton ID="lnkPendingBlogs" runat="server" OnClick="lnkbtnPendingBlogs_OnClick">
                              <i class="fas fa-desktop"></i>Pending Blogs
                             <span class="bot-line"></span>
                        </asp:LinkButton></li>


                    <li class="has-sub">
                        <asp:LinkButton ID="lnkbtnLogin" runat="server">
                              <i class="fas fa-user"></i>Login
                             <span class="bot-line"></span>
                        </asp:LinkButton>
                        <ul class="header3-sub-list list-unstyled">
                            <li>
                                <a href="AdminLogin.aspx">Admin</a>
                            </li>
                            <li>
                                <a href="UserLogin.aspx">User</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="header__tool">



                <div class="header-button-item js-item-menu">
                    <asp:LinkButton ID="lnkbtnLogout" runat="server" Style="color: white" OnClick="btnLogOut_OnClick">
                       <i class="zmdi zmdi-power-setting" ></i>

                    </asp:LinkButton>

                </div>
            </div>
        </div>
    </div>
</header>
