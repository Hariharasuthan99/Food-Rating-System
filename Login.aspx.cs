using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Food_Rating_System;
namespace Food_Rating_System
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string conStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string cmd = "Select * from Users where Email=@Email and Password=@Pass";
                using (SqlConnection cnn = new SqlConnection(conStr))
                {
                    cnn.Open();
                    using (SqlCommand cmdd = new SqlCommand(cmd, cnn))
                    {
                        cmdd.Parameters.AddWithValue("@Email", tbEmail.Text);
                        cmdd.Parameters.AddWithValue("@Pass", tbPassword.Text);
                        using(SqlDataReader reader=cmdd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                Session["Email"] = tbEmail.Text;
                                if (reader["Admin"].ToString().Equals("True"))
                                {
                                    Response.Redirect("Admin.aspx");
                                }
                                else
                                {
                                    Response.Redirect("Reviewer.aspx");
                                }
                            }
                            else
                            {
                                lblErrorText.Text = "Account doesn't exist";
                            }
                        }
                    }
                    cnn.Close();
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

    }
}