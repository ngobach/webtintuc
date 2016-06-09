using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.admin
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                LoadAll();
                if (Request.QueryString["id"] != null)
                {
                    // Update mode
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    ViewState["id"] = id;
                    using (var db = new DB())
                    {
                        var cate = db.Categories.First(c => c.ID == id);
                        txtTitle.Text = cate.Title;
                    }
                    btnMain.Text = "Cập nhật";
                    btnBack.Visible = true;
                }
            }
        }

        private void LoadAll()
        {
            using (var db = new DB())
            {
                lblCateCount.Text = db.Categories.Count().ToString();
                gridView.DataSource = db.Categories.ToList();
                gridView.DataBind();
            }
        }
        protected void OnClick(object sender, EventArgs e)
        {
            using (var db = new DB())
            {
                if (ViewState["id"] != null)
                {
                    var cate = new WebTinTuc.Category { ID = (int)ViewState["id"] };
                    db.Categories.Attach(cate);
                    cate.Title = txtTitle.Text;
                    db.SaveChanges();
                }
                else
                {
                    // Create Mode
                    WebTinTuc.Category cat = new WebTinTuc.Category {Title = txtTitle.Text};
                    db.Categories.Add(cat);
                    db.SaveChanges();
                }
                LoadAll();
            }
        }

        protected void gridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            using (var db = new DB())
                if (e.CommandName == "Xoa")
                {
                    var cat = new WebTinTuc.Category {ID = Convert.ToInt32(e.CommandArgument.ToString())};
                    db.Categories.Attach(cat);
                    db.Categories.Remove(cat);
                    db.SaveChanges();
                    LoadAll();
                }
                else if (e.CommandName == "Sua")
                {
                    Response.Redirect(Request.Url.AbsolutePath + "?id=" + e.CommandArgument.ToString());
                }
        }

        protected void OnBackClick(object sender, EventArgs e)
        {
            Response.Redirect("Category.aspx");
        }
    }
}