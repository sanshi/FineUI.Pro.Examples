using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.layout
{
    public partial class region : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string newtitle = String.Format("左侧面板（有提示信息） - 更新时间：{0}", DateTime.Now.ToLongTimeString());
            panelLeftRegion.Title = newtitle;
            panelLeftRegion.TitleToolTip = newtitle;
        }

        protected void btnHideBottomRegion_Click(object sender, EventArgs e)
        {
            panelBottomRegion.Hidden = !panelBottomRegion.Hidden;
        }

    }
}
