using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_Rating_System
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ddlCriteria.Items.Add("Cuisine");
                ddlCriteria.Items.Add("Location");
                ddlCriteria.Items.Add("Rating");
            }
        }
    }
}