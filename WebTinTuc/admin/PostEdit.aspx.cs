using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.admin
{
    public partial class PostEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropdowns();
                imgThumbnail.ImageUrl = WebTinTuc.Post.DefaultThumbnail;
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

        private WebTinTuc.Post FormData
        {
            get
            {
                return new WebTinTuc.Post
                {
                    Owner = (int)Session["UserID"],
                    Category_ID = Convert.ToInt32(dropDanhMuc.SelectedValue),
                    Title =  txtTitle.Text,
                    Description = txtDesc.Text,
                    Content = txtContent.Text,
                    Published = chkPublished.Checked,
                    Updated = DateTime.Now
                };
            }
        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            using (var db = new DB())
            {
                db.Posts.Add(FormData);
                db.SaveChanges();
            }
            Response.Redirect("~/admin/Post.aspx");
        }
    }
}