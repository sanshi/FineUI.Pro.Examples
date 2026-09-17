using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.iframe
{
    public partial class grid_iframe_alert_window : PageBase
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

            // 2. 先弹出提示对话框，再回发父窗体
            Alert.ShowInTop("保存成功！", String.Empty, MessageBoxIcon.Success, ActiveWindow.GetHidePostBackReference("参数" + DateTime.Now.Millisecond));
        }
    }
}
