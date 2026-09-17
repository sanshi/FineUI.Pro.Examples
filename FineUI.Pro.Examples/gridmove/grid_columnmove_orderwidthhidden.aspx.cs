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
    public partial class grid_columnmove_orderwidthhidden : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 模拟操作数据库中的数据
                JArray savedColumns = GetSavedColumns();

                // 将数据库保存的列顺序应用到表格列上
                int order = 0;
                foreach (JObject column in savedColumns)
                {
                    GridColumn foundColumn = Grid1.FindColumn(column.Value<string>("columnId"));
                    if (foundColumn != null)
                    {
                        foundColumn.ColumnOrder = order;

                        // hidden 属性可能不存在
                        bool? hidden = column.Value<bool?>("hidden");
                        if (hidden != null && hidden.Value)
                        {
                            foundColumn.Hidden = true;
                        }

                        // flex 属性可能不存在
                        int? flex = column.Value<int?>("flex");
                        if (flex != null)
                        {
                            foundColumn.BoxFlex = flex.Value;
                        }
                        else
                        {
                            // width 属性可能不存在
                            int? width = column.Value<int?>("width");
                            if (width != null)
                            {
                                foundColumn.Width = Unit.Point(width.Value);
                            }
                        }

                    }
                    order++;
                }

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
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }



        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "grid_columnmove_orderwidthhidden_savedcolumns";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private JArray GetSavedColumns()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                //[{
                //    "columnId": "RowNumber",
                //    "width": 30
                //}, {
                //    "columnId": "Name",
                //    "width": 100
                //}, {
                //    "columnId": "Gender",
                //    "width": 80
                //}, {
                //    "columnId": "EntranceYear",
                //    "width": 80
                //}, {
                //    "columnId": "AtSchool",
                //    "width": 80
                //}, {
                //    "columnId": "Major",
                //    "flex": 1
                //}, {
                //    "columnId": "LogTime",
                //    "width": 100
                //}]
                Session[KEY_FOR_DATASOURCE_SESSION] = JArray.Parse("[{\"columnId\":\"RowNumber\",\"width\":30},{\"columnId\":\"Name\",\"width\":100},{\"columnId\":\"Gender\",\"width\":80},{\"columnId\":\"EntranceYear\",\"width\":80},{\"columnId\":\"AtSchool\",\"width\":80},{\"columnId\":\"Major\",\"flex\":1},{\"columnId\":\"LogTime\",\"width\":100}]");
            }
            return (JArray)Session[KEY_FOR_DATASOURCE_SESSION];
        }


        #endregion

    }
}
