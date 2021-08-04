<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlogDetails.aspx.cs" Inherits="Blog.BlogDetails" %>

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
                        <div style="margin: 5% 10%">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4>
                                        <asp:Label ID="lblBlogTitle" runat="server"></asp:Label></h4>
                                </div>
                                <div class="col-lg-12">
                                    <asp:Label ID="lblBlogContent" runat="server"></asp:Label>
                                </div>

                                <div class="col-lg-12">
                                    <span>Blog ID: 
                                                <asp:Label ID="lblBlogID" runat="server"> </asp:Label>
                                    </span>
                                    <span style="padding-left: 30px;">Created By:
                                        <asp:Label ID="lblAuthorName" runat="server"></asp:Label>
                                    </span>
                                    <span style="padding-left: 50px;">Created Date:
                                        <asp:Label ID="lblDate" runat="server"> </asp:Label>
                                    </span>
                                    <br />
                                    <span>Comments
                                          <span class="badge badge-warning">
                                              <asp:Label runat="server" ID="lblCommentCount"></asp:Label></span>

                                    </span>


                                </div>

                            </div>
                            <br />
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4 style="padding-left: 15px">Comments</h4>
                                </div>
                                <div class="col-lg-12">
                                    <asp:Repeater ID="rptReview" runat="server">
                                        <ItemTemplate>
                                            <div class="row" style="border-bottom: 1px gray solid; padding: 5px">
                                                <div class="col-lg-12">
                                                    <span>User ID:
                                                <asp:Label ID="lblName" runat="server" Font-Bold="true" Text='<%#Eval("UserID") %>' /></td>
                                                    </span>
                                                    <span>Rating:<asp:Label ID="lblRating" runat="server" Font-Bold="true" Text='<%#Eval("Rating") %>' /></td>
                                                    </span>
                                                </div>
                                                <div class="col-lg-12">
                                                    <span>Comment:
                                                        <asp:Label ID="lblComment" runat="server" Text='<%#Eval("CommentContent") %>' />
                                                    </span>
                                                    <span>Posted-Date:<asp:Label ID="lblDate" runat="server" Text='<%#Eval("CommentDate") %>' />
                                                    </span>
                                                </div>
                                            </div>
                                            <hr />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-lg-12">

                                    <asp:TextBox ID="txtComment" class="au-input au-input--full" runat="server" TextMode="MultiLine" PlaceHolder="Enter Comment Here"></asp:TextBox>

                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <asp:Label runat="server">Rating</asp:Label>
                                        <asp:DropDownList ID="ddlRating" runat="server">
                                            <asp:ListItem Value="Very Good">Very Good</asp:ListItem>
                                            <asp:ListItem Value="Good">Good</asp:ListItem>
                                            <asp:ListItem Value="Average">Average</asp:ListItem>
                                            <asp:ListItem Value="Bad">Bad</asp:ListItem>


                                        </asp:DropDownList>
                                    </div>
                                </div>


                                <div class="col-lg-2">
                                    <asp:Button ID="Button1" CssClass="au-btn au-btn-icon au-btn--green au-btn--small" runat="server" Text="Submit" OnClick="btnSubmitReview_click" />
                                </div>

                            </div>
                            <div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
