using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc
{
    public partial class CategoryPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }
            var id = Convert.ToInt32(Request.QueryString["id"]);
            using (var db = new DB())
            {
                var cate = db.Categories.First(c => c.ID == id);
                Title = cate.Title;
                repPost.DataSource = cate.Posts.OrderByDescending(p=>p.Updated).ToList();
                repPost.DataBind();
            }
        }
    }
}