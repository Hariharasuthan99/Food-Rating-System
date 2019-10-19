﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Food_Rating_System.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" Text="Create New Restaurant"></asp:Label><br />
    <br />
    <asp:Table runat="server" HorizontalAlign="Center">
        <asp:TableRow runat="server" HorizontalAlign="Left">
            <asp:TableCell>
                <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
            </asp:TableCell>

        </asp:TableRow>
        <asp:TableRow runat="server"  HorizontalAlign="Left">
            <asp:TableCell>
                <asp:Label ID="Label2" runat="server" Text="Location:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
                <br />
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server"  HorizontalAlign="Left">
            <asp:TableCell>

                <asp:Label ID="Label3" runat="server" Text="Cuisine:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>

                <asp:TextBox ID="txtCuisine" runat="server"></asp:TextBox>
                <br />
            </asp:TableCell>

        </asp:TableRow>
    </asp:Table>
    <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" /><br />
    <br />
    <asp:Label runat="server" Text="Display"></asp:Label><br />
    <br />
    <asp:DropDownList ID="ddlCriteria" runat="server"></asp:DropDownList>
    <asp:TextBox ID="tbCriteria" runat="server"></asp:TextBox>
    <asp:Button ID="btnDisplay" runat="server" Text="Display" OnClick="btnDisplay_Click" /><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:FoodDeliveryDatabaseConnectionString %>' 
        SelectCommand="SELECT [Email],[Comment],[RestaurantName] FROM [Comments] WHERE ([Approved] = @Approved)" 
         >
        <SelectParameters>
            <asp:Parameter DefaultValue="False" Name="Approved" Type="Boolean"></asp:Parameter>
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="Label5" PropertyName="Text" Type="String" Name="Email" />
            <asp:ControlParameter ControlID="Label6" Type="String" Name="RestaurantName" />
        </DeleteParameters>
    </asp:SqlDataSource><br /><br />
    <asp:GridView DataKeyNames="Email"  ID="GridView1" runat="server" DataSourceID="SqlDataSource1" ClientIDMode="Static" 
        AutoGenerateColumns="false" HorizontalAlign="Center">
        <Columns>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    <br /> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comment">
                <ItemTemplate>
                        <%# Eval("Comment") %>
                    <br />
                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Restaurant">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("RestaurantName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" EditText="Approve" UpdateText="Approve"  />
            <asp:CommandField ShowDeleteButton="true" EditText="Reject" DeleteText="Reject"  />

        </Columns>
    </asp:GridView>
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    <br />
</asp:Content>
