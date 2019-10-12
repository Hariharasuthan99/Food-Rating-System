using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_Rating_System
{
    public partial class masterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                ddlTheme.Items.Add("Choose Theme");
                ddlTheme.Items.Add("Normal");
                ddlTheme.Items.Add("Dark");
            }
        }

        protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/");
            PagesSection pages = (PagesSection)config.GetSection("system.web/pages");
            pages.Theme = ddlTheme.SelectedItem.Text.ToString();
            if (!pages.SectionInformation.IsLocked)
            {
                config.Save();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                Response.Write("<script>alert('Could not save configuration')</script>");
            }
        }

    }
}