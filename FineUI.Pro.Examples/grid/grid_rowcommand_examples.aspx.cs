using System;
using System.IO;
using System.Web;

namespace FineUI.Pro.Examples.grid
{
    /// <summary>
    /// RenderField.Commands 示例族共用的最小服务端实现。
    /// </summary>
    public abstract class GridRowCommandExamplePageBase : PageBase
    {
        protected abstract Grid CommandGrid { get; }

        protected abstract Label ResultLabel { get; }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (Path.GetFileNameWithoutExtension(Request.AppRelativeCurrentExecutionFilePath) == "grid_rowcommand_disabled")
            {
                // GridCommand 是轻量配置对象，不单独进入 ViewState；每次请求都重新施加服务端配置。
                GridCommand action2 = CommandGrid.FindCommand("Action2");
                if (action2 != null)
                {
                    action2.Enabled = false;
                }
            }

            if (!IsPostBack)
            {
                CommandGrid.DataSource = DataSourceUtil.GetDataTable();
                CommandGrid.DataBind();
            }
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            object[] keys = CommandGrid.DataKeys[e.RowIndex];
            ResultLabel.Text = String.Format(
                "第 {0} 行，第 {1} 列；命令：{2}；参数：{3}<br />编号：{4}，姓名：{5}",
                e.RowIndex + 1,
                e.ColumnIndex + 1,
                HttpUtility.HtmlEncode(e.CommandName),
                HttpUtility.HtmlEncode(e.CommandArgument),
                HttpUtility.HtmlEncode(Convert.ToString(keys[0])),
                HttpUtility.HtmlEncode(Convert.ToString(keys[1])));
        }
    }
}
