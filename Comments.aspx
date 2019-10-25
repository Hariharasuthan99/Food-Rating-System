<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="Food_Rating_System.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Comments</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:FoodDeliveryDatabaseConnectionString %>'
        SelectCommand="SELECT [Comment], [Rating] FROM [Comments] WHERE ([RestaurantName] = @RestaurantName) AND [Approved] = 1">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="name" Name="RestaurantName" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <center>
        <asp:GridView ID="grid" runat="server" DataSourceID="SqlDataSource1" EmptyDataText="No Comments Found" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="true" SortedAscendingCellStyle-ForeColor="Black">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView><br />
    </center>
    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" /><br />
</asp:Content>
