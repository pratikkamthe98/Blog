<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="Blog.LandingPage" %>

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
                     <asp:Image runat="server"  src="Images/blog1.jpg" Height="700px" Width="100%"/>
                    
                </div>
            </div>



        </div>
    </form>
</body>
</html>
