using System;
using System.Linq;

namespace WebTinTuc.admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new DB())
            {
                var user = db.Users.First();
                Session["UserName"] = user.Username;
                Session["UserID"] = user.ID;
            }
            if (Session["UserName"] != null)
                Response.Redirect("Default.aspx");
            
        }
   
        protected void Check(object sender, EventArgs e)
        {
            using (var db = new DB())
            {
                if (db.Users.Any(u => u.Username == txtUsername.Text && u.Password == txtPassword.Text))
                {
                    Session["UserName"] = txtUsername.Text;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    thongbao.Visible = true;
                    lblMessage.Text = "Thông tin đăng nhập chưa chính xác!";
                }
            }
        }
    }
}
