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
    public partial class grideditor_editable_cell : PageBase
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
            DataRowView row = e.DataItem as DataRowView;

            int entranceYear = Convert.ToInt32(row["EntranceYear"]);
            if (entranceYear <= 2002)
            {
                e.SetCellCssClass("EntranceYear", "f-grid-cell-uneditable");
                e.SetCellCssClass("EntranceDate", "f-grid-cell-uneditable");
                e.SetCellCssClass("AtSchool", "f-grid-cell-uneditable");

                //RenderField rfEntranceYear = Grid1.FindColumn("EntranceYear") as RenderField;
                //RenderField rfEntranceDate = Grid1.FindColumn("EntranceDate") as RenderField;
                //RenderCheckField rcfAtSchool = Grid1.FindColumn("AtSchool") as RenderCheckField;

                //e.CellCssClasses[rfEntranceYear.ColumnIndex] = "f-grid-cell-uneditable";
                //e.CellCssClasses[rfEntranceDate.ColumnIndex] = "f-grid-cell-uneditable";
                //e.CellCssClasses[rcfAtSchool.ColumnIndex] = "f-grid-cell-uneditable";
            }

        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            //RenderField rfMajor = Grid1.FindColumn("Major") as RenderField;
            //Grid1.Rows[0].CellCssClasses[rfMajor.ColumnIndex] = "custom-cell-no-edit";

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

            // 所学专业
            UpdateDataRow("Major", rowDict, rowData);

        }

        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_editable_cell";

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
