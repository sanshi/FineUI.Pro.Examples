using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Text;
using System.IO;

using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grideditor
{
    public partial class grideditor_datachange : PageBase
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

        protected void btnRejectChanges_Click(object sender, EventArgs e)
        {
            // 只撤销浏览器里未保存的编辑，不重绑，也不修改会话数据源。
            PageContext.RegisterStartupScript(Grid1.GetRejectChangesReference());
        }

        protected void btnReadChanges_Click(object sender, EventArgs e)
        {
            // 再次回发读取，验证浏览器撤销后不再提交旧修改。
            labResult.Text = "未保存的修改记录数：" + Grid1.GetModifiedData().Count;
        }

        protected void btnCommitChanges_Click(object sender, EventArgs e)
        {
            // 只接受当前客户端编辑结果；故意不写入会话，以便刷新核对数据源仍未变化。
            PageContext.RegisterStartupScript(Grid1.GetCommitChangesReference());
        }

        protected void btnUpdateCells_Click(object sender, EventArgs e)
        {
            // 使用稳定行 ID，单列和多列修改均保留编辑记录，不重绑数据。
            PageContext.RegisterStartupScript(Grid1.GetUpdateCellValueReference("101", "Name", "服务端修改"));
            PageContext.RegisterStartupScript(Grid1.GetUpdateCellValueReference("101", new JObject
            {
                { "Gender", 0 }, { "Major", "服务端专业" }
            }));
        }

        protected void btnAddRecord_Click(object sender, EventArgs e)
        {
            // 每次使用新 ID，避免重复点击产生重号；插入到第二行并编辑姓名。
            var record = new JObject
            {
                { "id", "server-" + Guid.NewGuid() },
                { "values", new JObject { { "Name", "服务端新增" }, { "Gender", 1 }, { "Major", "新专业" } } }
            };
            PageContext.RegisterStartupScript(Grid1.GetAddNewRecordReference(record, 1, "Name"));
        }

        protected void btnAppendRecord_Click(object sender, EventArgs e)
        {
            var values = new JObject { { "Name", "末尾新增" }, { "Gender", 0 }, { "Major", "新专业" } };
            PageContext.RegisterStartupScript(Grid1.GetAddNewRecordReference(values, true));
        }

        protected void btnDeleteRow_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Grid1.GetDeleteRowReference("101"));
        }

        protected void btnForceDeleteRow_Click(object sender, EventArgs e)
        {
            // 强制删除只移除客户端行，撤销不能恢复；刷新仍可从原数据源加载。
            PageContext.RegisterStartupScript(Grid1.GetDeleteRowReference("102", true));
        }

        protected void btnDeleteSelected_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Grid1.GetDeleteSelectedRowsReference());
        }

        private DataRow CreateNewData(DataTable table, JObject modifiedRow)
        {
            DataRow rowData = table.NewRow();

            // 设置行ID（模拟数据库的自增长列）
            rowData["Id"] = GetNextRowID(GetSourceData());
            UpdateDataRow(modifiedRow, rowData);

            return rowData;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // 修改与删除先处理；新增行要等删除处理完，行序才与客户端一致
            foreach (JObject modifiedRow in Grid1.GetModifiedData())
            {
                string status = modifiedRow.Value<string>("status");

                if (status == "modified")
                {
                    int rowID = Convert.ToInt32(modifiedRow.Value<string>("id"));
                    DataRow row = FindRowByID(GetSourceData(), rowID);

                    UpdateDataRow(modifiedRow, row);
                }
                else if (status == "deleted")
                {
                    DeleteRowByID(GetSourceData(), Convert.ToInt32(modifiedRow.Value<string>("id")));
                }
            }

            // 新增行：客户端把它放在第几行，回发数据的 index 就是几，服务端照着插
            // （前提是表格不分页、也没在客户端排过序，否则 index 与数据源的行序对不上）
            DataTable table = GetSourceData();
            foreach (JObject modifiedRow in Grid1.GetModifiedData())
            {
                if (modifiedRow.Value<string>("status") == "newadded")
                {
                    table.Rows.InsertAt(CreateNewData(table, modifiedRow), modifiedRow.Value<int>("index"));
                }
            }
            labResult.Text = String.Format("用户修改的数据：<pre>{0}</pre>", EncodeJson(Grid1.GetModifiedData()));

            BindGrid();

            // 重新绑定表格后，重新检查提交按钮的启用状态（必须要加延迟！因为AJAX返回后会先启用提交按钮 - FineUI内置防止重复点击的手段）
            PageContext.RegisterStartupScript("window.setTimeout(function(){checkSubmitBtnStatus();},0);");

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

            // 所学专业
            UpdateDataRow("Major", rowDict, rowData);
        }

        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_datachange";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = DataSourceUtil.GetDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        #endregion
    }
}
