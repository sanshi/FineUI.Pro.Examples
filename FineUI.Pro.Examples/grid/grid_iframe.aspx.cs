using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_iframe : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

            Grid1.Title = "表格 - " + DateTime.Now.ToLongTimeString();
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        protected string GetEditUrl(object id, object name)
        {
            return Window1.GetShowReference(String.Format("grid_iframe_window.aspx?id={0}&name={1}", id, HttpUtility.UrlEncode(name.ToString())), "编辑 - " + name);
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
            //ShowNotify("窗体关闭了！");
            //Grid1.Title = "表格 - 窗体关闭了 -" + DateTime.Now.ToLongTimeString();
            Alert.Show("触发了窗体的关闭事件！");
        }

        protected void Grid1_RowDoubleClick(object sender, GridRowClickEventArgs e)
        {
            object[] dataKeys = Grid1.DataKeys[e.RowIndex];

            PageContext.RegisterStartupScript(GetEditUrl(dataKeys[0], dataKeys[1]));
        }

        #endregion
    }
}
