using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_form_window : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                
                // 绑定表格
                BindGrid();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Grid1_DeleteRows")
            {
                DeleteSelectedRows(e.EventArgumentsAsJObject.Value<JArray>("selectedRows").ToObject<string[]>());
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

        // 删除数据
        // 删除按钮走自定义回发（客户端确认后由页面脚本发起，选中行的标识随事件带上来）
        private void DeleteSelectedRows(string[] rowIDs)
        {
            foreach (string rowID in rowIDs)
            {
                DeleteRowByID(GetSourceData(), Convert.ToInt32(rowID));
            }

            BindGrid();

            ShowNotify("删除数据成功!（表格数据已重新绑定）");
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int rowID = Convert.ToInt32(Grid1.DataKeys[e.RowIndex][0]);
                DeleteRowByID(GetSourceData(), rowID);

                BindGrid();
                ShowNotify("删除数据成功!（表格数据已重新绑定）");
            }
        }
 

        // 保存数据
        protected void btnSave_Click(object sender, EventArgs e)
        {
            DataRow rowData;

            string strRowID = hfFormID.Text;
            if (String.IsNullOrEmpty(strRowID))
            {
                // 新增
                DataTable table = GetSourceData();

                rowData = table.NewRow();

                // 设置行ID（模拟数据库的自增长列）
                rowData["Id"] = GetNextRowID(GetSourceData());

                table.Rows.Add(rowData);
            }
            else
            {
                // 编辑
                int rowID = Convert.ToInt32(strRowID);
                rowData = FindRowByID(GetSourceData(), rowID);
            }

            // 姓名
            rowData["Name"] = tbxFormUserName.Text.Trim();
            // 性别
            rowData["Gender"] = Convert.ToInt32(rblFormGender.SelectedValue);
            // 入学年份
            rowData["EntranceYear"] = Convert.ToInt32(nbFormEntranceYear.Text);
            // 入学日期
            rowData["EntranceDate"] = dpFormEntranceDate.Text;
            // 是否在校
            rowData["AtSchool"] = cbFormAtSchool.Checked;
            // 所学专业
            rowData["Major"] = ddlFormMajor.SelectedValue;

            // 重新绑定表格，并点击当前编辑或者新增的行
            BindGrid();
            PageContext.RegisterStartupScript(String.Format("F('{0}').selectRow('{1}');", Grid1.ClientID, rowData["Id"]) + Window1.GetHideReference());
        }



        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grid_form_window";

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
