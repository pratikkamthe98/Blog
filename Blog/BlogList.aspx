<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlogList.aspx.cs" Inherits="Blog.BlogList" %>

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
                        <div class="row" style="padding: 15px 0px">
                            <asp:LinkButton ID="btnCreateBlog" runat="server" CssClass="au-btn au-btn-icon au-btn--green au-btn--small" OnClick="btnNewBlog_OnClick"> 
                                            <i class="zmdi zmdi-plus"></i>Create New Blog </asp:LinkButton>
                        </div>
                        <div style="margin: 5% 10%">



                            <asp:DataList ID="dlBlogs" runat="server" OnItemCommand="Item_Command">
                                <ItemTemplate>
                                    <div class="row" style="border-bottom: 1px gray solid; padding: 5px">
                                        <div class="col-lg-12">
                                            <h4>
                                                <asp:Label ID="lblBlogTitle" runat="server" Text='<%# Eval("BlogTitle") %>'></asp:Label></h4>
                                        </div>

                                        <div class="col-lg-12">
                                            <span>Blog ID: 
                                                <asp:Label ID="lblBlogID" runat="server" Text='<%# Eval("BlogID") %>'> </asp:Label>
                                            </span>
                                            <span style="padding-left: 30px;">
                                                <asp:Label ID="lblAuthorName" runat="server"> Posted By:<%# Eval("FullName") %></asp:Label>
                                            </span>
                                            <span style="padding-left: 50px;">
                                                <asp:Label ID="lblDate" runat="server">Posted Date: <%# Eval("BlogDate") %> </asp:Label>
                                            </span>
                                            <br />
                                            <span>

                                                <asp:LinkButton ID="btnPostBlog" runat="server" CommandName="Detail">Read Complete Blog </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                    <br />

                                </ItemTemplate>
                            </asp:DataList>

                        </div>
                    </div>
                </div>
            </div>


        </div>
    </form>
</body>
</html>
