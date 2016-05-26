using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebTinTuc.admin
{
    public partial class Post : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAll();
            }
        }

        private void LoadAll()
        {
            using (var db = new DB())
            {
                var posts = from post in db.Posts
                            orderby post.Updated descending
                            select new
                            {
                                post.ID,
                                post.Title,
                                post.Description,
                                post.Published,
                                post.Updated,
                                Cate = post.Category.Title,
                                Owner = post.User.Username
                            };

                gridView.DataSource = posts.ToList();
                gridView.DataBind();
            }
        }

        protected void gridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            var id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Xoa")
            {
                using (var db = new DB())
                {
                    var post = db.Posts.First(p => p.ID == id);
                    if (post.HasThumbnail)
                    {
                        File.Delete(Server.MapPath("~/uploads/" + post.Thumbnail));
                    }
                    db.Posts.Remove(post);
                    db.SaveChanges();
                }
                LoadAll();
            }
            else if (e.CommandName == "Sua")
            {
                Response.Redirect("PostEdit.aspx?id="+id);
            }
        }

        protected void btnNewPost_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("PostEdit.aspx");
        }
    }
}