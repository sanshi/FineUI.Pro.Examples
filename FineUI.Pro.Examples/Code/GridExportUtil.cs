using System;
using System.Web;

namespace FineUI.Pro.Examples
{
    /// <summary>
    /// 把普通渲染列的原始值转换成导出内容，例如性别 0 显示“女”、true 显示“√”、
    /// 日期显示 yyyy-MM-dd。客户端渲染器不会在导出时执行，不能直接把原始值写入文件。
    /// </summary>
    public static class GridExportUtil
    {
        public static string GetCellHtml(GridRow row, GridColumn column, System.Web.UI.Page page)
        {
            object value = row.Values[column.ColumnIndex];
            string text = Convert.ToString(value);
            if (column is RowNumberField)
            {
                return (row.RowIndex + 1).ToString();
            }
            if (column is RenderCheckField)
            {
                return Convert.ToBoolean(value) ? "√" : "×";
            }

            RenderField field = column as RenderField;
            if (field != null)
            {
                if (field.RendererFunction == "renderGender")
                {
                    return text == "1" || text == "男" ? "男" : "女";
                }
                if (field.RendererFunction == "renderGroup" && !String.IsNullOrEmpty(text))
                {
                    string imagePath = PageContext.ResolveUrl("~/res/images/16/" + text + ".png");
                    string imageUrl = new Uri(page.Request.Url, imagePath).AbsoluteUri;
                    return String.Format("<img src=\"{0}\" />", HttpUtility.HtmlAttributeEncode(imageUrl));
                }
                if (field.RendererFunction == "renderMajor" && !String.IsNullOrEmpty(text))
                {
                    return String.Format("<a href=\"http://gsa.ustc.edu.cn/search?q={0}\">{1}</a>",
                        HttpUtility.UrlEncode(text), HttpUtility.HtmlEncode(text));
                }
                if (field.DataField == "LogTime" && !String.IsNullOrEmpty(text))
                {
                    text = Convert.ToDateTime(value).ToString(field.RendererArgument);
                }
            }
            return HttpUtility.HtmlEncode(text);
        }
    }
}
