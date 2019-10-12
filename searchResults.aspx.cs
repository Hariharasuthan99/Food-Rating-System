using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_Rating_System
{
    public partial class searchResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            grid.DataSourceID = "results" + Request.QueryString["category"].ToString();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reviewer.aspx");
        }
    }
}