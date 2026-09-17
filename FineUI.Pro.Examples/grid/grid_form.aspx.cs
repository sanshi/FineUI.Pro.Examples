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
    public partial class grid_form : PageBase
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

        // 删除数据
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int rowID = Convert.ToInt32(hfFormID.Text);
            DeleteRowByID(GetSourceData(), rowID);

            // 重新绑定表格，并模拟点击[新增按钮]
            BindGrid();
            PageContext.RegisterStartupScript("onNewButtonClick();");
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
            PageContext.RegisterStartupScript(String.Format("F('{0}').selectRow('{1}');", Grid1.ClientID, rowData["Id"]));
        }



        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grid_form";

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
