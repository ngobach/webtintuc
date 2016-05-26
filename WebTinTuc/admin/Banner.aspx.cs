using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.admin
{
    public partial class Banner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                var dict = new Dictionary<string, string>
                {
                    {"phai", "Bên phải"},
                    {"giua", "Ở giữa"}
                };
                dropPos.DataSource = dict;
                dropPos.DataTextField = "Value";
                dropPos.DataValueField = "Key";
                dropPos.DataBind();

                LoadAll();
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    ViewState["id"] = id;
                    using (var db = new DB())
                    {
                        var banner = db.Banners.First(b => b.ID == id);
                        ViewState["banner"] = banner;
                        txtTitle.Text = banner.Title;
                        txtStart.Text = banner.Start.ToString("dd/MM/yyyy HH:mm:ss");
                        txtEnd.Text = banner.End.ToString("dd/MM/yyyy HH:mm:ss");
                        txtLink.Text = banner.Link;
                        img.ImageUrl = banner.ImageUrl;
                        dropPos.SelectedValue = banner.Position;
                    }
                    btnAdd.Visible = false;
                }
                else
                {
                    btnUpdate.Visible = false;
                }
            }
        }

        private string HandleFileUpload(FileUpload fileUpload, string saveTo)
        {
            if (!fileUpload.HasFile)
                return null;
            var md5 = MD5.Create();
            md5.ComputeHash(new Guid().ToByteArray());
            string fileName = md5.Hash.Aggregate("", (current, b) => current + b.ToString("x2"));
            fileName += "_" + fileUpload.FileName;
            fileUpload.SaveAs(Server.MapPath(saveTo + fileName));
            return fileName;
        }

        private void LoadAll()
        {
            using (var db = new DB())
            {
                gridView.DataSource = db.Banners.ToList();
                gridView.DataBind();
            }
        }


        protected void gridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            using (var db = new DB())
                if (e.CommandName == "Xoa")
                {
                    var id = Convert.ToInt32(e.CommandArgument.ToString());
                    var banner = db.Banners.First(b => b.ID == id);
                    if (banner.Image != "")
                    {
                        File.Delete(Server.MapPath("~/uploads/banners/" + banner.Image));
                    }
                    db.Banners.Remove(banner);
                    db.SaveChanges();
                    LoadAll();
                }
                else if (e.CommandName == "Sua")
                {
                    Response.Redirect(Request.Url.AbsolutePath + "?id=" + e.CommandArgument.ToString());
                }
        }


        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            var image = HandleFileUpload(fileImg,"~/uploads/banners/") ?? "";
            using (var db = new DB())
            {
                var banner = new WebTinTuc.Banner
                {
                    Title = txtTitle.Text,
                    Start = DateTime.Parse(txtStart.Text),
                    End = DateTime.Parse(txtEnd.Text),
                    Link = txtLink.Text,
                    Image = image,
                    Position = dropPos.SelectedValue
                };
                db.Banners.Add(banner);
                db.SaveChanges();
                Response.Redirect(Request.Url.AbsolutePath + "?id=" + banner.ID);
            }
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            var image = HandleFileUpload(fileImg, "~/uploads/banners/");
            using (var db = new DB())
            {
                var banner = (WebTinTuc.Banner) ViewState["banner"];
                banner.Title = txtTitle.Text;
                banner.Link = txtLink.Text;
                banner.Start = DateTime.Parse(txtStart.Text);
                banner.End = DateTime.Parse(txtEnd.Text);
                banner.Position = dropPos.SelectedValue;
                if (image != null)
                {
                    if (banner.Image != "")
                    {
                        File.Delete(Server.MapPath("~/uploads/banners/" + banner.Image));
                    }
                    banner.Image = image;
                }

                db.Entry(banner).State = EntityState.Modified;
                db.SaveChanges();
                Response.Redirect(Request.Url.AbsolutePath + "?id=" + banner.ID);
            }
        }
    }
}