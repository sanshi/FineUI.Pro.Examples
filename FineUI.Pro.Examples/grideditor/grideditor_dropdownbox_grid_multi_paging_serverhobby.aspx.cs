using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grideditor
{
    public partial class grideditor_dropdownbox_grid_multi_paging_serverhobby : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();

                Grid2.DataSource = GetHobbyTable();
                Grid2.DataBind();
            }
        }

        private string GetHobbyText(DataTable hobbyTable, string hobbyCodes)
        {
            var result = new List<string>();

            var hobbyCodeList = new List<string>(hobbyCodes.Split(','));
            foreach (DataRow row in hobbyTable.Rows)
            {
                if (hobbyCodeList.Contains(row["Code"].ToString()))
                {
                    result.Add(row["Name"].ToString());
                }
            }

            return String.Join(", ", result.ToArray());
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = GetSourceData();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }


        private DataTable GetHobbyTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Code", typeof(String)));
            table.Columns.Add(new DataColumn("Name", typeof(String)));

            DataRow row = null;

            row = table.NewRow();
            row[0] = "reading";
            row[1] = "读书";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "basketball";
            row[1] = "篮球";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "travel";
            row[1] = "旅游";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "movie";
            row[1] = "电影";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "music";
            row[1] = "音乐";
            table.Rows.Add(row);

            return table;
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

            // 姓名
            UpdateDataRow("Name", rowDict, rowData);

            // 性别
            UpdateDataRow("Gender", rowDict, rowData);

            // 入学年份
            UpdateDataRow("EntranceYear", rowDict, rowData);

            // 入学日期
            UpdateDataRow("EntranceDate", rowDict, rowData);

            // 是否在校
            UpdateDataRow("AtSchool", rowDict, rowData);

            // 兴趣爱好
            UpdateDataRow("Hobby", rowDict, rowData);

            // 兴趣爱好显示文本
            UpdateDataRow("HobbyText", rowDict, rowData);


        }

        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_dropdownbox_grid_multi_paging_serverhobby";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                DataTable hobbyTable = GetHobbyTable();

                // 修改数据源的结构，增加 HobbyText 项
                DataTable table = DataSourceUtil.GetDataTable();
                table.Columns.Add(new DataColumn("HobbyText", typeof(String)));
                foreach (DataRow row in table.Rows)
                {
                    row["HobbyText"] = GetHobbyText(hobbyTable, row["Hobby"].ToString());
                }

                Session[KEY_FOR_DATASOURCE_SESSION] = table;
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        #endregion

    }
}
