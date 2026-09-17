using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.mobile.message
{
    public partial class notify : MobilePageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Notify notify = new Notify();
            notify.Message = "数据保存成功！";
            notify.Title = "通知";
            notify.DisplayMilliseconds = 1000 * 1000;
            notify.Show();
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Notify notify = new Notify();
            notify.Message = "正在加载...";
            notify.MessageBoxIcon = MessageBoxIcon.None;
            notify.ShowHeader = false;
            notify.ShowLoading = true;
            notify.PositionX = Position.Center;
            notify.PositionY = Position.Center;
            notify.MinWidth = 0;
            notify.IsModal = true;
            notify.HideOnMaskClick = true;
            notify.DisplayMilliseconds = 1000 * 1000;

            notify.Show();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Notify notify = new Notify();
            notify.CssClass = "mynotify-notext";
            notify.MessageBoxIcon = MessageBoxIcon.None;
            notify.ShowHeader = false;
            notify.ShowLoading = true;
            notify.PositionX = Position.Center;
            notify.PositionY = Position.Center;
            notify.MinWidth = 0;
            notify.IsModal = true;
            notify.HideOnMaskClick = true;
            notify.DisplayMilliseconds = 1000 * 1000;
            
            notify.Show();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Notify notify = new Notify();
            notify.CssClass = "mynotify";
            notify.MessageRawHtml = new RawHtml("<div class=\"f-loading\"><div class=\"f-loading-img\"><img src=\"{0}\"/></div></div><div class=\"f-loading-message\">正在加载</div>",
                PageContext.ResolveUrl("~/res/images/loading/loading_32.gif"));
            notify.MessageBoxIcon = MessageBoxIcon.None;
            notify.ShowHeader = false;
            notify.PositionX = Position.Center;
            notify.PositionY = Position.Center;
            notify.MinWidth = 0;
            notify.IsModal = true;
            notify.HideOnMaskClick = true;
            notify.DisplayMilliseconds = 1000 * 1000;
            
            notify.Show();
        }


    }
}
