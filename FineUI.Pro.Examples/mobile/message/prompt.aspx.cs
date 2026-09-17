using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.mobile.message
{
    public partial class prompt : MobilePageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Prompt prompt = new Prompt();
            prompt.Message = "请输入你的姓名？";
            prompt.Title = "请输入";
            prompt.OkScript = "notifyit(arguments[0]);";
            prompt.Show();
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Prompt prompt = new Prompt();
            prompt.Message = "请输入你的姓名？";
            prompt.Title = "请输入";
            prompt.OkScript = "notifyit(arguments[0]);";
            prompt.TitleAlign = TextAlign.Center;
            prompt.EnableClose = false;
            prompt.ButtonFill = true;
            prompt.Show();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Prompt prompt = new Prompt();
            prompt.Message = "请输入你的姓名？";
            prompt.Title = "请输入";
            prompt.OkScript = "notifyit(arguments[0]);";
            prompt.TitleAlign = TextAlign.Center;
            prompt.EnableClose = false;
            prompt.ButtonPlain = true;
            prompt.CancelButtonAhead = true;
            prompt.Show();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Prompt prompt = new Prompt();
            prompt.Message = "请输入你的密码？";
            prompt.Title = "请输入";
            prompt.OkScript = "notifyit(arguments[0]);";
            prompt.TitleAlign = TextAlign.Center;
            prompt.EnableClose = false;
            prompt.ButtonPlain = true;
            prompt.TextMode = TextMode.Password;
            prompt.Show();
        }


        protected void Button5_Click(object sender, EventArgs e)
        {
            Prompt prompt = new Prompt();
            prompt.Message = "请输入你的姓名？";
            prompt.Title = "请输入";
            prompt.OkScript = "notifyit(arguments[0]);";
            prompt.TitleAlign = TextAlign.Center;
            prompt.EnableClose = false;
            prompt.ButtonPlain = true;
            prompt.Show();
        }

    }
}
