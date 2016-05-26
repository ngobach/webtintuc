using System;
using System.Linq;

namespace WebTinTuc.UserControls
{
    public partial class ListCate : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (var db = new DB())
                {
                    Rep.DataSource = db.Categories.ToList();
                    Rep.DataBind();
                }
            }
        }
    }
}