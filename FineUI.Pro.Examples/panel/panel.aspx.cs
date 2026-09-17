using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.panel
{
    public partial class panel : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Panel1.Title = "1.25*10<sup>4</sup>t";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ShowNotify(String.Format("面板处于{0}状态", Panel1.Expanded ? "展开" : "折叠"));
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            ContentPanel1.Expanded = !ContentPanel1.Expanded;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Panel1.Title = String.Format("面板（{0}）", DateTime.Now.ToLongTimeString());
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            ToolbarText1.Text = String.Format("工具条文本一（{0}）", DateTime.Now.ToLongTimeString());
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            ToolbarText1.Hidden = !ToolbarText1.Hidden;
            ToolbarSeparator1.Hidden = !ToolbarSeparator1.Hidden;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Toolbar1.Hidden = true;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Toolbar1.Hidden = false;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            if (Panel1.IconFont == IconFont._VolumeUp)
            {
                Panel1.IconFont = IconFont._VolumeDown;
            }
            else if (Panel1.IconFont == IconFont._VolumeDown)
            {
                Panel1.IconFont = IconFont._VolumeOff;
            }
            else
            {
                Panel1.IconFont = IconFont._VolumeUp;
            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Panel1.IconFont = IconFont.None;
        }
    }
}
