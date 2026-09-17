using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.tree
{
    public partial class tree_smart_text : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void cbxMiniMode_CheckedChanged(object sender, CheckedEventArgs e)
        {
            Tree1.MiniMode = cbxMiniMode.Checked;

            // 如果启用微型模式，则强制启用其他属性（建议微型模式的最小宽度为60px）
            if (cbxMiniMode.Checked)
            {
                Tree1.Width = Unit.Pixel(60);

                Tree1.HideHScrollbar = true;
                Tree1.HideVScrollbar = true;
                Tree1.ExpanderToRight = true;
                Tree1.HeaderStyle = true;
                Tree1.AllHeaderStyle = true;
            }
            else
            {
                Tree1.Width = Unit.Pixel(300);

                Tree1.HideHScrollbar = false;
                Tree1.HideVScrollbar = false;
                Tree1.ExpanderToRight = false;
                Tree1.HeaderStyle = false;
                Tree1.AllHeaderStyle = false;
            }
        }
    }
}
