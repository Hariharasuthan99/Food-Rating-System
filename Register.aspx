<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Food_Rating_System.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" HorizontalAlign="Center"> 
        <asp:TableRow>
            <asp:TableCell ColumnSpan="1" HorizontalAlign="Left">
                <asp:Label runat="server" Text="Name" />
            </asp:TableCell> 
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="name" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="ReqName" runat="server" ErrorMessage="Enter Name" Display="Dynamic" ControlToValidate="name" Text="*" ForeColor="Red">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegexName" runat="server" ErrorMessage="Only alphabets are allowed in name" Display="None" ControlToValidate="name" ValidationExpression="[a-zA-Z]+">
                </asp:RegularExpressionValidator><br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="1" HorizontalAlign="Left">
                <asp:Label runat="server" Text="Email" />
            </asp:TableCell> 
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="ReqEmail" runat="server" ErrorMessage="Enter Email" Display="Dynamic" ControlToValidate="email" Text="*" ForeColor="Red">
                </asp:RequiredFieldValidator><br />
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell ColumnSpan="1" HorizontalAlign="Left">
                <asp:Label runat="server" Text="Password" />
            </asp:TableCell> 
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="pw" runat="server" TextMode="Password"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="ReqPass" runat="server" ErrorMessage="Enter Password" Display="Dynamic" ControlToValidate="pw" Text="*" ForeColor="Red">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegexPass" runat="server" ErrorMessage="Minimum 8 characters for password" Display="None" ControlToValidate="pw" ValidationExpression="\w{8,16}">
                </asp:RegularExpressionValidator><br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="1" HorizontalAlign="Left">
                <asp:Label runat="server" Text="Confirm Password" />
            </asp:TableCell> 
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="cpw" runat="server" TextMode="Password"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                 <asp:RequiredFieldValidator ID="ReqCPass" runat="server" ErrorMessage="Enter Password Again" Display="Dynamic" ControlToValidate="cpw" Text="*" ForeColor="Red">
                 </asp:RequiredFieldValidator>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RegularExpressionValidator ID="RegexCPass" runat="server" ErrorMessage="Minimum 8 characters for password" Display="None" ControlToValidate="cpw" ValidationExpression="\w{8,16}">
                </asp:RegularExpressionValidator>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CompareValidator ID="CompPass" runat="server" ErrorMessage="Passwords don't match" ControlToValidate="cpw" ControlToCompare="pw" Display="None">
                </asp:CompareValidator><br />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" /><br />
    <asp:Button ID="btnBack" runat="server" Text="Go To Login" OnClick="btnBack_Click" CausesValidation="false" /><br />
    <asp:Label ID="lbStatus" runat="server" Text=""></asp:Label><br />
    <asp:ValidationSummary ID="ValSum" runat="server" />
</asp:Content>
