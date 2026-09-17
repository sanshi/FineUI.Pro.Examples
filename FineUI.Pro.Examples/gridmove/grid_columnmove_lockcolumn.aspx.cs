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
    public partial class grid_columnmove_lockcolumn : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 模拟操作数据库中的数据
                List<string> savedColumns = GetSavedColumns();
                List<string> lockedColumns = GetLockedColumns();

                // savedColumns.Count == 0，说明用户尚未改变列顺序
                if (savedColumns.Count > 0)
                {
                    // 将数据库保存的值应用到表格列上
                    foreach (GridColumn column in Grid1.Columns)
                    {
                        var columnId = column.ColumnID;

                        // 列锁定
                        if (lockedColumns.Contains(columnId))
                        {
                            column.Locked = true;
                        }
                        else
                        {
                            column.Locked = false;
                        }

                        // 列顺序
                        if (savedColumns.Contains(columnId))
                        {
                            column.ColumnOrder = savedColumns.IndexOf(columnId);
                        }
                    }
                }

                BindGrid();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Grid1_ColumnMoveOrLock")
            {
                JObject param = e.EventArgumentsAsJObject;
                Session[KEY_FOR_DATASOURCE_SESSION] = param.Value<JArray>("columnIds").ToObject<List<string>>();
                Session[KEY_FOR_DATASOURCE_SESSION_LOCKEDCOLUMNS] = param.Value<JArray>("lockedColumnIds").ToObject<List<string>>();
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

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "grid_columnmove_lockcolumn_savedcolumns";

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


        private static readonly string KEY_FOR_DATASOURCE_SESSION_LOCKEDCOLUMNS = "grid_columnmove_lockcolumn_lockedcolumns";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private List<string> GetLockedColumns()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION_LOCKEDCOLUMNS] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION_LOCKEDCOLUMNS] = new List<string>() { };
            }
            return (List<string>)Session[KEY_FOR_DATASOURCE_SESSION_LOCKEDCOLUMNS];
        }


        #endregion

    }
}
