using System;
using System.Data;

namespace FineUI.Pro.Examples.datalist
{
    public partial class datalist_databind : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCities(false);
            }
        }

        private void LoadCities(bool reverse)
        {
            DataTable table = CreateCityTable();
            if (reverse)
            {
                table.Rows.Add("guangzhou", "广州");
                table.Rows.Add("shanghai", "上海");
                table.Rows.Add("beijing", "北京");
            }
            else
            {
                table.Rows.Add("beijing", "北京");
                table.Rows.Add("shanghai", "上海");
                table.Rows.Add("guangzhou", "广州");
            }

            DataList1.DataSource = table;
            DataList1.DataBind();
            ViewState["AppendBatch"] = 0;
            labResult.Text = "数据数量：" + DataList1.Items.Count;
        }

        private static DataTable CreateCityTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id", typeof(string));
            table.Columns.Add("Name", typeof(string));
            return table;
        }

        protected void btnReload_Click(object sender, EventArgs e)
        {
            LoadCities(true);
        }

        protected void btnAppend_Click(object sender, EventArgs e)
        {
            int batch = Convert.ToInt32(ViewState["AppendBatch"]) + 1;
            DataTable table = CreateCityTable();
            // 同一城市在不同批次拥有不同标识，例如 shenzhen-1 和 shenzhen-2，避免选择时混淆两行。
            table.Rows.Add("shenzhen-" + batch, "深圳（第" + batch + "批）");
            table.Rows.Add("hangzhou-" + batch, "杭州（第" + batch + "批）");
            DataList1.AppendData(table);
            ViewState["AppendBatch"] = batch;
            labResult.Text = "数据数量：" + DataList1.Items.Count;
        }
    }
}
