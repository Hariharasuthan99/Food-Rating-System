﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Food_Rating_System.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" Text="Create New Restaurant" ForeColor="White"></asp:Label><br />

    <br />
    <asp:Button ID="btnCreate" runat="server" Text="Create" /><br /><br />
       <asp:Label runat="server" Text="Display" ForeColor="White"></asp:Label><br />
<br />
    <asp:DropDownList ID="ddlCriteria" runat="server"></asp:DropDownList>
    <asp:TextBox ID="tbCriteria" runat="server"></asp:TextBox>
    <asp:Button ID="btnDispaly" runat="server" Text="Display" /><br /><br />
</asp:Content>
