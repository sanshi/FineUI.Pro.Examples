using System;

namespace FineUI.Pro.Examples.tabstrip
{
    public partial class reorder : PageBase
    {
        protected void OpenFirst(object sender, EventArgs e)
        {
            TabStrip1.ActiveTabIndex = 0;
            labResult.Text = "后台第一项：" + TabStrip1.Tabs[0].Title;
        }

        protected void OpenHome(object sender, EventArgs e)
        {
            TabStrip1.ActiveTab = tabHome;
        }
    }
}
