using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.gridlockcolumn
{
    public partial class grid_lockcolumn_savelocked : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> lockedColumns = GetLockedColumns();
                foreach (GridColumn column in Grid1.Columns)
                {
                    column.Locked = lockedColumns.Contains(column.ColumnID);
                }


                BindGrid();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName != "Grid1_ColumnLockUnlock")
            {
                return;
            }

            JObject param = e.EventArgumentsAsJObject;
            string columnId = param.Value<string>("columnId");
            List<string> lockedColumns = GetLockedColumns();
            if (param.Value<string>("type") == "lock")
            {
                if (!lockedColumns.Contains(columnId))
                {
                    lockedColumns.Add(columnId);
                }
            }
            else if (param.Value<string>("type") == "unlock")
            {
                if (lockedColumns.Contains(columnId))
                {
                    lockedColumns.Remove(columnId);
                }
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

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "gridlockcolumn.grid_lockcolumn_savelocked";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private List<string> GetLockedColumns()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = new List<string>() { "RowNumber", "Name" };
            }
            return (List<string>)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        
        #endregion

    }
}
