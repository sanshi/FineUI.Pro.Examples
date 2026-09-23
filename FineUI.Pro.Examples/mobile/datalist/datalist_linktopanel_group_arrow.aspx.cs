using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.mobile.datalist
{
    public partial class datalist_linktopanel_group_arrow : MobilePageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }


        private void LoadData()
        {
            DataList1.DataGroupField = "Group";
            DataList1.DataSource = DataSourceUtil.GetCountryTable();
            DataList1.DataBind();
        }

        protected static readonly string DATALIST_ITEM_TEMPLATE_CHINA = "<table class=\"item-table\"><tr><td><img class=\"item-img\" src=\"{0}\"><div class=\"item-text\">{1}</div><div class=\"item-desc china\">{2}</div></td></tr></table>";


        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DataRowView row = e.DataItem as DataRowView;

            string name = row["Name"].ToString();
            string groupName = row["Group"].ToString();

            if (name == "中国")
            {
                // 列表项文本为可信 HTML，使用 TextRawHtml + new RawHtml(...) 原样输出（替代旧的内联 raw 标记写法）
                e.Item.TextRawHtml = new RawHtml(DATALIST_ITEM_TEMPLATE_CHINA,
                    PageContext.ResolveUrl("~/res/icon/flag_" + row["Image"] + ".png"),
                    HttpUtility.HtmlEncode(row["Name"]),
                    HttpUtility.HtmlEncode(row["Desc"]));
            }
            else
            {
                e.Item.TextRawHtml = new RawHtml(DATALIST_ITEM_TEMPLATE,
                    PageContext.ResolveUrl("~/res/icon/flag_" + row["Image"] + ".png"),
                    HttpUtility.HtmlEncode(row["Name"]),
                    HttpUtility.HtmlEncode(row["Desc"]));

                e.Item.NavigateUrl = "#";

                // 属于欧洲的子项，显示右侧箭头
                if (groupName == "欧洲")
                {
                    e.Item.ShowArrow = true;
                }
            }

        }

    }
}
