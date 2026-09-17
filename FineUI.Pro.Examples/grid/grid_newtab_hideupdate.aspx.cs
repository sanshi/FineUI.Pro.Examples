using System;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_newtab_hideupdate : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "UpdatePage")
            {
                Grid1.Title = "表格 - 来自子页面的参数：" + e.EventArguments;

                // 此时可以更新页面上的其他控件，比如表格
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            foreach (object[] dataKeys in Grid1.GetSelectedDataKeys())
            {
                sb.Append(dataKeys[1].ToString());
                sb.Append(",");
            }
            ShowNotify("你选择了删除行：" + sb.ToString().TrimEnd(','));
        }

        protected void Window1_Close(object sender, EventArgs e)
        {
            ShowNotify("弹出窗口关闭了！");
        }

        #endregion
    }
}
