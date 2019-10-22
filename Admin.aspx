<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Food_Rating_System.Admin" %>

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
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label><br /><br />
    <asp:Label runat="server" Text="Display"></asp:Label><br />
    <br />
    <asp:DropDownList ID="ddlCriteria" runat="server"></asp:DropDownList>
    <asp:TextBox ID="tbCriteria" runat="server"></asp:TextBox>
    <asp:Button ID="btnDisplay" runat="server" Text="Display" OnClick="btnDisplay_Click" /><br />
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FoodDeliveryDatabaseConnectionString %>' 
        DeleteCommand="DELETE FROM [Comments] WHERE [Email] = @Email AND [RestaurantName] = @RestaurantName" 
        InsertCommand="INSERT INTO [Comments] ([Email], [RestaurantName], [Comment], [Rating], [Approved]) VALUES (@Email, @RestaurantName, @Comment, @Rating, @Approved)" 
        SelectCommand="SELECT * FROM [Comments]"
        UpdateCommand="UPDATE [Comments] SET [Approved] = @Approved WHERE [Email] = @Email AND [RestaurantName] = @RestaurantName">

        <DeleteParameters>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="RestaurantName" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="RestaurantName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Comment" Type="String"></asp:Parameter>
            <asp:Parameter Name="Rating" Type="Double"></asp:Parameter>
            <asp:Parameter Name="Approved" Type="Boolean"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Approved" Type="Boolean" DefaultValue="false"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView DataKeyNames="Email,RestaurantName"  ID="GridView1" runat="server" DataSourceID="SqlDataSource1" ClientIDMode="Static" 
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
            <asp:TemplateField HeaderText="Approved">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Approved") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tbApproved" runat="server" Text='<%# Bind("Approved") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" EditText="Approve" UpdateText="Approve"  />
            <asp:CommandField ShowDeleteButton="true" EditText="Reject" DeleteText="Reject"  />
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
</asp:Content>
