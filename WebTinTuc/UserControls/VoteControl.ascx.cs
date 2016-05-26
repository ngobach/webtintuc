using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.UserControls
{
    public partial class VoteControl : System.Web.UI.UserControl
    {
        private List<int> Voted
        {
            get
            {
                if (Session["voted"] == null)
                    Session["voted"] = new List<int>();
                return (List<int>) Session["voted"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            using (var db = new DB())
            {
                repMain.DataSource = db.Votes.Include("Items").ToList();
                repMain.DataBind();
            }
        }

        protected void repMain_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var rad = (RadioButtonList)e.Item.FindControl("rad");
            var repResult = (Repeater)e.Item.FindControl("repResult");
            if (!UserVoted(e.Item))
            {
                rad.DataSource = ((Vote) e.Item.DataItem).Items;
                rad.DataTextField = "Title";
                rad.DataValueField = "ID";
                rad.DataBind();
                repResult.Visible = false;
            }
            else
            {
                repResult.DataSource = ((Vote)e.Item.DataItem).Items;
                repResult.DataBind();
                e.Item.FindControl("btnVote").Visible = false;
                rad.Visible = false;
            }
        }

        private bool UserVoted(RepeaterItem item)
        {
            var dataItem = (Vote) item.DataItem;
            var res = Voted.Contains(dataItem.ID);
            if (res)
                Debug.Write("FOUND!");
            return res;
        }

        protected void repMain_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Gui")
            {
                var rad = (RadioButtonList) e.Item.FindControl("rad");
                var id = Convert.ToInt32(rad.SelectedValue);
                using (var db = new DB())
                {
                    var voteItem = db.VoteItems.First(vi => vi.ID == id);
                    voteItem.Total++;
                    db.SaveChanges();
                }
                Voted.Add(Convert.ToInt32(e.CommandArgument.ToString()));
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}