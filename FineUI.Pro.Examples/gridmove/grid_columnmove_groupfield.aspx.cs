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
    public partial class grid_columnmove_groupfield : PageBase
    {
        private void ApplyOrders(JArray paramColumns)
        {
            int order = 0;
            foreach (JObject column in paramColumns)
            {
                GridColumn foundColumn = Grid1.FindColumn(column.Value<string>("columnId"));
                if (foundColumn != null)
                {
                    foundColumn.ColumnOrder = order;
                }

                JArray columns = column.Value<JArray>("columns");
                if (columns != null)
                {
                    ApplyOrders(columns);
                }

                order++;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 模拟操作数据库中的数据
                JArray savedColumns = GetSavedColumns();

                // 将数据库保存的列顺序应用到表格列上
                ApplyOrders(savedColumns);

                BindGrid();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Grid1_ColumnMove")
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = e.EventArgumentsAsJObject.Value<JArray>("columnIds");
            }
        }

        #region BindGrid

        private void BindGrid()
        {

            Grid1.DataSource = GetDataTable();
            Grid1.DataBind();
        }

        protected DataTable GetDataTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Id", typeof(int)));
            table.Columns.Add(new DataColumn("Guid", typeof(Guid)));
            table.Columns.Add(new DataColumn("Year", typeof(int)));
            table.Columns.Add(new DataColumn("HZData1", typeof(int)));
            table.Columns.Add(new DataColumn("HZData2", typeof(int)));
            table.Columns.Add(new DataColumn("HLData1", typeof(int)));
            table.Columns.Add(new DataColumn("HLData2", typeof(int)));
            table.Columns.Add(new DataColumn("AHData1", typeof(int)));
            table.Columns.Add(new DataColumn("AHData2", typeof(int)));
            table.Columns.Add(new DataColumn("LogTime", typeof(DateTime)));


            DataRow row;

            Random rd = new Random();
            for (int i = 0; i < 10; i++)
            {
                int year = 2000 + i;

                row = table.NewRow();
                row[0] = 100 + i;
                row[1] = Guid.NewGuid();
                row[2] = year;
                row[3] = rd.Next(1000, 9999);
                row[4] = rd.Next(1000, 9999);
                row[5] = rd.Next(1000, 9999);
                row[6] = rd.Next(1000, 9999);
                row[7] = rd.Next(1000, 9999);
                row[8] = rd.Next(1000, 9999);
                row[9] = DateTime.Parse(String.Format("{0}-09-01", year));

                table.Rows.Add(row);
            }

            return table;
        }
        

        #endregion


        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "grid_columnmove_groupfield_savedcolumns";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private JArray GetSavedColumns()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                //[{
                //    "columnId": "Year"
                //}, {
                //    "columnId": "anhui",
                //    "columns": [{
                //        "columnId": "hefei",
                //        "columns": [{
                //            "columnId": "AHData1"
                //        }, {
                //            "columnId": "AHData2"
                //        }]
                //    }]
                //}, {
                //    "columnId": "henan",
                //    "columns": [{
                //        "columnId": "zhumadian",
                //        "columns": [{
                //            "columnId": "HZData1"
                //        }, {
                //            "columnId": "HZData2"
                //        }]
                //    }, {
                //        "columnId": "luohe",
                //        "columns": [{
                //            "columnId": "HLData1"
                //        }, {
                //            "columnId": "HLData2"
                //        }]
                //    }]
                //}, {
                //    "columnId": "LogTime"
                //}]
                Session[KEY_FOR_DATASOURCE_SESSION] = JArray.Parse("[{\"columnId\":\"Year\"},{\"columnId\":\"anhui\",\"columns\":[{\"columnId\":\"hefei\",\"columns\":[{\"columnId\":\"AHData1\"},{\"columnId\":\"AHData2\"}]}]},{\"columnId\":\"henan\",\"columns\":[{\"columnId\":\"zhumadian\",\"columns\":[{\"columnId\":\"HZData1\"},{\"columnId\":\"HZData2\"}]},{\"columnId\":\"luohe\",\"columns\":[{\"columnId\":\"HLData1\"},{\"columnId\":\"HLData2\"}]}]},{\"columnId\":\"LogTime\"}]");
            }
            return (JArray)Session[KEY_FOR_DATASOURCE_SESSION];
        }


        #endregion
    }
}
