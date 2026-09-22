using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.mobile.datalist
{
    public partial class datalist_selectedvaluearray_keepcurrentselection : MobilePageBase
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
            LoadData(false);
        }

        private void LoadData(bool reverse)
        {
            DataTable source = DataSourceUtil.GetCountryTable();
            if (reverse)
            {
                DataTable reversed = source.Clone();
                for (int i = source.Rows.Count - 1; i >= 0; i--)
                {
                    reversed.ImportRow(source.Rows[i]);
                }
                source = reversed;
            }
            DataList1.DataSource = source;
            DataList1.DataBind();

            DataList1.SelectedValueArray = new string[] { "cn", "us"};
        }


        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DataRowView row = e.DataItem as DataRowView;

            e.Item.TextRawHtml = new RawHtml(DATALIST_SIMPLE_ITEM_TEMPLATE,
                PageContext.ResolveUrl("~/res/icon/flag_" + row["Image"] + ".png"),
                row["Name"]);
        }


        // 服务端设置选择，替换当前可取消的选中项。
        protected void btnSetSelection_Click(object sender, EventArgs e)
        {
            DataList1.SelectedValueArray = new string[] { "fr", "us" };
        }

        // 服务端清空选择。
        protected void btnClearSelection_Click(object sender, EventArgs e)
        {
            DataList1.SelectedValueArray = new string[0];
        }

        // 倒序重绑同一批列表项，并选中美国。
        protected void btnRebindSelection_Click(object sender, EventArgs e)
        {
            LoadData(true);
            DataList1.SelectedValue = "us";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Alert.Show("选中项：" + String.Join(", ", DataList1.SelectedValueArray));
        }
 
    }
}
