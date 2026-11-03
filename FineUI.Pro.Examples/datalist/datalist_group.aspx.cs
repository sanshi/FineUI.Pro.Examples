using System;

namespace FineUI.Pro.Examples.datalist
{
    public partial class datalist_group : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                foreach (DataListItem item in DataList1.Items)
                {
                    // 模板只授权固定标签，城市名称仍先编码，避免将业务文字当成 HTML 执行。
                    item.TextRawHtml = new RawHtml(
                        "<strong>{0}</strong><br />{1}",
                        HtmlEncode(item.Text),
                        HtmlEncode(item.Group + "地区城市"));
                }
            }
        }
    }
}
