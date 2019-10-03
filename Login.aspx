﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Food_Rating_System.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 2px;
        }

        .auto-style2 {
            margin-left: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="1" HorizontalAlign="Left">
                <asp:Label runat="server" ID="Email" Text="Email:" ForeColor="White"></asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="tbUsername" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="ReqUser" runat="server" ErrorMessage="Enter Username" Display="Dynamic" ControlToValidate="tbUsername" Text="*" ForeColor="Red">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegexUser" runat="server" ErrorMessage="Minimum 8 characters for username" Display="None" ControlToValidate="tbUsername" ValidationExpression="\w{8,16}">
                </asp:RegularExpressionValidator>

            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left" ColumnSpan="1">
                <asp:Label runat="server" ID="Password" Text="Password:" ForeColor="White" />
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" CssClass="auto-style1"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="ReqPass" runat="server" ErrorMessage="Enter Password" Display="Dynamic" ControlToValidate="tbPassword" Text="*" ForeColor="Red">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegexPass" runat="server" ErrorMessage="Minimum 8 characters for password" Display="None" ControlToValidate="tbPassword" ValidationExpression="\w{8,16}">
                </asp:RegularExpressionValidator><br />
                <br />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Button ID="btnLogin" runat="server" Text="Login" Width="80px" OnClick="btnLogin_Click" /><br />
    <br />
    <asp:Label runat="server" Text="Don't have an account?" ForeColor="White" /><br />
    <asp:Button ID="btnRegister" runat="server" Text="Register" Width="80px" OnClick="btnRegister_Click" />
    <asp:ValidationSummary ID="ValSum" runat="server" ForeColor="White" /><br /><br />

</asp:Content>
