<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Food_Rating_System.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Username
    <asp:TextBox ID="tbUsername" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ReqUser" runat="server" ErrorMessage="Enter Username" Display="Dynamic" ControlToValidate="tbUsername" Text="*" ForeColor="Red">
    </asp:RequiredFieldValidator>
    <br />
    Password
    <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" CssClass="auto-style1"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ReqPass" runat="server" ErrorMessage="Enter Password" Display="Dynamic" ControlToValidate="tbPassword" Text="*" ForeColor="Red">
    </asp:RequiredFieldValidator><br />
    <asp:RegularExpressionValidator ID="RegexPass" runat="server" ErrorMessage="Min 8 characters">
    </asp:RegularExpressionValidator>
    <asp:Button ID="btnLogin" runat="server" Text="Login" Width="80px" />
    <asp:Button ID="btnRegister" runat="server" Text="Register" Width="80px" />
    <asp:ValidationSummary ID="ValSum" runat="server" />
</asp:Content>
