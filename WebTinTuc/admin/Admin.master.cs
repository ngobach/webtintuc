using System;

namespace WebTinTuc
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Force login
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx", true);
            }
        }
        protected void Page_PreRender()
        {

        }
        protected void DoLogout(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Response.Redirect("~/admin/Login.aspx");
        }
    }
}
