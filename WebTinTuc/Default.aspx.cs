using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            using (var db = new DB())
            {
                rpPost.DataSource = db.Posts.Where(p => p.Published).OrderByDescending(p=>p.Updated).Include(p=>p.User).Include(p=>p.Category).Take(5).ToList();
                rpPost.DataBind();
            }
        }
    }
}