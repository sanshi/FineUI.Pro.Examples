using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.mobile.datalist
{
    public partial class datalist_more_iscroll : MobilePageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "PullUpAction")
            {
                LoadNextData();
            }
        }


        private void LoadData()
        {
            DataList1.DataSource = GetDataByIndex(1);
            DataList1.DataBind();
        }

        private void LoadNextData()
        {
            var dataIndex = Convert.ToInt32(DataList1.AttributeDataTag);
            dataIndex++;

            if (dataIndex <= 3)
            {
                DataList1.DataSource = GetDataByIndex(dataIndex);
                DataList1.DataBind(true); // true: 保持当前数据

                DataList1.AttributeDataTag = dataIndex.ToString();
            }

            if (dataIndex == 3)
            {
                //btnMore.Hidden = true;
            }
        }

        private DataTable GetDataByIndex(int dataIndex)
        {
            DataTable table = DataSourceUtil.GetCountryTable();
            if (dataIndex >= 2)
            {
                foreach (DataRow row in table.Rows)
                {
                    var rowId = row["Id"].ToString();
                    var rowName = row["Name"].ToString();

                    row["Id"] = rowId + '_' + dataIndex.ToString();
                    row["Name"] = rowName + ' ' + dataIndex.ToString();
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
