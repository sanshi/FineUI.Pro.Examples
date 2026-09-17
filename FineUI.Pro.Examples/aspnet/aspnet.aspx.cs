using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.aspnet
{
    public partial class aspnet : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            aspBox.Text = "ASP.NET 输入框 - " + DateTime.Now.ToLongTimeString();
            extBox.Text = "FineUI 输入框 - " + DateTime.Now.ToLongTimeString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            aspBox.Text = "ASP.NET 输入框 - " + DateTime.Now.ToLongTimeString();
            extBox.Text = "FineUI 输入框 - " + DateTime.Now.ToLongTimeString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            aspBox.Text = "ASP.NET 输入框 - " + DateTime.Now.ToLongTimeString();
            extBox.Text = "FineUI 输入框 - " + DateTime.Now.ToLongTimeString();
        }


    }
}
