using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.iframe
{
    public partial class grid_iframe_reload_window : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();

                string paramName = Request.QueryString["name"];
                if (!String.IsNullOrEmpty(paramName))
                {
                    labUserName.Text = paramName;
                }
            }
        }

        private void LoadData()
        {
        }

        protected void btnSaveContinue_Click(object sender, EventArgs e)
        {
            // 1. 这里放置保存窗体中数据的逻辑

            // 2. 不关闭窗体，直接回发父窗体
            string scripts = String.Format("F.getActiveWindow().window.reloadGrid('{0}');", "参数" + DateTime.Now.Millisecond);
            PageContext.RegisterStartupScript(scripts);
        }
    }
}
