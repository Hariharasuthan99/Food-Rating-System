<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Reviewer.aspx.cs" Inherits="Food_Rating_System.Reviewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" Text="Searching"></asp:Label><br /><br />
    <asp:DropDownList ID="ddlSearch" runat="server" ValidationGroup="Search"></asp:DropDownList>
    <asp:RequiredFieldValidator ID="ReqCat" runat="server" ErrorMessage="Choose Category" Display="Dynamic" Text="*" ForeColor="Red" ControlToValidate="ddlSearch" ValidationGroup="Search">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="tbSearch" runat="server" ValidationGroup="Search"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ReqTerm" runat="server" ErrorMessage="Enter Search Term" Display="Dynamic" Text="*" ForeColor="Red" ControlToValidate="tbSearch" ValidationGroup="Search">
    </asp:RequiredFieldValidator>
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="Search" />
    <br />
    <asp:Label runat="server" Text="Last Searched: "></asp:Label>
    <asp:Label ID="lbPrev" runat="server" Text=""></asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="rating" Text="Reviewing" /><br />
    <asp:SqlDataSource ID="restNames" runat="server" ConnectionString='<%$ ConnectionStrings:FoodDeliveryDatabaseConnectionString %>'
        SelectCommand="SELECT [Name] FROM [Restaurants]">
    </asp:SqlDataSource>
    <asp:DropDownList ID="ddlNames" runat="server" DataSourceID="restNames" DataTextField="Name" ValidationGroup="Review"></asp:DropDownList>
    <asp:RequiredFieldValidator ID="ReqName" runat="server" ErrorMessage="Choose Restaurant" Display="Dynamic" ControlToValidate="ddlNames" Text="*" ForeColor="Red" ValidationGroup="Review">
    </asp:RequiredFieldValidator>
    <asp:DropDownList ID="ddlReview" runat="server" ValidationGroup="Review"></asp:DropDownList>
    <asp:RequiredFieldValidator ID="ReqRating" runat="server" ErrorMessage="Choose Rating" Display="Dynamic" ControlToValidate="ddlReview" Text="*" ForeColor="Red" ValidationGroup="Review">
    </asp:RequiredFieldValidator><br /><br />
    <asp:TextBox ID="tbReview" runat="server" CssClass="auto-style1" Height="124px" Width="195px"></asp:TextBox><br /><br />
    <asp:Button ID="btnReview" runat="server" Text="Review" OnClick="btnReview_Click" ValidationGroup="Review" /><br /><br />
    <asp:Button ID="btnLogout" runat="server" Text="Logout" CausesValidation="false" OnClick="btnLogout_Click" /><br />
    <asp:Label ID="lbStatus" runat="server" Text=""></asp:Label><br />
    <asp:DropDownList ID="ddlTheme" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTheme_SelectedIndexChanged"></asp:DropDownList><br />
    <asp:ValidationSummary ID="ValSum" runat="server" />
</asp:Content>
