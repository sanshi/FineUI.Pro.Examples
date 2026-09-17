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
    public partial class grideditor_selectfromwindow_emptyrows : PageBase
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

        /// <summary>
        /// 返回空值（DBNull.Value），或者属性的值
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="values"></param>
        /// <param name="propertyName"></param>
        /// <returns></returns>
        private object GetDBNullOrTypeValue<T>(JObject values, string propertyName)
        {
            if (String.IsNullOrEmpty(values.Value<string>(propertyName)))
            {
                return DBNull.Value;
            }
            else
            {
                return values.Value<T>(propertyName);
            }
        }

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

                // 用户名不为空，才保存到数据库
                string userName = values.Value<string>("Name");
                if (!String.IsNullOrEmpty(userName))
                {
                    newRow = newTable.NewRow();
                    newRow[0] = rowIndex; // 实际项目中请使用数据库中的自增长主键，无需设置此列的值
                    newRow[1] = userName;
                    newRow[2] = GetDBNullOrTypeValue<int>(values, "EntranceYear");
                    newRow[3] = GetDBNullOrTypeValue<bool>(values, "AtSchool");
                    newRow[4] = values.Value<string>("Major");
                    newRow[5] = GetDBNullOrTypeValue<int>(values, "Gender");
                    newRow[6] = values.Value<string>("EntranceDate");
                    newTable.Rows.Add(newRow);
                }

                rowIndex++;
            }

            // 更新数据源
            Session[KEY_FOR_DATASOURCE_SESSION] = newTable;


            labResult.Text = String.Format("合并后的数据：<pre>{0}</pre>", EncodeJson(mergedData));

            BindGrid();

            ShowNotify("数据保存成功！（表格数据已重新绑定）");
        }

        // 新增数据（客户端实现）
        protected void Button1_Click(object sender, EventArgs e)
        {
            JArray records = new JArray();
            for (int i = 0; i < 4; i++)
            {
                JObject record = new JObject();
                record.Add("Name", "User " + i.ToString());
                record.Add("Gender", i % 2 == 0 ? 1 : 0);
                record.Add("EntranceYear", 2000 + i);
                record.Add("EntranceDate", DateTime.Now);
                record.Add("AtSchool", i % 2 == 0 ? true : false);
                record.Add("Major", i % 2 == 0 ? "化学系" : "材料科学与工程系");

                records.Add(record);
            }

            PageContext.RegisterStartupScript(String.Format("insertNewRecords({0});", records.ToString(Newtonsoft.Json.Formatting.None)));
        }


        // 清空数据（客户端实现）
        protected void Button3_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(String.Format("F('{0}').clearData();", Grid1.ClientID));
        }


        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_selectfromwindow_emptyrows";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = GetSimpleDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }


        /// <summary>
        /// 获取模拟表格（简单表格）
        /// </summary>
        /// <returns></returns>
        public static DataTable GetSimpleDataTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Id", typeof(int)));
            table.Columns.Add(new DataColumn("Name", typeof(String)));
            table.Columns.Add(new DataColumn("EntranceYear", typeof(int)));
            table.Columns.Add(new DataColumn("AtSchool", typeof(bool)));
            table.Columns.Add(new DataColumn("Major", typeof(String)));
            table.Columns.Add(new DataColumn("Gender", typeof(int)));
            table.Columns.Add(new DataColumn("EntranceDate", typeof(String)));

            return table;
        }
        #endregion


    }
}
