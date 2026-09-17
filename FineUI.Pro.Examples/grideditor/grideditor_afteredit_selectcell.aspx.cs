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
    public partial class grideditor_afteredit_selectcell : PageBase
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

        protected void Grid1_AfterEdit(object sender, GridAfterEditEventArgs e)
        {
            // 当前选中的单元格
            string[] selectedCell = Grid1.SelectedCell;

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

            // 数据绑定时，会清空选中的行和选中的单元格
            BindGrid();

            labResult.Text = String.Format("用户修改的数据：<pre>{0}</pre>", EncodeJson(Grid1.GetModifiedData()));

            // 重新选中之前的单元格
            PageContext.RegisterStartupScript(String.Format("F('{0}').selectCell('{1}','{2}');", Grid1.ClientID, selectedCell[0], selectedCell[1]));


            // 这个提示在父页面弹出，会让当前表格所在的页面失去焦点，从而无法进行后续的 TAB、ENTER 操作
            //Notify("数据保存成功！（表格数据已重新绑定）");

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

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_afteredit_selectcell";

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
