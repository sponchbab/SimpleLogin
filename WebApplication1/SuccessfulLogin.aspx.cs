using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BC = BCrypt.Net;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void hash_Click(object sender, EventArgs e)
        {
            TextBox PlainTextPassword = FormView1.FindControl("PlainTextPasswordTextBox") as TextBox;
            TextBox HashedPassword = FormView1.FindControl("HashedPasswordTextBox") as TextBox;

            HashedPassword.Text = BC.BCrypt.HashPassword(PlainTextPassword.Text).ToString();
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}