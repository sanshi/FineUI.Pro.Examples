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
    public partial class grideditor_shengshi_textvalue : PageBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();

                
                // 注册脚本（省数据）
                JArray shengData = new JArray();
                shengData.Add(new JArray("001", "北京"));
                shengData.Add(new JArray("002", "河南"));
                shengData.Add(new JArray("003", "河北"));
                shengData.Add(new JArray("004", "湖南"));
                shengData.Add(new JArray("005", "湖北"));
                shengData.Add(new JArray("006", "广西"));
                shengData.Add(new JArray("007", "安徽"));
                string shengScript = String.Format("window._SHENG={0};", shengData.ToString(Formatting.None));

                // 注册脚本（市数据）
                JObject shiData = new JObject();
                foreach (JArray item in shengData)
                {
                    string shengValue = item[0].Value<string>();
                    string shengText = item[1].Value<string>();

                    JArray newSheng = new JArray();
                    JArray sheng = DataSourceUtil.SHI_JSON[shengText] as JArray;
                    int num = 1;
                    foreach (string shi in sheng)
                    {
                        JArray newShi = new JArray();
                        newShi.Add(shengValue + paddingLeft(num));
                        newShi.Add(shi);
                        num++;

                        newSheng.Add(newShi);
                    }
                    
                    shiData[shengValue] = newSheng;
                }
                string shiScript = String.Format("window._SHI={0};", shiData.ToString(Formatting.None));


                PageContext.RegisterPreStartupScript(shengScript + shiScript);
            }
        }

        private string paddingLeft(int value)
        {
            StringBuilder sb = new StringBuilder();

            string str = value.ToString();
            for (int i = 0, count = 3 - str.Length; i < count; i++) {
                sb.Append("0");
            }
            sb.Append(str);

            return sb.ToString();
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

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_shengshi_textvalue";

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
            row[3] = "001";
            row[4] = "001001";
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 102;
            row[1] = "陈飞";
            row[2] = 1;
            row[3] = "002";
            row[4] = "002003";
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 103;
            row[1] = "董婷婷";
            row[2] = 0;
            row[3] = "007";
            row[4] = "007001";
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
