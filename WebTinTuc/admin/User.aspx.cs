using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.admin
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAll();
                if (Request.QueryString["id"] != null)
                {
                    // Update mode
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    ViewState["id"] = id;
                    using (var db = new DB())
                    {
                        var user = db.Users.First(u => u.ID == id);
                        txtUsername.Text = user.Username;
                        txtEmail.Text = user.Email;
                        txtPassword.Text = user.Password;
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
                gridView.DataSource = db.Users.ToList();
                gridView.DataBind();
            }
        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            var user = new WebTinTuc.User
            {
                Username = txtUsername.Text,
                Email = txtEmail.Text,
                Password = txtPassword.Text
            };
            using (var db = new DB())
            {
                db.Users.Add(user);
                db.SaveChanges();
            }
            Response.Redirect(Request.RawUrl);
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx");
        }

        protected void gridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Sua")
            {
                Response.Redirect("User.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "Xoa")
            {
                using (var db = new DB())
                {
                    int id = Convert.ToInt32(e.CommandArgument.ToString());
                    var user = db.Users.First(u => u.ID == id);
                    db.Users.Remove(user);
                    db.SaveChanges();
                }
            }
            LoadAll();
        }

        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            int id = (int) ViewState["id"];
            var user = new WebTinTuc.User {ID = id, Username =  txtUsername.Text, Email = txtEmail.Text, Password = txtPassword.Text};
            using (var db = new DB())
            {
                db.Users.Attach(user);
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
            }
            Response.Redirect("User.aspx");
        }
    }
}