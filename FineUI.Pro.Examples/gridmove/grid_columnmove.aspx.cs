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
    public partial class grid_columnmove : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 模拟操作数据库中的数据
                List<string> savedColumns = GetSavedColumns();

                // 将数据库保存的列顺序应用到表格列上
                int order = 0;
                foreach (string columnId in savedColumns)
                {
                    GridColumn foundColumn = Grid1.FindColumn(columnId);
                    if (foundColumn != null)
                    {
                        foundColumn.ColumnOrder = order;
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
                Session[KEY_FOR_DATASOURCE_SESSION] = e.EventArgumentsAsJObject
                    .Value<JArray>("columnIds").ToObject<List<string>>();
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

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "grid_columnmove_savedcolumns";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private List<string> GetSavedColumns()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = new List<string>() { };
            }
            return (List<string>)Session[KEY_FOR_DATASOURCE_SESSION];
        }


        #endregion

    }
}
