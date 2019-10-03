<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Reviewer.aspx.cs" Inherits="Food_Rating_System.Reviewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="ddlSearch" runat="server"></asp:DropDownList>
    <asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" />
    <br /><br />
    Rating
    <br />
    <asp:TextBox ID="tbReview" runat="server"></asp:TextBox>
    <asp:DropDownList ID="ddlReview" runat="server"></asp:DropDownList>
    <asp:Button ID="btnReview" runat="server" Text="Review" />
</asp:Content>
