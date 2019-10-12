<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="searchResults.aspx.cs" Inherits="Food_Rating_System.searchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="resultsName" runat="server" ConnectionString='<%$ ConnectionStrings:FoodDeliveryDatabaseConnectionString %>' 
        SelectCommand="WITH RTING AS (SELECT AVG(RATING) AS AVGR, COUNT(RATING) AS Visits,RestaurantName FROM Comments GROUP BY RestaurantName) SELECT Name,Location,Cuisine,AVGR as Rating,Visits FROM Restaurants,RTING WHERE RTING.RestaurantName=Restaurants.Name AND Restaurants.Name = @value">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="value" Name="value" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="resultsLocation" runat="server" ConnectionString='<%$ ConnectionStrings:FoodDeliveryDatabaseConnectionString %>' 
        SelectCommand="WITH RTING AS (SELECT AVG(RATING) AS AVGR, COUNT(RATING) AS Visits,RestaurantName FROM Comments GROUP BY RestaurantName) SELECT Name,Location,Cuisine,AVGR as Rating,Visits FROM Restaurants,RTING WHERE RTING.RestaurantName=Restaurants.Name AND Restaurants.Location = @value">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="value" Name="value" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="resultsCuisine" runat="server" ConnectionString='<%$ ConnectionStrings:FoodDeliveryDatabaseConnectionString %>' 
        SelectCommand="WITH RTING AS (SELECT AVG(RATING) AS AVGR, COUNT(RATING) AS Visits,RestaurantName FROM Comments GROUP BY RestaurantName) SELECT Name,Location,Cuisine,AVGR as Rating,Visits FROM Restaurants,RTING WHERE RTING.RestaurantName=Restaurants.Name AND Restaurants.Cuisine = @value">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="value" Name="value" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="resultsRating" runat="server" ConnectionString='<%$ ConnectionStrings:FoodDeliveryDatabaseConnectionString %>' 
        SelectCommand="WITH RTING AS (SELECT AVG(RATING) AS AVGR, COUNT(RATING) AS Visits,RestaurantName FROM Comments GROUP BY RestaurantName) SELECT Name,Location,Cuisine,AVGR as Rating ,Visits FROM Restaurants,RTING WHERE RTING.RestaurantName=Restaurants.Name AND AVGR >=@value">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="value" Name="value" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <center>
    <asp:GridView ID="grid" runat="server" EmptyDataText="No Restaurants Found" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
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
    //resultsRating approved condition
</asp:Content>
