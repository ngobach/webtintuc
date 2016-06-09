using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.UserControls
{
    public partial class UpcomingEvents : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            using (var db = new DB())
            {
                rep.DataSource = db.Events.Where(ev => ev.End >= DateTime.Now).OrderBy(ev=>ev.Start).Take(5).ToList();
                rep.DataBind();
            }
        }
    }
}