<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateNewBlog.aspx.cs" Inherits="Blog.CreateNewBlog" %>

<%@ Register Src="~/Styling.ascx" TagPrefix="uc1" TagName="Styling" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc1" TagName="Header" %>


<uc1:Styling runat="server" ID="Styling" />
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="page-wrapper">
                <uc1:Header runat="server" ID="Header" />
                <div class="page-content--bgf7">
                    <div class="container">
                        <div class="login-wrap" style="width: 100%">
                            <div class="login-content">
                                <div class="login-logo">
                                    <a href="#"><span>Create New Blog Post</span></a>
                                </div>
                                <div class="login-form">
                                    <div class="form-group">
                                        <asp:Label ID="lblBlogTitle" runat="server" Text="Title"></asp:Label>
                                        <asp:TextBox ID="txtBlogTitle" runat="server" CssClass="au-input au-input--full"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblBlogContent" runat="server" Text="Content"></asp:Label>
                                        <asp:TextBox ID="txtBlogContent" runat="server" CssClass="au-input au-input--full" TextMode="MultiLine" Height="300px"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="btnSubmitBlog" runat="server" CssClass="au-btn au-btn--block au-btn--green m-b-20" Text="Submit" OnClick="btnSubmitBlog_Click" />
                                    <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>



            </div>
        </div>
    </form>
</body>
</html>
