using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grideditor
{
    public partial class grideditor_numberbox_empty : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();

            }
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = GetSourceData();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }


        #endregion

        #region Events

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (JObject modifiedRow in Grid1.GetModifiedData())
            {
                if (modifiedRow.Value<string>("status") != "modified")
                {
                    continue;
                }

                int rowID = Convert.ToInt32(modifiedRow.Value<string>("id"));
                DataRow row = FindRowByID(GetSourceData(), rowID);

                UpdateDataRow(modifiedRow, row);
            }

            BindGrid();

            labResult.Text = String.Format("用户修改的数据：<pre>{0}</pre>", EncodeJson(Grid1.GetModifiedData()));

            ShowNotify("数据保存成功！（表格数据已重新绑定）");
        }

        private void UpdateDataRow(JObject modifiedRow, DataRow rowData)
        {
            Dictionary<string, object> rowDict = modifiedRow.Value<JObject>("values").ToObject<Dictionary<string, object>>();

            // 年份
            UpdateDataRow("Year", rowDict, rowData);

            // 学费
            UpdateDataRow("XueFei", rowDict, rowData);

            // 住宿费
            UpdateDataRow("ZhusuFei", rowDict, rowData);

            // 伙食费
            UpdateDataRow("HuoshiFei", rowDict, rowData);

            // 书本费
            UpdateDataRow("ShubenFei", rowDict, rowData);

        }

        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_numberbox_empty";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = GetDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        public static DataTable GetDataTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Id", typeof(int)));
            table.Columns.Add(new DataColumn("Year", typeof(int)));
            table.Columns.Add(new DataColumn("XueFei", typeof(int)));
            table.Columns.Add(new DataColumn("ZhusuFei", typeof(int)));
            table.Columns.Add(new DataColumn("HuoshiFei", typeof(int)));
            table.Columns.Add(new DataColumn("ShubenFei", typeof(int)));

            DataRow row = table.NewRow();
            row[0] = 101;
            row[1] = 2014;
            row[2] = 1000;
            row[3] = 3000;
            row[4] = 2000;
            row[5] = 1000;
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 102;
            row[1] = 2015;
            row[2] = 1200;
            row[3] = 3200;
            row[4] = 2200;
            row[5] = 1200;
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 103;
            row[1] = 2016;
            row[2] = 1500;
            row[3] = 3500;
            row[4] = 2500;
            row[5] = 1500;
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 104;
            row[1] = 2017;
            row[2] = DBNull.Value;
            row[3] = DBNull.Value;
            row[4] = DBNull.Value;
            row[5] = DBNull.Value;
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 105;
            row[1] = 2018;
            row[2] = DBNull.Value;
            row[3] = DBNull.Value;
            row[4] = DBNull.Value;
            row[5] = DBNull.Value;
            table.Rows.Add(row);


            return table;
        }


        #endregion



    }
}
