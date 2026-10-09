using System;
using System.Text;
using System.Web;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples
{
    /// <summary>
    /// 行选择示例共用：把选中行的数据键或自定义事件提交的勾选结果生成 HTML 表格。
    /// 入参包含所需数据，不依赖页面上下文，因此使用静态工具类。
    /// 姓名、数据键名与键值来自客户端回传，必须 HTML 编码，避免其中的 &amp; &lt; 破坏表格或执行脚本。
    /// </summary>
    public static class GridSelectionMessage
    {
        /// <summary>
        /// 显示自定义事件提交的姓名、性别和当前勾选状态。
        /// 直接遍历客户端提交的行数组，行号和选择顺序也来自该数组，不再读取表格的选中行。
        /// </summary>
        public static string GetCheckStateResult(JArray rows, string[] columnIds, string[] headers,
            bool showGender = true)
        {
            if (columnIds.Length != headers.Length)
            {
                throw new ArgumentException("复选框列与表头必须一一对应。");
            }

            if (rows == null)
            {
                throw new HttpException(400, "缺少选中行数据。");
            }
            if (rows.Count == 0)
            {
                return "<strong>没有选中任何一行！</strong>";
            }

            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("共选中了 {0} 行：", rows.Count);
            sb.Append("<table class=\"result\"><tr><th>行号</th><th>姓名</th>");
            if (showGender)
            {
                sb.Append("<th>性别</th>");
            }
            foreach (string header in headers)
            {
                sb.AppendFormat("<th>{0}</th>", HttpUtility.HtmlEncode(header));
            }
            sb.Append("</tr>");

            foreach (JToken row in rows)
            {
                JObject values = row as JObject;
                JToken rowNumber = values == null ? null : values["rowNumber"];
                JToken gender = values == null ? null : values["gender"];
                bool hasRowNumber = rowNumber != null && rowNumber.Type == JTokenType.Integer
                    && rowNumber.Value<int>() > 0;
                bool hasGender = !showGender || (gender != null && gender.Type == JTokenType.Integer);
                if (values == null || !hasRowNumber || !hasGender)
                {
                    throw new HttpException(400, "选中行缺少有效的行号或性别。");
                }
                sb.Append("<tr>");
                sb.AppendFormat("<td>{0}</td>", rowNumber.Value<int>());
                sb.AppendFormat("<td>{0}</td>", HttpUtility.HtmlEncode(values.Value<string>("name")));
                if (showGender)
                {
                    sb.AppendFormat("<td>{0}</td>", gender.Value<int>() == 1
                        ? Resources.SharedResources.Male : Resources.SharedResources.Female);
                }
                foreach (string columnId in columnIds)
                {
                    JToken checkedState = values[columnId];
                    if (checkedState == null || checkedState.Type != JTokenType.Boolean)
                    {
                        throw new HttpException(400, "选中行缺少有效的复选框状态，列 ID：" + columnId);
                    }
                    sb.AppendFormat("<td>{0}</td>", checkedState.Value<bool>());
                }
                sb.Append("</tr>");
            }
            sb.Append("</table>");
            return sb.ToString();
        }

        /// <summary>
        /// 生成「共选中了 N 行」的 HTML 表格；未选中返回提示文本。
        /// 数据由Grid.GetSelectedDataKeys按稳定行ID关联，不依赖行序号。
        /// </summary>
        public static string HowManyRowsAreSelected(Grid grid)
        {
            StringBuilder sb = new StringBuilder();
            var selectedDataKeys = grid.GetSelectedDataKeys();
            int selectedCount = selectedDataKeys.Count;
            if (selectedCount > 0)
            {
                sb.AppendFormat("<p><strong>" + Resources.SharedResources.GridSelectedRowsMessage + "</strong></p>", selectedCount);
                sb.Append("<table class=\"result\">");

                sb.Append("<tr>");
                foreach (string datakey in grid.DataKeyNames)
                {
                    sb.AppendFormat("<th>{0}</th>", HttpUtility.HtmlEncode(datakey));
                }
                sb.Append("</tr>");

                foreach (object[] dataKeys in selectedDataKeys)
                {
                    sb.Append("<tr>");
                    for (int j = 0; j < dataKeys.Length; j++)
                    {
                        sb.AppendFormat("<td>{0}</td>", HttpUtility.HtmlEncode(Convert.ToString(dataKeys[j])));
                    }

                    sb.Append("</tr>");
                }
                sb.Append("</table>");
            }
            else
            {
                sb.Append("<strong>" + Resources.SharedResources.GridNoSelectionMessage + "</strong>");
            }

            return sb.ToString();
        }
    }
}
