using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.admin
{
    public partial class VoteItem : System.Web.UI.Page
    {
        private bool UpdateMode
        {
            set {
                btnUpdate.Visible = value;
                btnAdd.Visible = !value;
            }  
        }

        protected void Page_Load(object sender, EventArgs ex)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("Vote.aspx");
                    return;
                }
                var id = Convert.ToInt32(Request.QueryString["id"]);
                ViewState["id"] = id;
                using (var db = new DB())
                {
                    var vote = db.Votes.First(v => v.ID == id);
                    lblTitle.Text = vote.Title;
                    lblDesc.Text = vote.Description;
                }
                LoadVoteItems();
                UpdateMode = false;
            }
        }


        private void LoadVoteItems()
        {
            var id = (int) ViewState["id"];
            using (var db = new DB())
            {
                gridView.DataSource = db.VoteItems.Where(v => v.Vote_ID == id).ToList();
                gridView.DataBind();
            }
        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            var vi = new WebTinTuc.VoteItem {Title = txtContent.Text, Vote_ID = (int) ViewState["id"],Total = 0};
            using (var db = new DB())
            {
                db.VoteItems.Add(vi);
                db.SaveChanges();
            }
            txtContent.Text = "";
            LoadVoteItems();
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Vote.aspx");
        }

        protected void gridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            var id = Convert.ToInt32(e.CommandArgument.ToString());
            if (e.CommandName == "Sua")
            {
                using (var db = new DB())
                {
                    var voteItem = db.VoteItems.First(vi => vi.ID == id);
                    txtContent.Text = voteItem.Title;
                    ViewState["current"] = voteItem.ID;
                    UpdateMode = true;
                }
            }
            else if (e.CommandName == "Xoa")
            {
                using (var db = new DB())
                {
                    db.VoteItems.Remove(db.VoteItems.First(vi => vi.ID == id));
                    db.SaveChanges();
                }
                LoadVoteItems();
            }
        }

        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            var id = (int)ViewState["current"];
            using (var db = new DB())
            {
                var voteItem = db.VoteItems.First(vi => vi.ID == id);
                voteItem.Title = txtContent.Text;
                db.SaveChanges();
            }
            UpdateMode = false;
            txtContent.Text = "";
            LoadVoteItems();
        }

        protected void btnEditItems_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("VoteItem.aspx?id=" + ViewState["id"]);
        }
    }
}