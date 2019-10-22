using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_Rating_System
{
    public partial class Reviewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> category = new List<string>();
                category.Add("Name");
                category.Add("Location");
                category.Add("Rating");
                category.Add("Cuisine");
                ddlSearch.DataSource = category;
                List<int> rating = new List<int>();
                rating.Add(1);
                rating.Add(2);
                rating.Add(3);
                rating.Add(4);
                rating.Add(5);
                ddlReview.DataSource = rating;
                this.DataBind();
                this.Master.FindControl("ddlTheme").Visible = false;
                //Changing theme creates a new session
            }
            HttpCookie cookie = Request.Cookies["prevSearch"];
            if (cookie != null)
                lbPrev.Text =cookie["category"].ToString() + " and "  +cookie["value"].ToString();
        }

        protected void btnReview_Click(object sender, EventArgs e)
        {
            int row = 0;
            if (Page.IsValid)
            {
                string conStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string cmdStr = "INSERT INTO Comments values(@Email,@RestName,@Comment,@Rating,@Approved)";
                using (SqlConnection cnn = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand(cmdStr, cnn))
                    {
                        cmd.Parameters.AddWithValue("@Email", Session["Email"].ToString());
                        cmd.Parameters.AddWithValue("@RestName", ddlNames.SelectedValue);
                        cmd.Parameters.AddWithValue("@Comment", tbReview.Text);
                        cmd.Parameters.AddWithValue("@Rating", ddlReview.SelectedValue);
                        cmd.Parameters.AddWithValue("@Approved", 0);

                        try
                        {
                            cnn.Open();
                            row = cmd.ExecuteNonQuery();
                        }
                        catch (Exception)
                        {
                            lbStatus.Text = "One Review Per Restaurant";
                            //other inputs can't cause an error
                        }
                        finally
                        {
                            cnn.Close();
                        }
                    }
                }
                tbReview.Text = "";
                if (row == 1)
                    lbStatus.Text = "Success";

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                HttpCookie prevSearch;
                prevSearch = Request.Cookies["prevSearch"];
                if(prevSearch == null)
                {
                    prevSearch = new HttpCookie("prevSearch");
                }
                prevSearch["category"] = ddlSearch.SelectedValue;
                prevSearch["value"] = tbSearch.Text;
                prevSearch.Expires.AddMonths(1);
                Response.Cookies.Add(prevSearch);
                Response.Redirect("searchResults.aspx?category=" + ddlSearch.SelectedValue + "&value=" + tbSearch.Text.ToString());
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}