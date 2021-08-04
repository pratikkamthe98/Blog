<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="Blog.UserSignUp" %>

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
                <uc1:Header runat="server" id="Header" />
                <div class="page-content--bgf7">
                    <div class="container">


                        <div class="login-wrap">
                            <div class="login-content">
                                <div class="login-logo">
                                    <a href="#">USER REGISTRATION</a>
                                </div>
                                <div class="login-form">

                                    <div class="form-group">
                                        <asp:Label ID="lblFullName" runat="server" Text="Full Name"></asp:Label>
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="au-input au-input--full"></asp:TextBox>
                                    </div>


                                    <div class="form-group">
                                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="au-input au-input--full" TextMode="Email"></asp:TextBox>
                                    </div>


                                    <div class="form-group">
                                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="au-input au-input--full" TextMode="Password"></asp:TextBox>
                                    </div>


                                    <asp:Button ID="btnRegisterUser" runat="server" CssClass="au-btn au-btn--block au-btn--green m-b-20" Text="Register" OnClick="btnRegisterUser_Click" />
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
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
