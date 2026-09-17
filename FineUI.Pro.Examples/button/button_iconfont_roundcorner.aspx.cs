using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.button
{
    public partial class button_iconfont_roundcorner : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCustomIcon_Click(object sender, EventArgs e)
        {
            if (btnCustomIcon.IconFont == IconFont._VolumeUp)
            {
                btnCustomIcon.IconFont = IconFont._VolumeDown;
            }
            else if (btnCustomIcon.IconFont == IconFont._VolumeDown)
            {
                btnCustomIcon.IconFont = IconFont._VolumeOff;
            }
            else
            {
                btnCustomIcon.IconFont = IconFont._VolumeUp;
            }
        }
    }
}
