using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.block
{
    public partial class dashboard : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable table = DataSourceUtil.GetDataTable();

                Grid1.DataSource = table;
                Grid1.DataBind();


                // 为CSS样式文件添加版本号，防止版本更新时客户端缓存
                linkDashboardCSS.Href = PageContext.ResolveUrl("~/res/css/dashboard.css?v" + GlobalConfig.ProductVersion);

            }
        }


    }
}
