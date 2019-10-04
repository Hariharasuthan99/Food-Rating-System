<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Food_Rating_System.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Name
    <asp:TextBox ID="name" runat="server"></asp:TextBox><br />
    Email
    <asp:TextBox ID="email" runat="server"></asp:TextBox><br />
    Password
    <asp:TextBox ID="pw" runat="server"></asp:TextBox><br />
    <asp:RequiredFieldValidator ID="ReqPass" runat="server" ErrorMessage="Enter Password" Display="Dynamic" ControlToValidate="pw" Text="*" ForeColor="Red">
    </asp:RequiredFieldValidator>
    Confirm Password
    <asp:TextBox ID="cpw" runat="server"></asp:TextBox>
</asp:Content>
