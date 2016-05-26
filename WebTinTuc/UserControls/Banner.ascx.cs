using System;
using System.Linq;

namespace WebTinTuc.UserControls
{
    public partial class Banner : System.Web.UI.UserControl
    {
        public string Position { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack || Position == null) return;
            using (var db = new DB())
            {
                rep.DataSource = db.Banners.Where(b => b.Position == Position).ToList();
                rep.DataBind();
            }
        }
    }
}