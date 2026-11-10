using System;
using System.Data;
using System.Linq;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_rowsort : PageBase
    {
        private const string SavedOrderSessionKey = "GridMove.RowSort";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            var students = DataSourceUtil.GetDataTable();
            var savedOrder = Session[SavedOrderSessionKey] as string[];
            if (savedOrder != null)
            {
                // 只保存行 ID。新加入的学生若没有保存位置，按初始顺序追加在已排序学生之后。
                var sortedStudents = students.Clone();
                var sortedRows = students.Rows.Cast<DataRow>().OrderBy(row =>
                {
                    int index = Array.IndexOf(savedOrder, row["Id"].ToString());
                    return index >= 0 ? index : int.MaxValue;
                });
                foreach (var row in sortedRows)
                {
                    sortedStudents.ImportRow(row);
                }
                students = sortedStudents;
            }

            Grid1.DataSource = students;
            Grid1.DataBind();
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Grid1_RowSort")
            {
                var rowIds = e.EventArgumentsAsJObject.Value<JArray>("rowIds");
                Session[SavedOrderSessionKey] = rowIds.ToObject<string[]>();
                ShowNotify("数据保存成功！");
            }
        }
    }
}
