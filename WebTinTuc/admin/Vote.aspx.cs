using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.admin
{
    public partial class Vote : System.Web.UI.Page
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
                        var vote = db.Votes.First(v => v.ID == id);
                        txtTitle.Text = vote.Title;
                        txtDesc.Text = vote.Description;
                    }
                    btnAdd.Visible = false;
                }
                else
                {
                    btnUpdate.Visible = btnCancel.Visible = btnEditItems.Visible = false;
                }
            }
        }

        private void LoadAll()
        {
            using (var db = new DB())
            {
                gridView.DataSource = db.Votes.ToList();
                gridView.DataBind();
            }
        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            var vote = new WebTinTuc.Vote {Title = txtTitle.Text, Description = txtDesc.Text};
            using (var db = new DB())
            {
                db.Votes.Add(vote);
                db.SaveChanges();
            }
            Response.Redirect(Request.Url.AbsolutePath + "?id=" + vote.ID);
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
                    db.Votes.Remove(db.Votes.First(v=>v.ID == id));
                    db.SaveChanges();
                }
                Response.Redirect(Request.Url.AbsolutePath);
            }
        }

        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            var id = (int)ViewState["id"];
            var vote = new WebTinTuc.Vote {ID = id, Title = txtTitle.Text, Description = txtDesc.Text};
            using (var db = new DB())
            {
                db.Votes.Attach(vote);
                db.Entry(vote).State = EntityState.Modified;
                db.SaveChanges();
            }
            Response.Redirect(Request.RawUrl);
        }

        protected void btnEditItems_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("VoteItem.aspx?id=" + ViewState["id"].ToString());
        }
    }
}