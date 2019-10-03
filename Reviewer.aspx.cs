using System;
using System.Collections.Generic;
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
                ddlSearch.Items.Add("Cuisine");
                ddlSearch.Items.Add("Location");
                ddlSearch.Items.Add("Rating");
                for (int i = 1; i <= 5; i++)
                {
                    ddlReview.Items.Add(i.ToString());
                }
            }
        }

    }
}