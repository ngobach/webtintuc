using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.admin
{
    public partial class Event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs ex)
        {
            if (!IsPostBack)
            {
                LoadAll();
                if (Request.QueryString["id"] != null)
                {
                    // Update mode
                    var id = Convert.ToInt32(Request.QueryString["id"]);
                    ViewState["id"] = id;
                    using (var db = new DB())
                    {
                        var ev = db.Events.First(e => e.ID == id);
                        txtTitle.Text = ev.Title;
                        txtContent.Text = ev.Content;
                        txtStart.Text = ev.Start.ToString("dd/MM/yyyy HH:mm:ss");
                        txtEnd.Text = ev.End.ToString("dd/MM/yyyy HH:mm:ss");
                        txtPlace.Text = ev.Place;
                    }
                    btnAdd.Visible = false;
                }
                else
                {
                    btnUpdate.Visible = btnCancel.Visible = false;
                }
            }
        }

        private void LoadAll()
        {
            using (var db = new DB())
            {
                gridView.DataSource = db.Events.OrderByDescending(e=>e.ID).ToList();
                gridView.DataBind();
            }
        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            var ev = new WebTinTuc.Event {Start = DateTime.Parse(txtStart.Text), End = DateTime.Parse(txtEnd.Text), Place = txtPlace.Text, Title = txtTitle.Text, Content = txtContent.Text};
            using (var db = new DB())
            {
                db.Events.Add(ev);
                db.SaveChanges();
            }
            Response.Redirect(Request.Url.AbsolutePath + "?id=" + ev.ID);
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsolutePath);
        }

        protected void gridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Sua")
            {
                Response.Redirect(Request.Url.AbsolutePath + "?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "Xoa")
            {
                using (var db = new DB())
                {
                    var id = Convert.ToInt32(e.CommandArgument.ToString());
                    db.Events.Remove(db.Events.First(ev=>ev.ID == id));
                    db.SaveChanges();
                }
                Response.Redirect(Request.Url.AbsolutePath);
            }
        }

        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            var id = (int)ViewState["id"];
            var ev = new WebTinTuc.Event {ID = id, Start = DateTime.Parse(txtStart.Text), End = DateTime.Parse(txtEnd.Text), Place = txtPlace.Text, Title = txtTitle.Text, Content = txtContent.Text};
            using (var db = new DB())
            {
                db.Events.Attach(ev);
                db.Entry(ev).State = EntityState.Modified;
                db.SaveChanges();
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}