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
                ddlCuisine.Visible = false;
                ddlRating.Visible = false;
                ddlLocation.Visible = false;

                locLabel.Visible = false;
                ratingLabel.Visible = false;
                cuisineLabel.Visible = false;

                ddlCriteria.Items.Add("Cuisine");
                ddlCriteria.Items.Add("Location");
                ddlCriteria.Items.Add("Rating");

                ddlTheme.Items.Add("Choose Theme");
                ddlTheme.Items.Add("Normal");
                ddlTheme.Items.Add("Dark");

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
            bool ratSelected = false;
            string cmdStr1 = "";
            string cmdStr2 = "Restaurants.Name";
            foreach (ListItem item in cbl.Items)
            {
                if (item.Selected)
                {
                    if (item.Text.Equals("Location"))
                    {
                        cmdStr2 += ",Restaurants.Location";
                        cmdStr1 += "Restaurants.Location='" + ddlLocation.SelectedValue + "'";
                    }
                    if (item.Text.Equals("Cuisine"))
                    {
                        cmdStr2 += ",Restaurants.Cuisine";
                        cmdStr1 += "and Restaurants.Cuisine='" + ddlCuisine.SelectedValue + "'";
                    }
                    if (item.Text.Equals("Rating"))
                    {
                        ratSelected = true;
                    }
                }
            }
            if (cmdStr1.StartsWith(" and"))
                cmdStr1 = cmdStr1.Substring(5, cmdStr1.Length - 5);

            string cmdStr = "WITH RTING AS (SELECT AVG(RATING) AS AVGR,RestaurantName FROM Comments WHERE Approved=1 GROUP BY RestaurantName) SELECT Name,Cuisine,Location,AVGR as Rating FROM Restaurants LEFT OUTER JOIN RTING ON RTING.RestaurantName=Restaurants.Name WHERE " + cmdStr1;
            if (ratSelected)
                cmdStr = cmdStr + " and RTING.AVGR>=" + ddlRating.SelectedValue;
            Label4.Text = cmdStr;
            executeDb(GridView3, cmdStr);

        }

        protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Theme"] = ddlTheme.SelectedItem.Text.ToString();
            Response.Redirect(Request.RawUrl);
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["Theme"] != null)
            {
                this.Theme = Session["Theme"].ToString();
            }
            else if (Request.QueryString["theme"] != null && Request.QueryString["theme"].ToString() != "Choose Theme")
            {
                this.Theme = Request.QueryString["theme"].ToString();
            }
        }
        protected void cbl_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in cbl.Items)
            {
                if (item.Selected)
                {
                    if (item.Text.Equals("Location"))
                    {
                        ddlLocation.Visible = true;
                        locLabel.Visible = true;

                    }
                    if (item.Text.Equals("Cuisine"))
                    {
                        ddlCuisine.Visible = true;
                        cuisineLabel.Visible = true;
                    }
                    if (item.Text.Equals("Rating"))
                    {
                        ddlRating.Visible = true;
                        ratingLabel.Visible = true;
                    }
                }
            }
            foreach (ListItem item in cbl.Items)
            {
                if (!item.Selected)
                {
                    if (item.Text.Equals("Location"))
                    {
                        ddlLocation.Visible = false;
                        locLabel.Visible = false;

                    }
                    if (item.Text.Equals("Cuisine"))
                    {
                        ddlCuisine.Visible = false;
                        cuisineLabel.Visible = false;

                    }
                    if (item.Text.Equals("Rating"))
                    {
                        ddlRating.Visible = false;
                        ratingLabel.Visible = false;

                    }
                }
            }
        }

    }
}