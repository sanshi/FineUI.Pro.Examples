using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.mobile.datalist
{
    public partial class datalist_more : MobilePageBase
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
            DataList1.DataSource = GetDataByIndex(0);
            DataList1.DataBind();
        }

        private void LoadNextData()
        {
            var dataIndex = Convert.ToInt32(DataList1.AttributeDataTag);
            dataIndex++;

            if (dataIndex <= 4)
            {
                // 追加数据
                DataList1.AppendData(GetDataByIndex(dataIndex));

                DataList1.AttributeDataTag = dataIndex.ToString();
            }

            if (dataIndex == 4)
            {
                btnMore.Enabled = false;
                btnMore.Text = "全部加载完毕";
            }
        }

        private DataTable GetDataByIndex(int dataIndex)
        {
            DataTable table = DataSourceUtil.GetCountryTable();
            if (dataIndex > 0)
            {
                foreach (DataRow row in table.Rows)
                {
                    var rowId = row["Id"].ToString();
                    var rowName = row["Name"].ToString();

                    row["Id"] = rowId + '_' + (dataIndex + 1).ToString();
                    row["Name"] = rowName + ' ' + (dataIndex + 1).ToString();
                }
            }
            return table;
        }


        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DataRowView row = e.DataItem as DataRowView;

            e.Item.TextRawHtml = new RawHtml(DATALIST_ITEM_TEMPLATE,
                PageContext.ResolveUrl("~/res/icon/flag_" + row["Image"] + ".png"),
                HttpUtility.HtmlEncode(row["Name"]),
                HttpUtility.HtmlEncode(row["Desc"]));
        }


        protected void btnMore_Click(object sender, EventArgs e)
        {
            LoadNextData();
        }

    }
}
