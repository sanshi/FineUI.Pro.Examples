using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.gridtree
{
    public partial class gridtree_celleditor_lockcolumn : PageBase
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


        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            if (e.RowID == "50" || e.RowID == "60")
            {
                e.TreeNodeExpanded = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            JArray modifiedData = Grid1.GetModifiedData();

            foreach (JObject modifiedRow in modifiedData)
            {
                string status = modifiedRow.Value<string>("status");
                int rowID = Convert.ToInt32(modifiedRow.Value<string>("id"));

                if (status == "modified")
                {
                    UpdateDataRow(modifiedRow.Value<JObject>("values"), rowID);
                }
            }

            BindGrid();

            labResult.Text = String.Format("用户修改的数据：<pre>{0}</pre>", EncodeJson(Grid1.GetModifiedData()));

            ShowNotify("数据保存成功！（表格数据已重新绑定）");
        }

        private void UpdateDataRow(JObject rowObj, int rowID)
        {
            DataRow rowData = FindRowByID(GetSourceData(), rowID);

            // 名称
            var name = rowObj["Name"];
            if (name != null)
            {
                rowData["Name"] = (name as JValue).Value;
            }

            // 类型
            var type = rowObj["Type"];
            if (type != null)
            {
                rowData["Type"] = (type as JValue).Value;
            }

            // 大小
            var size = rowObj["Size"];
            if (size != null)
            {
                rowData["Size"] = (size as JValue).Value;
            }

            // 修改日期
            var modifyDate = rowObj["ModifyDate"];
            if (modifyDate != null)
            {
                rowData["ModifyDate"] = (modifyDate as JValue).Value;
            }

        }


        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_gridtree_celleditor_lockcolumn";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = DataSourceUtil.GetTreeDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        #endregion
    }
}
