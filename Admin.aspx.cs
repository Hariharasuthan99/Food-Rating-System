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
                            lblStatus.Text = "Failure";
                        }
                        finally
                        {
                            lblStatus.Text = "Success";
                            txtCuisine.Text = "";
                            txtName.Text = "";
                            txtLocation.Text = "";
                            conn.Close();
                        }
                    }
                }

            }
        }

        protected void btnDisplay_Click(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {            
                Session.Abandon();
                Response.Redirect("Login.aspx");
        }
    }
}