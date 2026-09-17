using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.mobile.datalist
{
    public partial class datalist_selectedvaluearray : MobilePageBase
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
            DataList1.DataSource = DataSourceUtil.GetCountryTable();
            DataList1.DataBind();

            DataList1.SelectedValueArray = new string[] { "cn", "us" };
        }


        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DataRowView row = e.DataItem as DataRowView;

            e.Item.TextRawHtml = new RawHtml(DATALIST_SIMPLE_ITEM_TEMPLATE,
                PageContext.ResolveUrl("~/res/icon/flag_" + row["Image"] + ".png"),
                row["Name"]);
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Alert.Show("选中项：" + String.Join(", ", DataList1.SelectedValueArray));
        }

    }
}
