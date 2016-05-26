using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc
{
    public partial class PostPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request.QueryString["id"] == null)
                Response.Redirect("Default.aspx");
            else
            {
                using (var db = new DB())
                {
                    var id = Convert.ToInt32(Request.QueryString["id"]);
                    var post = db.Posts.First(p=>p.ID == id);
                    this.Title = post.Title;
                    if (!post.HasThumbnail)
                    {
                        panelThumbnail.Visible = false;
                    }
                    else
                    {
                        imgThumbnail.ImageUrl = post.ThumbnailUrl;
                    }
                    ltTitle.Text = post.Title;
                    content.Text = post.Content;
                    hlCategory.NavigateUrl = post.Category.Permalink;
                    hlCategory.Text = post.Category.Title;
                    ltAuthor.Text = post.User.Username;
                    ltTime.Text = post.Updated.ToString("HH:mm:ss dd/MM/yyyy");
                }
            }
        }
    }
}