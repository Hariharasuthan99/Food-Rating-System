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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int row =0;
            if (Page.IsValid)
            {
                string conStr = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=FoodBase;Integrated Security=True;Pooling=False";
                string cmdStr = "INSERT INTO Users values(@Name,@Email,@Password,@Admin)";
                using (SqlConnection cnn = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand(cmdStr, cnn))
                    {
                        cmd.Parameters.AddWithValue("@Name", name.Text);
                        cmd.Parameters.AddWithValue("@Email", email.Text);
                        cmd.Parameters.AddWithValue("@Password", pw.Text);
                        cmd.Parameters.AddWithValue("@Admin", 0);

                        try
                        {
                            cnn.Open();
                            row = cmd.ExecuteNonQuery();
                            cnn.Close();
                        }
                        catch(Exception)
                        {
                            lbStatus.Text = "Email already used";
                        }
                    }
                }
                name.Text = "";
                email.Text = "";
                pw.Text = "";
                cpw.Text = "";
                if (row == 1)
                    lbStatus.Text = "Success";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}