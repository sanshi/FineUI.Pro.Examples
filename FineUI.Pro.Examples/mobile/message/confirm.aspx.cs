using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.mobile.message
{
    public partial class confirm : MobilePageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 页面第一次加载
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "ConfirmOK")
            {
                ShowNotify("你点击了[直接退出]按钮！");
            }
            else if (e.EventName == "ConfirmCancel")
            {
                ShowNotify("你点击了[不退出]按钮！");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Confirm confirm = new Confirm();
            confirm.Message = "您真的要执行删除操作吗？";
            confirm.Title = "确认操作";
            confirm.MessageBoxIcon = MessageBoxIcon.Question;
            confirm.Show();
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Confirm confirm = new Confirm();
            confirm.Message = "您真的要执行删除操作吗？";
            confirm.Title = "确认操作";
            confirm.TitleAlign = TextAlign.Center;
            confirm.EnableClose = false;
            confirm.ButtonFill = true;
            confirm.Show();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Confirm confirm = new Confirm();
            confirm.Message = "您真的要执行删除操作吗？";
            confirm.Title = "确认操作";
            confirm.TitleAlign = TextAlign.Center;
            confirm.EnableClose = false;
            confirm.ButtonPlain = true;
            confirm.Show();
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            Confirm confirm = new Confirm();
            confirm.Message = "您真的要执行删除操作吗？";
            confirm.Title = "确认操作";
            confirm.TitleAlign = TextAlign.Center;
            confirm.EnableClose = false;
            confirm.ButtonPlain = true;
            confirm.CancelButtonAhead = true;
            confirm.Show();
        }


    }
}
