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
    public partial class grideditor_dynamic : PageBase
    {
        private int _minYear = 2014;
        private int _maxYear = 2017;

        // 动态创建控件的代码都要放到Page_Init中，参考：http://www.cnblogs.com/sanshi/archive/2012/11/19/2776672.html
        protected void Page_Init(object sender, EventArgs e)
        {
            RenderField rf;

            // 年份数据
            for (int i = _minYear; i <= _maxYear; i++)
            {
                rf = new RenderField();
                rf.Width = Unit.Pixel(120);
                rf.HeaderText = i + "年";
                rf.FieldType = FieldType.Int;
                rf.ColumnID = "Year_" + i;

                NumberBox nb = new NumberBox();
                nb.NoNegative = true;
                nb.ID = "Year_" + i + "_Editor";
                nb.Required = true;
                rf.Editor.Add(nb);

                Grid1.Columns.Add(rf);
            }

            // 合计列
            rf = new RenderField();
            rf.Width = Unit.Pixel(120);
            rf.HeaderText = "合计";
            rf.FieldType = FieldType.Int;
            rf.ColumnID = "TotalFee";
            Grid1.Columns.Add(rf);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();

                // 注册脚本
                string startScript = String.Format("window._MINYEAR={0};window._MAXYEAR={1};", _minYear, _maxYear);
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

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            DataRowView row = e.DataItem as DataRowView;
            string rowDataFieldValue = row["YearData"].ToString();

            JObject rowObj = new JObject();
            if (!String.IsNullOrEmpty(rowDataFieldValue))
            {
                rowObj = JObject.Parse(rowDataFieldValue);
            }

            //RenderField rf;
            int totalFee = 0;
            for (int i = _minYear; i <= _maxYear; i++)
            {
                //rf = Grid1.FindColumn("Year_" + i) as RenderField;

                // 初始值
                int fieldValue = 0;

                var fieldObj = rowObj[i.ToString()];
                if (fieldObj != null)
                {
                    fieldValue = Convert.ToInt32(fieldObj);
                }
                e.SetCellValue("Year_" + i, fieldValue);
                //e.Values[rf.ColumnIndex] = fieldValue;

                totalFee += fieldValue;
            }

            e.SetCellValue("TotalFee", totalFee);
            //rf = Grid1.FindColumn("TotalFee") as RenderField;
            //e.Values[rf.ColumnIndex] = totalFee;
        }


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

            JObject yearData = new JObject();
            string rowDataFieldValue = rowData["YearData"].ToString();
            if (!String.IsNullOrEmpty(rowDataFieldValue))
            {
                yearData = JObject.Parse(rowDataFieldValue);
            }

            // 更新修改的值
            for (int i = _minYear; i <= _maxYear; i++)
            {
                if (rowDict.ContainsKey("Year_" + i))
                {
                    yearData[i.ToString()] = new JValue(rowDict["Year_" + i]);
                }
            }

            rowData["YearData"] = yearData.ToString(Newtonsoft.Json.Formatting.None);
        }


        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_dynamic";

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
            table.Columns.Add(new DataColumn("Name", typeof(String)));
            table.Columns.Add(new DataColumn("YearData", typeof(String)));

            DataRow row = table.NewRow();
            row[0] = 101;
            row[1] = "学费";
            row[2] = "";
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 102;
            row[1] = "住宿费";
            row[2] = "";
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 103;
            row[1] = "伙食费";
            row[2] = "";
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 104;
            row[1] = "书本费";
            row[2] = "";
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 105;
            row[1] = "网络费";
            row[2] = "";
            table.Rows.Add(row);


            return table;
        }


        #endregion



    }
}
