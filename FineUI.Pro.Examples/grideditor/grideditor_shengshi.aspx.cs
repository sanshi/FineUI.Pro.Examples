using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

namespace FineUI.Pro.Examples.grideditor
{
    public partial class grideditor_shengshi : PageBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();

                // 后台绑定 省 下拉列表数据
                ddlSheng.DataSource = DataSourceUtil.SHENG_JSON;
                ddlSheng.DataBind();

                // 注册脚本
                string startScript = String.Format("window._SHI={0};", DataSourceUtil.SHI_JSON.ToString(Formatting.None));
                PageContext.RegisterStartupScript(startScript);
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

            // 省
            UpdateDataRow("Sheng", rowDict, rowData);

            // 市
            UpdateDataRow("Shi", rowDict, rowData);

        }

        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_shengshi";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = GetDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        public static DataTable GetDataTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Id", typeof(int)));
            table.Columns.Add(new DataColumn("Name", typeof(string)));
            table.Columns.Add(new DataColumn("Gender", typeof(int)));
            table.Columns.Add(new DataColumn("Sheng", typeof(string)));
            table.Columns.Add(new DataColumn("Shi", typeof(string)));

            DataRow row = table.NewRow();
            row[0] = 101;
            row[1] = "张萍萍";
            row[2] = 0;
            row[3] = "河南";
            row[4] = "驻马店市";
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 102;
            row[1] = "陈飞";
            row[2] = 1;
            row[3] = "安徽";
            row[4] = "合肥市";
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 103;
            row[1] = "董婷婷";
            row[2] = 0;
            row[3] = "北京";
            row[4] = "北京市";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 104;
            row[1] = "刘国";
            row[2] = 0;
            row[3] = "";
            row[4] = "";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 105;
            row[1] = "康颖颖";
            row[2] = 0;
            row[3] = "";
            row[4] = "";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 106;
            row[1] = "彭博";
            row[2] = 1;
            row[3] = "";
            row[4] = "";
            table.Rows.Add(row);


            return table;
        }


        #endregion

        

    }
}
