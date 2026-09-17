using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_iframe_window_buttongroup : PageBase
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

            // 2. 关闭本窗体，然后回发父窗体
            //PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());

            PageContext.RegisterStartupScript("F.notify({message:'添加成功！',messageIcon:'information',target:'_top',header:false,displayMilliseconds:3000,positionX:'center',positionY:'top'});" + ActiveWindow.GetHidePostBackReference());
        }

        protected void btnSaveRefresh_Click(object sender, EventArgs e)
        {
            // 1. 这里放置保存窗体中数据的逻辑

            // 2. 关闭本窗体，然后刷新父窗体
            PageContext.RegisterStartupScript(ActiveWindow.GetHideRefreshReference());
        }

        protected void btnSaveClose_Click(object sender, EventArgs e)
        {
            // 1. 这里放置保存窗体中数据的逻辑

            // 2. 关闭本窗体，然后执行JavaScript脚本（关闭当前激活的选项卡）
            PageContext.RegisterStartupScript(ActiveWindow.GetHideExecuteScriptReference("parent.removeActiveTab();"));
        }
    }
}
