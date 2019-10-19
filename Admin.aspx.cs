using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
namespace Food_Rating_System
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCriteria.Items.Add("Cuisine");
                ddlCriteria.Items.Add("Location");
                ddlCriteria.Items.Add("Rating");
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string cmd = "insert into Restaurants values(@Name,@Location,@Cuisine)";
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    using (SqlCommand cmdd = new SqlCommand(cmd, conn))
                    {
                        cmdd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmdd.Parameters.AddWithValue("@Location", txtLocation.Text);
                        cmdd.Parameters.AddWithValue("@Cuisine", txtCuisine.Text);
                        try
                        {
                            cmdd.ExecuteNonQuery();
                        }
                        catch (Exception)
                        {
                        }
                        finally
                        {
                            conn.Close();
                        }
                    }
                }

            }
        }

        protected void btnDisplay_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow emailRow = GridView1.Rows[0];
            GridViewRow restaurantRow = GridView1.Rows[1];
            string cmd = "delete from Comments where email='" + emailRow.Cells[0].Text + "'" + "and RestaurantName='" +
                restaurantRow.Cells[1].Text + "'";
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmdd = new SqlCommand(cmd, connection);
            try
            {
                connection.Open();
                cmdd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Label4.Text = ex.Message;
            }
            finally
            {
                connection.Close();
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}