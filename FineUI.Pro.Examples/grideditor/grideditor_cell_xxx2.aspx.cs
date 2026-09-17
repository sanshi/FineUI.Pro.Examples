using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.grideditor
{
    public partial class grideditor_cell_xxx2 : PageBase
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
            //DataTable table = GetSourceData();

            //Grid1.DataSource = table;
            //Grid1.DataBind();

            var DemoList = new List<DemoClass>();
            if (DemoList.Count < 10)
            {
                for (int i = 0; i < 10 - DemoList.Count; i++)
                {
                    var m = new DemoClass();
                    DemoList.Add(m);
                }
            }

            Grid1.DataSource = DemoList;
            Grid1.DataBind();
        }

        public class DemoClass
        {
            public string Name { get; set; }
            public int Gender { get; set; }
            public int EntranceYear { get; set; }
            public DateTime NEntranceDateame { get; set; }
            public bool AtSchool { get; set; }
            public string Major { get; set; }
        }

        #endregion

        #region Events

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

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grid_editor_cell_selectfromwindow";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = DataSourceUtil.GetEmptyDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        #endregion

        protected void tbxEditorName_TriggerClick(object sender, EventArgs e)
        {
            string[] selectedCell = Grid1.SelectedCell;
            if (selectedCell != null)
            {
                PageContext.RegisterStartupScript(Window1.GetShowReference("grid_editor_cell_selectfromwindow_iframe.aspx?rowid=" + selectedCell[0]));
            }
        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            if (!String.IsNullOrEmpty(e.CloseArgument))
            {
                JObject dataObj = null;

                try
                {
                    dataObj = JObject.Parse(e.CloseArgument);
                }
                catch (Exception)
                {
                    // nothing
                }

                if (dataObj != null)
                {
                    string rowid = dataObj.Value<string>("rowid");
                    string name = dataObj.Value<string>("Name");
                    string gender = dataObj.Value<string>("Gender");
                    string entranceYear = dataObj.Value<string>("EntranceYear");
                    string entranceDate = dataObj.Value<string>("EntranceDate");
                    bool atSchool = dataObj.Value<bool>("AtSchool");
                    string major = dataObj.Value<string>("Major");

                    StringBuilder sb = new StringBuilder();
                    sb.Append(Grid1.GetUpdateCellValueReference(rowid, "Name", name));
                    sb.Append(Grid1.GetUpdateCellValueReference(rowid, "Gender", gender));
                    sb.Append(Grid1.GetUpdateCellValueReference(rowid, "EntranceYear", entranceYear));
                    sb.Append(Grid1.GetUpdateCellValueReference(rowid, "EntranceDate", entranceDate));
                    sb.Append(Grid1.GetUpdateCellValueReference(rowid, "AtSchool", atSchool.ToString().ToLower()));
                    sb.Append(Grid1.GetUpdateCellValueReference(rowid, "Major", major));

                    PageContext.RegisterStartupScript(sb.ToString());
                }
            }
        }
    }
}
