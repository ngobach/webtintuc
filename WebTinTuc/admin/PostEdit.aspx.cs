using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebTinTuc.admin
{
    public partial class PostEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropdowns();

                WebTinTuc.Post post = new WebTinTuc.Post();
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    using (var db = new DB())
                    {
                        post = db.Posts.First(p => p.ID == id);
                        txtTitle.Text = post.Title;
                        txtDesc.Text = post.Description;
                        txtContent.Text = post.Content;
                        chkPublished.Checked = post.Published;
                        imgThumbnail.ImageUrl = post.ThumbnailUrl;
                    }
                    btnAdd.Visible = false;
                }
                else
                {
                    imgThumbnail.ImageUrl = WebTinTuc.Post.DefaultThumbnail;
                    btnUpdate.Visible = false;
                }
                ViewState["post"] = post;
            }
        }

        private void LoadDropdowns()
        {
            using (var db = new DB())
            {
                dropDanhMuc.DataSource = db.Categories.ToList();
                dropDanhMuc.DataValueField = "ID";
                dropDanhMuc.DataTextField = "Title";
                dropDanhMuc.DataBind();
            }
        }

        /// <summary>
        /// Read form data into post object
        /// </summary>
        /// <param name="post">target to write to</param>
        private void Append(WebTinTuc.Post post)
        {
            post.Owner = (int) Session["UserID"];
            post.Category_ID = Convert.ToInt32(dropDanhMuc.SelectedValue);
            post.Title = txtTitle.Text;
            post.Description = txtDesc.Text;
            post.Content = txtContent.Text;
            post.Published = chkPublished.Checked;
            post.Updated = DateTime.Now;
            if (fileThumbnail.HasFile)
            {
                var md5 = MD5.Create();
                var sb = new StringBuilder();
                foreach (var b in md5.ComputeHash(Guid.NewGuid().ToByteArray()))
                {
                    sb.Append(b.ToString("x2"));
                }
                var fname = string.Format("{0}_{1}", sb.ToString(), fileThumbnail.FileName);
                fileThumbnail.SaveAs(MapPath("~/uploads/" + fname));
                // Try remove old file
                if (post.HasThumbnail && File.Exists(MapPath("~/uploads/"+post.Thumbnail)))
                    File.Delete(MapPath("~/uploads/" + post.Thumbnail));
                post.Thumbnail = fname;
                imgThumbnail.ImageUrl = post.ThumbnailUrl;
            }
        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            var post = (WebTinTuc.Post) ViewState["post"];
            Append(post);
            using (var db = new DB())
            {
                db.Posts.Add(post);
                db.SaveChanges();
            }
            Response.Redirect("~/admin/PostEdit.aspx?id=" + post.ID);
        }

        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            var post = (WebTinTuc.Post) ViewState["post"];
            Append(post);
            using (var db = new DB())
            {
                db.Posts.Attach(post);
                db.Entry(post).State = EntityState.Modified;
                db.SaveChanges();
            }
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Post.aspx");
        }
    }
}