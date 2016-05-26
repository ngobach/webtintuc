using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTinTuc.admin
{
    public partial class Member : System.Web.UI.Page
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
                        var member = db.Members.First(u => u.ID == id);
                        txtFullname.Text = member.FullName;
                        txtAddress.Text = member.Address;
                        txtEmail.Text = member.Email;
                        txtDOB.Text = member.DayOfBirth.ToString("dd/MM/yyyy");
                        txtPhone.Text = member.Phone;
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
                gridView.DataSource = db.Members.ToList();
                gridView.DataBind();
            }
        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            var member = new WebTinTuc.Member {FullName =  txtFullname.Text, Address = txtAddress.Text, DayOfBirth = DateTime.Parse(txtDOB.Text), Email = txtEmail.Text, Phone = txtPhone.Text};
            using (var db = new DB())
            {
                db.Members.Add(member);
                db.SaveChanges();
            }
            Response.Redirect(Request.Url.AbsolutePath + "?id=" + member.ID);
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Member.aspx");
        }

        protected void gridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Sua")
            {
                Response.Redirect("Member.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "Xoa")
            {
                using (var db = new DB())
                {
                    int id = Convert.ToInt32(e.CommandArgument.ToString());
                    var member = db.Members.First(u => u.ID == id);
                    db.Members.Remove(member);
                    db.SaveChanges();
                }
            }
            LoadAll();
        }

        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            int id = (int)ViewState["id"];
            var member = new WebTinTuc.Member {ID = id,  FullName = txtFullname.Text, Address = txtAddress.Text, DayOfBirth = DateTime.Parse(txtDOB.Text), Email = txtEmail.Text, Phone = txtPhone.Text };
            using (var db = new DB())
            {
                db.Members.Attach(member);
                db.Entry(member).State = EntityState.Modified;
                db.SaveChanges();
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}