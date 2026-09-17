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
    public partial class grideditor_newdelete_getmergeddata : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 绑定表格
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
            if (Grid1.GetModifiedData().Count == 0)
            {
                labResult.Text = "";
                ShowNotify("表格数据没有变化！");
                return;
            }

            // 复制原始表格的结构
            DataTable newTable = GetSourceData().Clone();
            DataRow newRow;

            int rowIndex = 0;
            JArray mergedData = Grid1.GetMergedData();
            foreach (JObject mergedRow in mergedData)
            {
                JObject values = mergedRow.Value<JObject>("values");

                newRow = newTable.NewRow();
                newRow[0] = rowIndex; // 实际项目中请使用数据库中的自增长主键，无需设置此列的值
                newRow[1] = values.Value<string>("Name");
                newRow[2] = values.Value<int>("EntranceYear");
                newRow[3] = values.Value<bool>("AtSchool");
                newRow[4] = values.Value<string>("Major");
                newRow[5] = values.Value<int>("Gender");
                newRow[6] = values.Value<string>("EntranceDate");
                newTable.Rows.Add(newRow);

                rowIndex++;
            }

            // 更新数据源
            Session[KEY_FOR_DATASOURCE_SESSION] = newTable;

            labResult.Text = String.Format("合并后的数据：<pre>{0}</pre>", EncodeJson(mergedData));

            BindGrid();

            ShowNotify("数据保存成功！（表格数据已重新绑定）");
        }

        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_newdelete_getmergeddata";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = DataSourceUtil.GetSimpleDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }
        #endregion
    }
}
