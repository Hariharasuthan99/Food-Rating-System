using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

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

                /*ddlCuisine.Items.Add("Select");
                ddlCuisine.Items.Add("Mexican");
                ddlCuisine.Items.Add("Indian");
                ddlCuisine.Items.Add("Continental");
                ddlCuisine.Items.Add("Japanese");
                ddlCuisine.Items.Add("Thai");

                ddlLocation.Items.Add("Select");
                ddlLocation.Items.Add("Bengaluru");
                ddlLocation.Items.Add("Chennai");
                ddlLocation.Items.Add("Kolkata");
                ddlLocation.Items.Add("Mumbai");*/

                cbl.Items.Add("Location");
                cbl.Items.Add("Cuisine");
                cbl.Items.Add("Rating");

                ddlRating.Items.Add("Select");
                for (int i = 1; i < 6; i++)
                    ddlRating.Items.Add(i.ToString());
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
        public void executeDb(GridView gridView,string cmdStr)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(cmdStr, conn);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            try
            {
                conn.Open();
                sqlDataAdapter.Fill(ds);
                //Label4.Text+= ds.Rows.Count.ToString();
            }
            catch (Exception ex)
            {
                Label4.Text += ex.Message;
            }
            finally
            {
                conn.Close();
            }
            gridView.Visible = true;
            gridView.DataSource = ds;
            gridView.DataBind();
        }
        protected void btnDisplay_Click(object sender, EventArgs e)
        {
            GridView2.DataSource = "";
            string checkCmd = ddlCriteria.SelectedValue;
            //Label4.Text = checkCmd;

            string cmdStr="";
            if (!checkCmd.Equals("Rating"))
                cmdStr = "SELECT * FROM Restaurants WHERE " + checkCmd + " = '" + tbCriteria.Text + "'";
            else
                cmdStr = "WITH RTING AS(SELECT AVG(RATING) AS AVGR, RestaurantName FROM Comments WHERE Approved = 1 GROUP BY RestaurantName) SELECT Name, Location, Cuisine, AVGR as Rating FROM Restaurants,RTING WHERE RTING.RestaurantName = Restaurants.Name AND AVGR >=" + tbCriteria.Text;
            // Label4.Text += cmdStr;

            executeDb(GridView2, cmdStr);
           
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {            
                Session.Abandon();
                Response.Redirect("Login.aspx");
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            //cbl.Items.FindByText("Location").
            /*string cmdStr1 = "";
            string cmdStr2 = "Name";
            if(!ddlCuisine.SelectedValue.Equals("Select"))
            {
                cmdStr2 += ",Cuisine";
                cmdStr1 += "Restaurants.Cuisine='" + ddlCuisine.SelectedValue+"'";
            }
            if (!ddlLocation.SelectedValue.Equals("Select"))
            {
                cmdStr2 += ",Location";
                cmdStr1 += " and Restaurants.Location='" + ddlLocation.SelectedValue+"'";
            }
            if (!ddlRating.SelectedValue.Equals("Select"))
            {
                cmdStr2 += ",AVGR as Rating";
                cmdStr1 += " and AVGR>="+ddlRating.SelectedValue;
            }
            if (cmdStr2.Substring(0, 1).Equals(","))
                cmdStr2 = cmdStr2.Substring(1, cmdStr2.Length-1);
            
            //if (cmdStr1.StartsWith(" and"))
            //    cmdStr1 = cmdStr1.Substring(5, cmdStr1.Length-5);
            string cmdStr = "select " + cmdStr2 + " from Comments,Restaurants where Approved=1 group by Comments.RestaurantName," + cmdStr2 + " having Comments.RestaurantName=Restaurants.Name " + cmdStr1;
            */
            string cmdStr = "WITH RTING AS (SELECT AVG(RATING) AS AVGR,RestaurantName FROM Comments WHERE Approved=1 GROUP BY RestaurantName) SELECT Name,Location,Cuisine,AVGR as Rating FROM Restaurants LEFT OUTER JOIN RTING ON RTING.RestaurantName=Restaurants.Name WHERE Restaurants.Location = @value";
            executeDb(GridView3, cmdStr);
          
        }
    }
}